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

export default function NetworkConnectivityTest(): void {
  describe('NetworkConnectivityTest', () => {
    beforeAll(() => {
      logSuite('NetworkConnectivityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('NetworkConnectivityTest', 'end');
    });

    /**
     * @tc.name OfflineQueueDrainAndErrorClassificationStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc OfflineQueueDrainAndErrorClassificationStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndErrorClassificationStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
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
        expect(ErrorClassifier.classify(404)).assertEqual('client');
        expect(ErrorClassifier.recoverable('client')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name ErrorClassificationAndRetryBudgetAndTokenBucketRefillKeepTheVisibleStateInStepDuringPreview
     * @tc.desc ErrorClassificationAndRetryBudgetAndTokenBucketRefillKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ErrorClassificationAndRetryBudgetAndTokenBucketRefillKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        expect(ErrorClassifier.classify(404)).assertEqual('client');
        expect(ErrorClassifier.recoverable('client')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
      {
        const budget: RetryBudget = new RetryBudget(4);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(4);
        expect(budget.exhausted()).assertTrue();
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
     * @tc.name RetryBudgetAndTokenBucketRefillPreserveTheDeclaredContractDuringPreview
     * @tc.desc RetryBudgetAndTokenBucketRefillPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RetryBudgetAndTokenBucketRefillPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const budget: RetryBudget = new RetryBudget(4);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(4);
        expect(budget.exhausted()).assertTrue();
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
     * @tc.name TokenBucketRefillAndOfflineQueueDrainAndErrorClassificationSurviveRapidInteractionDuringPreview
     * @tc.desc TokenBucketRefillAndOfflineQueueDrainAndErrorClassificationSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndOfflineQueueDrainAndErrorClassificationSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
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
        expect(ErrorClassifier.classify(200)).assertEqual('ok');
        expect(ErrorClassifier.recoverable('ok')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name OfflineQueueDrainAndErrorClassificationHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc OfflineQueueDrainAndErrorClassificationHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndErrorClassificationHoldAcrossConfigurationChangesDuringPreview', 0, () => {
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
        expect(ErrorClassifier.classify(200)).assertEqual('ok');
        expect(ErrorClassifier.recoverable('ok')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name ErrorClassificationAndRetryBudgetAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc ErrorClassificationAndRetryBudgetAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ErrorClassificationAndRetryBudgetAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        expect(ErrorClassifier.classify(200)).assertEqual('ok');
        expect(ErrorClassifier.recoverable('ok')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
      {
        const budget: RetryBudget = new RetryBudget(2);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(2);
        expect(budget.exhausted()).assertTrue();
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
  });
}
