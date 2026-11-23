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

export default function PowerConsumptionTest(): void {
  describe('PowerConsumptionTest', () => {
    beforeAll(() => {
      logSuite('PowerConsumptionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('PowerConsumptionTest', 'end');
    });

    /**
     * @tc.name EnergyAccountingAndTokenBucketRefillStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc EnergyAccountingAndTokenBucketRefillStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndTokenBucketRefillStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(10, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(5);
        expect(ledger.average(10)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name TokenBucketRefillAndRateLimiterWindowAndStopwatchMeasurementKeepTheVisibleStateInStepDuringPreview
     * @tc.desc TokenBucketRefillAndRateLimiterWindowAndStopwatchMeasurementKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndRateLimiterWindowAndStopwatchMeasurementKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
      {
        const limiter: RateLimiter = new RateLimiter(5, 1000);
        for (let index = 0; index < 5; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
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
     * @tc.name RateLimiterWindowAndStopwatchMeasurementPreserveTheDeclaredContractDuringPreview
     * @tc.desc RateLimiterWindowAndStopwatchMeasurementPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndStopwatchMeasurementPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(5, 1000);
        for (let index = 0; index < 5; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
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
     * @tc.name StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingSurviveRapidInteractionDuringPreview
     * @tc.desc StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 6; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(6);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(6);
        expect(queue.size()).assertEqual(0);
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
     * @tc.name OfflineQueueDrainAndFrameBudgetTrackingHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc OfflineQueueDrainAndFrameBudgetTrackingHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndFrameBudgetTrackingHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 6; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(6);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(6);
        expect(queue.size()).assertEqual(0);
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
     * @tc.name FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview', 0, () => {
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
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(16, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(8);
        expect(ledger.average(16)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name EnergyAccountingAndTokenBucketRefillAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc EnergyAccountingAndTokenBucketRefillAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndTokenBucketRefillAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(16, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(8);
        expect(ledger.average(16)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name TokenBucketRefillAndRateLimiterWindowAndStopwatchMeasurementKeepTheSessionCoherentDuringPreview
     * @tc.desc TokenBucketRefillAndRateLimiterWindowAndStopwatchMeasurementKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndRateLimiterWindowAndStopwatchMeasurementKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
      {
        const limiter: RateLimiter = new RateLimiter(5, 1000);
        for (let index = 0; index < 5; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
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
     * @tc.name StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingPreserveOrderingGuaranteesDuringPreview
     * @tc.desc StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingPreserveOrderingGuaranteesDuringPreview',
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
          const queue: OfflineQueue = new OfflineQueue();
          for (let index = 0; index < 2; index++) {
            queue.enqueue('action-' + index.toString());
          }
          expect(queue.size()).assertEqual(2);
          expect(queue.drain(false).length).assertEqual(0);
          expect(queue.drain(true).length).assertEqual(2);
          expect(queue.size()).assertEqual(0);
        }
        {
          const timeline: AnimationTimeline = new AnimationTimeline();
          for (let index = 0; index < 6; index++) {
            timeline.addFrame(12.5);
          }
          timeline.addFrame(12);
          expect(timeline.frames.length).assertEqual(7);
          expect(timeline.dropped()).assertEqual(0);
          expect(timeline.averageFrame() > 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name OfflineQueueDrainAndFrameBudgetTrackingHoldForRepeatedEntryDuringPreview
     * @tc.desc OfflineQueueDrainAndFrameBudgetTrackingHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndFrameBudgetTrackingHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 2; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(2);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(2);
        expect(queue.size()).assertEqual(0);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 6; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(12);
        expect(timeline.frames.length).assertEqual(7);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadDuringPreview
     * @tc.desc FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 6; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(12);
        expect(timeline.frames.length).assertEqual(7);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(22, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(11);
        expect(ledger.average(22)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name EnergyAccountingAndTokenBucketRefillStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc EnergyAccountingAndTokenBucketRefillStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndTokenBucketRefillStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(22, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(11);
        expect(ledger.average(22)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingSurviveRapidInteractionAfterRollover
     * @tc.desc StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingSurviveRapidInteractionAfterRollover', 0, () => {
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 3; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(3);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(3);
        expect(queue.size()).assertEqual(0);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(18);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name OfflineQueueDrainAndFrameBudgetTrackingHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc OfflineQueueDrainAndFrameBudgetTrackingHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndFrameBudgetTrackingHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 3; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(3);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(3);
        expect(queue.size()).assertEqual(0);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(18);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryAfterRollover', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(18);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(28, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(14);
        expect(ledger.average(28)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name EnergyAccountingAndTokenBucketRefillAgreeWithTheModelInvariantsAfterRollover
     * @tc.desc EnergyAccountingAndTokenBucketRefillAgreeWithTheModelInvariantsAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndTokenBucketRefillAgreeWithTheModelInvariantsAfterRollover', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(28, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(14);
        expect(ledger.average(28)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingPreserveOrderingGuaranteesAfterRollover
     * @tc.desc StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingPreserveOrderingGuaranteesAfterRollover',
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
          const queue: OfflineQueue = new OfflineQueue();
          for (let index = 0; index < 4; index++) {
            queue.enqueue('action-' + index.toString());
          }
          expect(queue.size()).assertEqual(4);
          expect(queue.drain(false).length).assertEqual(0);
          expect(queue.drain(true).length).assertEqual(4);
          expect(queue.size()).assertEqual(0);
        }
        {
          const timeline: AnimationTimeline = new AnimationTimeline();
          for (let index = 0; index < 6; index++) {
            timeline.addFrame(12.5);
          }
          timeline.addFrame(15);
          expect(timeline.frames.length).assertEqual(7);
          expect(timeline.dropped()).assertEqual(0);
          expect(timeline.averageFrame() > 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name OfflineQueueDrainAndFrameBudgetTrackingHoldForRepeatedEntryAfterRollover
     * @tc.desc OfflineQueueDrainAndFrameBudgetTrackingHoldForRepeatedEntryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndFrameBudgetTrackingHoldForRepeatedEntryAfterRollover', 0, () => {
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 4; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(4);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(4);
        expect(queue.size()).assertEqual(0);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 6; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(15);
        expect(timeline.frames.length).assertEqual(7);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadAfterRollover
     * @tc.desc FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadAfterRollover', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 6; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(15);
        expect(timeline.frames.length).assertEqual(7);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(14, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(7);
        expect(ledger.average(14)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name EnergyAccountingAndTokenBucketRefillStayConsistentUnderRepeatedUseUnderLoad
     * @tc.desc EnergyAccountingAndTokenBucketRefillStayConsistentUnderRepeatedUseUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndTokenBucketRefillStayConsistentUnderRepeatedUseUnderLoad', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(14, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(7);
        expect(ledger.average(14)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingSurviveRapidInteractionUnderLoad
     * @tc.desc StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingSurviveRapidInteractionUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingSurviveRapidInteractionUnderLoad', 0, () => {
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 5; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(5);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(5);
        expect(queue.size()).assertEqual(0);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(12);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name OfflineQueueDrainAndFrameBudgetTrackingHoldAcrossConfigurationChangesUnderLoad
     * @tc.desc OfflineQueueDrainAndFrameBudgetTrackingHoldAcrossConfigurationChangesUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndFrameBudgetTrackingHoldAcrossConfigurationChangesUnderLoad', 0, () => {
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 5; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(5);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(5);
        expect(queue.size()).assertEqual(0);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(12);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryUnderLoad
     * @tc.desc FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryUnderLoad', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(12);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(20, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(10);
        expect(ledger.average(20)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name EnergyAccountingAndTokenBucketRefillAgreeWithTheModelInvariantsUnderLoad
     * @tc.desc EnergyAccountingAndTokenBucketRefillAgreeWithTheModelInvariantsUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndTokenBucketRefillAgreeWithTheModelInvariantsUnderLoad', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(20, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(10);
        expect(ledger.average(20)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingPreserveOrderingGuaranteesUnderLoad
     * @tc.desc StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingPreserveOrderingGuaranteesUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndOfflineQueueDrainAndFrameBudgetTrackingPreserveOrderingGuaranteesUnderLoad', 0, () => {
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 6; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(6);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(6);
        expect(queue.size()).assertEqual(0);
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
     * @tc.name OfflineQueueDrainAndFrameBudgetTrackingHoldForRepeatedEntryUnderLoad
     * @tc.desc OfflineQueueDrainAndFrameBudgetTrackingHoldForRepeatedEntryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndFrameBudgetTrackingHoldForRepeatedEntryUnderLoad', 0, () => {
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 6; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(6);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(6);
        expect(queue.size()).assertEqual(0);
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
     * @tc.name FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadUnderLoad
     * @tc.desc FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadUnderLoad', 0, () => {
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
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(26, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(13);
        expect(ledger.average(26)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name EnergyAccountingAndTokenBucketRefillStayConsistentUnderRepeatedUseOnNarrowScreens
     * @tc.desc EnergyAccountingAndTokenBucketRefillStayConsistentUnderRepeatedUseOnNarrowScreens
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndTokenBucketRefillStayConsistentUnderRepeatedUseOnNarrowScreens', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(26, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(13);
        expect(ledger.average(26)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
    });
  });
}
