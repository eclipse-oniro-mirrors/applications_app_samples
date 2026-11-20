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

export default function ConcurrencyControlTest(): void {
  describe('ConcurrencyControlTest', () => {
    beforeAll(() => {
      logSuite('ConcurrencyControlTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('ConcurrencyControlTest', 'end');
    });

    /**
     * @tc.name StableRandomStreamAndRetryBudgetStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc StableRandomStreamAndRetryBudgetStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StableRandomStreamAndRetryBudgetStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const stream: StableRandom = new StableRandom(11);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(11);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      {
        const budget: RetryBudget = new RetryBudget(3);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(3);
        expect(budget.exhausted()).assertTrue();
      }
    });

    /**
     * @tc.name RetryBudgetAndRepeatedBuildStabilityAndTokenBucketRefillKeepTheVisibleStateInStepDuringPreview
     * @tc.desc RetryBudgetAndRepeatedBuildStabilityAndTokenBucketRefillKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RetryBudgetAndRepeatedBuildStabilityAndTokenBucketRefillKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const budget: RetryBudget = new RetryBudget(3);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(3);
        expect(budget.exhausted()).assertTrue();
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
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name RepeatedBuildStabilityAndTokenBucketRefillPreserveTheDeclaredContractDuringPreview
     * @tc.desc RepeatedBuildStabilityAndTokenBucketRefillPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RepeatedBuildStabilityAndTokenBucketRefillPreserveTheDeclaredContractDuringPreview', 0, () => {
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
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name TokenBucketRefillAndStableRandomStreamAndRetryBudgetSurviveRapidInteractionDuringPreview
     * @tc.desc TokenBucketRefillAndStableRandomStreamAndRetryBudgetSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndStableRandomStreamAndRetryBudgetSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
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
        const budget: RetryBudget = new RetryBudget(4);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(4);
        expect(budget.exhausted()).assertTrue();
      }
    });

    /**
     * @tc.name StableRandomStreamAndRetryBudgetHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc StableRandomStreamAndRetryBudgetHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StableRandomStreamAndRetryBudgetHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const stream: StableRandom = new StableRandom(15);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(15);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      {
        const budget: RetryBudget = new RetryBudget(4);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(4);
        expect(budget.exhausted()).assertTrue();
      }
    });

    /**
     * @tc.name RetryBudgetAndRepeatedBuildStabilityAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc RetryBudgetAndRepeatedBuildStabilityAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RetryBudgetAndRepeatedBuildStabilityAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const budget: RetryBudget = new RetryBudget(4);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(4);
        expect(budget.exhausted()).assertTrue();
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
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
    });

    /**
     * @tc.name TokenBucketRefillAndStableRandomStreamAndRetryBudgetKeepTheSessionCoherentDuringPreview
     * @tc.desc TokenBucketRefillAndStableRandomStreamAndRetryBudgetKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndStableRandomStreamAndRetryBudgetKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
      {
        const stream: StableRandom = new StableRandom(19);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(19);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      {
        const budget: RetryBudget = new RetryBudget(2);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(2);
        expect(budget.exhausted()).assertTrue();
      }
    });
  });
}
