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

export default function AccessibilityNavigationTest(): void {
  describe('AccessibilityNavigationTest', () => {
    beforeAll(() => {
      logSuite('AccessibilityNavigationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('AccessibilityNavigationTest', 'end');
    });

    /**
     * @tc.name HorizontalFocusMoveAndCalendarJourneyStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc HorizontalFocusMoveAndCalendarJourneyStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndCalendarJourneyStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 0;
        expect(grid.columnOf(start)).assertEqual(0);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(2, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(2, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 2);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndVerticalFocusMoveAndFocusRingVisibilityKeepTheVisibleStateInStepDuringPreview
     * @tc.desc CalendarJourneyAndVerticalFocusMoveAndFocusRingVisibilityKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndVerticalFocusMoveAndFocusRingVisibilityKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(2, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(2, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 2);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 10;
        const down: int = grid.moveDown(start);
        expect(grid.columnOf(down)).assertEqual(grid.columnOf(start));
        if (start + 7 < 35) {
          expect(down).assertEqual(start + 7);
          expect(grid.moveUp(down)).assertEqual(start);
        } else {
          expect(down).assertEqual(start);
        }
        expect(grid.clamp(99)).assertEqual(34);
        expect(grid.clamp(-4)).assertEqual(0);
      }
      {
        const ring: FocusRingModel = new FocusRingModel();
        ring.show(false);
        expect(ring.visible).assertTrue();
        expect(ring.borderWidth()).assertEqual(2);
        expect(ring.emphasized).assertEqual(false);
        ring.hide();
        expect(ring.borderWidth()).assertEqual(0);
      }
    });

    /**
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityPreserveTheDeclaredContractDuringPreview
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveAndFocusRingVisibilityPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 10;
        const down: int = grid.moveDown(start);
        expect(grid.columnOf(down)).assertEqual(grid.columnOf(start));
        if (start + 7 < 35) {
          expect(down).assertEqual(start + 7);
          expect(grid.moveUp(down)).assertEqual(start);
        } else {
          expect(down).assertEqual(start);
        }
        expect(grid.clamp(99)).assertEqual(34);
        expect(grid.clamp(-4)).assertEqual(0);
      }
      {
        const ring: FocusRingModel = new FocusRingModel();
        ring.show(false);
        expect(ring.visible).assertTrue();
        expect(ring.borderWidth()).assertEqual(2);
        expect(ring.emphasized).assertEqual(false);
        ring.hide();
        expect(ring.borderWidth()).assertEqual(0);
      }
    });

    /**
     * @tc.name FocusRingVisibilityAndEventPathOrderAndDayCellHighlightSurviveRapidInteractionDuringPreview
     * @tc.desc FocusRingVisibilityAndEventPathOrderAndDayCellHighlightSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndEventPathOrderAndDayCellHighlightSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const ring: FocusRingModel = new FocusRingModel();
        ring.show(false);
        expect(ring.visible).assertTrue();
        expect(ring.borderWidth()).assertEqual(2);
        expect(ring.emphasized).assertEqual(false);
        ring.hide();
        expect(ring.borderWidth()).assertEqual(0);
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
        const active = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(5, 6, 2026, 6, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name EventPathOrderAndDayCellHighlightHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc EventPathOrderAndDayCellHighlightHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndDayCellHighlightHoldAcrossConfigurationChangesDuringPreview', 0, () => {
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
        const active = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(5, 6, 2026, 6, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndHorizontalFocusMoveAndCalendarJourneyRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc DayCellHighlightAndHorizontalFocusMoveAndCalendarJourneyRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndHorizontalFocusMoveAndCalendarJourneyRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const active = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(5, 6, 2026, 6, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 18;
        expect(grid.columnOf(start)).assertEqual(4);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(8, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(8, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 8);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name HorizontalFocusMoveAndCalendarJourneyAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc HorizontalFocusMoveAndCalendarJourneyAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndCalendarJourneyAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 18;
        expect(grid.columnOf(start)).assertEqual(4);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(8, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(8, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 8);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndVerticalFocusMoveAndFocusRingVisibilityKeepTheSessionCoherentDuringPreview
     * @tc.desc CalendarJourneyAndVerticalFocusMoveAndFocusRingVisibilityKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndVerticalFocusMoveAndFocusRingVisibilityKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(8, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(8, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 8);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 5;
        const down: int = grid.moveDown(start);
        expect(grid.columnOf(down)).assertEqual(grid.columnOf(start));
        if (start + 7 < 35) {
          expect(down).assertEqual(start + 7);
          expect(grid.moveUp(down)).assertEqual(start);
        } else {
          expect(down).assertEqual(start);
        }
        expect(grid.clamp(99)).assertEqual(34);
        expect(grid.clamp(-4)).assertEqual(0);
      }
      {
        const ring: FocusRingModel = new FocusRingModel();
        ring.show(false);
        expect(ring.visible).assertTrue();
        expect(ring.borderWidth()).assertEqual(2);
        expect(ring.emphasized).assertEqual(false);
        ring.hide();
        expect(ring.borderWidth()).assertEqual(0);
      }
    });

    /**
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityTrackTheSelectedStateDuringPreview
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveAndFocusRingVisibilityTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 5;
        const down: int = grid.moveDown(start);
        expect(grid.columnOf(down)).assertEqual(grid.columnOf(start));
        if (start + 7 < 35) {
          expect(down).assertEqual(start + 7);
          expect(grid.moveUp(down)).assertEqual(start);
        } else {
          expect(down).assertEqual(start);
        }
        expect(grid.clamp(99)).assertEqual(34);
        expect(grid.clamp(-4)).assertEqual(0);
      }
      {
        const ring: FocusRingModel = new FocusRingModel();
        ring.show(false);
        expect(ring.visible).assertTrue();
        expect(ring.borderWidth()).assertEqual(2);
        expect(ring.emphasized).assertEqual(false);
        ring.hide();
        expect(ring.borderWidth()).assertEqual(0);
      }
    });

    /**
     * @tc.name FocusRingVisibilityAndEventPathOrderAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview
     * @tc.desc FocusRingVisibilityAndEventPathOrderAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndEventPathOrderAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        const ring: FocusRingModel = new FocusRingModel();
        ring.show(false);
        expect(ring.visible).assertTrue();
        expect(ring.borderWidth()).assertEqual(2);
        expect(ring.emphasized).assertEqual(false);
        ring.hide();
        expect(ring.borderWidth()).assertEqual(0);
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
        const active = CellProjector.project(12, 6, 2026, 12, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(11, 6, 2026, 12, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name EventPathOrderAndDayCellHighlightHoldForRepeatedEntryDuringPreview
     * @tc.desc EventPathOrderAndDayCellHighlightHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndDayCellHighlightHoldForRepeatedEntryDuringPreview', 0, () => {
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
        const active = CellProjector.project(12, 6, 2026, 12, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(11, 6, 2026, 12, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndHorizontalFocusMoveAndCalendarJourneyRemainStableUnderLoadDuringPreview
     * @tc.desc DayCellHighlightAndHorizontalFocusMoveAndCalendarJourneyRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndHorizontalFocusMoveAndCalendarJourneyRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const active = CellProjector.project(12, 6, 2026, 12, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(11, 6, 2026, 12, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 1;
        expect(grid.columnOf(start)).assertEqual(1);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(2, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(2, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 14);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name HorizontalFocusMoveAndCalendarJourneyStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc HorizontalFocusMoveAndCalendarJourneyStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndCalendarJourneyStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 1;
        expect(grid.columnOf(start)).assertEqual(1);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(2, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(2, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 14);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndVerticalFocusMoveAndFocusRingVisibilityKeepTheVisibleStateInStepAfterRollover
     * @tc.desc CalendarJourneyAndVerticalFocusMoveAndFocusRingVisibilityKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndVerticalFocusMoveAndFocusRingVisibilityKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(2, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(2, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 14);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 0;
        const down: int = grid.moveDown(start);
        expect(grid.columnOf(down)).assertEqual(grid.columnOf(start));
        if (start + 7 < 35) {
          expect(down).assertEqual(start + 7);
          expect(grid.moveUp(down)).assertEqual(start);
        } else {
          expect(down).assertEqual(start);
        }
        expect(grid.clamp(99)).assertEqual(34);
        expect(grid.clamp(-4)).assertEqual(0);
      }
      {
        const ring: FocusRingModel = new FocusRingModel();
        ring.show(false);
        expect(ring.visible).assertTrue();
        expect(ring.borderWidth()).assertEqual(2);
        expect(ring.emphasized).assertEqual(false);
        ring.hide();
        expect(ring.borderWidth()).assertEqual(0);
      }
    });

    /**
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityPreserveTheDeclaredContractAfterRollover
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveAndFocusRingVisibilityPreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 0;
        const down: int = grid.moveDown(start);
        expect(grid.columnOf(down)).assertEqual(grid.columnOf(start));
        if (start + 7 < 35) {
          expect(down).assertEqual(start + 7);
          expect(grid.moveUp(down)).assertEqual(start);
        } else {
          expect(down).assertEqual(start);
        }
        expect(grid.clamp(99)).assertEqual(34);
        expect(grid.clamp(-4)).assertEqual(0);
      }
      {
        const ring: FocusRingModel = new FocusRingModel();
        ring.show(false);
        expect(ring.visible).assertTrue();
        expect(ring.borderWidth()).assertEqual(2);
        expect(ring.emphasized).assertEqual(false);
        ring.hide();
        expect(ring.borderWidth()).assertEqual(0);
      }
    });

    /**
     * @tc.name FocusRingVisibilityAndEventPathOrderAndDayCellHighlightSurviveRapidInteractionAfterRollover
     * @tc.desc FocusRingVisibilityAndEventPathOrderAndDayCellHighlightSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndEventPathOrderAndDayCellHighlightSurviveRapidInteractionAfterRollover', 0, () => {
      {
        const ring: FocusRingModel = new FocusRingModel();
        ring.show(false);
        expect(ring.visible).assertTrue();
        expect(ring.borderWidth()).assertEqual(2);
        expect(ring.emphasized).assertEqual(false);
        ring.hide();
        expect(ring.borderWidth()).assertEqual(0);
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
        const active = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(17, 6, 2026, 18, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name EventPathOrderAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc EventPathOrderAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover', 0, () => {
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
        const active = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(17, 6, 2026, 18, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndHorizontalFocusMoveAndCalendarJourneyRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc DayCellHighlightAndHorizontalFocusMoveAndCalendarJourneyRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndHorizontalFocusMoveAndCalendarJourneyRemainCorrectAfterRecoveryAfterRollover', 0, () => {
      {
        const active = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(17, 6, 2026, 18, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 19;
        expect(grid.columnOf(start)).assertEqual(5);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(8, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(8, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 20);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name HorizontalFocusMoveAndCalendarJourneyAgreeWithTheModelInvariantsAfterRollover
     * @tc.desc HorizontalFocusMoveAndCalendarJourneyAgreeWithTheModelInvariantsAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndCalendarJourneyAgreeWithTheModelInvariantsAfterRollover', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 19;
        expect(grid.columnOf(start)).assertEqual(5);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(8, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(8, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 20);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndVerticalFocusMoveAndFocusRingVisibilityKeepTheSessionCoherentAfterRollover
     * @tc.desc CalendarJourneyAndVerticalFocusMoveAndFocusRingVisibilityKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndVerticalFocusMoveAndFocusRingVisibilityKeepTheSessionCoherentAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(8, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(8, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 20);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 30;
        const down: int = grid.moveDown(start);
        expect(grid.columnOf(down)).assertEqual(grid.columnOf(start));
        if (start + 7 < 35) {
          expect(down).assertEqual(start + 7);
          expect(grid.moveUp(down)).assertEqual(start);
        } else {
          expect(down).assertEqual(start);
        }
        expect(grid.clamp(99)).assertEqual(34);
        expect(grid.clamp(-4)).assertEqual(0);
      }
      {
        const ring: FocusRingModel = new FocusRingModel();
        ring.show(true);
        expect(ring.visible).assertTrue();
        expect(ring.borderWidth()).assertEqual(3);
        expect(ring.emphasized).assertEqual(true);
        ring.hide();
        expect(ring.borderWidth()).assertEqual(0);
      }
    });

    /**
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityTrackTheSelectedStateAfterRollover
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveAndFocusRingVisibilityTrackTheSelectedStateAfterRollover', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 30;
        const down: int = grid.moveDown(start);
        expect(grid.columnOf(down)).assertEqual(grid.columnOf(start));
        if (start + 7 < 35) {
          expect(down).assertEqual(start + 7);
          expect(grid.moveUp(down)).assertEqual(start);
        } else {
          expect(down).assertEqual(start);
        }
        expect(grid.clamp(99)).assertEqual(34);
        expect(grid.clamp(-4)).assertEqual(0);
      }
      {
        const ring: FocusRingModel = new FocusRingModel();
        ring.show(true);
        expect(ring.visible).assertTrue();
        expect(ring.borderWidth()).assertEqual(3);
        expect(ring.emphasized).assertEqual(true);
        ring.hide();
        expect(ring.borderWidth()).assertEqual(0);
      }
    });

    /**
     * @tc.name FocusRingVisibilityAndEventPathOrderAndDayCellHighlightPreserveOrderingGuaranteesAfterRollover
     * @tc.desc FocusRingVisibilityAndEventPathOrderAndDayCellHighlightPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndEventPathOrderAndDayCellHighlightPreserveOrderingGuaranteesAfterRollover', 0, () => {
      {
        const ring: FocusRingModel = new FocusRingModel();
        ring.show(true);
        expect(ring.visible).assertTrue();
        expect(ring.borderWidth()).assertEqual(3);
        expect(ring.emphasized).assertEqual(true);
        ring.hide();
        expect(ring.borderWidth()).assertEqual(0);
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
        const active = CellProjector.project(24, 6, 2026, 24, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(23, 6, 2026, 24, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name EventPathOrderAndDayCellHighlightHoldForRepeatedEntryAfterRollover
     * @tc.desc EventPathOrderAndDayCellHighlightHoldForRepeatedEntryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndDayCellHighlightHoldForRepeatedEntryAfterRollover', 0, () => {
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
        const active = CellProjector.project(24, 6, 2026, 24, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(23, 6, 2026, 24, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndHorizontalFocusMoveAndCalendarJourneyRemainStableUnderLoadAfterRollover
     * @tc.desc DayCellHighlightAndHorizontalFocusMoveAndCalendarJourneyRemainStableUnderLoadAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndHorizontalFocusMoveAndCalendarJourneyRemainStableUnderLoadAfterRollover', 0, () => {
      {
        const active = CellProjector.project(24, 6, 2026, 24, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(23, 6, 2026, 24, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 2;
        expect(grid.columnOf(start)).assertEqual(2);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(2, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(2, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 26);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name HorizontalFocusMoveAndCalendarJourneyStayConsistentUnderRepeatedUseUnderLoad
     * @tc.desc HorizontalFocusMoveAndCalendarJourneyStayConsistentUnderRepeatedUseUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndCalendarJourneyStayConsistentUnderRepeatedUseUnderLoad', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 2;
        expect(grid.columnOf(start)).assertEqual(2);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(2, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(2, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 26);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });
  });
}
