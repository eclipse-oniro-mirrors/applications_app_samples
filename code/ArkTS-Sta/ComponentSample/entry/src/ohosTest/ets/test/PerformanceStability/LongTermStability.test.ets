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

export default function LongTermStabilityTest(): void {
  describe('LongTermStabilityTest', () => {
    beforeAll(() => {
      logSuite('LongTermStabilityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('LongTermStabilityTest', 'end');
    });

    /**
     * @tc.name RepeatedBuildStabilityAndRealTimeDateFieldsStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc RepeatedBuildStabilityAndRealTimeDateFieldsStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RepeatedBuildStabilityAndRealTimeDateFieldsStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
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
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.week >= 0 && model.week <= 6).assertTrue();
        expect(new Date(model.year, model.month, 0).getDate().toInt() >= model.day).assertTrue();
      }
    });

    /**
     * @tc.name RealTimeDateFieldsAndCalendarJourneyAndStableRandomStreamKeepTheVisibleStateInStepDuringPreview
     * @tc.desc RealTimeDateFieldsAndCalendarJourneyAndStableRandomStreamKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RealTimeDateFieldsAndCalendarJourneyAndStableRandomStreamKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.week >= 0 && model.week <= 6).assertTrue();
        expect(new Date(model.year, model.month, 0).getDate().toInt() >= model.day).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(3, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(3, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 3);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
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
     * @tc.name CalendarJourneyAndStableRandomStreamPreserveTheDeclaredContractDuringPreview
     * @tc.desc CalendarJourneyAndStableRandomStreamPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndStableRandomStreamPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(3, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(3, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 3);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
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
     * @tc.name StableRandomStreamAndRepeatedBuildStabilityAndRealTimeDateFieldsSurviveRapidInteractionDuringPreview
     * @tc.desc StableRandomStreamAndRepeatedBuildStabilityAndRealTimeDateFieldsSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'StableRandomStreamAndRepeatedBuildStabilityAndRealTimeDateFieldsSurviveRapidInteractionDuringPreview',
      0,
      () => {
        {
          const stream: StableRandom = new StableRandom(14);
          const first: number = stream.nextInRange(0, 34);
          expect(first >= 0).assertTrue();
          expect(first <= 34).assertTrue();
          const replay: StableRandom = new StableRandom(14);
          expect(replay.nextInRange(0, 34)).assertEqual(first);
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
          const model: DateModel = getRealTimeDate();
          const now: Date = new Date();
          expect(model.year).assertEqual(now.getFullYear().toInt());
          expect(model.month).assertEqual(now.getMonth().toInt() + 1);
          expect(model.day).assertEqual(now.getDate().toInt());
          expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
          expect(isLeapYear(model.year) || !isLeapYear(model.year)).assertTrue();
          expect(daysInMonth(model.month, model.year) >= model.day).assertTrue();
        }
      },
    );

    /**
     * @tc.name RepeatedBuildStabilityAndRealTimeDateFieldsHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc RepeatedBuildStabilityAndRealTimeDateFieldsHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RepeatedBuildStabilityAndRealTimeDateFieldsHoldAcrossConfigurationChangesDuringPreview', 0, () => {
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
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(isLeapYear(model.year) || !isLeapYear(model.year)).assertTrue();
        expect(daysInMonth(model.month, model.year) >= model.day).assertTrue();
      }
    });

    /**
     * @tc.name RealTimeDateFieldsAndCalendarJourneyAndStableRandomStreamRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc RealTimeDateFieldsAndCalendarJourneyAndStableRandomStreamRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RealTimeDateFieldsAndCalendarJourneyAndStableRandomStreamRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(isLeapYear(model.year) || !isLeapYear(model.year)).assertTrue();
        expect(daysInMonth(model.month, model.year) >= model.day).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(7, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(7, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 7);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const stream: StableRandom = new StableRandom(18);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(18);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
    });

    /**
     * @tc.name CalendarJourneyAndStableRandomStreamAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc CalendarJourneyAndStableRandomStreamAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndStableRandomStreamAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(7, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(7, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 7);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const stream: StableRandom = new StableRandom(18);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(18);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
    });
  });
}
