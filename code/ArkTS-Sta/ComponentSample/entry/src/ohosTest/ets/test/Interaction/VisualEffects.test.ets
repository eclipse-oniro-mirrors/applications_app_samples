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

export default function VisualEffectsTest(): void {
  describe('VisualEffectsTest', () => {
    beforeAll(() => {
      logSuite('VisualEffectsTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('VisualEffectsTest', 'end');
    });

    /**
     * @tc.name FrameBudgetTrackingAndThemeTokenResolutionStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc FrameBudgetTrackingAndThemeTokenResolutionStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndThemeTokenResolutionStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(10);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name ThemeTokenResolutionAndFocusRingVisibilityAndFontScaleProjectionKeepTheVisibleStateInStepDuringPreview
     * @tc.desc ThemeTokenResolutionAndFocusRingVisibilityAndFontScaleProjectionKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ThemeTokenResolutionAndFocusRingVisibilityAndFontScaleProjectionKeepTheVisibleStateInStepDuringPreview',
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
          const ring: FocusRingModel = new FocusRingModel();
          ring.show(false);
          expect(ring.visible).assertTrue();
          expect(ring.borderWidth()).assertEqual(2);
          expect(ring.emphasized).assertEqual(false);
          ring.hide();
          expect(ring.borderWidth()).assertEqual(0);
        }
        {
          const scale: ContentScaleModel = new ContentScaleModel(1.75);
          expect(scale.scaled(20)).assertEqual(35);
          expect(scale.rowHeight(50) >= 50).assertTrue();
          expect(scale.fits(100, 20)).assertTrue();
        }
      },
    );

    /**
     * @tc.name FocusRingVisibilityAndFontScaleProjectionPreserveTheDeclaredContractDuringPreview
     * @tc.desc FocusRingVisibilityAndFontScaleProjectionPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndFontScaleProjectionPreserveTheDeclaredContractDuringPreview', 0, () => {
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
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndPanelGeometryAndFrameBudgetTrackingSurviveRapidInteractionDuringPreview
     * @tc.desc FontScaleProjectionAndPanelGeometryAndFrameBudgetTrackingSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndPanelGeometryAndFrameBudgetTrackingSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(15);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name PanelGeometryAndFrameBudgetTrackingHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc PanelGeometryAndFrameBudgetTrackingHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndFrameBudgetTrackingHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(15);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndThemeTokenResolutionAndFocusRingVisibilityRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc FrameBudgetTrackingAndThemeTokenResolutionAndFocusRingVisibilityRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'FrameBudgetTrackingAndThemeTokenResolutionAndFocusRingVisibilityRemainCorrectAfterRecoveryDuringPreview',
      0,
      () => {
        {
          const timeline: AnimationTimeline = new AnimationTimeline();
          for (let index = 0; index < 4; index++) {
            timeline.addFrame(12.5);
          }
          timeline.addFrame(15);
          expect(timeline.frames.length).assertEqual(5);
          expect(timeline.dropped()).assertEqual(0);
          expect(timeline.averageFrame() > 0).assertTrue();
        }
        {
          const tokens: ThemeTokens = ThemeResolver.resolve(false);
          expect(tokens.background).assertEqual('#ffffffff');
          expect(tokens.foreground).assertEqual('#ff000000');
          expect(ThemeResolver.gridHeight(false)).assertEqual(300);
          expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
      },
    );

    /**
     * @tc.name ThemeTokenResolutionAndFocusRingVisibilityAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc ThemeTokenResolutionAndFocusRingVisibilityAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndFocusRingVisibilityAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name FocusRingVisibilityAndFontScaleProjectionAndPanelGeometryKeepTheSessionCoherentDuringPreview
     * @tc.desc FocusRingVisibilityAndFontScaleProjectionAndPanelGeometryKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndFontScaleProjectionAndPanelGeometryKeepTheSessionCoherentDuringPreview', 0, () => {
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
     * @tc.name PanelGeometryAndFrameBudgetTrackingAndThemeTokenResolutionPreserveOrderingGuaranteesDuringPreview
     * @tc.desc PanelGeometryAndFrameBudgetTrackingAndThemeTokenResolutionPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndFrameBudgetTrackingAndThemeTokenResolutionPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.margin(false)).assertEqual(8);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(11);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name FrameBudgetTrackingAndThemeTokenResolutionHoldForRepeatedEntryDuringPreview
     * @tc.desc FrameBudgetTrackingAndThemeTokenResolutionHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndThemeTokenResolutionHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(11);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name ThemeTokenResolutionAndFocusRingVisibilityAndFontScaleProjectionRemainStableUnderLoadDuringPreview
     * @tc.desc ThemeTokenResolutionAndFocusRingVisibilityAndFontScaleProjectionRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndFocusRingVisibilityAndFontScaleProjectionRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
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
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FocusRingVisibilityAndFontScaleProjectionStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc FocusRingVisibilityAndFontScaleProjectionStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndFontScaleProjectionStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
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
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndPanelGeometryAndFrameBudgetTrackingKeepTheVisibleStateInStepAfterRollover
     * @tc.desc FontScaleProjectionAndPanelGeometryAndFrameBudgetTrackingKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndPanelGeometryAndFrameBudgetTrackingKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 6; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(16);
        expect(timeline.frames.length).assertEqual(7);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name PanelGeometryAndFrameBudgetTrackingPreserveTheDeclaredContractAfterRollover
     * @tc.desc PanelGeometryAndFrameBudgetTrackingPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndFrameBudgetTrackingPreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 6; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(16);
        expect(timeline.frames.length).assertEqual(7);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndThemeTokenResolutionAndFocusRingVisibilitySurviveRapidInteractionAfterRollover
     * @tc.desc FrameBudgetTrackingAndThemeTokenResolutionAndFocusRingVisibilitySurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'FrameBudgetTrackingAndThemeTokenResolutionAndFocusRingVisibilitySurviveRapidInteractionAfterRollover',
      0,
      () => {
        {
          const timeline: AnimationTimeline = new AnimationTimeline();
          for (let index = 0; index < 6; index++) {
            timeline.addFrame(12.5);
          }
          timeline.addFrame(16);
          expect(timeline.frames.length).assertEqual(7);
          expect(timeline.dropped()).assertEqual(0);
          expect(timeline.averageFrame() > 0).assertTrue();
        }
        {
          const tokens: ThemeTokens = ThemeResolver.resolve(false);
          expect(tokens.background).assertEqual('#ffffffff');
          expect(tokens.foreground).assertEqual('#ff000000');
          expect(ThemeResolver.gridHeight(false)).assertEqual(300);
          expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name ThemeTokenResolutionAndFocusRingVisibilityHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc ThemeTokenResolutionAndFocusRingVisibilityHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndFocusRingVisibilityHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name FocusRingVisibilityAndFontScaleProjectionAndPanelGeometryRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc FocusRingVisibilityAndFontScaleProjectionAndPanelGeometryRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FocusRingVisibilityAndFontScaleProjectionAndPanelGeometryRemainCorrectAfterRecoveryAfterRollover', 0, () => {
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
     * @tc.name PanelGeometryAndFrameBudgetTrackingAndThemeTokenResolutionKeepTheSessionCoherentAfterRollover
     * @tc.desc PanelGeometryAndFrameBudgetTrackingAndThemeTokenResolutionKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndFrameBudgetTrackingAndThemeTokenResolutionKeepTheSessionCoherentAfterRollover', 0, () => {
      {
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.margin(false)).assertEqual(8);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(12);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name FrameBudgetTrackingAndThemeTokenResolutionTrackTheSelectedStateAfterRollover
     * @tc.desc FrameBudgetTrackingAndThemeTokenResolutionTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndThemeTokenResolutionTrackTheSelectedStateAfterRollover', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(12);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name FontScaleProjectionAndPanelGeometryAndFrameBudgetTrackingRemainStableUnderLoadAfterRollover
     * @tc.desc FontScaleProjectionAndPanelGeometryAndFrameBudgetTrackingRemainStableUnderLoadAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndPanelGeometryAndFrameBudgetTrackingRemainStableUnderLoadAfterRollover', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(17);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name PanelGeometryAndFrameBudgetTrackingStayConsistentUnderRepeatedUseUnderLoad
     * @tc.desc PanelGeometryAndFrameBudgetTrackingStayConsistentUnderRepeatedUseUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndFrameBudgetTrackingStayConsistentUnderRepeatedUseUnderLoad', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(17);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndThemeTokenResolutionAndFocusRingVisibilityKeepTheVisibleStateInStepUnderLoad
     * @tc.desc FrameBudgetTrackingAndThemeTokenResolutionAndFocusRingVisibilityKeepTheVisibleStateInStepUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndThemeTokenResolutionAndFocusRingVisibilityKeepTheVisibleStateInStepUnderLoad', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 4; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(17);
        expect(timeline.frames.length).assertEqual(5);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name PanelGeometryAndFrameBudgetTrackingAndThemeTokenResolutionRemainCorrectAfterRecoveryUnderLoad
     * @tc.desc PanelGeometryAndFrameBudgetTrackingAndThemeTokenResolutionRemainCorrectAfterRecoveryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndFrameBudgetTrackingAndThemeTokenResolutionRemainCorrectAfterRecoveryUnderLoad', 0, () => {
      {
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.margin(false)).assertEqual(8);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(13);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
      }
    });
  });
}
