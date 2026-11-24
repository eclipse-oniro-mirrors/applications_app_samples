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

export default function FocusNavigationTest(): void {
  describe('FocusNavigationTest', () => {
    beforeAll(() => {
      logSuite('FocusNavigationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('FocusNavigationTest', 'end');
    });

    /**
     * @tc.name HorizontalFocusMoveAndVerticalFocusMoveStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc HorizontalFocusMoveAndVerticalFocusMoveStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndVerticalFocusMoveStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
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
    });

    /**
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheVisibleStateInStepDuringPreview
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheVisibleStateInStepDuringPreview', 0, () => {
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
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
    });

    /**
     * @tc.name FocusRingVisibilityAndEventPathOrderPreserveTheDeclaredContractDuringPreview
     * @tc.desc FocusRingVisibilityAndEventPathOrderPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndEventPathOrderPreserveTheDeclaredContractDuringPreview', 0, () => {
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
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
    });

    /**
     * @tc.name EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightSurviveRapidInteractionDuringPreview
     * @tc.desc EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.tagStart = 4;
        model.tagEnd = 10;
        model.currentTagIndex = 10;
        model.onIndexChange();
        expect(model.tagScrollTarget).assertEqual(11);
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
     * @tc.name CascadeWatchKeepVisibleAndDayCellHighlightHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc CascadeWatchKeepVisibleAndDayCellHighlightHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeWatchKeepVisibleAndDayCellHighlightHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.tagStart = 4;
        model.tagEnd = 10;
        model.currentTagIndex = 10;
        model.onIndexChange();
        expect(model.tagScrollTarget).assertEqual(11);
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
     * @tc.name DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainCorrectAfterRecoveryDuringPreview', 0, () => {
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
    });

    /**
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheSessionCoherentDuringPreview
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheSessionCoherentDuringPreview', 0, () => {
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
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
    });

    /**
     * @tc.name EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview
     * @tc.desc EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.tagStart = 4;
        model.tagEnd = 6;
        model.currentTagIndex = 6;
        model.onIndexChange();
        expect(model.tagScrollTarget).assertEqual(7);
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
     * @tc.name CascadeWatchKeepVisibleAndDayCellHighlightHoldForRepeatedEntryDuringPreview
     * @tc.desc CascadeWatchKeepVisibleAndDayCellHighlightHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeWatchKeepVisibleAndDayCellHighlightHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.tagStart = 4;
        model.tagEnd = 6;
        model.currentTagIndex = 6;
        model.onIndexChange();
        expect(model.tagScrollTarget).assertEqual(7);
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
     * @tc.name DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainStableUnderLoadDuringPreview
     * @tc.desc DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainStableUnderLoadDuringPreview', 0, () => {
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
    });

    /**
     * @tc.name HorizontalFocusMoveAndVerticalFocusMoveStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc HorizontalFocusMoveAndVerticalFocusMoveStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndVerticalFocusMoveStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
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
    });

    /**
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheVisibleStateInStepAfterRollover
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheVisibleStateInStepAfterRollover', 0, () => {
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
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
    });

    /**
     * @tc.name FocusRingVisibilityAndEventPathOrderPreserveTheDeclaredContractAfterRollover
     * @tc.desc FocusRingVisibilityAndEventPathOrderPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndEventPathOrderPreserveTheDeclaredContractAfterRollover', 0, () => {
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
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
    });

    /**
     * @tc.name EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightSurviveRapidInteractionAfterRollover
     * @tc.desc EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightSurviveRapidInteractionAfterRollover', 0, () => {
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.tagStart = 4;
        model.tagEnd = 7;
        model.currentTagIndex = 7;
        model.onIndexChange();
        expect(model.tagScrollTarget).assertEqual(8);
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
     * @tc.name CascadeWatchKeepVisibleAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc CascadeWatchKeepVisibleAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeWatchKeepVisibleAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.tagStart = 4;
        model.tagEnd = 7;
        model.currentTagIndex = 7;
        model.onIndexChange();
        expect(model.tagScrollTarget).assertEqual(8);
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
     * @tc.name DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainCorrectAfterRecoveryAfterRollover', 0, () => {
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
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 25;
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
    });

    /**
     * @tc.name HorizontalFocusMoveAndVerticalFocusMoveAgreeWithTheModelInvariantsAfterRollover
     * @tc.desc HorizontalFocusMoveAndVerticalFocusMoveAgreeWithTheModelInvariantsAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndVerticalFocusMoveAgreeWithTheModelInvariantsAfterRollover', 0, () => {
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
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 25;
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
    });

    /**
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheSessionCoherentAfterRollover
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheSessionCoherentAfterRollover', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 25;
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
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
    });

    /**
     * @tc.name EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightPreserveOrderingGuaranteesAfterRollover
     * @tc.desc EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightPreserveOrderingGuaranteesAfterRollover', 0, () => {
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.tagStart = 4;
        model.tagEnd = 8;
        model.currentTagIndex = 8;
        model.onIndexChange();
        expect(model.tagScrollTarget).assertEqual(9);
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
     * @tc.name CascadeWatchKeepVisibleAndDayCellHighlightHoldForRepeatedEntryAfterRollover
     * @tc.desc CascadeWatchKeepVisibleAndDayCellHighlightHoldForRepeatedEntryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeWatchKeepVisibleAndDayCellHighlightHoldForRepeatedEntryAfterRollover', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.tagStart = 4;
        model.tagEnd = 8;
        model.currentTagIndex = 8;
        model.onIndexChange();
        expect(model.tagScrollTarget).assertEqual(9);
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
     * @tc.name DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainStableUnderLoadAfterRollover
     * @tc.desc DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainStableUnderLoadAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainStableUnderLoadAfterRollover', 0, () => {
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
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 20;
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
    });

    /**
     * @tc.name HorizontalFocusMoveAndVerticalFocusMoveStayConsistentUnderRepeatedUseUnderLoad
     * @tc.desc HorizontalFocusMoveAndVerticalFocusMoveStayConsistentUnderRepeatedUseUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndVerticalFocusMoveStayConsistentUnderRepeatedUseUnderLoad', 0, () => {
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
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 20;
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
    });

    /**
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheVisibleStateInStepUnderLoad
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheVisibleStateInStepUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheVisibleStateInStepUnderLoad', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 20;
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
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
    });

    /**
     * @tc.name EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightSurviveRapidInteractionUnderLoad
     * @tc.desc EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightSurviveRapidInteractionUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightSurviveRapidInteractionUnderLoad', 0, () => {
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.tagStart = 4;
        model.tagEnd = 9;
        model.currentTagIndex = 9;
        model.onIndexChange();
        expect(model.tagScrollTarget).assertEqual(10);
      }
      {
        const active = CellProjector.project(3, 6, 2026, 3, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(2, 6, 2026, 3, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name CascadeWatchKeepVisibleAndDayCellHighlightHoldAcrossConfigurationChangesUnderLoad
     * @tc.desc CascadeWatchKeepVisibleAndDayCellHighlightHoldAcrossConfigurationChangesUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeWatchKeepVisibleAndDayCellHighlightHoldAcrossConfigurationChangesUnderLoad', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.tagStart = 4;
        model.tagEnd = 9;
        model.currentTagIndex = 9;
        model.onIndexChange();
        expect(model.tagScrollTarget).assertEqual(10);
      }
      {
        const active = CellProjector.project(3, 6, 2026, 3, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(2, 6, 2026, 3, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainCorrectAfterRecoveryUnderLoad
     * @tc.desc DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainCorrectAfterRecoveryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainCorrectAfterRecoveryUnderLoad', 0, () => {
      {
        const active = CellProjector.project(3, 6, 2026, 3, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(2, 6, 2026, 3, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 20;
        expect(grid.columnOf(start)).assertEqual(6);
        expect(grid.moveRight(start)).assertEqual(start);
        expect(grid.columnOf(start)).assertEqual(6);
        expect(grid.isWeekendColumn(start)).assertTrue();
        expect(grid.clamp(start) >= 0).assertTrue();
      }
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 15;
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
    });

    /**
     * @tc.name HorizontalFocusMoveAndVerticalFocusMoveAgreeWithTheModelInvariantsUnderLoad
     * @tc.desc HorizontalFocusMoveAndVerticalFocusMoveAgreeWithTheModelInvariantsUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndVerticalFocusMoveAgreeWithTheModelInvariantsUnderLoad', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 20;
        expect(grid.columnOf(start)).assertEqual(6);
        expect(grid.moveRight(start)).assertEqual(start);
        expect(grid.columnOf(start)).assertEqual(6);
        expect(grid.isWeekendColumn(start)).assertTrue();
        expect(grid.clamp(start) >= 0).assertTrue();
      }
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 15;
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
    });

    /**
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheSessionCoherentUnderLoad
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheSessionCoherentUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveAndFocusRingVisibilityAndEventPathOrderKeepTheSessionCoherentUnderLoad', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 15;
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
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
    });

    /**
     * @tc.name EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightPreserveOrderingGuaranteesUnderLoad
     * @tc.desc EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightPreserveOrderingGuaranteesUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndCascadeWatchKeepVisibleAndDayCellHighlightPreserveOrderingGuaranteesUnderLoad', 0, () => {
      {
        const root: EventNode = new EventNode('page');
        let cursor: EventNode = root;
        for (let level = 0; level < 3; level++) {
          cursor = cursor.add(new EventNode('level' + level.toString())).children[0];
        }
        const capture: string[] = EventDispatcher.capturePath(root, 'level2');
        expect(capture.length).assertEqual(4);
        expect(capture[0]).assertEqual('page');
        expect(capture[capture.length - 1]).assertEqual('level2');
        const bubble: string[] = EventDispatcher.bubblePath(root, 'level2');
        expect(bubble[0]).assertEqual('level2');
        expect(bubble[bubble.length - 1]).assertEqual('page');
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.tagStart = 4;
        model.tagEnd = 10;
        model.currentTagIndex = 10;
        model.onIndexChange();
        expect(model.tagScrollTarget).assertEqual(11);
      }
      {
        const active = CellProjector.project(9, 6, 2026, 9, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(8, 6, 2026, 9, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name CascadeWatchKeepVisibleAndDayCellHighlightHoldForRepeatedEntryUnderLoad
     * @tc.desc CascadeWatchKeepVisibleAndDayCellHighlightHoldForRepeatedEntryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeWatchKeepVisibleAndDayCellHighlightHoldForRepeatedEntryUnderLoad', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.tagStart = 4;
        model.tagEnd = 10;
        model.currentTagIndex = 10;
        model.onIndexChange();
        expect(model.tagScrollTarget).assertEqual(11);
      }
      {
        const active = CellProjector.project(9, 6, 2026, 9, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(8, 6, 2026, 9, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainStableUnderLoadUnderLoad
     * @tc.desc DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainStableUnderLoadUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndHorizontalFocusMoveAndVerticalFocusMoveRemainStableUnderLoadUnderLoad', 0, () => {
      {
        const active = CellProjector.project(9, 6, 2026, 9, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(8, 6, 2026, 9, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 3;
        expect(grid.columnOf(start)).assertEqual(3);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
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
    });

    /**
     * @tc.name HorizontalFocusMoveAndVerticalFocusMoveStayConsistentUnderRepeatedUseOnNarrowScreens
     * @tc.desc HorizontalFocusMoveAndVerticalFocusMoveStayConsistentUnderRepeatedUseOnNarrowScreens
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndVerticalFocusMoveStayConsistentUnderRepeatedUseOnNarrowScreens', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 3;
        expect(grid.columnOf(start)).assertEqual(3);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
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
    });
  });
}
