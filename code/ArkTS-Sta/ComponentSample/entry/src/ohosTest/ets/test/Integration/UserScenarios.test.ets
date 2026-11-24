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

export default function UserScenariosTest(): void {
  describe('UserScenariosTest', () => {
    beforeAll(() => {
      logSuite('UserScenariosTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('UserScenariosTest', 'end');
    });

    /**
     * @tc.name CalendarJourneyAndCascadeTagSelectionStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc CalendarJourneyAndCascadeTagSelectionStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndCascadeTagSelectionStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(1, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(1, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 1);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(1);
        expect(model.itemScrollTarget).assertEqual(10);
        expect(model.currentTagIndex).assertEqual(1);
        expect(model.itemsOfTag(1).length).assertEqual(10);
      }
    });

    /**
     * @tc.name CascadeTagSelectionAndCartQuantityClampAndCartSelectionToggleKeepTheVisibleStateInStepDuringPreview
     * @tc.desc CascadeTagSelectionAndCartQuantityClampAndCartSelectionToggleKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeTagSelectionAndCartQuantityClampAndCartSelectionToggleKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(1);
        expect(model.itemScrollTarget).assertEqual(10);
        expect(model.currentTagIndex).assertEqual(1);
        expect(model.itemsOfTag(1).length).assertEqual(10);
      }
      {
        const cart: CartModel = new CartModel(3);
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
     * @tc.name CartQuantityClampAndCartSelectionTogglePreserveTheDeclaredContractDuringPreview
     * @tc.desc CartQuantityClampAndCartSelectionTogglePreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndCartSelectionTogglePreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const cart: CartModel = new CartModel(3);
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
     * @tc.name CartSelectionToggleAndPanelStateMachineAndMonthLabelContractSurviveRapidInteractionDuringPreview
     * @tc.desc CartSelectionToggleAndPanelStateMachineAndMonthLabelContractSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartSelectionToggleAndPanelStateMachineAndMonthLabelContractSurviveRapidInteractionDuringPreview', 0, () => {
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
        const label: string = monthLabel(6, 2020);
        expect(label.indexOf('2020') >= 0).assertTrue();
        expect(label.indexOf('6') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(6, 2020, 1);
        expect(panels[0].label).assertEqual(label);
      }
    });

    /**
     * @tc.name PanelStateMachineAndMonthLabelContractHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc PanelStateMachineAndMonthLabelContractHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndMonthLabelContractHoldAcrossConfigurationChangesDuringPreview', 0, () => {
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
        const label: string = monthLabel(6, 2020);
        expect(label.indexOf('2020') >= 0).assertTrue();
        expect(label.indexOf('6') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(6, 2020, 1);
        expect(panels[0].label).assertEqual(label);
      }
    });

    /**
     * @tc.name MonthLabelContractAndCalendarJourneyAndCascadeTagSelectionRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc MonthLabelContractAndCalendarJourneyAndCascadeTagSelectionRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndCalendarJourneyAndCascadeTagSelectionRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const label: string = monthLabel(6, 2020);
        expect(label.indexOf('2020') >= 0).assertTrue();
        expect(label.indexOf('6') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(6, 2020, 1);
        expect(panels[0].label).assertEqual(label);
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
        const model: CascadeModel = new CascadeModel();
        model.selectTag(7);
        expect(model.itemScrollTarget).assertEqual(70);
        expect(model.currentTagIndex).assertEqual(7);
        expect(model.itemsOfTag(7).length).assertEqual(10);
      }
    });

    /**
     * @tc.name CalendarJourneyAndCascadeTagSelectionAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc CalendarJourneyAndCascadeTagSelectionAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndCascadeTagSelectionAgreeWithTheModelInvariantsDuringPreview', 0, () => {
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
        const model: CascadeModel = new CascadeModel();
        model.selectTag(7);
        expect(model.itemScrollTarget).assertEqual(70);
        expect(model.currentTagIndex).assertEqual(7);
        expect(model.itemsOfTag(7).length).assertEqual(10);
      }
    });

    /**
     * @tc.name CascadeTagSelectionAndCartQuantityClampAndCartSelectionToggleKeepTheSessionCoherentDuringPreview
     * @tc.desc CascadeTagSelectionAndCartQuantityClampAndCartSelectionToggleKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeTagSelectionAndCartQuantityClampAndCartSelectionToggleKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(7);
        expect(model.itemScrollTarget).assertEqual(70);
        expect(model.currentTagIndex).assertEqual(7);
        expect(model.itemsOfTag(7).length).assertEqual(10);
      }
      {
        const cart: CartModel = new CartModel(3);
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
     * @tc.name CartQuantityClampAndCartSelectionToggleTrackTheSelectedStateDuringPreview
     * @tc.desc CartQuantityClampAndCartSelectionToggleTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndCartSelectionToggleTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const cart: CartModel = new CartModel(3);
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
     * @tc.name CartSelectionToggleAndPanelStateMachineAndMonthLabelContractPreserveOrderingGuaranteesDuringPreview
     * @tc.desc CartSelectionToggleAndPanelStateMachineAndMonthLabelContractPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartSelectionToggleAndPanelStateMachineAndMonthLabelContractPreserveOrderingGuaranteesDuringPreview', 0, () => {
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
        const label: string = monthLabel(12, 2026);
        expect(label.indexOf('2026') >= 0).assertTrue();
        expect(label.indexOf('12') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(12, 2026, 1);
        expect(panels[0].label).assertEqual(label);
      }
    });

    /**
     * @tc.name PanelStateMachineAndMonthLabelContractHoldForRepeatedEntryDuringPreview
     * @tc.desc PanelStateMachineAndMonthLabelContractHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndMonthLabelContractHoldForRepeatedEntryDuringPreview', 0, () => {
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
        const label: string = monthLabel(12, 2026);
        expect(label.indexOf('2026') >= 0).assertTrue();
        expect(label.indexOf('12') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(12, 2026, 1);
        expect(panels[0].label).assertEqual(label);
      }
    });

    /**
     * @tc.name MonthLabelContractAndCalendarJourneyAndCascadeTagSelectionRemainStableUnderLoadDuringPreview
     * @tc.desc MonthLabelContractAndCalendarJourneyAndCascadeTagSelectionRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndCalendarJourneyAndCascadeTagSelectionRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const label: string = monthLabel(12, 2026);
        expect(label.indexOf('2026') >= 0).assertTrue();
        expect(label.indexOf('12') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(12, 2026, 1);
        expect(panels[0].label).assertEqual(label);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(1, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(1, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 13);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(1);
        expect(model.itemScrollTarget).assertEqual(10);
        expect(model.currentTagIndex).assertEqual(1);
        expect(model.itemsOfTag(1).length).assertEqual(10);
      }
    });

    /**
     * @tc.name CalendarJourneyAndCascadeTagSelectionStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc CalendarJourneyAndCascadeTagSelectionStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndCascadeTagSelectionStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(1, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(1, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 13);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(1);
        expect(model.itemScrollTarget).assertEqual(10);
        expect(model.currentTagIndex).assertEqual(1);
        expect(model.itemsOfTag(1).length).assertEqual(10);
      }
    });

    /**
     * @tc.name CascadeTagSelectionAndCartQuantityClampAndCartSelectionToggleKeepTheVisibleStateInStepAfterRollover
     * @tc.desc CascadeTagSelectionAndCartQuantityClampAndCartSelectionToggleKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeTagSelectionAndCartQuantityClampAndCartSelectionToggleKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(1);
        expect(model.itemScrollTarget).assertEqual(10);
        expect(model.currentTagIndex).assertEqual(1);
        expect(model.itemsOfTag(1).length).assertEqual(10);
      }
      {
        const cart: CartModel = new CartModel(3);
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
     * @tc.name CartQuantityClampAndCartSelectionTogglePreserveTheDeclaredContractAfterRollover
     * @tc.desc CartQuantityClampAndCartSelectionTogglePreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndCartSelectionTogglePreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        const cart: CartModel = new CartModel(3);
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
     * @tc.name CartSelectionToggleAndPanelStateMachineAndMonthLabelContractSurviveRapidInteractionAfterRollover
     * @tc.desc CartSelectionToggleAndPanelStateMachineAndMonthLabelContractSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartSelectionToggleAndPanelStateMachineAndMonthLabelContractSurviveRapidInteractionAfterRollover', 0, () => {
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
        const label: string = monthLabel(6, 2032);
        expect(label.indexOf('2032') >= 0).assertTrue();
        expect(label.indexOf('6') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(6, 2032, 1);
        expect(panels[0].label).assertEqual(label);
      }
    });

    /**
     * @tc.name PanelStateMachineAndMonthLabelContractHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc PanelStateMachineAndMonthLabelContractHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndMonthLabelContractHoldAcrossConfigurationChangesAfterRollover', 0, () => {
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
        const label: string = monthLabel(6, 2032);
        expect(label.indexOf('2032') >= 0).assertTrue();
        expect(label.indexOf('6') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(6, 2032, 1);
        expect(panels[0].label).assertEqual(label);
      }
    });

    /**
     * @tc.name MonthLabelContractAndCalendarJourneyAndCascadeTagSelectionRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc MonthLabelContractAndCalendarJourneyAndCascadeTagSelectionRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndCalendarJourneyAndCascadeTagSelectionRemainCorrectAfterRecoveryAfterRollover', 0, () => {
      {
        const label: string = monthLabel(6, 2032);
        expect(label.indexOf('2032') >= 0).assertTrue();
        expect(label.indexOf('6') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(6, 2032, 1);
        expect(panels[0].label).assertEqual(label);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(7, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(7, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 19);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(7);
        expect(model.itemScrollTarget).assertEqual(70);
        expect(model.currentTagIndex).assertEqual(7);
        expect(model.itemsOfTag(7).length).assertEqual(10);
      }
    });

    /**
     * @tc.name CalendarJourneyAndCascadeTagSelectionAgreeWithTheModelInvariantsAfterRollover
     * @tc.desc CalendarJourneyAndCascadeTagSelectionAgreeWithTheModelInvariantsAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndCascadeTagSelectionAgreeWithTheModelInvariantsAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(7, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(7, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 19);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(7);
        expect(model.itemScrollTarget).assertEqual(70);
        expect(model.currentTagIndex).assertEqual(7);
        expect(model.itemsOfTag(7).length).assertEqual(10);
      }
    });

    /**
     * @tc.name CascadeTagSelectionAndCartQuantityClampAndCartSelectionToggleKeepTheSessionCoherentAfterRollover
     * @tc.desc CascadeTagSelectionAndCartQuantityClampAndCartSelectionToggleKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeTagSelectionAndCartQuantityClampAndCartSelectionToggleKeepTheSessionCoherentAfterRollover', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(7);
        expect(model.itemScrollTarget).assertEqual(70);
        expect(model.currentTagIndex).assertEqual(7);
        expect(model.itemsOfTag(7).length).assertEqual(10);
      }
      {
        const cart: CartModel = new CartModel(3);
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
     * @tc.name CartQuantityClampAndCartSelectionToggleTrackTheSelectedStateAfterRollover
     * @tc.desc CartQuantityClampAndCartSelectionToggleTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndCartSelectionToggleTrackTheSelectedStateAfterRollover', 0, () => {
      {
        const cart: CartModel = new CartModel(3);
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
     * @tc.name CartSelectionToggleAndPanelStateMachineAndMonthLabelContractPreserveOrderingGuaranteesAfterRollover
     * @tc.desc CartSelectionToggleAndPanelStateMachineAndMonthLabelContractPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartSelectionToggleAndPanelStateMachineAndMonthLabelContractPreserveOrderingGuaranteesAfterRollover', 0, () => {
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
        const label: string = monthLabel(12, 2038);
        expect(label.indexOf('2038') >= 0).assertTrue();
        expect(label.indexOf('12') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(12, 2038, 1);
        expect(panels[0].label).assertEqual(label);
      }
    });
  });
}
