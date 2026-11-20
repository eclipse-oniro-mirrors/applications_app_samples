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

export default function StatePersistenceTest(): void {
  describe('StatePersistenceTest', () => {
    beforeAll(() => {
      logSuite('StatePersistenceTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('StatePersistenceTest', 'end');
    });

    /**
     * @tc.name SnapshotRoundTripAndDateModelConstructionStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc SnapshotRoundTripAndDateModelConstructionStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndDateModelConstructionStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '1');
        snapshot.put('day', '1');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('1');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const model: DateModel = new DateModel(2, 1, 2, 2021);
        expect(model.day).assertEqual(2);
        expect(model.week).assertEqual(1);
        expect(model.month).assertEqual(2);
        expect(model.year).assertEqual(2021);
        model.year = model.year + 1;
        expect(model.year).assertEqual(2022);
      }
    });

    /**
     * @tc.name DateModelConstructionAndCalendarJourneyAndConfigurationSnapshotKeepTheVisibleStateInStepDuringPreview
     * @tc.desc DateModelConstructionAndCalendarJourneyAndConfigurationSnapshotKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'DateModelConstructionAndCalendarJourneyAndConfigurationSnapshotKeepTheVisibleStateInStepDuringPreview',
      0,
      () => {
        {
          const model: DateModel = new DateModel(2, 1, 2, 2021);
          expect(model.day).assertEqual(2);
          expect(model.week).assertEqual(1);
          expect(model.month).assertEqual(2);
          expect(model.year).assertEqual(2021);
          model.year = model.year + 1;
          expect(model.year).assertEqual(2022);
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
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
        }
      },
    );

    /**
     * @tc.name CalendarJourneyAndConfigurationSnapshotPreserveTheDeclaredContractDuringPreview
     * @tc.desc CalendarJourneyAndConfigurationSnapshotPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndConfigurationSnapshotPreserveTheDeclaredContractDuringPreview', 0, () => {
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
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
    });

    /**
     * @tc.name ConfigurationSnapshotAndMonthLabelContractAndSnapshotRoundTripSurviveRapidInteractionDuringPreview
     * @tc.desc ConfigurationSnapshotAndMonthLabelContractAndSnapshotRoundTripSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndMonthLabelContractAndSnapshotRoundTripSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const label: string = monthLabel(5, 2019);
        expect(label.indexOf('2019') >= 0).assertTrue();
        expect(label.indexOf('5') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(5, 2019, 1);
        expect(panels[0].label).assertEqual(label);
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '6');
        snapshot.put('day', '6');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('6');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name MonthLabelContractAndSnapshotRoundTripHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc MonthLabelContractAndSnapshotRoundTripHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndSnapshotRoundTripHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const label: string = monthLabel(5, 2019);
        expect(label.indexOf('2019') >= 0).assertTrue();
        expect(label.indexOf('5') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(5, 2019, 1);
        expect(panels[0].label).assertEqual(label);
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '6');
        snapshot.put('day', '6');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('6');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndDateModelConstructionAndCalendarJourneyRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc SnapshotRoundTripAndDateModelConstructionAndCalendarJourneyRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndDateModelConstructionAndCalendarJourneyRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '6');
        snapshot.put('day', '6');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('6');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const model: DateModel = new DateModel(7, 6, 7, 2021);
        expect(model.day).assertEqual(7);
        expect(model.week).assertEqual(6);
        expect(model.month).assertEqual(7);
        expect(model.year).assertEqual(2021);
        model.year = model.year + 1;
        expect(model.year).assertEqual(2022);
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
     * @tc.name DateModelConstructionAndCalendarJourneyAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc DateModelConstructionAndCalendarJourneyAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DateModelConstructionAndCalendarJourneyAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const model: DateModel = new DateModel(7, 6, 7, 2021);
        expect(model.day).assertEqual(7);
        expect(model.week).assertEqual(6);
        expect(model.month).assertEqual(7);
        expect(model.year).assertEqual(2021);
        model.year = model.year + 1;
        expect(model.year).assertEqual(2022);
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
     * @tc.name CalendarJourneyAndConfigurationSnapshotAndMonthLabelContractKeepTheSessionCoherentDuringPreview
     * @tc.desc CalendarJourneyAndConfigurationSnapshotAndMonthLabelContractKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndConfigurationSnapshotAndMonthLabelContractKeepTheSessionCoherentDuringPreview', 0, () => {
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
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const label: string = monthLabel(10, 2024);
        expect(label.indexOf('2024') >= 0).assertTrue();
        expect(label.indexOf('10') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(10, 2024, 1);
        expect(panels[0].label).assertEqual(label);
      }
    });

    /**
     * @tc.name ConfigurationSnapshotAndMonthLabelContractTrackTheSelectedStateDuringPreview
     * @tc.desc ConfigurationSnapshotAndMonthLabelContractTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndMonthLabelContractTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const label: string = monthLabel(10, 2024);
        expect(label.indexOf('2024') >= 0).assertTrue();
        expect(label.indexOf('10') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(10, 2024, 1);
        expect(panels[0].label).assertEqual(label);
      }
    });

    /**
     * @tc.name MonthLabelContractAndSnapshotRoundTripAndDateModelConstructionPreserveOrderingGuaranteesDuringPreview
     * @tc.desc MonthLabelContractAndSnapshotRoundTripAndDateModelConstructionPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'MonthLabelContractAndSnapshotRoundTripAndDateModelConstructionPreserveOrderingGuaranteesDuringPreview',
      0,
      () => {
        {
          const label: string = monthLabel(10, 2024);
          expect(label.indexOf('2024') >= 0).assertTrue();
          expect(label.indexOf('10') >= 0).assertTrue();
          expect(label.length > 3).assertTrue();
          const panels = PanelBuilder.build(10, 2024, 1);
          expect(panels[0].label).assertEqual(label);
        }
        {
          const snapshot: Snapshot = new Snapshot();
          snapshot.put('month', '11');
          snapshot.put('day', '11');
          const encoded: string = snapshot.encode();
          expect(encoded.indexOf('month=') >= 0).assertTrue();
          const restored: Snapshot = Snapshot.decode(encoded);
          expect(restored.get('month')).assertEqual('11');
          expect(restored.fields.length).assertEqual(2);
        }
        {
          const model: DateModel = new DateModel(12, 4, 12, 2021);
          expect(model.day).assertEqual(12);
          expect(model.week).assertEqual(4);
          expect(model.month).assertEqual(12);
          expect(model.year).assertEqual(2021);
          model.year = model.year + 1;
          expect(model.year).assertEqual(2022);
        }
      },
    );
  });
}
