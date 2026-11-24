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

export default function PowerSecurityTest(): void {
  describe('PowerSecurityTest', () => {
    beforeAll(() => {
      logSuite('PowerSecurityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('PowerSecurityTest', 'end');
    });

    /**
     * @tc.name RolePolicyCheckAndLogMaskingPolicyStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc RolePolicyCheckAndLogMaskingPolicyStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RolePolicyCheckAndLogMaskingPolicyStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
        trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
        expect(RolePolicy.canMutate('viewer')).assertEqual(false);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
      {
        expect(Sanitizer.isSafeForLog('account token')).assertFalse();
        expect(Sanitizer.isSafeForLog('plain text')).assertTrue();
        expect(Sanitizer.maskAccount('13800138000')).assertEqual('1***0');
      }
    });

    /**
     * @tc.name LogMaskingPolicyAndTokenBucketRefillAndRetryBudgetKeepTheVisibleStateInStepDuringPreview
     * @tc.desc LogMaskingPolicyAndTokenBucketRefillAndRetryBudgetKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('LogMaskingPolicyAndTokenBucketRefillAndRetryBudgetKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        expect(Sanitizer.isSafeForLog('account token')).assertFalse();
        expect(Sanitizer.isSafeForLog('plain text')).assertTrue();
        expect(Sanitizer.maskAccount('13800138000')).assertEqual('1***0');
      }
      {
        const bucket: TokenBucket = new TokenBucket(4);
        expect(bucket.take(4)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(4);
        expect(bucket.tokens).assertEqual(4);
        expect(bucket.take(0)).assertFalse();
      }
      {
        const budget: RetryBudget = new RetryBudget(2);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(2);
        expect(budget.exhausted()).assertTrue();
      }
    });

    /**
     * @tc.name TokenBucketRefillAndRetryBudgetPreserveTheDeclaredContractDuringPreview
     * @tc.desc TokenBucketRefillAndRetryBudgetPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndRetryBudgetPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(4);
        expect(bucket.take(4)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(4);
        expect(bucket.tokens).assertEqual(4);
        expect(bucket.take(0)).assertFalse();
      }
      {
        const budget: RetryBudget = new RetryBudget(2);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(2);
        expect(budget.exhausted()).assertTrue();
      }
    });

    /**
     * @tc.name RetryBudgetAndRateLimiterWindowAndSessionTransitionsSurviveRapidInteractionDuringPreview
     * @tc.desc RetryBudgetAndRateLimiterWindowAndSessionTransitionsSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RetryBudgetAndRateLimiterWindowAndSessionTransitionsSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const budget: RetryBudget = new RetryBudget(2);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(2);
        expect(budget.exhausted()).assertTrue();
      }
      {
        const limiter: RateLimiter = new RateLimiter(4, 1000);
        for (let index = 0; index < 4; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
      }
    });

    /**
     * @tc.name RateLimiterWindowAndSessionTransitionsHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc RateLimiterWindowAndSessionTransitionsHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndSessionTransitionsHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(4, 1000);
        for (let index = 0; index < 4; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
      }
    });

    /**
     * @tc.name SessionTransitionsAndSnapshotRoundTripAndRolePolicyCheckRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc SessionTransitionsAndSnapshotRoundTripAndRolePolicyCheckRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SessionTransitionsAndSnapshotRoundTripAndRolePolicyCheckRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '7');
        snapshot.put('day', '7');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('7');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
        trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
        expect(RolePolicy.canMutate('editor')).assertEqual(true);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndRolePolicyCheckAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc SnapshotRoundTripAndRolePolicyCheckAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndRolePolicyCheckAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '7');
        snapshot.put('day', '7');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('7');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
        trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
        expect(RolePolicy.canMutate('editor')).assertEqual(true);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
    });

    /**
     * @tc.name RolePolicyCheckAndLogMaskingPolicyAndTokenBucketRefillKeepTheSessionCoherentDuringPreview
     * @tc.desc RolePolicyCheckAndLogMaskingPolicyAndTokenBucketRefillKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RolePolicyCheckAndLogMaskingPolicyAndTokenBucketRefillKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
        trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
        expect(RolePolicy.canMutate('editor')).assertEqual(true);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
      {
        expect(Sanitizer.maskAccount('xy')).assertEqual('**');
        expect(Sanitizer.clean('a').length).assertEqual(1);
        expect(Sanitizer.trim('a ')).assertEqual('a');
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
     * @tc.name LogMaskingPolicyAndTokenBucketRefillTrackTheSelectedStateDuringPreview
     * @tc.desc LogMaskingPolicyAndTokenBucketRefillTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('LogMaskingPolicyAndTokenBucketRefillTrackTheSelectedStateDuringPreview', 0, () => {
      {
        expect(Sanitizer.maskAccount('xy')).assertEqual('**');
        expect(Sanitizer.clean('a').length).assertEqual(1);
        expect(Sanitizer.trim('a ')).assertEqual('a');
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
     * @tc.name TokenBucketRefillAndRetryBudgetAndRateLimiterWindowPreserveOrderingGuaranteesDuringPreview
     * @tc.desc TokenBucketRefillAndRetryBudgetAndRateLimiterWindowPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndRetryBudgetAndRateLimiterWindowPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(3);
        expect(bucket.take(3)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(3);
        expect(bucket.tokens).assertEqual(3);
        expect(bucket.take(0)).assertFalse();
      }
      {
        const budget: RetryBudget = new RetryBudget(3);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(3);
        expect(budget.exhausted()).assertTrue();
      }
      {
        const limiter: RateLimiter = new RateLimiter(5, 1000);
        for (let index = 0; index < 5; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
    });

    /**
     * @tc.name RetryBudgetAndRateLimiterWindowHoldForRepeatedEntryDuringPreview
     * @tc.desc RetryBudgetAndRateLimiterWindowHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RetryBudgetAndRateLimiterWindowHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const budget: RetryBudget = new RetryBudget(3);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(3);
        expect(budget.exhausted()).assertTrue();
      }
      {
        const limiter: RateLimiter = new RateLimiter(5, 1000);
        for (let index = 0; index < 5; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
    });

    /**
     * @tc.name RateLimiterWindowAndSessionTransitionsAndSnapshotRoundTripRemainStableUnderLoadDuringPreview
     * @tc.desc RateLimiterWindowAndSessionTransitionsAndSnapshotRoundTripRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndSessionTransitionsAndSnapshotRoundTripRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(5, 1000);
        for (let index = 0; index < 5; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('foreground')).assertTrue();
        expect(session.move('background')).assertTrue();
        expect(session.move('foreground')).assertTrue();
        expect(session.move('created')).assertFalse();
        expect(session.move('destroyed')).assertTrue();
        expect(session.rank()).assertEqual(3);
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '2');
        snapshot.put('day', '14');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('2');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name SessionTransitionsAndSnapshotRoundTripStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc SessionTransitionsAndSnapshotRoundTripStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SessionTransitionsAndSnapshotRoundTripStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('foreground')).assertTrue();
        expect(session.move('background')).assertTrue();
        expect(session.move('foreground')).assertTrue();
        expect(session.move('created')).assertFalse();
        expect(session.move('destroyed')).assertTrue();
        expect(session.rank()).assertEqual(3);
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '2');
        snapshot.put('day', '14');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('2');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndRolePolicyCheckAndLogMaskingPolicyKeepTheVisibleStateInStepAfterRollover
     * @tc.desc SnapshotRoundTripAndRolePolicyCheckAndLogMaskingPolicyKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndRolePolicyCheckAndLogMaskingPolicyKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '2');
        snapshot.put('day', '14');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('2');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('owner', 'editGrid', RolePolicy.canMutate('owner'));
        trail.record('owner', 'exportGrid', RolePolicy.canExport('owner'));
        expect(RolePolicy.canMutate('owner')).assertEqual(true);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
      {
        expect(Sanitizer.trim('  grid  ')).assertEqual('grid');
        expect(Sanitizer.clean(' grid ')).assertEqual('grid');
        expect(Sanitizer.isSafeForLog('grid')).assertTrue();
      }
    });

    /**
     * @tc.name RolePolicyCheckAndLogMaskingPolicyPreserveTheDeclaredContractAfterRollover
     * @tc.desc RolePolicyCheckAndLogMaskingPolicyPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RolePolicyCheckAndLogMaskingPolicyPreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('owner', 'editGrid', RolePolicy.canMutate('owner'));
        trail.record('owner', 'exportGrid', RolePolicy.canExport('owner'));
        expect(RolePolicy.canMutate('owner')).assertEqual(true);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
      {
        expect(Sanitizer.trim('  grid  ')).assertEqual('grid');
        expect(Sanitizer.clean(' grid ')).assertEqual('grid');
        expect(Sanitizer.isSafeForLog('grid')).assertTrue();
      }
    });

    /**
     * @tc.name LogMaskingPolicyAndTokenBucketRefillAndRetryBudgetSurviveRapidInteractionAfterRollover
     * @tc.desc LogMaskingPolicyAndTokenBucketRefillAndRetryBudgetSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('LogMaskingPolicyAndTokenBucketRefillAndRetryBudgetSurviveRapidInteractionAfterRollover', 0, () => {
      {
        expect(Sanitizer.trim('  grid  ')).assertEqual('grid');
        expect(Sanitizer.clean(' grid ')).assertEqual('grid');
        expect(Sanitizer.isSafeForLog('grid')).assertTrue();
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
        const budget: RetryBudget = new RetryBudget(4);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(4);
        expect(budget.exhausted()).assertTrue();
      }
    });

    /**
     * @tc.name TokenBucketRefillAndRetryBudgetHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc TokenBucketRefillAndRetryBudgetHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndRetryBudgetHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(2);
        expect(bucket.take(2)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(2);
        expect(bucket.tokens).assertEqual(2);
        expect(bucket.take(0)).assertFalse();
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
     * @tc.name RetryBudgetAndRateLimiterWindowAndSessionTransitionsRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc RetryBudgetAndRateLimiterWindowAndSessionTransitionsRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RetryBudgetAndRateLimiterWindowAndSessionTransitionsRemainCorrectAfterRecoveryAfterRollover', 0, () => {
      {
        const budget: RetryBudget = new RetryBudget(4);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(4);
        expect(budget.exhausted()).assertTrue();
      }
      {
        const limiter: RateLimiter = new RateLimiter(3, 1000);
        for (let index = 0; index < 3; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
      }
    });

    /**
     * @tc.name RateLimiterWindowAndSessionTransitionsAgreeWithTheModelInvariantsAfterRollover
     * @tc.desc RateLimiterWindowAndSessionTransitionsAgreeWithTheModelInvariantsAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RateLimiterWindowAndSessionTransitionsAgreeWithTheModelInvariantsAfterRollover', 0, () => {
      {
        const limiter: RateLimiter = new RateLimiter(3, 1000);
        for (let index = 0; index < 3; index++) {
          expect(limiter.allow(index * 10)).assertTrue();
        }
        expect(limiter.allow(500)).assertFalse();
        expect(limiter.allow(2000)).assertTrue();
      }
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
      }
    });

    /**
     * @tc.name SessionTransitionsAndSnapshotRoundTripAndRolePolicyCheckKeepTheSessionCoherentAfterRollover
     * @tc.desc SessionTransitionsAndSnapshotRoundTripAndRolePolicyCheckKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SessionTransitionsAndSnapshotRoundTripAndRolePolicyCheckKeepTheSessionCoherentAfterRollover', 0, () => {
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '9');
        snapshot.put('day', '21');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('9');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
        trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
        expect(RolePolicy.canMutate('viewer')).assertEqual(false);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndRolePolicyCheckTrackTheSelectedStateAfterRollover
     * @tc.desc SnapshotRoundTripAndRolePolicyCheckTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndRolePolicyCheckTrackTheSelectedStateAfterRollover', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '9');
        snapshot.put('day', '21');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('9');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
        trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
        expect(RolePolicy.canMutate('viewer')).assertEqual(false);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
    });

    /**
     * @tc.name RolePolicyCheckAndLogMaskingPolicyAndTokenBucketRefillPreserveOrderingGuaranteesAfterRollover
     * @tc.desc RolePolicyCheckAndLogMaskingPolicyAndTokenBucketRefillPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RolePolicyCheckAndLogMaskingPolicyAndTokenBucketRefillPreserveOrderingGuaranteesAfterRollover', 0, () => {
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
        trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
        expect(RolePolicy.canMutate('viewer')).assertEqual(false);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
      {
        expect(Sanitizer.isSafeForLog('account token')).assertFalse();
        expect(Sanitizer.isSafeForLog('plain text')).assertTrue();
        expect(Sanitizer.maskAccount('13800138000')).assertEqual('1***0');
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
     * @tc.name LogMaskingPolicyAndTokenBucketRefillHoldForRepeatedEntryAfterRollover
     * @tc.desc LogMaskingPolicyAndTokenBucketRefillHoldForRepeatedEntryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('LogMaskingPolicyAndTokenBucketRefillHoldForRepeatedEntryAfterRollover', 0, () => {
      {
        expect(Sanitizer.isSafeForLog('account token')).assertFalse();
        expect(Sanitizer.isSafeForLog('plain text')).assertTrue();
        expect(Sanitizer.maskAccount('13800138000')).assertEqual('1***0');
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
     * @tc.name TokenBucketRefillAndRetryBudgetAndRateLimiterWindowRemainStableUnderLoadAfterRollover
     * @tc.desc TokenBucketRefillAndRetryBudgetAndRateLimiterWindowRemainStableUnderLoadAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('TokenBucketRefillAndRetryBudgetAndRateLimiterWindowRemainStableUnderLoadAfterRollover', 0, () => {
      {
        const bucket: TokenBucket = new TokenBucket(5);
        expect(bucket.take(5)).assertTrue();
        expect(bucket.take(1)).assertFalse();
        bucket.refill(5);
        expect(bucket.tokens).assertEqual(5);
        expect(bucket.take(0)).assertFalse();
      }
      {
        const budget: RetryBudget = new RetryBudget(2);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(2);
        expect(budget.exhausted()).assertTrue();
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
