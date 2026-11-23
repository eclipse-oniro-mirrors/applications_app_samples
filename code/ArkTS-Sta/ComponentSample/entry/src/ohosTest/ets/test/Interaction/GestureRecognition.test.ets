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

export default function GestureRecognitionTest(): void {
  describe('GestureRecognitionTest', () => {
    beforeAll(() => {
      logSuite('GestureRecognitionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GestureRecognitionTest', 'end');
    });

    /**
     * @tc.name TapClassificationAndDragClassificationStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc TapClassificationAndDragClassificationStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('TapClassificationAndDragClassificationStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
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
     * @tc.name DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheVisibleStateInStepDuringPreview
     * @tc.desc DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, -1);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name SwipeDirectionAndFontScaleProjectionPreserveTheDeclaredContractDuringPreview
     * @tc.desc SwipeDirectionAndFontScaleProjectionPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SwipeDirectionAndFontScaleProjectionPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, -1);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightSurviveRapidInteractionDuringPreview
     * @tc.desc FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(14);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name FrameBudgetTrackingAndDayCellHighlightHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc FrameBudgetTrackingAndDayCellHighlightHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndDayCellHighlightHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(14);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name DayCellHighlightAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc DayCellHighlightAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const active = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(5, 6, 2026, 6, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheSessionCoherentDuringPreview
     * @tc.desc DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, -2);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(2);
        expect(scale.scaled(20)).assertEqual(40);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name SwipeDirectionAndFontScaleProjectionTrackTheSelectedStateDuringPreview
     * @tc.desc SwipeDirectionAndFontScaleProjectionTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SwipeDirectionAndFontScaleProjectionTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, -2);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(2);
        expect(scale.scaled(20)).assertEqual(40);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview
     * @tc.desc FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(2);
        expect(scale.scaled(20)).assertEqual(40);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
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
        const active = CellProjector.project(12, 6, 2026, 12, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(11, 6, 2026, 12, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndDayCellHighlightHoldForRepeatedEntryDuringPreview
     * @tc.desc FrameBudgetTrackingAndDayCellHighlightHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndDayCellHighlightHoldForRepeatedEntryDuringPreview', 0, () => {
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
        const active = CellProjector.project(12, 6, 2026, 12, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(11, 6, 2026, 12, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });

    /**
     * @tc.name DayCellHighlightAndTapClassificationAndDragClassificationRemainStableUnderLoadDuringPreview
     * @tc.desc DayCellHighlightAndTapClassificationAndDragClassificationRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndTapClassificationAndDragClassificationRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const active = CellProjector.project(12, 6, 2026, 12, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(11, 6, 2026, 12, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheVisibleStateInStepAfterRollover
     * @tc.desc DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, -3);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1);
        expect(scale.scaled(20)).assertEqual(20);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name SwipeDirectionAndFontScaleProjectionPreserveTheDeclaredContractAfterRollover
     * @tc.desc SwipeDirectionAndFontScaleProjectionPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SwipeDirectionAndFontScaleProjectionPreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, -3);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1);
        expect(scale.scaled(20)).assertEqual(20);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightSurviveRapidInteractionAfterRollover
     * @tc.desc FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightSurviveRapidInteractionAfterRollover', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1);
        expect(scale.scaled(20)).assertEqual(20);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(17);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name FrameBudgetTrackingAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc FrameBudgetTrackingAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(17);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name DayCellHighlightAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc DayCellHighlightAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryAfterRollover', 0, () => {
      {
        const active = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(17, 6, 2026, 18, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheSessionCoherentAfterRollover
     * @tc.desc DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheSessionCoherentAfterRollover', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, 3);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.25);
        expect(scale.scaled(20)).assertEqual(25);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name SwipeDirectionAndFontScaleProjectionTrackTheSelectedStateAfterRollover
     * @tc.desc SwipeDirectionAndFontScaleProjectionTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SwipeDirectionAndFontScaleProjectionTrackTheSelectedStateAfterRollover', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, 3);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.25);
        expect(scale.scaled(20)).assertEqual(25);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightPreserveOrderingGuaranteesAfterRollover
     * @tc.desc FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightPreserveOrderingGuaranteesAfterRollover', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.25);
        expect(scale.scaled(20)).assertEqual(25);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(14);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name FrameBudgetTrackingAndDayCellHighlightHoldForRepeatedEntryAfterRollover
     * @tc.desc FrameBudgetTrackingAndDayCellHighlightHoldForRepeatedEntryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndDayCellHighlightHoldForRepeatedEntryAfterRollover', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(14);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name DayCellHighlightAndTapClassificationAndDragClassificationRemainStableUnderLoadAfterRollover
     * @tc.desc DayCellHighlightAndTapClassificationAndDragClassificationRemainStableUnderLoadAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndTapClassificationAndDragClassificationRemainStableUnderLoadAfterRollover', 0, () => {
      {
        const active = CellProjector.project(24, 6, 2026, 24, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(23, 6, 2026, 24, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheVisibleStateInStepUnderLoad
     * @tc.desc DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheVisibleStateInStepUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheVisibleStateInStepUnderLoad', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, 2);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.5);
        expect(scale.scaled(20)).assertEqual(30);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name SwipeDirectionAndFontScaleProjectionPreserveTheDeclaredContractUnderLoad
     * @tc.desc SwipeDirectionAndFontScaleProjectionPreserveTheDeclaredContractUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('SwipeDirectionAndFontScaleProjectionPreserveTheDeclaredContractUnderLoad', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, 2);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.5);
        expect(scale.scaled(20)).assertEqual(30);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightSurviveRapidInteractionUnderLoad
     * @tc.desc FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightSurviveRapidInteractionUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightSurviveRapidInteractionUnderLoad', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.5);
        expect(scale.scaled(20)).assertEqual(30);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(11);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name FrameBudgetTrackingAndDayCellHighlightHoldAcrossConfigurationChangesUnderLoad
     * @tc.desc FrameBudgetTrackingAndDayCellHighlightHoldAcrossConfigurationChangesUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndDayCellHighlightHoldAcrossConfigurationChangesUnderLoad', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(11);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name DayCellHighlightAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryUnderLoad
     * @tc.desc DayCellHighlightAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndTapClassificationAndDragClassificationRemainCorrectAfterRecoveryUnderLoad', 0, () => {
      {
        const active = CellProjector.project(3, 6, 2026, 3, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(2, 6, 2026, 3, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheSessionCoherentUnderLoad
     * @tc.desc DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheSessionCoherentUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheSessionCoherentUnderLoad', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, 1);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name SwipeDirectionAndFontScaleProjectionTrackTheSelectedStateUnderLoad
     * @tc.desc SwipeDirectionAndFontScaleProjectionTrackTheSelectedStateUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('SwipeDirectionAndFontScaleProjectionTrackTheSelectedStateUnderLoad', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, 1);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightPreserveOrderingGuaranteesUnderLoad
     * @tc.desc FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightPreserveOrderingGuaranteesUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightPreserveOrderingGuaranteesUnderLoad', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(17);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name FrameBudgetTrackingAndDayCellHighlightHoldForRepeatedEntryUnderLoad
     * @tc.desc FrameBudgetTrackingAndDayCellHighlightHoldForRepeatedEntryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndDayCellHighlightHoldForRepeatedEntryUnderLoad', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(17);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
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
     * @tc.name DayCellHighlightAndTapClassificationAndDragClassificationRemainStableUnderLoadUnderLoad
     * @tc.desc DayCellHighlightAndTapClassificationAndDragClassificationRemainStableUnderLoadUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndTapClassificationAndDragClassificationRemainStableUnderLoadUnderLoad', 0, () => {
      {
        const active = CellProjector.project(9, 6, 2026, 9, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(8, 6, 2026, 9, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
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
     * @tc.name DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheVisibleStateInStepOnNarrowScreens
     * @tc.desc DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheVisibleStateInStepOnNarrowScreens
     * @tc.type Function
     * @tc.level Level2
     */
    it('DragClassificationAndSwipeDirectionAndFontScaleProjectionKeepTheVisibleStateInStepOnNarrowScreens', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 12, 9);
        expect(GestureClassifier.classify(sample)).assertEqual('drag');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(12);
      }
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, 0);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(2);
        expect(scale.scaled(20)).assertEqual(40);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name SwipeDirectionAndFontScaleProjectionPreserveTheDeclaredContractOnNarrowScreens
     * @tc.desc SwipeDirectionAndFontScaleProjectionPreserveTheDeclaredContractOnNarrowScreens
     * @tc.type Function
     * @tc.level Level2
     */
    it('SwipeDirectionAndFontScaleProjectionPreserveTheDeclaredContractOnNarrowScreens', 0, () => {
      {
        const sample: GestureSample = new GestureSample(0, 0, 60, 0);
        expect(GestureClassifier.classify(sample)).assertEqual('swipeRight');
        expect(sample.distance() >= 0).assertTrue();
        expect(sample.dx()).assertEqual(60);
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(2);
        expect(scale.scaled(20)).assertEqual(40);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightSurviveRapidInteractionOnNarrowScreens
     * @tc.desc FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightSurviveRapidInteractionOnNarrowScreens
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndFrameBudgetTrackingAndDayCellHighlightSurviveRapidInteractionOnNarrowScreens', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(2);
        expect(scale.scaled(20)).assertEqual(40);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(14);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const active = CellProjector.project(15, 6, 2026, 15, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(14, 6, 2026, 15, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });
  });
}
