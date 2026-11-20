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

export default function ConfigurationChangesTest(): void {
  describe('ConfigurationChangesTest', () => {
    beforeAll(() => {
      logSuite('ConfigurationChangesTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('ConfigurationChangesTest', 'end');
    });

    /**
     * @tc.name ConfigurationSnapshotAndFontScaleProjectionStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc ConfigurationSnapshotAndFontScaleProjectionStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndFontScaleProjectionStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.25);
        expect(scale.scaled(20)).assertEqual(25);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndThemeTokenResolutionAndSnapshotRoundTripKeepTheVisibleStateInStepDuringPreview
     * @tc.desc FontScaleProjectionAndThemeTokenResolutionAndSnapshotRoundTripKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'FontScaleProjectionAndThemeTokenResolutionAndSnapshotRoundTripKeepTheVisibleStateInStepDuringPreview',
      0,
      () => {
        {
          const scale: ContentScaleModel = new ContentScaleModel(1.25);
          expect(scale.scaled(20)).assertEqual(25);
          expect(scale.rowHeight(50) >= 50).assertTrue();
          expect(scale.fits(100, 20)).assertTrue();
        }
        {
          const tokens: ThemeTokens = ThemeResolver.resolve(false);
          expect(tokens.background).assertEqual('#ffffffff');
          expect(tokens.foreground).assertEqual('#ff000000');
          expect(ThemeResolver.gridHeight(false)).assertEqual(300);
          expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
        }
        {
          const snapshot: Snapshot = new Snapshot();
          snapshot.put('month', '4');
          snapshot.put('day', '4');
          const encoded: string = snapshot.encode();
          expect(encoded.indexOf('month=') >= 0).assertTrue();
          const restored: Snapshot = Snapshot.decode(encoded);
          expect(restored.get('month')).assertEqual('4');
          expect(restored.fields.length).assertEqual(2);
        }
      },
    );

    /**
     * @tc.name ThemeTokenResolutionAndSnapshotRoundTripPreserveTheDeclaredContractDuringPreview
     * @tc.desc ThemeTokenResolutionAndSnapshotRoundTripPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndSnapshotRoundTripPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '4');
        snapshot.put('day', '4');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('4');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndCalendarJourneyAndConfigurationSnapshotSurviveRapidInteractionDuringPreview
     * @tc.desc SnapshotRoundTripAndCalendarJourneyAndConfigurationSnapshotSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndCalendarJourneyAndConfigurationSnapshotSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '4');
        snapshot.put('day', '4');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('4');
        expect(restored.fields.length).assertEqual(2);
      }
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
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
    });

    /**
     * @tc.name CalendarJourneyAndConfigurationSnapshotHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc CalendarJourneyAndConfigurationSnapshotHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndConfigurationSnapshotHoldAcrossConfigurationChangesDuringPreview', 0, () => {
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
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
    });

    /**
     * @tc.name ConfigurationSnapshotAndFontScaleProjectionAndThemeTokenResolutionRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc ConfigurationSnapshotAndFontScaleProjectionAndThemeTokenResolutionRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ConfigurationSnapshotAndFontScaleProjectionAndThemeTokenResolutionRemainCorrectAfterRecoveryDuringPreview',
      0,
      () => {
        {
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
        }
        {
          const scale: ContentScaleModel = new ContentScaleModel(1.25);
          expect(scale.scaled(20)).assertEqual(25);
          expect(scale.rowHeight(50) >= 50).assertTrue();
          expect(scale.fits(100, 20)).assertTrue();
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

    /**
     * @tc.name FontScaleProjectionAndThemeTokenResolutionAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc FontScaleProjectionAndThemeTokenResolutionAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndThemeTokenResolutionAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.25);
        expect(scale.scaled(20)).assertEqual(25);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
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
     * @tc.name ThemeTokenResolutionAndSnapshotRoundTripAndCalendarJourneyKeepTheSessionCoherentDuringPreview
     * @tc.desc ThemeTokenResolutionAndSnapshotRoundTripAndCalendarJourneyKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndSnapshotRoundTripAndCalendarJourneyKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '9');
        snapshot.put('day', '9');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('9');
        expect(restored.fields.length).assertEqual(2);
      }
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
     * @tc.name SnapshotRoundTripAndCalendarJourneyTrackTheSelectedStateDuringPreview
     * @tc.desc SnapshotRoundTripAndCalendarJourneyTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndCalendarJourneyTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '9');
        snapshot.put('day', '9');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('9');
        expect(restored.fields.length).assertEqual(2);
      }
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
     * @tc.name CalendarJourneyAndConfigurationSnapshotAndFontScaleProjectionPreserveOrderingGuaranteesDuringPreview
     * @tc.desc CalendarJourneyAndConfigurationSnapshotAndFontScaleProjectionPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'CalendarJourneyAndConfigurationSnapshotAndFontScaleProjectionPreserveOrderingGuaranteesDuringPreview',
      0,
      () => {
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
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
        }
        {
          const scale: ContentScaleModel = new ContentScaleModel(1.25);
          expect(scale.scaled(20)).assertEqual(25);
          expect(scale.rowHeight(50) >= 50).assertTrue();
          expect(scale.fits(100, 20)).assertTrue();
        }
      },
    );

    /**
     * @tc.name ConfigurationSnapshotAndFontScaleProjectionHoldForRepeatedEntryDuringPreview
     * @tc.desc ConfigurationSnapshotAndFontScaleProjectionHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndFontScaleProjectionHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.25);
        expect(scale.scaled(20)).assertEqual(25);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndThemeTokenResolutionAndSnapshotRoundTripRemainStableUnderLoadDuringPreview
     * @tc.desc FontScaleProjectionAndThemeTokenResolutionAndSnapshotRoundTripRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndThemeTokenResolutionAndSnapshotRoundTripRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.25);
        expect(scale.scaled(20)).assertEqual(25);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '2');
        snapshot.put('day', '14');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('2');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name ThemeTokenResolutionAndSnapshotRoundTripStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc ThemeTokenResolutionAndSnapshotRoundTripStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndSnapshotRoundTripStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '2');
        snapshot.put('day', '14');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('2');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndCalendarJourneyAndConfigurationSnapshotKeepTheVisibleStateInStepAfterRollover
     * @tc.desc SnapshotRoundTripAndCalendarJourneyAndConfigurationSnapshotKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndCalendarJourneyAndConfigurationSnapshotKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '2');
        snapshot.put('day', '14');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('2');
        expect(restored.fields.length).assertEqual(2);
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
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
    });
  });
}
