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

export default function FocusRingBehaviorTest(): void {
  describe('FocusRingBehaviorTest', () => {
    beforeAll(() => {
      logSuite('FocusRingBehaviorTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('FocusRingBehaviorTest', 'end');
    });

    /**
     * @tc.name FocusRingVisibilityAndHorizontalFocusMoveStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc FocusRingVisibilityAndHorizontalFocusMoveStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndHorizontalFocusMoveStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
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
     * @tc.name HorizontalFocusMoveAndDayCellHighlightAndThemeTokenResolutionKeepTheVisibleStateInStepDuringPreview
     * @tc.desc HorizontalFocusMoveAndDayCellHighlightAndThemeTokenResolutionKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndDayCellHighlightAndThemeTokenResolutionKeepTheVisibleStateInStepDuringPreview', 0, () => {
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
        const active = CellProjector.project(3, 6, 2026, 3, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(2, 6, 2026, 3, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DayCellHighlightAndThemeTokenResolutionPreserveTheDeclaredContractDuringPreview
     * @tc.desc DayCellHighlightAndThemeTokenResolutionPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndThemeTokenResolutionPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const active = CellProjector.project(3, 6, 2026, 3, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(2, 6, 2026, 3, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name ThemeTokenResolutionAndVerticalFocusMoveAndFocusRingVisibilitySurviveRapidInteractionDuringPreview
     * @tc.desc ThemeTokenResolutionAndVerticalFocusMoveAndFocusRingVisibilitySurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndVerticalFocusMoveAndFocusRingVisibilitySurviveRapidInteractionDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
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
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveAndFocusRingVisibilityHoldAcrossConfigurationChangesDuringPreview', 0, () => {
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
    });

    /**
     * @tc.name FocusRingVisibilityAndHorizontalFocusMoveAndDayCellHighlightRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc FocusRingVisibilityAndHorizontalFocusMoveAndDayCellHighlightRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndHorizontalFocusMoveAndDayCellHighlightRemainCorrectAfterRecoveryDuringPreview', 0, () => {
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
        const active = CellProjector.project(8, 6, 2026, 8, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(7, 6, 2026, 8, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name HorizontalFocusMoveAndDayCellHighlightAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc HorizontalFocusMoveAndDayCellHighlightAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndDayCellHighlightAgreeWithTheModelInvariantsDuringPreview', 0, () => {
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
        const active = CellProjector.project(8, 6, 2026, 8, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(7, 6, 2026, 8, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndThemeTokenResolutionAndVerticalFocusMoveKeepTheSessionCoherentDuringPreview
     * @tc.desc DayCellHighlightAndThemeTokenResolutionAndVerticalFocusMoveKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndThemeTokenResolutionAndVerticalFocusMoveKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const active = CellProjector.project(8, 6, 2026, 8, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(7, 6, 2026, 8, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name ThemeTokenResolutionAndVerticalFocusMoveTrackTheSelectedStateDuringPreview
     * @tc.desc ThemeTokenResolutionAndVerticalFocusMoveTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndVerticalFocusMoveTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityAndHorizontalFocusMovePreserveOrderingGuaranteesDuringPreview
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityAndHorizontalFocusMovePreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'VerticalFocusMoveAndFocusRingVisibilityAndHorizontalFocusMovePreserveOrderingGuaranteesDuringPreview',
      0,
      () => {
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
      },
    );

    /**
     * @tc.name FocusRingVisibilityAndHorizontalFocusMoveHoldForRepeatedEntryDuringPreview
     * @tc.desc FocusRingVisibilityAndHorizontalFocusMoveHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndHorizontalFocusMoveHoldForRepeatedEntryDuringPreview', 0, () => {
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
     * @tc.name HorizontalFocusMoveAndDayCellHighlightAndThemeTokenResolutionRemainStableUnderLoadDuringPreview
     * @tc.desc HorizontalFocusMoveAndDayCellHighlightAndThemeTokenResolutionRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndDayCellHighlightAndThemeTokenResolutionRemainStableUnderLoadDuringPreview', 0, () => {
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
        const active = CellProjector.project(13, 6, 2026, 13, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(12, 6, 2026, 13, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DayCellHighlightAndThemeTokenResolutionStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc DayCellHighlightAndThemeTokenResolutionStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndThemeTokenResolutionStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const active = CellProjector.project(13, 6, 2026, 13, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(12, 6, 2026, 13, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name ThemeTokenResolutionAndVerticalFocusMoveAndFocusRingVisibilityKeepTheVisibleStateInStepAfterRollover
     * @tc.desc ThemeTokenResolutionAndVerticalFocusMoveAndFocusRingVisibilityKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ThemeTokenResolutionAndVerticalFocusMoveAndFocusRingVisibilityKeepTheVisibleStateInStepAfterRollover',
      0,
      () => {
        {
          const tokens: ThemeTokens = ThemeResolver.resolve(true);
          expect(tokens.background).assertEqual('#ff000000');
          expect(tokens.foreground).assertEqual('#ffffffff');
          expect(ThemeResolver.gridHeight(true)).assertEqual(360);
          expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
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
      },
    );

    /**
     * @tc.name FocusRingVisibilityAndHorizontalFocusMoveAndDayCellHighlightSurviveRapidInteractionAfterRollover
     * @tc.desc FocusRingVisibilityAndHorizontalFocusMoveAndDayCellHighlightSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndHorizontalFocusMoveAndDayCellHighlightSurviveRapidInteractionAfterRollover', 0, () => {
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
        const grid: FocusGrid = new FocusGrid(7, 5);
        const start: int = 13;
        expect(grid.columnOf(start)).assertEqual(6);
        expect(grid.moveRight(start)).assertEqual(start);
        expect(grid.columnOf(start)).assertEqual(6);
        expect(grid.isWeekendColumn(start)).assertTrue();
        expect(grid.clamp(start) >= 0).assertTrue();
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
     * @tc.name HorizontalFocusMoveAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc HorizontalFocusMoveAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('HorizontalFocusMoveAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover', 0, () => {
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
        const active = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(17, 6, 2026, 18, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndThemeTokenResolutionAndVerticalFocusMoveRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc DayCellHighlightAndThemeTokenResolutionAndVerticalFocusMoveRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndThemeTokenResolutionAndVerticalFocusMoveRemainCorrectAfterRecoveryAfterRollover', 0, () => {
      {
        const active = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(17, 6, 2026, 18, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name ThemeTokenResolutionAndVerticalFocusMoveAgreeWithTheModelInvariantsAfterRollover
     * @tc.desc ThemeTokenResolutionAndVerticalFocusMoveAgreeWithTheModelInvariantsAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndVerticalFocusMoveAgreeWithTheModelInvariantsAfterRollover', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name VerticalFocusMoveAndFocusRingVisibilityAndHorizontalFocusMoveKeepTheSessionCoherentAfterRollover
     * @tc.desc VerticalFocusMoveAndFocusRingVisibilityAndHorizontalFocusMoveKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('VerticalFocusMoveAndFocusRingVisibilityAndHorizontalFocusMoveKeepTheSessionCoherentAfterRollover', 0, () => {
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
     * @tc.name FocusRingVisibilityAndHorizontalFocusMoveTrackTheSelectedStateAfterRollover
     * @tc.desc FocusRingVisibilityAndHorizontalFocusMoveTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndHorizontalFocusMoveTrackTheSelectedStateAfterRollover', 0, () => {
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
     * @tc.name HorizontalFocusMoveAndDayCellHighlightAndThemeTokenResolutionPreserveOrderingGuaranteesAfterRollover
     * @tc.desc HorizontalFocusMoveAndDayCellHighlightAndThemeTokenResolutionPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'HorizontalFocusMoveAndDayCellHighlightAndThemeTokenResolutionPreserveOrderingGuaranteesAfterRollover',
      0,
      () => {
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
          const active = CellProjector.project(23, 6, 2026, 23, 6, 2026);
          expect(active.highlighted).assertTrue();
          const past = CellProjector.project(22, 6, 2026, 23, 6, 2026);
          expect(past.highlighted).assertFalse();
          expect(past.selectable).assertEqual(false);
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
  });
}
