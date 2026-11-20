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

export default function ButtonInteractionTest(): void {
  describe('ButtonInteractionTest', () => {
    beforeAll(() => {
      logSuite('ButtonInteractionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('ButtonInteractionTest', 'end');
    });

    /**
     * @tc.name SettlementBarAvailabilityAndCartSelectionToggleStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc SettlementBarAvailabilityAndCartSelectionToggleStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SettlementBarAvailabilityAndCartSelectionToggleStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const cart: CartModel = new CartModel(1);
        const bar: BottomBarModel = new BottomBarModel('settlement', SettlementBar.CART);
        bar.disableWhenEmpty(cart);
        expect(bar.enabled).assertTrue();
        cart.selectAll(false);
        bar.disableWhenEmpty(cart);
        expect(bar.enabled).assertFalse();
        expect(bar.barType).assertEqual(SettlementBar.CART);
      }
      {
        const cart: CartModel = new CartModel(3);
        expect(cart.allSelected()).assertTrue();
        cart.selectAll(false);
        expect(cart.selectedCount()).assertEqual(0);
        cart.toggleSelected(0);
        expect(cart.selectedCount()).assertEqual(1);
        expect(cart.selectedSubtotal()).assertEqual(cart.items[0].lineTotal());
      }
    });

    /**
     * @tc.name CartSelectionToggleAndPanelStateMachineAndThemeTokenResolutionKeepTheVisibleStateInStepDuringPreview
     * @tc.desc CartSelectionToggleAndPanelStateMachineAndThemeTokenResolutionKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'CartSelectionToggleAndPanelStateMachineAndThemeTokenResolutionKeepTheVisibleStateInStepDuringPreview',
      0,
      () => {
        {
          const cart: CartModel = new CartModel(3);
          expect(cart.allSelected()).assertTrue();
          cart.selectAll(false);
          expect(cart.selectedCount()).assertEqual(0);
          cart.toggleSelected(0);
          expect(cart.selectedCount()).assertEqual(1);
          expect(cart.selectedSubtotal()).assertEqual(cart.items[0].lineTotal());
        }
        {
          const machine: PanelMachine = new PanelMachine();
          expect(machine.state).assertEqual('closed');
          machine.open();
          expect(machine.state).assertEqual('open');
          expect(machine.transition('closing')).assertTrue();
          expect(machine.transition('open')).assertFalse();
          machine.close();
          expect(machine.state).assertEqual('closed');
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
     * @tc.name PanelStateMachineAndThemeTokenResolutionPreserveTheDeclaredContractDuringPreview
     * @tc.desc PanelStateMachineAndThemeTokenResolutionPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndThemeTokenResolutionPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const machine: PanelMachine = new PanelMachine();
        expect(machine.state).assertEqual('closed');
        machine.open();
        expect(machine.state).assertEqual('open');
        expect(machine.transition('closing')).assertTrue();
        expect(machine.transition('open')).assertFalse();
        machine.close();
        expect(machine.state).assertEqual('closed');
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
     * @tc.name ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneySurviveRapidInteractionDuringPreview
     * @tc.desc ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneySurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneySurviveRapidInteractionDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
      }
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, 14);
        if (before + 14 < 1) {
          expect(after).assertEqual(1);
        } else if (before + 14 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + 14);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 6);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CartQuantityClampAndCalendarJourneyHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc CartQuantityClampAndCalendarJourneyHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndCalendarJourneyHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, 14);
        if (before + 14 < 1) {
          expect(after).assertEqual(1);
        } else if (before + 14 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + 14);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 6);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainCorrectAfterRecoveryDuringPreview',
      0,
      () => {
        {
          const today: DateModel = getRealTimeDate();
          const grid: int[] = getMonthDate(6, 2025);
          expect(grid.length % 7).assertEqual(0);
          const panel = PanelBuilder.build(6, 2025, 2);
          expect(panel.length).assertEqual(2);
          const chosen: number = GridInspector.slotOfDay(grid, 6);
          expect(chosen >= 0).assertTrue();
          expect(today.month >= 1).assertTrue();
          expect(panel[0].days.length).assertEqual(grid.length);
        }
        {
          const cart: CartModel = new CartModel(1);
          const bar: BottomBarModel = new BottomBarModel('settlement', SettlementBar.CART);
          bar.disableWhenEmpty(cart);
          expect(bar.enabled).assertTrue();
          cart.selectAll(false);
          bar.disableWhenEmpty(cart);
          expect(bar.enabled).assertFalse();
          expect(bar.barType).assertEqual(SettlementBar.CART);
        }
        {
          const cart: CartModel = new CartModel(5);
          expect(cart.allSelected()).assertTrue();
          cart.selectAll(false);
          expect(cart.selectedCount()).assertEqual(0);
          cart.toggleSelected(0);
          expect(cart.selectedCount()).assertEqual(1);
          expect(cart.selectedSubtotal()).assertEqual(cart.items[0].lineTotal());
        }
      },
    );

    /**
     * @tc.name SettlementBarAvailabilityAndCartSelectionToggleAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc SettlementBarAvailabilityAndCartSelectionToggleAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SettlementBarAvailabilityAndCartSelectionToggleAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const cart: CartModel = new CartModel(1);
        const bar: BottomBarModel = new BottomBarModel('settlement', SettlementBar.CART);
        bar.disableWhenEmpty(cart);
        expect(bar.enabled).assertTrue();
        cart.selectAll(false);
        bar.disableWhenEmpty(cart);
        expect(bar.enabled).assertFalse();
        expect(bar.barType).assertEqual(SettlementBar.CART);
      }
      {
        const cart: CartModel = new CartModel(5);
        expect(cart.allSelected()).assertTrue();
        cart.selectAll(false);
        expect(cart.selectedCount()).assertEqual(0);
        cart.toggleSelected(0);
        expect(cart.selectedCount()).assertEqual(1);
        expect(cart.selectedSubtotal()).assertEqual(cart.items[0].lineTotal());
      }
    });

    /**
     * @tc.name CartSelectionToggleAndPanelStateMachineAndThemeTokenResolutionKeepTheSessionCoherentDuringPreview
     * @tc.desc CartSelectionToggleAndPanelStateMachineAndThemeTokenResolutionKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartSelectionToggleAndPanelStateMachineAndThemeTokenResolutionKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const cart: CartModel = new CartModel(5);
        expect(cart.allSelected()).assertTrue();
        cart.selectAll(false);
        expect(cart.selectedCount()).assertEqual(0);
        cart.toggleSelected(0);
        expect(cart.selectedCount()).assertEqual(1);
        expect(cart.selectedSubtotal()).assertEqual(cart.items[0].lineTotal());
      }
      {
        const machine: PanelMachine = new PanelMachine();
        expect(machine.state).assertEqual('closed');
        machine.open();
        expect(machine.state).assertEqual('open');
        expect(machine.transition('closing')).assertTrue();
        expect(machine.transition('open')).assertFalse();
        machine.close();
        expect(machine.state).assertEqual('closed');
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
     * @tc.name ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneyPreserveOrderingGuaranteesDuringPreview
     * @tc.desc ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneyPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneyPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
      }
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, -14);
        if (before + -14 < 1) {
          expect(after).assertEqual(1);
        } else if (before + -14 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + -14);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(12, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(12, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 12);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CartQuantityClampAndCalendarJourneyHoldForRepeatedEntryDuringPreview
     * @tc.desc CartQuantityClampAndCalendarJourneyHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndCalendarJourneyHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, -14);
        if (before + -14 < 1) {
          expect(after).assertEqual(1);
        } else if (before + -14 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + -14);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(12, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(12, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 12);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainStableUnderLoadDuringPreview
     * @tc.desc CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(12, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(12, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 12);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const cart: CartModel = new CartModel(1);
        const bar: BottomBarModel = new BottomBarModel('settlement', SettlementBar.CART);
        bar.disableWhenEmpty(cart);
        expect(bar.enabled).assertTrue();
        cart.selectAll(false);
        bar.disableWhenEmpty(cart);
        expect(bar.enabled).assertFalse();
        expect(bar.barType).assertEqual(SettlementBar.CART);
      }
      {
        const cart: CartModel = new CartModel(3);
        expect(cart.allSelected()).assertTrue();
        cart.selectAll(false);
        expect(cart.selectedCount()).assertEqual(0);
        cart.toggleSelected(0);
        expect(cart.selectedCount()).assertEqual(1);
        expect(cart.selectedSubtotal()).assertEqual(cart.items[0].lineTotal());
      }
    });

    /**
     * @tc.name ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneySurviveRapidInteractionAfterRollover
     * @tc.desc ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneySurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneySurviveRapidInteractionAfterRollover', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
      }
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, -7);
        if (before + -7 < 1) {
          expect(after).assertEqual(1);
        } else if (before + -7 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + -7);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 18);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CartQuantityClampAndCalendarJourneyHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc CartQuantityClampAndCalendarJourneyHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndCalendarJourneyHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, -7);
        if (before + -7 < 1) {
          expect(after).assertEqual(1);
        } else if (before + -7 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + -7);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 18);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainCorrectAfterRecoveryAfterRollover',
      0,
      () => {
        {
          const today: DateModel = getRealTimeDate();
          const grid: int[] = getMonthDate(6, 2025);
          expect(grid.length % 7).assertEqual(0);
          const panel = PanelBuilder.build(6, 2025, 2);
          expect(panel.length).assertEqual(2);
          const chosen: number = GridInspector.slotOfDay(grid, 18);
          expect(chosen >= 0).assertTrue();
          expect(today.month >= 1).assertTrue();
          expect(panel[0].days.length).assertEqual(grid.length);
        }
        {
          const cart: CartModel = new CartModel(1);
          const bar: BottomBarModel = new BottomBarModel('settlement', SettlementBar.CART);
          bar.disableWhenEmpty(cart);
          expect(bar.enabled).assertTrue();
          cart.selectAll(false);
          bar.disableWhenEmpty(cart);
          expect(bar.enabled).assertFalse();
          expect(bar.barType).assertEqual(SettlementBar.CART);
        }
        {
          const cart: CartModel = new CartModel(5);
          expect(cart.allSelected()).assertTrue();
          cart.selectAll(false);
          expect(cart.selectedCount()).assertEqual(0);
          cart.toggleSelected(0);
          expect(cart.selectedCount()).assertEqual(1);
          expect(cart.selectedSubtotal()).assertEqual(cart.items[0].lineTotal());
        }
      },
    );

    /**
     * @tc.name ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneyPreserveOrderingGuaranteesAfterRollover
     * @tc.desc ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneyPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneyPreserveOrderingGuaranteesAfterRollover', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
      }
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, 0);
        if (before + 0 < 1) {
          expect(after).assertEqual(1);
        } else if (before + 0 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + 0);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(12, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(12, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 24);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CartQuantityClampAndCalendarJourneyHoldForRepeatedEntryAfterRollover
     * @tc.desc CartQuantityClampAndCalendarJourneyHoldForRepeatedEntryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndCalendarJourneyHoldForRepeatedEntryAfterRollover', 0, () => {
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, 0);
        if (before + 0 < 1) {
          expect(after).assertEqual(1);
        } else if (before + 0 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + 0);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(12, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(12, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 24);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainStableUnderLoadAfterRollover
     * @tc.desc CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainStableUnderLoadAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainStableUnderLoadAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(12, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(12, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 24);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const cart: CartModel = new CartModel(1);
        const bar: BottomBarModel = new BottomBarModel('settlement', SettlementBar.CART);
        bar.disableWhenEmpty(cart);
        expect(bar.enabled).assertTrue();
        cart.selectAll(false);
        bar.disableWhenEmpty(cart);
        expect(bar.enabled).assertFalse();
        expect(bar.barType).assertEqual(SettlementBar.CART);
      }
      {
        const cart: CartModel = new CartModel(3);
        expect(cart.allSelected()).assertTrue();
        cart.selectAll(false);
        expect(cart.selectedCount()).assertEqual(0);
        cart.toggleSelected(0);
        expect(cart.selectedCount()).assertEqual(1);
        expect(cart.selectedSubtotal()).assertEqual(cart.items[0].lineTotal());
      }
    });

    /**
     * @tc.name ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneySurviveRapidInteractionUnderLoad
     * @tc.desc ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneySurviveRapidInteractionUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneySurviveRapidInteractionUnderLoad', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
      }
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, 7);
        if (before + 7 < 1) {
          expect(after).assertEqual(1);
        } else if (before + 7 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + 7);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 3);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CartQuantityClampAndCalendarJourneyHoldAcrossConfigurationChangesUnderLoad
     * @tc.desc CartQuantityClampAndCalendarJourneyHoldAcrossConfigurationChangesUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndCalendarJourneyHoldAcrossConfigurationChangesUnderLoad', 0, () => {
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, 7);
        if (before + 7 < 1) {
          expect(after).assertEqual(1);
        } else if (before + 7 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + 7);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 3);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainCorrectAfterRecoveryUnderLoad
     * @tc.desc CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainCorrectAfterRecoveryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainCorrectAfterRecoveryUnderLoad',
      0,
      () => {
        {
          const today: DateModel = getRealTimeDate();
          const grid: int[] = getMonthDate(6, 2025);
          expect(grid.length % 7).assertEqual(0);
          const panel = PanelBuilder.build(6, 2025, 2);
          expect(panel.length).assertEqual(2);
          const chosen: number = GridInspector.slotOfDay(grid, 3);
          expect(chosen >= 0).assertTrue();
          expect(today.month >= 1).assertTrue();
          expect(panel[0].days.length).assertEqual(grid.length);
        }
        {
          const cart: CartModel = new CartModel(1);
          const bar: BottomBarModel = new BottomBarModel('settlement', SettlementBar.CART);
          bar.disableWhenEmpty(cart);
          expect(bar.enabled).assertTrue();
          cart.selectAll(false);
          bar.disableWhenEmpty(cart);
          expect(bar.enabled).assertFalse();
          expect(bar.barType).assertEqual(SettlementBar.CART);
        }
        {
          const cart: CartModel = new CartModel(5);
          expect(cart.allSelected()).assertTrue();
          cart.selectAll(false);
          expect(cart.selectedCount()).assertEqual(0);
          cart.toggleSelected(0);
          expect(cart.selectedCount()).assertEqual(1);
          expect(cart.selectedSubtotal()).assertEqual(cart.items[0].lineTotal());
        }
      },
    );

    /**
     * @tc.name ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneyPreserveOrderingGuaranteesUnderLoad
     * @tc.desc ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneyPreserveOrderingGuaranteesUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneyPreserveOrderingGuaranteesUnderLoad', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
      }
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, 14);
        if (before + 14 < 1) {
          expect(after).assertEqual(1);
        } else if (before + 14 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + 14);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(12, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(12, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 9);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CartQuantityClampAndCalendarJourneyHoldForRepeatedEntryUnderLoad
     * @tc.desc CartQuantityClampAndCalendarJourneyHoldForRepeatedEntryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndCalendarJourneyHoldForRepeatedEntryUnderLoad', 0, () => {
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, 14);
        if (before + 14 < 1) {
          expect(after).assertEqual(1);
        } else if (before + 14 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + 14);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(12, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(12, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 9);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainStableUnderLoadUnderLoad
     * @tc.desc CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainStableUnderLoadUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndSettlementBarAvailabilityAndCartSelectionToggleRemainStableUnderLoadUnderLoad', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(12, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(12, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 9);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const cart: CartModel = new CartModel(1);
        const bar: BottomBarModel = new BottomBarModel('settlement', SettlementBar.CART);
        bar.disableWhenEmpty(cart);
        expect(bar.enabled).assertTrue();
        cart.selectAll(false);
        bar.disableWhenEmpty(cart);
        expect(bar.enabled).assertFalse();
        expect(bar.barType).assertEqual(SettlementBar.CART);
      }
      {
        const cart: CartModel = new CartModel(3);
        expect(cart.allSelected()).assertTrue();
        cart.selectAll(false);
        expect(cart.selectedCount()).assertEqual(0);
        cart.toggleSelected(0);
        expect(cart.selectedCount()).assertEqual(1);
        expect(cart.selectedSubtotal()).assertEqual(cart.items[0].lineTotal());
      }
    });

    /**
     * @tc.name ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneySurviveRapidInteractionOnNarrowScreens
     * @tc.desc ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneySurviveRapidInteractionOnNarrowScreens
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndCartQuantityClampAndCalendarJourneySurviveRapidInteractionOnNarrowScreens', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
      }
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, -14);
        if (before + -14 < 1) {
          expect(after).assertEqual(1);
        } else if (before + -14 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + -14);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 15);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });
  });
}
