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

export default function SystemIntegrationTest(): void {
  describe('SystemIntegrationTest', () => {
    beforeAll(() => {
      logSuite('SystemIntegrationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('SystemIntegrationTest', 'end');
    });

    /**
     * @tc.name ConfigurationSnapshotAndOfflineQueueDrainAndCalendarJourneyKeepTheVisibleStateInStepDuringPreview
     * @tc.desc ConfigurationSnapshotAndOfflineQueueDrainAndCalendarJourneyKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndOfflineQueueDrainAndCalendarJourneyKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 4; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(4);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(4);
        expect(queue.size()).assertEqual(0);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(4, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(4, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 4);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name OfflineQueueDrainAndCalendarJourneyPreserveTheDeclaredContractDuringPreview
     * @tc.desc OfflineQueueDrainAndCalendarJourneyPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndCalendarJourneyPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 4; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(4);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(4);
        expect(queue.size()).assertEqual(0);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(4, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(4, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 4);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndResourcePoolBudgetAndSessionTransitionsSurviveRapidInteractionDuringPreview
     * @tc.desc CalendarJourneyAndResourcePoolBudgetAndSessionTransitionsSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndResourcePoolBudgetAndSessionTransitionsSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(4, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(4, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 4);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const pool: ResourcePool = new ResourcePool(3);
        for (let index = 0; index < 3; index++) {
          expect(pool.acquire()).assertTrue();
        }
        expect(pool.acquire()).assertFalse();
        expect(pool.highWater).assertEqual(3);
        pool.release(3);
        expect(pool.leaked()).assertEqual(0);
      }
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
      }
    });

    /**
     * @tc.name ResourcePoolBudgetAndSessionTransitionsHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc ResourcePoolBudgetAndSessionTransitionsHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ResourcePoolBudgetAndSessionTransitionsHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const pool: ResourcePool = new ResourcePool(3);
        for (let index = 0; index < 3; index++) {
          expect(pool.acquire()).assertTrue();
        }
        expect(pool.acquire()).assertFalse();
        expect(pool.highWater).assertEqual(3);
        pool.release(3);
        expect(pool.leaked()).assertEqual(0);
      }
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
      }
    });

    /**
     * @tc.name SessionTransitionsAndConfigurationSnapshotAndOfflineQueueDrainRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc SessionTransitionsAndConfigurationSnapshotAndOfflineQueueDrainRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'SessionTransitionsAndConfigurationSnapshotAndOfflineQueueDrainRemainCorrectAfterRecoveryDuringPreview',
      0,
      () => {
        {
          const session: SessionStore = new SessionStore();
          expect(session.move('destroyed')).assertTrue();
          expect(session.move('foreground')).assertFalse();
          expect(session.rank()).assertEqual(3);
          expect(SessionStore.canMove('background', 'foreground')).assertTrue();
        }
        {
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
        }
        {
          const queue: OfflineQueue = new OfflineQueue();
          for (let index = 0; index < 4; index++) {
            queue.enqueue('action-' + index.toString());
          }
          expect(queue.size()).assertEqual(4);
          expect(queue.drain(false).length).assertEqual(0);
          expect(queue.drain(true).length).assertEqual(4);
          expect(queue.size()).assertEqual(0);
        }
      },
    );

    /**
     * @tc.name ConfigurationSnapshotAndOfflineQueueDrainAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc ConfigurationSnapshotAndOfflineQueueDrainAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndOfflineQueueDrainAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 4; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(4);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(4);
        expect(queue.size()).assertEqual(0);
      }
    });

    /**
     * @tc.name OfflineQueueDrainAndCalendarJourneyAndResourcePoolBudgetKeepTheSessionCoherentDuringPreview
     * @tc.desc OfflineQueueDrainAndCalendarJourneyAndResourcePoolBudgetKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndCalendarJourneyAndResourcePoolBudgetKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 4; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(4);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(4);
        expect(queue.size()).assertEqual(0);
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
        const pool: ResourcePool = new ResourcePool(4);
        for (let index = 0; index < 4; index++) {
          expect(pool.acquire()).assertTrue();
        }
        expect(pool.acquire()).assertFalse();
        expect(pool.highWater).assertEqual(4);
        pool.release(4);
        expect(pool.leaked()).assertEqual(0);
      }
    });

    /**
     * @tc.name CalendarJourneyAndResourcePoolBudgetTrackTheSelectedStateDuringPreview
     * @tc.desc CalendarJourneyAndResourcePoolBudgetTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndResourcePoolBudgetTrackTheSelectedStateDuringPreview', 0, () => {
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
        const pool: ResourcePool = new ResourcePool(4);
        for (let index = 0; index < 4; index++) {
          expect(pool.acquire()).assertTrue();
        }
        expect(pool.acquire()).assertFalse();
        expect(pool.highWater).assertEqual(4);
        pool.release(4);
        expect(pool.leaked()).assertEqual(0);
      }
    });

    /**
     * @tc.name ResourcePoolBudgetAndSessionTransitionsAndConfigurationSnapshotPreserveOrderingGuaranteesDuringPreview
     * @tc.desc ResourcePoolBudgetAndSessionTransitionsAndConfigurationSnapshotPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ResourcePoolBudgetAndSessionTransitionsAndConfigurationSnapshotPreserveOrderingGuaranteesDuringPreview',
      0,
      () => {
        {
          const pool: ResourcePool = new ResourcePool(4);
          for (let index = 0; index < 4; index++) {
            expect(pool.acquire()).assertTrue();
          }
          expect(pool.acquire()).assertFalse();
          expect(pool.highWater).assertEqual(4);
          pool.release(4);
          expect(pool.leaked()).assertEqual(0);
        }
        {
          const session: SessionStore = new SessionStore();
          expect(session.move('foreground')).assertTrue();
          expect(session.move('background')).assertTrue();
          expect(session.move('foreground')).assertTrue();
          expect(session.move('created')).assertFalse();
          expect(session.move('destroyed')).assertTrue();
          expect(session.rank()).assertEqual(3);
        }
        {
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
        }
      },
    );

    /**
     * @tc.name ConfigurationSnapshotAndOfflineQueueDrainAndCalendarJourneyRemainStableUnderLoadDuringPreview
     * @tc.desc ConfigurationSnapshotAndOfflineQueueDrainAndCalendarJourneyRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndOfflineQueueDrainAndCalendarJourneyRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 4; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(4);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(4);
        expect(queue.size()).assertEqual(0);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(2, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(2, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 14);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name OfflineQueueDrainAndCalendarJourneyStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc OfflineQueueDrainAndCalendarJourneyStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndCalendarJourneyStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 4; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(4);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(4);
        expect(queue.size()).assertEqual(0);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(2, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(2, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 14);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndResourcePoolBudgetAndSessionTransitionsKeepTheVisibleStateInStepAfterRollover
     * @tc.desc CalendarJourneyAndResourcePoolBudgetAndSessionTransitionsKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndResourcePoolBudgetAndSessionTransitionsKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(2, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(2, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 14);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const pool: ResourcePool = new ResourcePool(5);
        for (let index = 0; index < 5; index++) {
          expect(pool.acquire()).assertTrue();
        }
        expect(pool.acquire()).assertFalse();
        expect(pool.highWater).assertEqual(5);
        pool.release(5);
        expect(pool.leaked()).assertEqual(0);
      }
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
      }
    });
  });
}
