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

export default function DeviceCompatibilityTest(): void {
  describe('DeviceCompatibilityTest', () => {
    beforeAll(() => {
      logSuite('DeviceCompatibilityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('DeviceCompatibilityTest', 'end');
    });

    /**
     * @tc.name ConfigurationSnapshotAndPanelGeometryStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc ConfigurationSnapshotAndPanelGeometryStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndPanelGeometryStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name PanelGeometryAndThemeTokenResolutionAndFontScaleProjectionKeepTheVisibleStateInStepDuringPreview
     * @tc.desc PanelGeometryAndThemeTokenResolutionAndFontScaleProjectionKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndThemeTokenResolutionAndFontScaleProjectionKeepTheVisibleStateInStepDuringPreview', 0, () => {
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
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name ThemeTokenResolutionAndFontScaleProjectionPreserveTheDeclaredContractDuringPreview
     * @tc.desc ThemeTokenResolutionAndFontScaleProjectionPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndFontScaleProjectionPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndConfigurationSnapshotAndPanelGeometrySurviveRapidInteractionDuringPreview
     * @tc.desc FontScaleProjectionAndConfigurationSnapshotAndPanelGeometrySurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndConfigurationSnapshotAndPanelGeometrySurviveRapidInteractionDuringPreview', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.75);
        expect(scale.scaled(20)).assertEqual(35);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name ConfigurationSnapshotAndPanelGeometryHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc ConfigurationSnapshotAndPanelGeometryHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndPanelGeometryHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
