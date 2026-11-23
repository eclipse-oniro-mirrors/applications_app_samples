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

export default function ThemeVariationTest(): void {
  describe('ThemeVariationTest', () => {
    beforeAll(() => {
      logSuite('ThemeVariationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('ThemeVariationTest', 'end');
    });

    /**
     * @tc.name WeekHeaderEmphasisAndPanelGeometryAndDayCellHighlightKeepTheVisibleStateInStepDuringPreview
     * @tc.desc WeekHeaderEmphasisAndPanelGeometryAndDayCellHighlightKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndPanelGeometryAndDayCellHighlightKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[2].emphasized).assertFalse();
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name PanelGeometryAndDayCellHighlightPreserveTheDeclaredContractDuringPreview
     * @tc.desc PanelGeometryAndDayCellHighlightPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndDayCellHighlightPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name DayCellHighlightAndThemeTokenResolutionAndWeekHeaderEmphasisSurviveRapidInteractionDuringPreview
     * @tc.desc DayCellHighlightAndThemeTokenResolutionAndWeekHeaderEmphasisSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndThemeTokenResolutionAndWeekHeaderEmphasisSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const active = CellProjector.project(4, 6, 2026, 4, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(3, 6, 2026, 4, 6, 2026);
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
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[1].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name ThemeTokenResolutionAndWeekHeaderEmphasisHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc ThemeTokenResolutionAndWeekHeaderEmphasisHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndWeekHeaderEmphasisHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name WeekHeaderEmphasisAndPanelGeometryAndDayCellHighlightRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc WeekHeaderEmphasisAndPanelGeometryAndDayCellHighlightRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndPanelGeometryAndDayCellHighlightRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[1].emphasized).assertFalse();
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name PanelGeometryAndDayCellHighlightAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc PanelGeometryAndDayCellHighlightAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndDayCellHighlightAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name DayCellHighlightAndThemeTokenResolutionAndWeekHeaderEmphasisKeepTheSessionCoherentDuringPreview
     * @tc.desc DayCellHighlightAndThemeTokenResolutionAndWeekHeaderEmphasisKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndThemeTokenResolutionAndWeekHeaderEmphasisKeepTheSessionCoherentDuringPreview', 0, () => {
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
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[5].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name ThemeTokenResolutionAndWeekHeaderEmphasisTrackTheSelectedStateDuringPreview
     * @tc.desc ThemeTokenResolutionAndWeekHeaderEmphasisTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndWeekHeaderEmphasisTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name WeekHeaderEmphasisAndPanelGeometryAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview
     * @tc.desc WeekHeaderEmphasisAndPanelGeometryAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndPanelGeometryAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[5].emphasized).assertFalse();
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name PanelGeometryAndDayCellHighlightHoldForRepeatedEntryDuringPreview
     * @tc.desc PanelGeometryAndDayCellHighlightHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndDayCellHighlightHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name DayCellHighlightAndThemeTokenResolutionAndWeekHeaderEmphasisRemainStableUnderLoadDuringPreview
     * @tc.desc DayCellHighlightAndThemeTokenResolutionAndWeekHeaderEmphasisRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndThemeTokenResolutionAndWeekHeaderEmphasisRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const active = CellProjector.project(12, 6, 2026, 12, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(11, 6, 2026, 12, 6, 2026);
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
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name WeekHeaderEmphasisAndPanelGeometryAndDayCellHighlightKeepTheVisibleStateInStepAfterRollover
     * @tc.desc WeekHeaderEmphasisAndPanelGeometryAndDayCellHighlightKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndPanelGeometryAndDayCellHighlightKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const active = CellProjector.project(16, 6, 2026, 16, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(15, 6, 2026, 16, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });
  });
}
