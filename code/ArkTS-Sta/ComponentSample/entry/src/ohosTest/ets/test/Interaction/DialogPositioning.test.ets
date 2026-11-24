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

export default function DialogPositioningTest(): void {
  describe('DialogPositioningTest', () => {
    beforeAll(() => {
      logSuite('DialogPositioningTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('DialogPositioningTest', 'end');
    });

    /**
     * @tc.name PanelGeometryAndPanelStateMachineStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc PanelGeometryAndPanelStateMachineStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelGeometryAndPanelStateMachineStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name PanelStateMachineAndThemeTokenResolutionAndDayCellHighlightKeepTheVisibleStateInStepDuringPreview
     * @tc.desc PanelStateMachineAndThemeTokenResolutionAndDayCellHighlightKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndThemeTokenResolutionAndDayCellHighlightKeepTheVisibleStateInStepDuringPreview', 0, () => {
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
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name ThemeTokenResolutionAndDayCellHighlightPreserveTheDeclaredContractDuringPreview
     * @tc.desc ThemeTokenResolutionAndDayCellHighlightPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndDayCellHighlightPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name DayCellHighlightAndPanelGeometryAndPanelStateMachineSurviveRapidInteractionDuringPreview
     * @tc.desc DayCellHighlightAndPanelGeometryAndPanelStateMachineSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndPanelGeometryAndPanelStateMachineSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const active = CellProjector.project(4, 6, 2026, 4, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(3, 6, 2026, 4, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name PanelStateMachineAndThemeTokenResolutionAndDayCellHighlightRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc PanelStateMachineAndThemeTokenResolutionAndDayCellHighlightRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndThemeTokenResolutionAndDayCellHighlightRemainCorrectAfterRecoveryDuringPreview', 0, () => {
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
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name ThemeTokenResolutionAndDayCellHighlightAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc ThemeTokenResolutionAndDayCellHighlightAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndDayCellHighlightAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name DayCellHighlightAndPanelGeometryAndPanelStateMachineKeepTheSessionCoherentDuringPreview
     * @tc.desc DayCellHighlightAndPanelGeometryAndPanelStateMachineKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndPanelGeometryAndPanelStateMachineKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const active = CellProjector.project(8, 6, 2026, 8, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(7, 6, 2026, 8, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name PanelStateMachineAndThemeTokenResolutionAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview
     * @tc.desc PanelStateMachineAndThemeTokenResolutionAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndThemeTokenResolutionAndDayCellHighlightPreserveOrderingGuaranteesDuringPreview', 0, () => {
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
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name ThemeTokenResolutionAndDayCellHighlightHoldForRepeatedEntryDuringPreview
     * @tc.desc ThemeTokenResolutionAndDayCellHighlightHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ThemeTokenResolutionAndDayCellHighlightHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
     * @tc.name DayCellHighlightAndPanelGeometryAndPanelStateMachineRemainStableUnderLoadDuringPreview
     * @tc.desc DayCellHighlightAndPanelGeometryAndPanelStateMachineRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DayCellHighlightAndPanelGeometryAndPanelStateMachineRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const active = CellProjector.project(12, 6, 2026, 12, 6, 2026);
        expect(active.highlighted).assertTrue();
        const past = CellProjector.project(11, 6, 2026, 12, 6, 2026);
        expect(past.highlighted).assertFalse();
        expect(past.selectable).assertEqual(false);
      }
      {
        expect(ThemeResolver.gridHeight(true)).assertEqual(360);
        expect(ThemeResolver.margin(true)).assertEqual(24);
        const panels = PanelBuilder.build(9, 2023, 2);
        expect(panels.length).assertEqual(2);
        expect(panels[1].num).assertEqual(10);
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
     * @tc.name PanelStateMachineAndThemeTokenResolutionAndDayCellHighlightKeepTheVisibleStateInStepAfterRollover
     * @tc.desc PanelStateMachineAndThemeTokenResolutionAndDayCellHighlightKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndThemeTokenResolutionAndDayCellHighlightKeepTheVisibleStateInStepAfterRollover', 0, () => {
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
        const tokens: ThemeTokens = ThemeResolver.resolve(false);
        expect(tokens.background).assertEqual('#ffffffff');
        expect(tokens.foreground).assertEqual('#ff000000');
        expect(ThemeResolver.gridHeight(false)).assertEqual(300);
        expect(ThemeResolver.dayColor(0, false, false).length > 0).assertTrue();
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
