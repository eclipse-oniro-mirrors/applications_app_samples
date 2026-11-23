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

export default function UIComponentRenderingTest(): void {
  describe('UIComponentRenderingTest', () => {
    beforeAll(() => {
      logSuite('UIComponentRenderingTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('UIComponentRenderingTest', 'end');
    });

    /**
     * @tc.name PanelGeometryAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc PanelGeometryAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[2].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheVisibleStateInStepDuringPreview
     * @tc.desc WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[2].emphasized).assertFalse();
      }
      {
        const info: ProductInfoModel = new ProductInfoModel(101, 114, true);
        expect(info.priceText().indexOf(info.price.toFixed(2)) >= 0).assertTrue();
        expect(info.priceText().length >= 5).assertTrue();
        expect(info.soldText().indexOf(info.sold.toString()) >= 0).assertTrue();
        expect(info.discountLine().length > 0).assertTrue();
      }
      {
        const active = CellProjector.project(4, 6, 2026, 4, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(3, 6, 2026, 4, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name ProductPriceBlockAndDayCellHighlightPreserveTheDeclaredContractDuringPreview
     * @tc.desc ProductPriceBlockAndDayCellHighlightPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ProductPriceBlockAndDayCellHighlightPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const info: ProductInfoModel = new ProductInfoModel(101, 114, true);
        expect(info.priceText().indexOf(info.price.toFixed(2)) >= 0).assertTrue();
        expect(info.priceText().length >= 5).assertTrue();
        expect(info.soldText().indexOf(info.sold.toString()) >= 0).assertTrue();
        expect(info.discountLine().length > 0).assertTrue();
      }
      {
        const active = CellProjector.project(4, 6, 2026, 4, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(3, 6, 2026, 4, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndCalendarJourneyAndCartLineItemSurviveRapidInteractionDuringPreview
     * @tc.desc DayCellHighlightAndCalendarJourneyAndCartLineItemSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndCalendarJourneyAndCartLineItemSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const active = CellProjector.project(4, 6, 2026, 4, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(3, 6, 2026, 4, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
        const item: CartItem = new CartItem('sample', 20, 3, true);
        expect(item.lineTotal()).assertEqual(60);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(3);
      }
    });

    /**
     * @tc.name CalendarJourneyAndCartLineItemHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc CalendarJourneyAndCartLineItemHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndCartLineItemHoldAcrossConfigurationChangesDuringPreview', 0, () => {
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
        const item: CartItem = new CartItem('sample', 20, 3, true);
        expect(item.lineTotal()).assertEqual(60);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(3);
      }
    });

    /**
     * @tc.name CartLineItemAndPanelGeometryAndWeekHeaderEmphasisRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc CartLineItemAndPanelGeometryAndWeekHeaderEmphasisRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartLineItemAndPanelGeometryAndWeekHeaderEmphasisRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const item: CartItem = new CartItem('sample', 20, 3, true);
        expect(item.lineTotal()).assertEqual(60);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(3);
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[3].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name PanelGeometryAndWeekHeaderEmphasisAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc PanelGeometryAndWeekHeaderEmphasisAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndWeekHeaderEmphasisAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[3].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheSessionCoherentDuringPreview
     * @tc.desc WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[3].emphasized).assertFalse();
      }
      {
        const info: ProductInfoModel = new ProductInfoModel(107, 156, true);
        expect(info.priceText().indexOf(info.price.toFixed(2)) >= 0).assertTrue();
        expect(info.priceText().length >= 5).assertTrue();
        expect(info.soldText().indexOf(info.sold.toString()) >= 0).assertTrue();
        expect(info.discountLine().length > 0).assertTrue();
      }
      {
        const active = CellProjector.project(10, 6, 2026, 10, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(9, 6, 2026, 10, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name ProductPriceBlockAndDayCellHighlightTrackTheSelectedStateDuringPreview
     * @tc.desc ProductPriceBlockAndDayCellHighlightTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ProductPriceBlockAndDayCellHighlightTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const info: ProductInfoModel = new ProductInfoModel(107, 156, true);
        expect(info.priceText().indexOf(info.price.toFixed(2)) >= 0).assertTrue();
        expect(info.priceText().length >= 5).assertTrue();
        expect(info.soldText().indexOf(info.sold.toString()) >= 0).assertTrue();
        expect(info.discountLine().length > 0).assertTrue();
      }
      {
        const active = CellProjector.project(10, 6, 2026, 10, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(9, 6, 2026, 10, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndCalendarJourneyAndCartLineItemPreserveOrderingGuaranteesDuringPreview
     * @tc.desc DayCellHighlightAndCalendarJourneyAndCartLineItemPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndCalendarJourneyAndCartLineItemPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        const active = CellProjector.project(10, 6, 2026, 10, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(9, 6, 2026, 10, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(11, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(11, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 11);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const item: CartItem = new CartItem('sample', 16, 5, true);
        expect(item.lineTotal()).assertEqual(80);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(5);
      }
    });

    /**
     * @tc.name CalendarJourneyAndCartLineItemHoldForRepeatedEntryDuringPreview
     * @tc.desc CalendarJourneyAndCartLineItemHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndCartLineItemHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(11, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(11, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 11);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const item: CartItem = new CartItem('sample', 16, 5, true);
        expect(item.lineTotal()).assertEqual(80);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(5);
      }
    });

    /**
     * @tc.name CartLineItemAndPanelGeometryAndWeekHeaderEmphasisRemainStableUnderLoadDuringPreview
     * @tc.desc CartLineItemAndPanelGeometryAndWeekHeaderEmphasisRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartLineItemAndPanelGeometryAndWeekHeaderEmphasisRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const item: CartItem = new CartItem('sample', 16, 5, true);
        expect(item.lineTotal()).assertEqual(80);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(5);
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name PanelGeometryAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc PanelGeometryAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheVisibleStateInStepAfterRollover
     * @tc.desc WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
      }
      {
        const info: ProductInfoModel = new ProductInfoModel(113, 198, true);
        expect(info.priceText().indexOf(info.price.toFixed(2)) >= 0).assertTrue();
        expect(info.priceText().length >= 5).assertTrue();
        expect(info.soldText().indexOf(info.sold.toString()) >= 0).assertTrue();
        expect(info.discountLine().length > 0).assertTrue();
      }
      {
        const active = CellProjector.project(16, 6, 2026, 16, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(15, 6, 2026, 16, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name ProductPriceBlockAndDayCellHighlightPreserveTheDeclaredContractAfterRollover
     * @tc.desc ProductPriceBlockAndDayCellHighlightPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ProductPriceBlockAndDayCellHighlightPreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        const info: ProductInfoModel = new ProductInfoModel(113, 198, true);
        expect(info.priceText().indexOf(info.price.toFixed(2)) >= 0).assertTrue();
        expect(info.priceText().length >= 5).assertTrue();
        expect(info.soldText().indexOf(info.sold.toString()) >= 0).assertTrue();
        expect(info.discountLine().length > 0).assertTrue();
      }
      {
        const active = CellProjector.project(16, 6, 2026, 16, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(15, 6, 2026, 16, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndCalendarJourneyAndCartLineItemSurviveRapidInteractionAfterRollover
     * @tc.desc DayCellHighlightAndCalendarJourneyAndCartLineItemSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndCalendarJourneyAndCartLineItemSurviveRapidInteractionAfterRollover', 0, () => {
      {
        const active = CellProjector.project(16, 6, 2026, 16, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(15, 6, 2026, 16, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(5, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(5, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 17);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const item: CartItem = new CartItem('sample', 22, 3, true);
        expect(item.lineTotal()).assertEqual(66);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(3);
      }
    });

    /**
     * @tc.name CalendarJourneyAndCartLineItemHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc CalendarJourneyAndCartLineItemHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndCartLineItemHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(5, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(5, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 17);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const item: CartItem = new CartItem('sample', 22, 3, true);
        expect(item.lineTotal()).assertEqual(66);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(3);
      }
    });

    /**
     * @tc.name CartLineItemAndPanelGeometryAndWeekHeaderEmphasisRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc CartLineItemAndPanelGeometryAndWeekHeaderEmphasisRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartLineItemAndPanelGeometryAndWeekHeaderEmphasisRemainCorrectAfterRecoveryAfterRollover', 0, () => {
      {
        const item: CartItem = new CartItem('sample', 22, 3, true);
        expect(item.lineTotal()).assertEqual(66);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(3);
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[5].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name PanelGeometryAndWeekHeaderEmphasisAgreeWithTheModelInvariantsAfterRollover
     * @tc.desc PanelGeometryAndWeekHeaderEmphasisAgreeWithTheModelInvariantsAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndWeekHeaderEmphasisAgreeWithTheModelInvariantsAfterRollover', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[5].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheSessionCoherentAfterRollover
     * @tc.desc WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheSessionCoherentAfterRollover', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[5].emphasized).assertFalse();
      }
      {
        const info: ProductInfoModel = new ProductInfoModel(99, 240, true);
        expect(info.priceText().indexOf(info.price.toFixed(2)) >= 0).assertTrue();
        expect(info.priceText().length >= 5).assertTrue();
        expect(info.soldText().indexOf(info.sold.toString()) >= 0).assertTrue();
        expect(info.discountLine().length > 0).assertTrue();
      }
      {
        const active = CellProjector.project(22, 6, 2026, 22, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(21, 6, 2026, 22, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name ProductPriceBlockAndDayCellHighlightTrackTheSelectedStateAfterRollover
     * @tc.desc ProductPriceBlockAndDayCellHighlightTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ProductPriceBlockAndDayCellHighlightTrackTheSelectedStateAfterRollover', 0, () => {
      {
        const info: ProductInfoModel = new ProductInfoModel(99, 240, true);
        expect(info.priceText().indexOf(info.price.toFixed(2)) >= 0).assertTrue();
        expect(info.priceText().length >= 5).assertTrue();
        expect(info.soldText().indexOf(info.sold.toString()) >= 0).assertTrue();
        expect(info.discountLine().length > 0).assertTrue();
      }
      {
        const active = CellProjector.project(22, 6, 2026, 22, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(21, 6, 2026, 22, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndCalendarJourneyAndCartLineItemPreserveOrderingGuaranteesAfterRollover
     * @tc.desc DayCellHighlightAndCalendarJourneyAndCartLineItemPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndCalendarJourneyAndCartLineItemPreserveOrderingGuaranteesAfterRollover', 0, () => {
      {
        const active = CellProjector.project(22, 6, 2026, 22, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(21, 6, 2026, 22, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(11, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(11, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 23);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const item: CartItem = new CartItem('sample', 18, 5, true);
        expect(item.lineTotal()).assertEqual(90);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(5);
      }
    });

    /**
     * @tc.name CalendarJourneyAndCartLineItemHoldForRepeatedEntryAfterRollover
     * @tc.desc CalendarJourneyAndCartLineItemHoldForRepeatedEntryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndCartLineItemHoldForRepeatedEntryAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(11, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(11, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 23);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const item: CartItem = new CartItem('sample', 18, 5, true);
        expect(item.lineTotal()).assertEqual(90);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(5);
      }
    });

    /**
     * @tc.name CartLineItemAndPanelGeometryAndWeekHeaderEmphasisRemainStableUnderLoadAfterRollover
     * @tc.desc CartLineItemAndPanelGeometryAndWeekHeaderEmphasisRemainStableUnderLoadAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartLineItemAndPanelGeometryAndWeekHeaderEmphasisRemainStableUnderLoadAfterRollover', 0, () => {
      {
        const item: CartItem = new CartItem('sample', 18, 5, true);
        expect(item.lineTotal()).assertEqual(90);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(5);
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[1].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name PanelGeometryAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseUnderLoad
     * @tc.desc PanelGeometryAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseUnderLoad', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[1].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheVisibleStateInStepUnderLoad
     * @tc.desc WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheVisibleStateInStepUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndProductPriceBlockAndDayCellHighlightKeepTheVisibleStateInStepUnderLoad', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[1].emphasized).assertFalse();
      }
      {
        const info: ProductInfoModel = new ProductInfoModel(105, 282, true);
        expect(info.priceText().indexOf(info.price.toFixed(2)) >= 0).assertTrue();
        expect(info.priceText().length >= 5).assertTrue();
        expect(info.soldText().indexOf(info.sold.toString()) >= 0).assertTrue();
        expect(info.discountLine().length > 0).assertTrue();
      }
      {
        const active = CellProjector.project(1, 6, 2026, 1, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(2, 6, 2026, 1, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(true);
      }
    });

    /**
     * @tc.name ProductPriceBlockAndDayCellHighlightPreserveTheDeclaredContractUnderLoad
     * @tc.desc ProductPriceBlockAndDayCellHighlightPreserveTheDeclaredContractUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('ProductPriceBlockAndDayCellHighlightPreserveTheDeclaredContractUnderLoad', 0, () => {
      {
        const info: ProductInfoModel = new ProductInfoModel(105, 282, true);
        expect(info.priceText().indexOf(info.price.toFixed(2)) >= 0).assertTrue();
        expect(info.priceText().length >= 5).assertTrue();
        expect(info.soldText().indexOf(info.sold.toString()) >= 0).assertTrue();
        expect(info.discountLine().length > 0).assertTrue();
      }
      {
        const active = CellProjector.project(1, 6, 2026, 1, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(2, 6, 2026, 1, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(true);
      }
    });

    /**
     * @tc.name DayCellHighlightAndCalendarJourneyAndCartLineItemSurviveRapidInteractionUnderLoad
     * @tc.desc DayCellHighlightAndCalendarJourneyAndCartLineItemSurviveRapidInteractionUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndCalendarJourneyAndCartLineItemSurviveRapidInteractionUnderLoad', 0, () => {
      {
        const active = CellProjector.project(1, 6, 2026, 1, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(2, 6, 2026, 1, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(true);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(5, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(5, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 2);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const item: CartItem = new CartItem('sample', 24, 3, true);
        expect(item.lineTotal()).assertEqual(72);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(3);
      }
    });

    /**
     * @tc.name CalendarJourneyAndCartLineItemHoldAcrossConfigurationChangesUnderLoad
     * @tc.desc CalendarJourneyAndCartLineItemHoldAcrossConfigurationChangesUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndCartLineItemHoldAcrossConfigurationChangesUnderLoad', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(5, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(5, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 2);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const item: CartItem = new CartItem('sample', 24, 3, true);
        expect(item.lineTotal()).assertEqual(72);
        expect(item.selected).assertTrue();
        expect(item.quantity).assertEqual(3);
      }
    });
  });
}
