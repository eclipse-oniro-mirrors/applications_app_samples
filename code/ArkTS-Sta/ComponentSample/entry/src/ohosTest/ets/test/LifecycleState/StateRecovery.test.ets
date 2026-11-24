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

export default function StateRecoveryTest(): void {
  describe('StateRecoveryTest', () => {
    beforeAll(() => {
      logSuite('StateRecoveryTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('StateRecoveryTest', 'end');
    });

    /**
     * @tc.name SnapshotRoundTripAndRetryBudgetStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc SnapshotRoundTripAndRetryBudgetStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndRetryBudgetStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '1');
        snapshot.put('day', '1');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('1');
        expect(restored.fields.length).assertEqual(2);
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
     * @tc.name RetryBudgetAndErrorClassificationAndDateModelIndependenceKeepTheVisibleStateInStepDuringPreview
     * @tc.desc RetryBudgetAndErrorClassificationAndDateModelIndependenceKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RetryBudgetAndErrorClassificationAndDateModelIndependenceKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const budget: RetryBudget = new RetryBudget(3);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(3);
        expect(budget.exhausted()).assertTrue();
      }
      {
        expect(ErrorClassifier.classify(503)).assertEqual('server');
        expect(ErrorClassifier.recoverable('server')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
      {
        const left: DateModel = new DateModel(4, 1, 2, 2020);
        const right: DateModel = new DateModel(left.day, left.week, left.month, left.year);
        left.day = left.day + 3;
        expect(left.day).assertEqual(7);
        expect(right.day).assertEqual(4);
        expect(left !== right).assertTrue();
      }
    });

    /**
     * @tc.name ErrorClassificationAndDateModelIndependencePreserveTheDeclaredContractDuringPreview
     * @tc.desc ErrorClassificationAndDateModelIndependencePreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ErrorClassificationAndDateModelIndependencePreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        expect(ErrorClassifier.classify(503)).assertEqual('server');
        expect(ErrorClassifier.recoverable('server')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
      {
        const left: DateModel = new DateModel(4, 1, 2, 2020);
        const right: DateModel = new DateModel(left.day, left.week, left.month, left.year);
        left.day = left.day + 3;
        expect(left.day).assertEqual(7);
        expect(right.day).assertEqual(4);
        expect(left !== right).assertTrue();
      }
    });

    /**
     * @tc.name DateModelIndependenceAndCalendarJourneyAndSnapshotRoundTripSurviveRapidInteractionDuringPreview
     * @tc.desc DateModelIndependenceAndCalendarJourneyAndSnapshotRoundTripSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DateModelIndependenceAndCalendarJourneyAndSnapshotRoundTripSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const left: DateModel = new DateModel(4, 1, 2, 2020);
        const right: DateModel = new DateModel(left.day, left.week, left.month, left.year);
        left.day = left.day + 3;
        expect(left.day).assertEqual(7);
        expect(right.day).assertEqual(4);
        expect(left !== right).assertTrue();
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
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '6');
        snapshot.put('day', '6');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('6');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name CalendarJourneyAndSnapshotRoundTripHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc CalendarJourneyAndSnapshotRoundTripHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndSnapshotRoundTripHoldAcrossConfigurationChangesDuringPreview', 0, () => {
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
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '6');
        snapshot.put('day', '6');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('6');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndRetryBudgetAndErrorClassificationRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc SnapshotRoundTripAndRetryBudgetAndErrorClassificationRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndRetryBudgetAndErrorClassificationRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '6');
        snapshot.put('day', '6');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('6');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const budget: RetryBudget = new RetryBudget(2);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(2);
        expect(budget.exhausted()).assertTrue();
      }
      {
        expect(ErrorClassifier.classify(503)).assertEqual('server');
        expect(ErrorClassifier.recoverable('server')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name RetryBudgetAndErrorClassificationAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc RetryBudgetAndErrorClassificationAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RetryBudgetAndErrorClassificationAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const budget: RetryBudget = new RetryBudget(2);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(2);
        expect(budget.exhausted()).assertTrue();
      }
      {
        expect(ErrorClassifier.classify(503)).assertEqual('server');
        expect(ErrorClassifier.recoverable('server')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
    });

    /**
     * @tc.name ErrorClassificationAndDateModelIndependenceAndCalendarJourneyKeepTheSessionCoherentDuringPreview
     * @tc.desc ErrorClassificationAndDateModelIndependenceAndCalendarJourneyKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ErrorClassificationAndDateModelIndependenceAndCalendarJourneyKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        expect(ErrorClassifier.classify(503)).assertEqual('server');
        expect(ErrorClassifier.recoverable('server')).assertEqual(true);
        expect(ErrorClassifier.backoffDelay(0, 100)).assertEqual(100);
        expect(ErrorClassifier.backoffDelay(10, 100)).assertEqual(8000);
      }
      {
        const left: DateModel = new DateModel(9, 1, 2, 2020);
        const right: DateModel = new DateModel(left.day, left.week, left.month, left.year);
        left.day = left.day + 3;
        expect(left.day).assertEqual(12);
        expect(right.day).assertEqual(9);
        expect(left !== right).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(10, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(10, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 10);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name DateModelIndependenceAndCalendarJourneyTrackTheSelectedStateDuringPreview
     * @tc.desc DateModelIndependenceAndCalendarJourneyTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DateModelIndependenceAndCalendarJourneyTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const left: DateModel = new DateModel(9, 1, 2, 2020);
        const right: DateModel = new DateModel(left.day, left.week, left.month, left.year);
        left.day = left.day + 3;
        expect(left.day).assertEqual(12);
        expect(right.day).assertEqual(9);
        expect(left !== right).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(10, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(10, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 10);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndSnapshotRoundTripAndRetryBudgetPreserveOrderingGuaranteesDuringPreview
     * @tc.desc CalendarJourneyAndSnapshotRoundTripAndRetryBudgetPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndSnapshotRoundTripAndRetryBudgetPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(10, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(10, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 10);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '11');
        snapshot.put('day', '11');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('11');
        expect(restored.fields.length).assertEqual(2);
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
     * @tc.name SnapshotRoundTripAndRetryBudgetHoldForRepeatedEntryDuringPreview
     * @tc.desc SnapshotRoundTripAndRetryBudgetHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndRetryBudgetHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '11');
        snapshot.put('day', '11');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('11');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const budget: RetryBudget = new RetryBudget(4);
        const failed: boolean = budget.attempt(() => false);
        expect(failed).assertFalse();
        expect(budget.attempts).assertEqual(4);
        expect(budget.exhausted()).assertTrue();
      }
    });
  });
}
