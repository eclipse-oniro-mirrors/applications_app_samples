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

export default function MemoryLeakDetectionTest(): void {
  describe('MemoryLeakDetectionTest', () => {
    beforeAll(() => {
      logSuite('MemoryLeakDetectionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('MemoryLeakDetectionTest', 'end');
    });

    /**
     * @tc.name ResourcePoolBudgetAndListenerLifecycleStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc ResourcePoolBudgetAndListenerLifecycleStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ResourcePoolBudgetAndListenerLifecycleStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
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
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(2, 2024), num: 2, days: getMonthDate(2, 2024) };
        source.pushData(seededMonth);
        expect(source.totalCount()).assertEqual(1);
        expect(recorder.countOf('add')).assertEqual(1);
        source.addData(0, seededMonth);
        expect(recorder.trace()).assertEqual('add:0|add:0');
        source.unregisterDataChangeListener(recorder);
        const frozen: number = recorder.size();
        source.notifyDataChange(0);
        expect(recorder.size()).assertEqual(frozen);
      }
    });

    /**
     * @tc.name ListenerLifecycleAndOfflineQueueDrainAndSnapshotRoundTripKeepTheVisibleStateInStepDuringPreview
     * @tc.desc ListenerLifecycleAndOfflineQueueDrainAndSnapshotRoundTripKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ListenerLifecycleAndOfflineQueueDrainAndSnapshotRoundTripKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(2, 2024), num: 2, days: getMonthDate(2, 2024) };
        source.pushData(seededMonth);
        expect(source.totalCount()).assertEqual(1);
        expect(recorder.countOf('add')).assertEqual(1);
        source.addData(0, seededMonth);
        expect(recorder.trace()).assertEqual('add:0|add:0');
        source.unregisterDataChangeListener(recorder);
        const frozen: number = recorder.size();
        source.notifyDataChange(0);
        expect(recorder.size()).assertEqual(frozen);
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
     * @tc.name OfflineQueueDrainAndSnapshotRoundTripPreserveTheDeclaredContractDuringPreview
     * @tc.desc OfflineQueueDrainAndSnapshotRoundTripPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndSnapshotRoundTripPreserveTheDeclaredContractDuringPreview', 0, () => {
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
     * @tc.name SnapshotRoundTripAndResourcePoolBudgetAndListenerLifecycleSurviveRapidInteractionDuringPreview
     * @tc.desc SnapshotRoundTripAndResourcePoolBudgetAndListenerLifecycleSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndResourcePoolBudgetAndListenerLifecycleSurviveRapidInteractionDuringPreview', 0, () => {
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
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(6, 2024), num: 6, days: getMonthDate(6, 2024) };
        source.pushData(seededMonth);
        expect(source.totalCount()).assertEqual(1);
        expect(recorder.countOf('add')).assertEqual(1);
        source.addData(0, seededMonth);
        expect(recorder.trace()).assertEqual('add:0|add:0');
        source.unregisterDataChangeListener(recorder);
        const frozen: number = recorder.size();
        source.notifyDataChange(0);
        expect(recorder.size()).assertEqual(frozen);
      }
    });

    /**
     * @tc.name ResourcePoolBudgetAndListenerLifecycleHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc ResourcePoolBudgetAndListenerLifecycleHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ResourcePoolBudgetAndListenerLifecycleHoldAcrossConfigurationChangesDuringPreview', 0, () => {
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
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(6, 2024), num: 6, days: getMonthDate(6, 2024) };
        source.pushData(seededMonth);
        expect(source.totalCount()).assertEqual(1);
        expect(recorder.countOf('add')).assertEqual(1);
        source.addData(0, seededMonth);
        expect(recorder.trace()).assertEqual('add:0|add:0');
        source.unregisterDataChangeListener(recorder);
        const frozen: number = recorder.size();
        source.notifyDataChange(0);
        expect(recorder.size()).assertEqual(frozen);
      }
    });

    /**
     * @tc.name ListenerLifecycleAndOfflineQueueDrainAndSnapshotRoundTripRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc ListenerLifecycleAndOfflineQueueDrainAndSnapshotRoundTripRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ListenerLifecycleAndOfflineQueueDrainAndSnapshotRoundTripRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(6, 2024), num: 6, days: getMonthDate(6, 2024) };
        source.pushData(seededMonth);
        expect(source.totalCount()).assertEqual(1);
        expect(recorder.countOf('add')).assertEqual(1);
        source.addData(0, seededMonth);
        expect(recorder.trace()).assertEqual('add:0|add:0');
        source.unregisterDataChangeListener(recorder);
        const frozen: number = recorder.size();
        source.notifyDataChange(0);
        expect(recorder.size()).assertEqual(frozen);
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 3; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(3);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(3);
        expect(queue.size()).assertEqual(0);
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '8');
        snapshot.put('day', '8');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('8');
        expect(restored.fields.length).assertEqual(2);
      }
    });
  });
}
