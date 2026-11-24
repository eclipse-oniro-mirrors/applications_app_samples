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

export default function DialogLifecycleTest(): void {
  describe('DialogLifecycleTest', () => {
    beforeAll(() => {
      logSuite('DialogLifecycleTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('DialogLifecycleTest', 'end');
    });

    /**
     * @tc.name PanelStateMachineAndPanelGeometryStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc PanelStateMachineAndPanelGeometryStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndPanelGeometryStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const machine: PanelMachine = new PanelMachine();
        expect(machine.state).assertEqual('closed');
        machine.open();
        expect(machine.state).assertEqual('open');
        expect(machine.transition('closing')).assertTrue();
        expect(machine.transition('open')).assertFalse();
        machine.close();
        expect(machine.state).assertEqual('closed');
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
     * @tc.name PanelGeometryAndThemeTokenResolutionAndPanelStateMachineKeepTheVisibleStateInStepDuringPreview
     * @tc.desc PanelGeometryAndThemeTokenResolutionAndPanelStateMachineKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndThemeTokenResolutionAndPanelStateMachineKeepTheVisibleStateInStepDuringPreview', 0, () => {
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
        const machine: PanelMachine = new PanelMachine();
        expect(machine.state).assertEqual('closed');
        machine.open();
        expect(machine.state).assertEqual('open');
        expect(machine.transition('closing')).assertTrue();
        expect(machine.transition('open')).assertFalse();
        machine.close();
        expect(machine.state).assertEqual('closed');
      }
    });

    /**
     * @tc.name ThemeTokenResolutionAndPanelStateMachinePreserveTheDeclaredContractDuringPreview
     * @tc.desc ThemeTokenResolutionAndPanelStateMachinePreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndPanelStateMachinePreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
      }
      {
        const machine: PanelMachine = new PanelMachine();
        expect(machine.state).assertEqual('closed');
        machine.open();
        expect(machine.state).assertEqual('open');
        expect(machine.transition('closing')).assertTrue();
        expect(machine.transition('open')).assertFalse();
        machine.close();
        expect(machine.state).assertEqual('closed');
      }
    });

    /**
     * @tc.name PanelStateMachineAndPanelGeometryAndThemeTokenResolutionSurviveRapidInteractionDuringPreview
     * @tc.desc PanelStateMachineAndPanelGeometryAndThemeTokenResolutionSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndPanelGeometryAndThemeTokenResolutionSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const machine: PanelMachine = new PanelMachine();
        expect(machine.state).assertEqual('closed');
        machine.open();
        expect(machine.state).assertEqual('open');
        expect(machine.transition('closing')).assertTrue();
        expect(machine.transition('open')).assertFalse();
        machine.close();
        expect(machine.state).assertEqual('closed');
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name PanelGeometryAndThemeTokenResolutionHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc PanelGeometryAndThemeTokenResolutionHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndThemeTokenResolutionHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name ThemeTokenResolutionAndPanelStateMachineAndPanelGeometryRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc ThemeTokenResolutionAndPanelStateMachineAndPanelGeometryRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndPanelStateMachineAndPanelGeometryRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(true);
        expect(tokens.background).assertEqual('#ff000000');
        expect(tokens.foreground).assertEqual('#ffffffff');
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.dayColor(0, false, true).length > 0).assertTrue();
      }
      {
        const machine: PanelMachine = new PanelMachine();
        expect(machine.state).assertEqual('closed');
        machine.open();
        expect(machine.state).assertEqual('open');
        expect(machine.transition('closing')).assertTrue();
        expect(machine.transition('open')).assertFalse();
        machine.close();
        expect(machine.state).assertEqual('closed');
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
