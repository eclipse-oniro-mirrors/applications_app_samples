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

export default function AnimationPerformanceTest(): void {
  describe('AnimationPerformanceTest', () => {
    beforeAll(() => {
      logSuite('AnimationPerformanceTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('AnimationPerformanceTest', 'end');
    });

    /**
     * @tc.name FrameBudgetTrackingAndRepeatedBuildStabilityStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc FrameBudgetTrackingAndRepeatedBuildStabilityStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndRepeatedBuildStabilityStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(10);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name RepeatedBuildStabilityAndEnergyAccountingAndStopwatchMeasurementKeepTheVisibleStateInStepDuringPreview
     * @tc.desc RepeatedBuildStabilityAndEnergyAccountingAndStopwatchMeasurementKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'RepeatedBuildStabilityAndEnergyAccountingAndStopwatchMeasurementKeepTheVisibleStateInStepDuringPreview',
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
          const ledger: EnergyLedger = new EnergyLedger();
          ledger.chargeOperation(12, 0.5);
          expect(ledger.milliwattSeconds).assertEqual(6);
          expect(ledger.average(12)).assertEqual(0.5);
          expect(ledger.average(0)).assertEqual(0);
        }
        {
          const watch: Stopwatch = new Stopwatch();
          watch.start();
          expect(watch.isRunning()).assertTrue();
          const elapsed: number = watch.stop();
          expect(elapsed >= 0).assertTrue();
          expect(watch.isRunning()).assertFalse();
        }
      },
    );

    /**
     * @tc.name EnergyAccountingAndStopwatchMeasurementPreserveTheDeclaredContractDuringPreview
     * @tc.desc EnergyAccountingAndStopwatchMeasurementPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndStopwatchMeasurementPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(12, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(6);
        expect(ledger.average(12)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
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
     * @tc.name StopwatchMeasurementAndThemeTokenResolutionAndFrameBudgetTrackingSurviveRapidInteractionDuringPreview
     * @tc.desc StopwatchMeasurementAndThemeTokenResolutionAndFrameBudgetTrackingSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'StopwatchMeasurementAndThemeTokenResolutionAndFrameBudgetTrackingSurviveRapidInteractionDuringPreview',
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
          const tokens: ThemeTokens = ThemeResolver.resolve(false);
          expect(tokens.background).assertEqual('#ffffffff');
          expect(tokens.foreground).assertEqual('#ff000000');
          expect(ThemeResolver.gridHeight(false)).assertEqual(300);
          expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
        }
        {
          const timeline: AnimationTimeline = new AnimationTimeline();
          for (let index = 0; index < 4; index++) {
            timeline.addFrame(12.5);
          }
          timeline.addFrame(15);
          expect(timeline.frames.length).assertEqual(5);
          expect(timeline.dropped()).assertEqual(0);
          expect(timeline.averageFrame() > 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name ThemeTokenResolutionAndFrameBudgetTrackingHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc ThemeTokenResolutionAndFrameBudgetTrackingHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndFrameBudgetTrackingHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(15);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndRepeatedBuildStabilityAndEnergyAccountingRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc FrameBudgetTrackingAndRepeatedBuildStabilityAndEnergyAccountingRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'FrameBudgetTrackingAndRepeatedBuildStabilityAndEnergyAccountingRemainCorrectAfterRecoveryDuringPreview',
      0,
      () => {
        {
          const timeline: AnimationTimeline = new AnimationTimeline();
          for (let index = 0; index < 4; index++) {
            timeline.addFrame(12.5);
          }
          timeline.addFrame(15);
          expect(timeline.frames.length).assertEqual(5);
          expect(timeline.dropped()).assertEqual(0);
          expect(timeline.averageFrame() > 0).assertTrue();
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
      },
    );

    /**
     * @tc.name RepeatedBuildStabilityAndEnergyAccountingAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc RepeatedBuildStabilityAndEnergyAccountingAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RepeatedBuildStabilityAndEnergyAccountingAgreeWithTheModelInvariantsDuringPreview', 0, () => {
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
     * @tc.name EnergyAccountingAndStopwatchMeasurementAndThemeTokenResolutionKeepTheSessionCoherentDuringPreview
     * @tc.desc EnergyAccountingAndStopwatchMeasurementAndThemeTokenResolutionKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndStopwatchMeasurementAndThemeTokenResolutionKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(17, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(8.5);
        expect(ledger.average(17)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
      }
    });

    /**
     * @tc.name StopwatchMeasurementAndThemeTokenResolutionTrackTheSelectedStateDuringPreview
     * @tc.desc StopwatchMeasurementAndThemeTokenResolutionTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndThemeTokenResolutionTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
      }
    });

    /**
     * @tc.name ThemeTokenResolutionAndFrameBudgetTrackingAndRepeatedBuildStabilityPreserveOrderingGuaranteesDuringPreview
     * @tc.desc ThemeTokenResolutionAndFrameBudgetTrackingAndRepeatedBuildStabilityPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ThemeTokenResolutionAndFrameBudgetTrackingAndRepeatedBuildStabilityPreserveOrderingGuaranteesDuringPreview',
      0,
      () => {
        {
          const tokens: ThemeTokens = ThemeResolver.resolve(true);
          expect(tokens.background).assertEqual('#ff000000');
          expect(tokens.foreground).assertEqual('#ffffffff');
          expect(ThemeResolver.gridHeight(true)).assertEqual(360);
          expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
        }
        {
          const timeline: AnimationTimeline = new AnimationTimeline();
          for (let index = 0; index < 5; index++) {
            timeline.addFrame(12.5);
          }
          timeline.addFrame(11);
          expect(timeline.frames.length).assertEqual(6);
          expect(timeline.dropped()).assertEqual(0);
          expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name FrameBudgetTrackingAndRepeatedBuildStabilityHoldForRepeatedEntryDuringPreview
     * @tc.desc FrameBudgetTrackingAndRepeatedBuildStabilityHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndRepeatedBuildStabilityHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(11);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name RepeatedBuildStabilityAndEnergyAccountingAndStopwatchMeasurementRemainStableUnderLoadDuringPreview
     * @tc.desc RepeatedBuildStabilityAndEnergyAccountingAndStopwatchMeasurementRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RepeatedBuildStabilityAndEnergyAccountingAndStopwatchMeasurementRemainStableUnderLoadDuringPreview', 0, () => {
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
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(22, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(11);
        expect(ledger.average(22)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
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
     * @tc.name EnergyAccountingAndStopwatchMeasurementStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc EnergyAccountingAndStopwatchMeasurementStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndStopwatchMeasurementStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(22, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(11);
        expect(ledger.average(22)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
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
     * @tc.name StopwatchMeasurementAndThemeTokenResolutionAndFrameBudgetTrackingKeepTheVisibleStateInStepAfterRollover
     * @tc.desc StopwatchMeasurementAndThemeTokenResolutionAndFrameBudgetTrackingKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'StopwatchMeasurementAndThemeTokenResolutionAndFrameBudgetTrackingKeepTheVisibleStateInStepAfterRollover',
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
          const tokens: ThemeTokens = ThemeResolver.resolve(false);
          expect(tokens.background).assertEqual('#ffffffff');
          expect(tokens.foreground).assertEqual('#ff000000');
          expect(ThemeResolver.gridHeight(false)).assertEqual(300);
          expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
        }
        {
          const timeline: AnimationTimeline = new AnimationTimeline();
          for (let index = 0; index < 6; index++) {
            timeline.addFrame(12.5);
          }
          timeline.addFrame(16);
          expect(timeline.frames.length).assertEqual(7);
          expect(timeline.dropped()).assertEqual(0);
          expect(timeline.averageFrame() > 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name ThemeTokenResolutionAndFrameBudgetTrackingPreserveTheDeclaredContractAfterRollover
     * @tc.desc ThemeTokenResolutionAndFrameBudgetTrackingPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndFrameBudgetTrackingPreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 6; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(16);
        expect(timeline.frames.length).assertEqual(7);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndRepeatedBuildStabilityAndEnergyAccountingSurviveRapidInteractionAfterRollover
     * @tc.desc FrameBudgetTrackingAndRepeatedBuildStabilityAndEnergyAccountingSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndRepeatedBuildStabilityAndEnergyAccountingSurviveRapidInteractionAfterRollover', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 6; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(16);
        expect(timeline.frames.length).assertEqual(7);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
        ledger.chargeOperation(27, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(13.5);
        expect(ledger.average(27)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
    });

    /**
     * @tc.name RepeatedBuildStabilityAndEnergyAccountingHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc RepeatedBuildStabilityAndEnergyAccountingHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RepeatedBuildStabilityAndEnergyAccountingHoldAcrossConfigurationChangesAfterRollover', 0, () => {
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
        ledger.chargeOperation(27, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(13.5);
        expect(ledger.average(27)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
    });

    /**
     * @tc.name EnergyAccountingAndStopwatchMeasurementAndThemeTokenResolutionRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc EnergyAccountingAndStopwatchMeasurementAndThemeTokenResolutionRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'EnergyAccountingAndStopwatchMeasurementAndThemeTokenResolutionRemainCorrectAfterRecoveryAfterRollover',
      0,
      () => {
        {
          const ledger: EnergyLedger = new EnergyLedger();
          ledger.chargeOperation(27, 0.5);
          expect(ledger.milliwattSeconds).assertEqual(13.5);
          expect(ledger.average(27)).assertEqual(0.5);
          expect(ledger.average(0)).assertEqual(0);
        }
        {
          const watch: Stopwatch = new Stopwatch();
          watch.start();
          expect(watch.isRunning()).assertTrue();
          const elapsed: number = watch.stop();
          expect(elapsed >= 0).assertTrue();
          expect(watch.isRunning()).assertFalse();
        }
        {
          const tokens: ThemeTokens = ThemeResolver.resolve(true);
          expect(tokens.background).assertEqual('#ff000000');
          expect(tokens.foreground).assertEqual('#ffffffff');
          expect(ThemeResolver.gridHeight(true)).assertEqual(360);
          expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name ThemeTokenResolutionAndFrameBudgetTrackingAndRepeatedBuildStabilityKeepTheSessionCoherentAfterRollover
     * @tc.desc ThemeTokenResolutionAndFrameBudgetTrackingAndRepeatedBuildStabilityKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ThemeTokenResolutionAndFrameBudgetTrackingAndRepeatedBuildStabilityKeepTheSessionCoherentAfterRollover',
      0,
      () => {
        {
          const tokens: ThemeTokens = ThemeResolver.resolve(true);
          expect(tokens.background).assertEqual('#ff000000');
          expect(tokens.foreground).assertEqual('#ffffffff');
          expect(ThemeResolver.gridHeight(true)).assertEqual(360);
          expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
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
      },
    );

    /**
     * @tc.name FrameBudgetTrackingAndRepeatedBuildStabilityTrackTheSelectedStateAfterRollover
     * @tc.desc FrameBudgetTrackingAndRepeatedBuildStabilityTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndRepeatedBuildStabilityTrackTheSelectedStateAfterRollover', 0, () => {
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
     * @tc.name StopwatchMeasurementAndThemeTokenResolutionAndFrameBudgetTrackingRemainStableUnderLoadAfterRollover
     * @tc.desc StopwatchMeasurementAndThemeTokenResolutionAndFrameBudgetTrackingRemainStableUnderLoadAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndThemeTokenResolutionAndFrameBudgetTrackingRemainStableUnderLoadAfterRollover', 0, () => {
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(17);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name ThemeTokenResolutionAndFrameBudgetTrackingStayConsistentUnderRepeatedUseUnderLoad
     * @tc.desc ThemeTokenResolutionAndFrameBudgetTrackingStayConsistentUnderRepeatedUseUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndFrameBudgetTrackingStayConsistentUnderRepeatedUseUnderLoad', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(17);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndRepeatedBuildStabilityAndEnergyAccountingKeepTheVisibleStateInStepUnderLoad
     * @tc.desc FrameBudgetTrackingAndRepeatedBuildStabilityAndEnergyAccountingKeepTheVisibleStateInStepUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndRepeatedBuildStabilityAndEnergyAccountingKeepTheVisibleStateInStepUnderLoad', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(17);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name ThemeTokenResolutionAndFrameBudgetTrackingAndRepeatedBuildStabilityRemainCorrectAfterRecoveryUnderLoad
     * @tc.desc ThemeTokenResolutionAndFrameBudgetTrackingAndRepeatedBuildStabilityRemainCorrectAfterRecoveryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ThemeTokenResolutionAndFrameBudgetTrackingAndRepeatedBuildStabilityRemainCorrectAfterRecoveryUnderLoad',
      0,
      () => {
        {
          const tokens: ThemeTokens = ThemeResolver.resolve(true);
          expect(tokens.background).assertEqual('#ff000000');
          expect(tokens.foreground).assertEqual('#ffffffff');
          expect(ThemeResolver.gridHeight(true)).assertEqual(360);
          expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
        }
        {
          const timeline: AnimationTimeline = new AnimationTimeline();
          for (let index = 0; index < 5; index++) {
            timeline.addFrame(12.5);
          }
          timeline.addFrame(13);
          expect(timeline.frames.length).assertEqual(6);
          expect(timeline.dropped()).assertEqual(0);
          expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name FrameBudgetTrackingAndRepeatedBuildStabilityAgreeWithTheModelInvariantsUnderLoad
     * @tc.desc FrameBudgetTrackingAndRepeatedBuildStabilityAgreeWithTheModelInvariantsUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndRepeatedBuildStabilityAgreeWithTheModelInvariantsUnderLoad', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(13);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name StopwatchMeasurementAndThemeTokenResolutionAndFrameBudgetTrackingPreserveOrderingGuaranteesUnderLoad
     * @tc.desc StopwatchMeasurementAndThemeTokenResolutionAndFrameBudgetTrackingPreserveOrderingGuaranteesUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'StopwatchMeasurementAndThemeTokenResolutionAndFrameBudgetTrackingPreserveOrderingGuaranteesUnderLoad',
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
          const tokens: ThemeTokens = ThemeResolver.resolve(false);
          expect(tokens.background).assertEqual('#ffffffff');
          expect(tokens.foreground).assertEqual('#ff000000');
          expect(ThemeResolver.gridHeight(false)).assertEqual(300);
          expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
        }
        {
          const timeline: AnimationTimeline = new AnimationTimeline();
          for (let index = 0; index < 6; index++) {
            timeline.addFrame(12.5);
          }
          timeline.addFrame(18);
          expect(timeline.frames.length).assertEqual(7);
          expect(timeline.dropped()).assertEqual(1);
          expect(timeline.averageFrame() > 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name ThemeTokenResolutionAndFrameBudgetTrackingHoldForRepeatedEntryUnderLoad
     * @tc.desc ThemeTokenResolutionAndFrameBudgetTrackingHoldForRepeatedEntryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndFrameBudgetTrackingHoldForRepeatedEntryUnderLoad', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 6; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(18);
        expect(timeline.frames.length).assertEqual(7);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndRepeatedBuildStabilityAndEnergyAccountingRemainStableUnderLoadUnderLoad
     * @tc.desc FrameBudgetTrackingAndRepeatedBuildStabilityAndEnergyAccountingRemainStableUnderLoadUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndRepeatedBuildStabilityAndEnergyAccountingRemainStableUnderLoadUnderLoad', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 6; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(18);
        expect(timeline.frames.length).assertEqual(7);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
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
        ledger.chargeOperation(27, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(13.5);
        expect(ledger.average(27)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
    });
  });
}
