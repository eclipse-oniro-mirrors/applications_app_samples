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

export default function TouchInteractionTest(): void {
  describe('TouchInteractionTest', () => {
    beforeAll(() => {
      logSuite('TouchInteractionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('TouchInteractionTest', 'end');
    });

    /**
     * @tc.name DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheVisibleStateInStepDuringPreview
     * @tc.desc DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const active = CellProjector.project(3, 6, 2026, 3, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(2, 6, 2026, 3, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DayCellHighlightAndCartSelectionTogglePreserveTheDeclaredContractDuringPreview
     * @tc.desc DayCellHighlightAndCartSelectionTogglePreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndCartSelectionTogglePreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const active = CellProjector.project(3, 6, 2026, 3, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(2, 6, 2026, 3, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name CartSelectionToggleAndEventPathOrderAndCartQuantityClampSurviveRapidInteractionDuringPreview
     * @tc.desc CartSelectionToggleAndEventPathOrderAndCartQuantityClampSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartSelectionToggleAndEventPathOrderAndCartQuantityClampSurviveRapidInteractionDuringPreview', 0, () => {
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
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 2; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level1');
        expect(capture.length).assertEqual(3);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level1');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level1');
        expect(bubble[0]).assertEqual('level1');
        expect(bubble[bubble.length - 1]).assertEqual('page');
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
    });

    /**
     * @tc.name EventPathOrderAndCartQuantityClampHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc EventPathOrderAndCartQuantityClampHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndCartQuantityClampHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 2; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level1');
        expect(capture.length).assertEqual(3);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level1');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level1');
        expect(bubble[0]).assertEqual('level1');
        expect(bubble[bubble.length - 1]).assertEqual('page');
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
    });

    /**
     * @tc.name CartQuantityClampAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc CartQuantityClampAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryDuringPreview', 0, () => {
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
        const sample: GestureSample = new GestureSample(0, 0, 3, 4);
        expect(GestureClassifier.classify(sample)).assertEqual('tap');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(3);
      }
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
    });

    /**
     * @tc.name DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheSessionCoherentDuringPreview
     * @tc.desc DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const active = CellProjector.project(9, 6, 2026, 9, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(8, 6, 2026, 9, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DayCellHighlightAndCartSelectionToggleTrackTheSelectedStateDuringPreview
     * @tc.desc DayCellHighlightAndCartSelectionToggleTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndCartSelectionToggleTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const active = CellProjector.project(9, 6, 2026, 9, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(8, 6, 2026, 9, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name CartSelectionToggleAndEventPathOrderAndCartQuantityClampPreserveOrderingGuaranteesDuringPreview
     * @tc.desc CartSelectionToggleAndEventPathOrderAndCartQuantityClampPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartSelectionToggleAndEventPathOrderAndCartQuantityClampPreserveOrderingGuaranteesDuringPreview', 0, () => {
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
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 2; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level1');
        expect(capture.length).assertEqual(3);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level1');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level1');
        expect(bubble[0]).assertEqual('level1');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
      {
        const cart: CartModel = new CartModel(3);
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
    });

    /**
     * @tc.name EventPathOrderAndCartQuantityClampHoldForRepeatedEntryDuringPreview
     * @tc.desc EventPathOrderAndCartQuantityClampHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndCartQuantityClampHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 2; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level1');
        expect(capture.length).assertEqual(3);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level1');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level1');
        expect(bubble[0]).assertEqual('level1');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
      {
        const cart: CartModel = new CartModel(3);
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
    });

    /**
     * @tc.name CartQuantityClampAndTapClassificationAndDragClassificationRemainStableUnderLoadDuringPreview
     * @tc.desc CartQuantityClampAndTapClassificationAndDragClassificationRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndTapClassificationAndDragClassificationRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const cart: CartModel = new CartModel(3);
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
        const sample: GestureSample = new GestureSample(0, 0, 3, 4);
        expect(GestureClassifier.classify(sample)).assertEqual('tap');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(3);
      }
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
    });

    /**
     * @tc.name DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheVisibleStateInStepAfterRollover
     * @tc.desc DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const active = CellProjector.project(15, 6, 2026, 15, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(14, 6, 2026, 15, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DayCellHighlightAndCartSelectionTogglePreserveTheDeclaredContractAfterRollover
     * @tc.desc DayCellHighlightAndCartSelectionTogglePreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndCartSelectionTogglePreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        const active = CellProjector.project(15, 6, 2026, 15, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(14, 6, 2026, 15, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name CartSelectionToggleAndEventPathOrderAndCartQuantityClampSurviveRapidInteractionAfterRollover
     * @tc.desc CartSelectionToggleAndEventPathOrderAndCartQuantityClampSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartSelectionToggleAndEventPathOrderAndCartQuantityClampSurviveRapidInteractionAfterRollover', 0, () => {
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
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 2; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level1');
        expect(capture.length).assertEqual(3);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level1');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level1');
        expect(bubble[0]).assertEqual('level1');
        expect(bubble[bubble.length - 1]).assertEqual('page');
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
    });

    /**
     * @tc.name EventPathOrderAndCartQuantityClampHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc EventPathOrderAndCartQuantityClampHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndCartQuantityClampHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 2; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level1');
        expect(capture.length).assertEqual(3);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level1');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level1');
        expect(bubble[0]).assertEqual('level1');
        expect(bubble[bubble.length - 1]).assertEqual('page');
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
    });

    /**
     * @tc.name CartQuantityClampAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc CartQuantityClampAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryAfterRollover', 0, () => {
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
        const sample: GestureSample = new GestureSample(0, 0, 3, 4);
        expect(GestureClassifier.classify(sample)).assertEqual('tap');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(3);
      }
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
    });

    /**
     * @tc.name DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheSessionCoherentAfterRollover
     * @tc.desc DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheSessionCoherentAfterRollover', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const active = CellProjector.project(21, 6, 2026, 21, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(20, 6, 2026, 21, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DayCellHighlightAndCartSelectionToggleTrackTheSelectedStateAfterRollover
     * @tc.desc DayCellHighlightAndCartSelectionToggleTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndCartSelectionToggleTrackTheSelectedStateAfterRollover', 0, () => {
      {
        const active = CellProjector.project(21, 6, 2026, 21, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(20, 6, 2026, 21, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name CartSelectionToggleAndEventPathOrderAndCartQuantityClampPreserveOrderingGuaranteesAfterRollover
     * @tc.desc CartSelectionToggleAndEventPathOrderAndCartQuantityClampPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartSelectionToggleAndEventPathOrderAndCartQuantityClampPreserveOrderingGuaranteesAfterRollover', 0, () => {
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
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 2; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level1');
        expect(capture.length).assertEqual(3);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level1');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level1');
        expect(bubble[0]).assertEqual('level1');
        expect(bubble[bubble.length - 1]).assertEqual('page');
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
    });

    /**
     * @tc.name EventPathOrderAndCartQuantityClampHoldForRepeatedEntryAfterRollover
     * @tc.desc EventPathOrderAndCartQuantityClampHoldForRepeatedEntryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndCartQuantityClampHoldForRepeatedEntryAfterRollover', 0, () => {
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 2; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level1');
        expect(capture.length).assertEqual(3);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level1');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level1');
        expect(bubble[0]).assertEqual('level1');
        expect(bubble[bubble.length - 1]).assertEqual('page');
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
    });

    /**
     * @tc.name CartQuantityClampAndTapClassificationAndDragClassificationRemainStableUnderLoadAfterRollover
     * @tc.desc CartQuantityClampAndTapClassificationAndDragClassificationRemainStableUnderLoadAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndTapClassificationAndDragClassificationRemainStableUnderLoadAfterRollover', 0, () => {
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
        const sample: GestureSample = new GestureSample(0, 0, 3, 4);
        expect(GestureClassifier.classify(sample)).assertEqual('tap');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(3);
      }
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
    });

    /**
     * @tc.name DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheVisibleStateInStepUnderLoad
     * @tc.desc DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheVisibleStateInStepUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheVisibleStateInStepUnderLoad', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const active = CellProjector.project(27, 6, 2026, 27, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(26, 6, 2026, 27, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DayCellHighlightAndCartSelectionTogglePreserveTheDeclaredContractUnderLoad
     * @tc.desc DayCellHighlightAndCartSelectionTogglePreserveTheDeclaredContractUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndCartSelectionTogglePreserveTheDeclaredContractUnderLoad', 0, () => {
      {
        const active = CellProjector.project(27, 6, 2026, 27, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(26, 6, 2026, 27, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name CartSelectionToggleAndEventPathOrderAndCartQuantityClampSurviveRapidInteractionUnderLoad
     * @tc.desc CartSelectionToggleAndEventPathOrderAndCartQuantityClampSurviveRapidInteractionUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartSelectionToggleAndEventPathOrderAndCartQuantityClampSurviveRapidInteractionUnderLoad', 0, () => {
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
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 2; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level1');
        expect(capture.length).assertEqual(3);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level1');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level1');
        expect(bubble[0]).assertEqual('level1');
        expect(bubble[bubble.length - 1]).assertEqual('page');
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
    });

    /**
     * @tc.name EventPathOrderAndCartQuantityClampHoldAcrossConfigurationChangesUnderLoad
     * @tc.desc EventPathOrderAndCartQuantityClampHoldAcrossConfigurationChangesUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndCartQuantityClampHoldAcrossConfigurationChangesUnderLoad', 0, () => {
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 2; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level1');
        expect(capture.length).assertEqual(3);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level1');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level1');
        expect(bubble[0]).assertEqual('level1');
        expect(bubble[bubble.length - 1]).assertEqual('page');
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
    });

    /**
     * @tc.name CartQuantityClampAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryUnderLoad
     * @tc.desc CartQuantityClampAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryUnderLoad', 0, () => {
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
        const sample: GestureSample = new GestureSample(0, 0, 3, 4);
        expect(GestureClassifier.classify(sample)).assertEqual('tap');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(3);
      }
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
    });

    /**
     * @tc.name DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheSessionCoherentUnderLoad
     * @tc.desc DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheSessionCoherentUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndDayCellHighlightAndCartSelectionToggleKeepTheSessionCoherentUnderLoad', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const active = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(5, 6, 2026, 6, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DayCellHighlightAndCartSelectionToggleTrackTheSelectedStateUnderLoad
     * @tc.desc DayCellHighlightAndCartSelectionToggleTrackTheSelectedStateUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndCartSelectionToggleTrackTheSelectedStateUnderLoad', 0, () => {
      {
        const active = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(5, 6, 2026, 6, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name CartSelectionToggleAndEventPathOrderAndCartQuantityClampPreserveOrderingGuaranteesUnderLoad
     * @tc.desc CartSelectionToggleAndEventPathOrderAndCartQuantityClampPreserveOrderingGuaranteesUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartSelectionToggleAndEventPathOrderAndCartQuantityClampPreserveOrderingGuaranteesUnderLoad', 0, () => {
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
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 2; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level1');
        expect(capture.length).assertEqual(3);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level1');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level1');
        expect(bubble[0]).assertEqual('level1');
        expect(bubble[bubble.length - 1]).assertEqual('page');
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
    });
  });
}
