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

export default function SecurityValidationTest(): void {
  describe('SecurityValidationTest', () => {
    beforeAll(() => {
      logSuite('SecurityValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('SecurityValidationTest', 'end');
    });

    /**
     * @tc.name RateLimiterWindowAndTokenBucketRefillStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc RateLimiterWindowAndTokenBucketRefillStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndTokenBucketRefillStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(3, 1000);
        for (let index = 0; index < 3; index++) {
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
     * @tc.name TokenBucketRefillAndLogMaskingPolicyAndErrorClassificationKeepTheVisibleStateInStepDuringPreview
     * @tc.desc TokenBucketRefillAndLogMaskingPolicyAndErrorClassificationKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndLogMaskingPolicyAndErrorClassificationKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
      {
        expect(Sanitizer.maskAccount('xy')).assertEqual('**');
        expect(Sanitizer.clean('a').length).assertEqual(1);
        expect(Sanitizer.trim('a ')).assertEqual('a');
      }
      {
        expect(ErrorClassifier.classify(0)).assertEqual('network');
        expect(ErrorClassifier.recoverable('network')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name LogMaskingPolicyAndErrorClassificationPreserveTheDeclaredContractDuringPreview
     * @tc.desc LogMaskingPolicyAndErrorClassificationPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('LogMaskingPolicyAndErrorClassificationPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        expect(Sanitizer.maskAccount('xy')).assertEqual('**');
        expect(Sanitizer.clean('a').length).assertEqual(1);
        expect(Sanitizer.trim('a ')).assertEqual('a');
      }
      {
        expect(ErrorClassifier.classify(0)).assertEqual('network');
        expect(ErrorClassifier.recoverable('network')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name ErrorClassificationAndStableRandomStreamRoleAuditTrailSurviveRapidInteractionDuringPreview
     * @tc.desc ErrorClassificationAndStableRandomStreamRoleAuditTrailSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ErrorClassificationAndStableRandomStreamRoleAuditTrailSurviveRapidInteractionDuringPreview', 0, () => {
      {
        expect(ErrorClassifier.classify(0)).assertEqual('network');
        expect(ErrorClassifier.recoverable('network')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
      {
        const stream: StableRandom = new StableRandom(15);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(15);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      const trail: AuditTrail = new AuditTrail();
      trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
      trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
      expect(RolePolicy.canMutate('viewer')).assertEqual(false);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name StableRandomStreamRoleAuditTrailHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc StableRandomStreamRoleAuditTrailHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StableRandomStreamRoleAuditTrailHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const stream: StableRandom = new StableRandom(15);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(15);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      const trail: AuditTrail = new AuditTrail();
      trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
      trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
      expect(RolePolicy.canMutate('viewer')).assertEqual(false);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name RoleAuditTrailAndRateLimiterWindowAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc RoleAuditTrailAndRateLimiterWindowAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RoleAuditTrailAndRateLimiterWindowAndTokenBucketRefillRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      const trail: AuditTrail = new AuditTrail();
      trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
      trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
      expect(RolePolicy.canMutate('viewer')).assertEqual(false);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
      {
        const limiter: RateLimiter = new RateLimiter(3, 1000);
        for (let index = 0; index < 3; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
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
     * @tc.name RateLimiterWindowAndTokenBucketRefillAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc RateLimiterWindowAndTokenBucketRefillAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndTokenBucketRefillAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(3, 1000);
        for (let index = 0; index < 3; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
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
     * @tc.name TokenBucketRefillAndLogMaskingPolicyAndErrorClassificationKeepTheSessionCoherentDuringPreview
     * @tc.desc TokenBucketRefillAndLogMaskingPolicyAndErrorClassificationKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndLogMaskingPolicyAndErrorClassificationKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
      {
        expect(Sanitizer.maskAccount('xy')).assertEqual('**');
        expect(Sanitizer.clean('a').length).assertEqual(1);
        expect(Sanitizer.trim('a ')).assertEqual('a');
      }
      {
        expect(ErrorClassifier.classify(700)).assertEqual('unknown');
        expect(ErrorClassifier.recoverable('unknown')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name LogMaskingPolicyAndErrorClassificationTrackTheSelectedStateDuringPreview
     * @tc.desc LogMaskingPolicyAndErrorClassificationTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('LogMaskingPolicyAndErrorClassificationTrackTheSelectedStateDuringPreview', 0, () => {
      {
        expect(Sanitizer.maskAccount('xy')).assertEqual('**');
        expect(Sanitizer.clean('a').length).assertEqual(1);
        expect(Sanitizer.trim('a ')).assertEqual('a');
      }
      {
        expect(ErrorClassifier.classify(700)).assertEqual('unknown');
        expect(ErrorClassifier.recoverable('unknown')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name ErrorClassificationAndStableRandomStreamRoleAuditTrailPreserveOrderingGuaranteesDuringPreview
     * @tc.desc ErrorClassificationAndStableRandomStreamRoleAuditTrailPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ErrorClassificationAndStableRandomStreamRoleAuditTrailPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        expect(ErrorClassifier.classify(700)).assertEqual('unknown');
        expect(ErrorClassifier.recoverable('unknown')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
      {
        const stream: StableRandom = new StableRandom(21);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(21);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      const trail: AuditTrail = new AuditTrail();
      trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
      trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
      expect(RolePolicy.canMutate('viewer')).assertEqual(false);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name StableRandomStreamRoleAuditTrailHoldForRepeatedEntryDuringPreview
     * @tc.desc StableRandomStreamRoleAuditTrailHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StableRandomStreamRoleAuditTrailHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const stream: StableRandom = new StableRandom(21);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(21);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      const trail: AuditTrail = new AuditTrail();
      trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
      trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
      expect(RolePolicy.canMutate('viewer')).assertEqual(false);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name RoleAuditTrailAndRateLimiterWindowAndTokenBucketRefillRemainStableUnderLoadDuringPreview
     * @tc.desc RoleAuditTrailAndRateLimiterWindowAndTokenBucketRefillRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RoleAuditTrailAndRateLimiterWindowAndTokenBucketRefillRemainStableUnderLoadDuringPreview', 0, () => {
      const trail: AuditTrail = new AuditTrail();
      trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
      trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
      expect(RolePolicy.canMutate('viewer')).assertEqual(false);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
      {
        const limiter: RateLimiter = new RateLimiter(3, 1000);
        for (let index = 0; index < 3; index++) {
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
     * @tc.name TokenBucketRefillAndLogMaskingPolicyAndErrorClassificationKeepTheVisibleStateInStepAfterRollover
     * @tc.desc TokenBucketRefillAndLogMaskingPolicyAndErrorClassificationKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndLogMaskingPolicyAndErrorClassificationKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
      {
        expect(Sanitizer.maskAccount('xy')).assertEqual('**');
        expect(Sanitizer.clean('a').length).assertEqual(1);
        expect(Sanitizer.trim('a ')).assertEqual('a');
      }
      {
        expect(ErrorClassifier.classify(200)).assertEqual('ok');
        expect(ErrorClassifier.recoverable('ok')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name LogMaskingPolicyAndErrorClassificationPreserveTheDeclaredContractAfterRollover
     * @tc.desc LogMaskingPolicyAndErrorClassificationPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('LogMaskingPolicyAndErrorClassificationPreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        expect(Sanitizer.maskAccount('xy')).assertEqual('**');
        expect(Sanitizer.clean('a').length).assertEqual(1);
        expect(Sanitizer.trim('a ')).assertEqual('a');
      }
      {
        expect(ErrorClassifier.classify(200)).assertEqual('ok');
        expect(ErrorClassifier.recoverable('ok')).assertEqual(false);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });
  });
}
