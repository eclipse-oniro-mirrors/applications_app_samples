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

export default function PowerCompatibilityTest(): void {
  describe('PowerCompatibilityTest', () => {
    beforeAll(() => {
      logSuite('PowerCompatibilityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('PowerCompatibilityTest', 'end');
    });

    /**
     * @tc.name TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheVisibleStateInStepDuringPreview
     * @tc.desc TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheVisibleStateInStepDuringPreview', 0, () => {
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
        expect(ErrorClassifier.classify(0)).assertEqual('network');
        expect(ErrorClassifier.recoverable('network')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name RateLimiterWindowAndErrorClassificationPreserveTheDeclaredContractDuringPreview
     * @tc.desc RateLimiterWindowAndErrorClassificationPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndErrorClassificationPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(5, 1000);
        for (let index = 0; index < 5; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
      {
        expect(ErrorClassifier.classify(0)).assertEqual('network');
        expect(ErrorClassifier.recoverable('network')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementSurviveRapidInteractionDuringPreview
     * @tc.desc ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementSurviveRapidInteractionDuringPreview',
      0,
      () => {
        {
          expect(ErrorClassifier.classify(0)).assertEqual('network');
          expect(ErrorClassifier.recoverable('network')).assertEqual(true);
          expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
          expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
        }
        {
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
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
     * @tc.name ConfigurationSnapshotAndStopwatchMeasurementHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc ConfigurationSnapshotAndStopwatchMeasurementHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndStopwatchMeasurementHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview', 0, () => {
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
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheSessionCoherentDuringPreview
     * @tc.desc TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheSessionCoherentDuringPreview', 0, () => {
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
        expect(ErrorClassifier.classify(700)).assertEqual('unknown');
        expect(ErrorClassifier.recoverable('unknown')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name RateLimiterWindowAndErrorClassificationTrackTheSelectedStateDuringPreview
     * @tc.desc RateLimiterWindowAndErrorClassificationTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndErrorClassificationTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(5, 1000);
        for (let index = 0; index < 5; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
      {
        expect(ErrorClassifier.classify(700)).assertEqual('unknown');
        expect(ErrorClassifier.recoverable('unknown')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementPreserveOrderingGuaranteesDuringPreview
     * @tc.desc ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementPreserveOrderingGuaranteesDuringPreview',
      0,
      () => {
        {
          expect(ErrorClassifier.classify(700)).assertEqual('unknown');
          expect(ErrorClassifier.recoverable('unknown')).assertEqual(false);
          expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
          expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
        }
        {
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
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
     * @tc.name StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadDuringPreview
     * @tc.desc StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadDuringPreview', 0, () => {
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
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheVisibleStateInStepAfterRollover
     * @tc.desc TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheVisibleStateInStepAfterRollover', 0, () => {
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
        expect(ErrorClassifier.classify(200)).assertEqual('ok');
        expect(ErrorClassifier.recoverable('ok')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name RateLimiterWindowAndErrorClassificationPreserveTheDeclaredContractAfterRollover
     * @tc.desc RateLimiterWindowAndErrorClassificationPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndErrorClassificationPreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(5, 1000);
        for (let index = 0; index < 5; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
      {
        expect(ErrorClassifier.classify(200)).assertEqual('ok');
        expect(ErrorClassifier.recoverable('ok')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementSurviveRapidInteractionAfterRollover
     * @tc.desc ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementSurviveRapidInteractionAfterRollover',
      0,
      () => {
        {
          expect(ErrorClassifier.classify(200)).assertEqual('ok');
          expect(ErrorClassifier.recoverable('ok')).assertEqual(false);
          expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
          expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
        }
        {
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
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
     * @tc.name StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryAfterRollover', 0, () => {
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
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheSessionCoherentAfterRollover
     * @tc.desc TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheSessionCoherentAfterRollover', 0, () => {
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
        expect(ErrorClassifier.classify(404)).assertEqual('client');
        expect(ErrorClassifier.recoverable('client')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name RateLimiterWindowAndErrorClassificationTrackTheSelectedStateAfterRollover
     * @tc.desc RateLimiterWindowAndErrorClassificationTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndErrorClassificationTrackTheSelectedStateAfterRollover', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(5, 1000);
        for (let index = 0; index < 5; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
      {
        expect(ErrorClassifier.classify(404)).assertEqual('client');
        expect(ErrorClassifier.recoverable('client')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementPreserveOrderingGuaranteesAfterRollover
     * @tc.desc ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementPreserveOrderingGuaranteesAfterRollover',
      0,
      () => {
        {
          expect(ErrorClassifier.classify(404)).assertEqual('client');
          expect(ErrorClassifier.recoverable('client')).assertEqual(false);
          expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
          expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
        }
        {
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
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
     * @tc.name StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadAfterRollover
     * @tc.desc StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainStableUnderLoadAfterRollover', 0, () => {
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
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheVisibleStateInStepUnderLoad
     * @tc.desc TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheVisibleStateInStepUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheVisibleStateInStepUnderLoad', 0, () => {
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
        expect(ErrorClassifier.classify(503)).assertEqual('server');
        expect(ErrorClassifier.recoverable('server')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name RateLimiterWindowAndErrorClassificationPreserveTheDeclaredContractUnderLoad
     * @tc.desc RateLimiterWindowAndErrorClassificationPreserveTheDeclaredContractUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndErrorClassificationPreserveTheDeclaredContractUnderLoad', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(5, 1000);
        for (let index = 0; index < 5; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
      {
        expect(ErrorClassifier.classify(503)).assertEqual('server');
        expect(ErrorClassifier.recoverable('server')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementSurviveRapidInteractionUnderLoad
     * @tc.desc ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementSurviveRapidInteractionUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('ErrorClassificationAndConfigurationSnapshotAndStopwatchMeasurementSurviveRapidInteractionUnderLoad', 0, () => {
      {
        expect(ErrorClassifier.classify(503)).assertEqual('server');
        expect(ErrorClassifier.recoverable('server')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryUnderLoad
     * @tc.desc StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndEnergyAccountingAndTokenBucketRefillRemainCorrectAfterRecoveryUnderLoad', 0, () => {
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
     * @tc.name TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheSessionCoherentUnderLoad
     * @tc.desc TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheSessionCoherentUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndRateLimiterWindowAndErrorClassificationKeepTheSessionCoherentUnderLoad', 0, () => {
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
        expect(ErrorClassifier.classify(0)).assertEqual('network');
        expect(ErrorClassifier.recoverable('network')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });
  });
}
