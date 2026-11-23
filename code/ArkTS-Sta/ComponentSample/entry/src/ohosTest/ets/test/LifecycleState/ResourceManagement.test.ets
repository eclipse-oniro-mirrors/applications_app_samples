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

export default function ResourceManagementTest(): void {
  describe('ResourceManagementTest', () => {
    beforeAll(() => {
      logSuite('ResourceManagementTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('ResourceManagementTest', 'end');
    });

    /**
     * @tc.name ResourcePoolBudgetAndOfflineQueueDrainStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc ResourcePoolBudgetAndOfflineQueueDrainStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ResourcePoolBudgetAndOfflineQueueDrainStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const pool: ResourcePool = new ResourcePool(3);
        for (let index = 0; index < 3; index++) {
          expect(pool.acquire()).assertTrue();
        }
        expect(pool.acquire()).assertFalse();
        expect(pool.highWater).assertEqual(3);
        pool.release(3);
        expect(pool.leaked()).assertEqual(0);
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
    });

    /**
     * @tc.name OfflineQueueDrainAndEnergyAccountingAndRateLimiterWindowKeepTheVisibleStateInStepDuringPreview
     * @tc.desc OfflineQueueDrainAndEnergyAccountingAndRateLimiterWindowKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndEnergyAccountingAndRateLimiterWindowKeepTheVisibleStateInStepDuringPreview', 0, () => {
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
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(12, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(6);
        expect(ledger.average(12)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const limiter: RateLimiter = new RateLimiter(3, 1000);
        for (let index = 0; index < 3; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
    });

    /**
     * @tc.name EnergyAccountingAndRateLimiterWindowPreserveTheDeclaredContractDuringPreview
     * @tc.desc EnergyAccountingAndRateLimiterWindowPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndRateLimiterWindowPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(12, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(6);
        expect(ledger.average(12)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const limiter: RateLimiter = new RateLimiter(3, 1000);
        for (let index = 0; index < 3; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
    });

    /**
     * @tc.name RateLimiterWindowAndTokenBucketRefillAndResourcePoolBudgetSurviveRapidInteractionDuringPreview
     * @tc.desc RateLimiterWindowAndTokenBucketRefillAndResourcePoolBudgetSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndTokenBucketRefillAndResourcePoolBudgetSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(3, 1000);
        for (let index = 0; index < 3; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
      {
        const bucket: TokenBucket = new TokenBucket(2);
        expect(bucket.take(2)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(2);
        expect(bucket.tokens).assertEqual(2);
        expect(bucket.take(0)).assertFalse();
      }
      {
        const pool: ResourcePool = new ResourcePool(4);
        for (let index = 0; index < 4; index++) {
          expect(pool.acquire()).assertTrue();
        }
        expect(pool.acquire()).assertFalse();
        expect(pool.highWater).assertEqual(4);
        pool.release(4);
        expect(pool.leaked()).assertEqual(0);
      }
    });

    /**
     * @tc.name TokenBucketRefillAndResourcePoolBudgetHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc TokenBucketRefillAndResourcePoolBudgetHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndResourcePoolBudgetHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(2);
        expect(bucket.take(2)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(2);
        expect(bucket.tokens).assertEqual(2);
        expect(bucket.take(0)).assertFalse();
      }
      {
        const pool: ResourcePool = new ResourcePool(4);
        for (let index = 0; index < 4; index++) {
          expect(pool.acquire()).assertTrue();
        }
        expect(pool.acquire()).assertFalse();
        expect(pool.highWater).assertEqual(4);
        pool.release(4);
        expect(pool.leaked()).assertEqual(0);
      }
    });

    /**
     * @tc.name ResourcePoolBudgetAndOfflineQueueDrainAndEnergyAccountingRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc ResourcePoolBudgetAndOfflineQueueDrainAndEnergyAccountingRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ResourcePoolBudgetAndOfflineQueueDrainAndEnergyAccountingRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const pool: ResourcePool = new ResourcePool(4);
        for (let index = 0; index < 4; index++) {
          expect(pool.acquire()).assertTrue();
        }
        expect(pool.acquire()).assertFalse();
        expect(pool.highWater).assertEqual(4);
        pool.release(4);
        expect(pool.leaked()).assertEqual(0);
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
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(17, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(8.5);
        expect(ledger.average(17)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
    });

    /**
     * @tc.name OfflineQueueDrainAndEnergyAccountingAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc OfflineQueueDrainAndEnergyAccountingAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndEnergyAccountingAgreeWithTheModelInvariantsDuringPreview', 0, () => {
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
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(17, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(8.5);
        expect(ledger.average(17)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
    });

    /**
     * @tc.name EnergyAccountingAndRateLimiterWindowAndTokenBucketRefillKeepTheSessionCoherentDuringPreview
     * @tc.desc EnergyAccountingAndRateLimiterWindowAndTokenBucketRefillKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndRateLimiterWindowAndTokenBucketRefillKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(17, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(8.5);
        expect(ledger.average(17)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
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
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name RateLimiterWindowAndTokenBucketRefillTrackTheSelectedStateDuringPreview
     * @tc.desc RateLimiterWindowAndTokenBucketRefillTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndTokenBucketRefillTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(5, 1000);
        for (let index = 0; index < 5; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
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
     * @tc.name TokenBucketRefillAndResourcePoolBudgetAndOfflineQueueDrainPreserveOrderingGuaranteesDuringPreview
     * @tc.desc TokenBucketRefillAndResourcePoolBudgetAndOfflineQueueDrainPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndResourcePoolBudgetAndOfflineQueueDrainPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
      {
        const pool: ResourcePool = new ResourcePool(5);
        for (let index = 0; index < 5; index++) {
          expect(pool.acquire()).assertTrue();
        }
        expect(pool.acquire()).assertFalse();
        expect(pool.highWater).assertEqual(5);
        pool.release(5);
        expect(pool.leaked()).assertEqual(0);
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
    });

    /**
     * @tc.name ResourcePoolBudgetAndOfflineQueueDrainHoldForRepeatedEntryDuringPreview
     * @tc.desc ResourcePoolBudgetAndOfflineQueueDrainHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ResourcePoolBudgetAndOfflineQueueDrainHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const pool: ResourcePool = new ResourcePool(5);
        for (let index = 0; index < 5; index++) {
          expect(pool.acquire()).assertTrue();
        }
        expect(pool.acquire()).assertFalse();
        expect(pool.highWater).assertEqual(5);
        pool.release(5);
        expect(pool.leaked()).assertEqual(0);
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
    });

    /**
     * @tc.name OfflineQueueDrainAndEnergyAccountingAndRateLimiterWindowRemainStableUnderLoadDuringPreview
     * @tc.desc OfflineQueueDrainAndEnergyAccountingAndRateLimiterWindowRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndEnergyAccountingAndRateLimiterWindowRemainStableUnderLoadDuringPreview', 0, () => {
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
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(22, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(11);
        expect(ledger.average(22)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const limiter: RateLimiter = new RateLimiter(4, 1000);
        for (let index = 0; index < 4; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
    });

    /**
     * @tc.name EnergyAccountingAndRateLimiterWindowStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc EnergyAccountingAndRateLimiterWindowStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndRateLimiterWindowStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(22, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(11);
        expect(ledger.average(22)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const limiter: RateLimiter = new RateLimiter(4, 1000);
        for (let index = 0; index < 4; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
    });
  });
}
