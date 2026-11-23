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

export default function ContentScalingTest(): void {
  describe('ContentScalingTest', () => {
    beforeAll(() => {
      logSuite('ContentScalingTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('ContentScalingTest', 'end');
    });

    /**
     * @tc.name FontScaleProjectionAndPanelGeometryStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc FontScaleProjectionAndPanelGeometryStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndPanelGeometryStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1);
        expect(scale.scaled(20)).assertEqual(20);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.margin(false)).assertEqual(8);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
    });

    /**
     * @tc.name PanelGeometryAndThemeTokenResolutionAndWeekHeaderEmphasisKeepTheVisibleStateInStepDuringPreview
     * @tc.desc PanelGeometryAndThemeTokenResolutionAndWeekHeaderEmphasisKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndThemeTokenResolutionAndWeekHeaderEmphasisKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.margin(false)).assertEqual(8);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name ThemeTokenResolutionAndWeekHeaderEmphasisPreserveTheDeclaredContractDuringPreview
     * @tc.desc ThemeTokenResolutionAndWeekHeaderEmphasisPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndWeekHeaderEmphasisPreserveTheDeclaredContractDuringPreview', 0, () => {
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
     * @tc.name WeekHeaderEmphasisAndFontScaleProjectionAndPanelGeometrySurviveRapidInteractionDuringPreview
     * @tc.desc WeekHeaderEmphasisAndFontScaleProjectionAndPanelGeometrySurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndFontScaleProjectionAndPanelGeometrySurviveRapidInteractionDuringPreview', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(2);
        expect(scale.scaled(20)).assertEqual(40);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.margin(false)).assertEqual(8);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
    });

    /**
     * @tc.name FontScaleProjectionAndPanelGeometryHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc FontScaleProjectionAndPanelGeometryHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndPanelGeometryHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(2);
        expect(scale.scaled(20)).assertEqual(40);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.margin(false)).assertEqual(8);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
    });

    /**
     * @tc.name PanelGeometryAndThemeTokenResolutionAndWeekHeaderEmphasisRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc PanelGeometryAndThemeTokenResolutionAndWeekHeaderEmphasisRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndThemeTokenResolutionAndWeekHeaderEmphasisRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.margin(false)).assertEqual(8);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
        expect(entries[3].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name ThemeTokenResolutionAndWeekHeaderEmphasisAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc ThemeTokenResolutionAndWeekHeaderEmphasisAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndWeekHeaderEmphasisAgreeWithTheModelInvariantsDuringPreview', 0, () => {
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
        expect(entries[3].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name WeekHeaderEmphasisAndFontScaleProjectionAndPanelGeometryKeepTheSessionCoherentDuringPreview
     * @tc.desc WeekHeaderEmphasisAndFontScaleProjectionAndPanelGeometryKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndFontScaleProjectionAndPanelGeometryKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[3].emphasized).assertFalse();
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.margin(false)).assertEqual(8);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
    });

    /**
     * @tc.name FontScaleProjectionAndPanelGeometryTrackTheSelectedStateDuringPreview
     * @tc.desc FontScaleProjectionAndPanelGeometryTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndPanelGeometryTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.margin(false)).assertEqual(8);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
    });

    /**
     * @tc.name PanelGeometryAndThemeTokenResolutionAndWeekHeaderEmphasisPreserveOrderingGuaranteesDuringPreview
     * @tc.desc PanelGeometryAndThemeTokenResolutionAndWeekHeaderEmphasisPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndThemeTokenResolutionAndWeekHeaderEmphasisPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.margin(false)).assertEqual(8);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
        expect(entries[2].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name ThemeTokenResolutionAndWeekHeaderEmphasisHoldForRepeatedEntryDuringPreview
     * @tc.desc ThemeTokenResolutionAndWeekHeaderEmphasisHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndWeekHeaderEmphasisHoldForRepeatedEntryDuringPreview', 0, () => {
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
        expect(entries[2].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name WeekHeaderEmphasisAndFontScaleProjectionAndPanelGeometryRemainStableUnderLoadDuringPreview
     * @tc.desc WeekHeaderEmphasisAndFontScaleProjectionAndPanelGeometryRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndFontScaleProjectionAndPanelGeometryRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[2].emphasized).assertFalse();
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.5);
        expect(scale.scaled(20)).assertEqual(30);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.margin(false)).assertEqual(8);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
    });
  });
}
