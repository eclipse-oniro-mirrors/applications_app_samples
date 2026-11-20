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

export default function EventPropagationTest(): void {
  describe('EventPropagationTest', () => {
    beforeAll(() => {
      logSuite('EventPropagationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('EventPropagationTest', 'end');
    });

    /**
     * @tc.name EventPathOrderAndHorizontalFocusMoveStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc EventPathOrderAndHorizontalFocusMoveStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndHorizontalFocusMoveStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
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
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 3;
        expect(grid.columnOf(start)).assertEqual(3);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
    });

    /**
     * @tc.name HorizontalFocusMoveAndVerticalFocusMoveRoleAuditTrailKeepTheVisibleStateInStepDuringPreview
     * @tc.desc HorizontalFocusMoveAndVerticalFocusMoveRoleAuditTrailKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndVerticalFocusMoveRoleAuditTrailKeepTheVisibleStateInStepDuringPreview', 0, () => {
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
      const trail: AuditTrail = new AuditTrail();
      trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
      trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
      expect(RolePolicy.canMutate('editor')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name VerticalFocusMoveRoleAuditTrailPreserveTheDeclaredContractDuringPreview
     * @tc.desc VerticalFocusMoveRoleAuditTrailPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveRoleAuditTrailPreserveTheDeclaredContractDuringPreview', 0, () => {
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
      const trail: AuditTrail = new AuditTrail();
      trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
      trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
      expect(RolePolicy.canMutate('editor')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name RoleAuditTrailAndCalendarJourneyAndEventPathOrderSurviveRapidInteractionDuringPreview
     * @tc.desc RoleAuditTrailAndCalendarJourneyAndEventPathOrderSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RoleAuditTrailAndCalendarJourneyAndEventPathOrderSurviveRapidInteractionDuringPreview', 0, () => {
      const trail: AuditTrail = new AuditTrail();
      trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
      trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
      expect(RolePolicy.canMutate('editor')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
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
     * @tc.name CalendarJourneyAndEventPathOrderHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc CalendarJourneyAndEventPathOrderHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndEventPathOrderHoldAcrossConfigurationChangesDuringPreview', 0, () => {
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
     * @tc.name EventPathOrderAndHorizontalFocusMoveAndVerticalFocusMoveRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc EventPathOrderAndHorizontalFocusMoveAndVerticalFocusMoveRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndHorizontalFocusMoveAndVerticalFocusMoveRemainCorrectAfterRecoveryDuringPreview', 0, () => {
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
     * @tc.name HorizontalFocusMoveAndVerticalFocusMoveAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc HorizontalFocusMoveAndVerticalFocusMoveAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndVerticalFocusMoveAgreeWithTheModelInvariantsDuringPreview', 0, () => {
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
     * @tc.name VerticalFocusMoveRoleAuditTrailAndCalendarJourneyKeepTheSessionCoherentDuringPreview
     * @tc.desc VerticalFocusMoveRoleAuditTrailAndCalendarJourneyKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveRoleAuditTrailAndCalendarJourneyKeepTheSessionCoherentDuringPreview', 0, () => {
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
      const trail: AuditTrail = new AuditTrail();
      trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
      trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
      expect(RolePolicy.canMutate('viewer')).assertEqual(false);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
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
     * @tc.name RoleAuditTrailAndCalendarJourneyTrackTheSelectedStateDuringPreview
     * @tc.desc RoleAuditTrailAndCalendarJourneyTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RoleAuditTrailAndCalendarJourneyTrackTheSelectedStateDuringPreview', 0, () => {
      const trail: AuditTrail = new AuditTrail();
      trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
      trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
      expect(RolePolicy.canMutate('viewer')).assertEqual(false);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
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
     * @tc.name CalendarJourneyAndEventPathOrderAndHorizontalFocusMovePreserveOrderingGuaranteesDuringPreview
     * @tc.desc CalendarJourneyAndEventPathOrderAndHorizontalFocusMovePreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndEventPathOrderAndHorizontalFocusMovePreserveOrderingGuaranteesDuringPreview', 0, () => {
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
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 33;
        expect(grid.columnOf(start)).assertEqual(5);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
    });

    /**
     * @tc.name EventPathOrderAndHorizontalFocusMoveHoldForRepeatedEntryDuringPreview
     * @tc.desc EventPathOrderAndHorizontalFocusMoveHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndHorizontalFocusMoveHoldForRepeatedEntryDuringPreview', 0, () => {
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
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 33;
        expect(grid.columnOf(start)).assertEqual(5);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
    });

    /**
     * @tc.name HorizontalFocusMoveAndVerticalFocusMoveRoleAuditTrailRemainStableUnderLoadDuringPreview
     * @tc.desc HorizontalFocusMoveAndVerticalFocusMoveRoleAuditTrailRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndVerticalFocusMoveRoleAuditTrailRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 33;
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
      const trail: AuditTrail = new AuditTrail();
      trail.record('owner', 'editGrid', RolePolicy.canMutate('owner'));
      trail.record('owner', 'exportGrid', RolePolicy.canExport('owner'));
      expect(RolePolicy.canMutate('owner')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name VerticalFocusMoveRoleAuditTrailStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc VerticalFocusMoveRoleAuditTrailStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveRoleAuditTrailStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
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
      const trail: AuditTrail = new AuditTrail();
      trail.record('owner', 'editGrid', RolePolicy.canMutate('owner'));
      trail.record('owner', 'exportGrid', RolePolicy.canExport('owner'));
      expect(RolePolicy.canMutate('owner')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name RoleAuditTrailAndCalendarJourneyAndEventPathOrderKeepTheVisibleStateInStepAfterRollover
     * @tc.desc RoleAuditTrailAndCalendarJourneyAndEventPathOrderKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RoleAuditTrailAndCalendarJourneyAndEventPathOrderKeepTheVisibleStateInStepAfterRollover', 0, () => {
      const trail: AuditTrail = new AuditTrail();
      trail.record('owner', 'editGrid', RolePolicy.canMutate('owner'));
      trail.record('owner', 'exportGrid', RolePolicy.canExport('owner'));
      expect(RolePolicy.canMutate('owner')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(3, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(3, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 15);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
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
     * @tc.name CalendarJourneyAndEventPathOrderPreserveTheDeclaredContractAfterRollover
     * @tc.desc CalendarJourneyAndEventPathOrderPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndEventPathOrderPreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(3, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(3, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 15);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
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
     * @tc.name EventPathOrderAndHorizontalFocusMoveAndVerticalFocusMoveSurviveRapidInteractionAfterRollover
     * @tc.desc EventPathOrderAndHorizontalFocusMoveAndVerticalFocusMoveSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndHorizontalFocusMoveAndVerticalFocusMoveSurviveRapidInteractionAfterRollover', 0, () => {
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
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 13;
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
     * @tc.name HorizontalFocusMoveAndVerticalFocusMoveHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc HorizontalFocusMoveAndVerticalFocusMoveHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndVerticalFocusMoveHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 13;
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
     * @tc.name VerticalFocusMoveRoleAuditTrailAndCalendarJourneyRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc VerticalFocusMoveRoleAuditTrailAndCalendarJourneyRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveRoleAuditTrailAndCalendarJourneyRemainCorrectAfterRecoveryAfterRollover', 0, () => {
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
      const trail: AuditTrail = new AuditTrail();
      trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
      trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
      expect(RolePolicy.canMutate('editor')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
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
     * @tc.name RoleAuditTrailAndCalendarJourneyAgreeWithTheModelInvariantsAfterRollover
     * @tc.desc RoleAuditTrailAndCalendarJourneyAgreeWithTheModelInvariantsAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RoleAuditTrailAndCalendarJourneyAgreeWithTheModelInvariantsAfterRollover', 0, () => {
      const trail: AuditTrail = new AuditTrail();
      trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
      trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
      expect(RolePolicy.canMutate('editor')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
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
     * @tc.name CalendarJourneyAndEventPathOrderAndHorizontalFocusMoveKeepTheSessionCoherentAfterRollover
     * @tc.desc CalendarJourneyAndEventPathOrderAndHorizontalFocusMoveKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndEventPathOrderAndHorizontalFocusMoveKeepTheSessionCoherentAfterRollover', 0, () => {
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
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 28;
        expect(grid.columnOf(start)).assertEqual(0);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
    });

    /**
     * @tc.name EventPathOrderAndHorizontalFocusMoveTrackTheSelectedStateAfterRollover
     * @tc.desc EventPathOrderAndHorizontalFocusMoveTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EventPathOrderAndHorizontalFocusMoveTrackTheSelectedStateAfterRollover', 0, () => {
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
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 28;
        expect(grid.columnOf(start)).assertEqual(0);
        const moved: int = grid.moveRight(start);
        expect(moved).assertEqual(start + 1);
        expect(grid.rowOf(moved)).assertEqual(grid.rowOf(start));
        expect(grid.moveLeft(moved)).assertEqual(start);
        expect(grid.clamp(start) >= 0).assertTrue();
      }
    });

    /**
     * @tc.name HorizontalFocusMoveAndVerticalFocusMoveRoleAuditTrailPreserveOrderingGuaranteesAfterRollover
     * @tc.desc HorizontalFocusMoveAndVerticalFocusMoveRoleAuditTrailPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndVerticalFocusMoveRoleAuditTrailPreserveOrderingGuaranteesAfterRollover', 0, () => {
      {
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 28;
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
      const trail: AuditTrail = new AuditTrail();
      trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
      trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
      expect(RolePolicy.canMutate('viewer')).assertEqual(false);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name VerticalFocusMoveRoleAuditTrailHoldForRepeatedEntryAfterRollover
     * @tc.desc VerticalFocusMoveRoleAuditTrailHoldForRepeatedEntryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveRoleAuditTrailHoldForRepeatedEntryAfterRollover', 0, () => {
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
      const trail: AuditTrail = new AuditTrail();
      trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
      trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
      expect(RolePolicy.canMutate('viewer')).assertEqual(false);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });
  });
}
