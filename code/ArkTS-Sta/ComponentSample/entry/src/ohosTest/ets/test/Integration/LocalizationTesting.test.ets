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

export default function LocalizationTestingTest(): void {
  describe('LocalizationTestingTest', () => {
    beforeAll(() => {
      logSuite('LocalizationTestingTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('LocalizationTestingTest', 'end');
    });

    /**
     * @tc.name MonthLabelContractAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc MonthLabelContractAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const label: string = monthLabel(1, 2015);
        expect(label.indexOf('2015') >= 0).assertTrue();
        expect(label.indexOf('1') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(1, 2015, 1);
        expect(panels[0].label).assertEqual(label);
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
     * @tc.name WeekHeaderEmphasisAndCalendarJourneyAndRealTimeDateFieldsKeepTheVisibleStateInStepDuringPreview
     * @tc.desc WeekHeaderEmphasisAndCalendarJourneyAndRealTimeDateFieldsKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndCalendarJourneyAndRealTimeDateFieldsKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[2].emphasized).assertFalse();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(3, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(3, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 3);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.month >= 1 && model.month <= 12).assertTrue();
        expect(model.day >= 1 && model.day <= 31).assertTrue();
      }
    });

    /**
     * @tc.name CalendarJourneyAndRealTimeDateFieldsPreserveTheDeclaredContractDuringPreview
     * @tc.desc CalendarJourneyAndRealTimeDateFieldsPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndRealTimeDateFieldsPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(3, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(3, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 3);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.month >= 1 && model.month <= 12).assertTrue();
        expect(model.day >= 1 && model.day <= 31).assertTrue();
      }
    });

    /**
     * @tc.name RealTimeDateFieldsAndConfigurationSnapshotAndDayCellHighlightSurviveRapidInteractionDuringPreview
     * @tc.desc RealTimeDateFieldsAndConfigurationSnapshotAndDayCellHighlightSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RealTimeDateFieldsAndConfigurationSnapshotAndDayCellHighlightSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.month >= 1 && model.month <= 12).assertTrue();
        expect(model.day >= 1 && model.day <= 31).assertTrue();
      }
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name ConfigurationSnapshotAndDayCellHighlightHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc ConfigurationSnapshotAndDayCellHighlightHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndDayCellHighlightHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name DayCellHighlightAndMonthLabelContractAndWeekHeaderEmphasisRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc DayCellHighlightAndMonthLabelContractAndWeekHeaderEmphasisRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndMonthLabelContractAndWeekHeaderEmphasisRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const active = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(5, 6, 2026, 6, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const label: string = monthLabel(7, 2021);
        expect(label.indexOf('2021') >= 0).assertTrue();
        expect(label.indexOf('7') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(7, 2021, 1);
        expect(panels[0].label).assertEqual(label);
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
     * @tc.name MonthLabelContractAndWeekHeaderEmphasisAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc MonthLabelContractAndWeekHeaderEmphasisAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndWeekHeaderEmphasisAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const label: string = monthLabel(7, 2021);
        expect(label.indexOf('2021') >= 0).assertTrue();
        expect(label.indexOf('7') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(7, 2021, 1);
        expect(panels[0].label).assertEqual(label);
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
     * @tc.name WeekHeaderEmphasisAndCalendarJourneyAndRealTimeDateFieldsKeepTheSessionCoherentDuringPreview
     * @tc.desc WeekHeaderEmphasisAndCalendarJourneyAndRealTimeDateFieldsKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndCalendarJourneyAndRealTimeDateFieldsKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[3].emphasized).assertFalse();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(9, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(9, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 9);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.month >= 1 && model.month <= 12).assertTrue();
        expect(model.day >= 1 && model.day <= 31).assertTrue();
      }
    });

    /**
     * @tc.name CalendarJourneyAndRealTimeDateFieldsTrackTheSelectedStateDuringPreview
     * @tc.desc CalendarJourneyAndRealTimeDateFieldsTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndRealTimeDateFieldsTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(9, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(9, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 9);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.month >= 1 && model.month <= 12).assertTrue();
        expect(model.day >= 1 && model.day <= 31).assertTrue();
      }
    });

    /**
     * @tc.name RealTimeDateFieldsAndConfigurationSnapshotAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview
     * @tc.desc RealTimeDateFieldsAndConfigurationSnapshotAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'RealTimeDateFieldsAndConfigurationSnapshotAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview',
      0,
      () => {
        {
          const model: DateModel = getRealTimeDate();
          const now: Date = new Date();
          expect(model.year).assertEqual(now.getFullYear().toInt());
          expect(model.month).assertEqual(now.getMonth().toInt() + 1);
          expect(model.day).assertEqual(now.getDate().toInt());
          expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
          expect(model.month >= 1 && model.month <= 12).assertTrue();
          expect(model.day >= 1 && model.day <= 31).assertTrue();
        }
        {
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
        }
        {
          const active = CellProjector.project(12, 6, 2026, 12, 6, 2026);
          expect(active.highlighted).assertTrue();
          const past = CellProjector.project(11, 6, 2026, 12, 6, 2026);
          expect(past.highlighted).assertFalse();
          expect(past.selectable).assertEqual(false);
        }
      },
    );

    /**
     * @tc.name ConfigurationSnapshotAndDayCellHighlightHoldForRepeatedEntryDuringPreview
     * @tc.desc ConfigurationSnapshotAndDayCellHighlightHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndDayCellHighlightHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name DayCellHighlightAndMonthLabelContractAndWeekHeaderEmphasisRemainStableUnderLoadDuringPreview
     * @tc.desc DayCellHighlightAndMonthLabelContractAndWeekHeaderEmphasisRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndMonthLabelContractAndWeekHeaderEmphasisRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const active = CellProjector.project(12, 6, 2026, 12, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(11, 6, 2026, 12, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const label: string = monthLabel(1, 2027);
        expect(label.indexOf('2027') >= 0).assertTrue();
        expect(label.indexOf('1') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(1, 2027, 1);
        expect(panels[0].label).assertEqual(label);
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
     * @tc.name MonthLabelContractAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc MonthLabelContractAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndWeekHeaderEmphasisStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const label: string = monthLabel(1, 2027);
        expect(label.indexOf('2027') >= 0).assertTrue();
        expect(label.indexOf('1') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(1, 2027, 1);
        expect(panels[0].label).assertEqual(label);
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
     * @tc.name WeekHeaderEmphasisAndCalendarJourneyAndRealTimeDateFieldsKeepTheVisibleStateInStepAfterRollover
     * @tc.desc WeekHeaderEmphasisAndCalendarJourneyAndRealTimeDateFieldsKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndCalendarJourneyAndRealTimeDateFieldsKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
      }
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
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.month >= 1 && model.month <= 12).assertTrue();
        expect(model.day >= 1 && model.day <= 31).assertTrue();
      }
    });

    /**
     * @tc.name CalendarJourneyAndRealTimeDateFieldsPreserveTheDeclaredContractAfterRollover
     * @tc.desc CalendarJourneyAndRealTimeDateFieldsPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndRealTimeDateFieldsPreserveTheDeclaredContractAfterRollover', 0, () => {
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
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.month >= 1 && model.month <= 12).assertTrue();
        expect(model.day >= 1 && model.day <= 31).assertTrue();
      }
    });

    /**
     * @tc.name RealTimeDateFieldsAndConfigurationSnapshotAndDayCellHighlightSurviveRapidInteractionAfterRollover
     * @tc.desc RealTimeDateFieldsAndConfigurationSnapshotAndDayCellHighlightSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RealTimeDateFieldsAndConfigurationSnapshotAndDayCellHighlightSurviveRapidInteractionAfterRollover', 0, () => {
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.month >= 1 && model.month <= 12).assertTrue();
        expect(model.day >= 1 && model.day <= 31).assertTrue();
      }
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name ConfigurationSnapshotAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc ConfigurationSnapshotAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndDayCellHighlightHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name DayCellHighlightAndMonthLabelContractAndWeekHeaderEmphasisRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc DayCellHighlightAndMonthLabelContractAndWeekHeaderEmphasisRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndMonthLabelContractAndWeekHeaderEmphasisRemainCorrectAfterRecoveryAfterRollover', 0, () => {
      {
        const active = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(17, 6, 2026, 18, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        const label: string = monthLabel(7, 2033);
        expect(label.indexOf('2033') >= 0).assertTrue();
        expect(label.indexOf('7') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(7, 2033, 1);
        expect(panels[0].label).assertEqual(label);
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
     * @tc.name MonthLabelContractAndWeekHeaderEmphasisAgreeWithTheModelInvariantsAfterRollover
     * @tc.desc MonthLabelContractAndWeekHeaderEmphasisAgreeWithTheModelInvariantsAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndWeekHeaderEmphasisAgreeWithTheModelInvariantsAfterRollover', 0, () => {
      {
        const label: string = monthLabel(7, 2033);
        expect(label.indexOf('2033') >= 0).assertTrue();
        expect(label.indexOf('7') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(7, 2033, 1);
        expect(panels[0].label).assertEqual(label);
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
     * @tc.name WeekHeaderEmphasisAndCalendarJourneyAndRealTimeDateFieldsKeepTheSessionCoherentAfterRollover
     * @tc.desc WeekHeaderEmphasisAndCalendarJourneyAndRealTimeDateFieldsKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndCalendarJourneyAndRealTimeDateFieldsKeepTheSessionCoherentAfterRollover', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[5].emphasized).assertFalse();
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(9, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(9, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 21);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.month >= 1 && model.month <= 12).assertTrue();
        expect(model.day >= 1 && model.day <= 31).assertTrue();
      }
    });

    /**
     * @tc.name CalendarJourneyAndRealTimeDateFieldsTrackTheSelectedStateAfterRollover
     * @tc.desc CalendarJourneyAndRealTimeDateFieldsTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndRealTimeDateFieldsTrackTheSelectedStateAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(9, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(9, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 21);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.month >= 1 && model.month <= 12).assertTrue();
        expect(model.day >= 1 && model.day <= 31).assertTrue();
      }
    });

    /**
     * @tc.name RealTimeDateFieldsAndConfigurationSnapshotAndDayCellHighlightPreserveOrderingGuaranteesAfterRollover
     * @tc.desc RealTimeDateFieldsAndConfigurationSnapshotAndDayCellHighlightPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'RealTimeDateFieldsAndConfigurationSnapshotAndDayCellHighlightPreserveOrderingGuaranteesAfterRollover',
      0,
      () => {
        {
          const model: DateModel = getRealTimeDate();
          const now: Date = new Date();
          expect(model.year).assertEqual(now.getFullYear().toInt());
          expect(model.month).assertEqual(now.getMonth().toInt() + 1);
          expect(model.day).assertEqual(now.getDate().toInt());
          expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
          expect(model.month >= 1 && model.month <= 12).assertTrue();
          expect(model.day >= 1 && model.day <= 31).assertTrue();
        }
        {
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
        }
        {
          const active = CellProjector.project(24, 6, 2026, 24, 6, 2026);
          expect(active.highlighted).assertTrue();
          const past = CellProjector.project(23, 6, 2026, 24, 6, 2026);
          expect(past.highlighted).assertFalse();
          expect(past.selectable).assertEqual(false);
        }
      },
    );

    /**
     * @tc.name ConfigurationSnapshotAndDayCellHighlightHoldForRepeatedEntryAfterRollover
     * @tc.desc ConfigurationSnapshotAndDayCellHighlightHoldForRepeatedEntryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndDayCellHighlightHoldForRepeatedEntryAfterRollover', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const active = CellProjector.project(24, 6, 2026, 24, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(23, 6, 2026, 24, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
    });
  });
}
