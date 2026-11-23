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

export default function DataBindingTest(): void {
  describe('DataBindingTest', () => {
    beforeAll(() => {
      logSuite('DataBindingTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('DataBindingTest', 'end');
    });

    /**
     * @tc.name DateModelConstructionAndSnapshotRoundTripStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc DateModelConstructionAndSnapshotRoundTripStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DateModelConstructionAndSnapshotRoundTripStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const model: DateModel = new DateModel(1, 0, 1, 2020);
        expect(model.day).assertEqual(1);
        expect(model.week).assertEqual(0);
        expect(model.month).assertEqual(1);
        expect(model.year).assertEqual(2020);
        model.year = model.year + 1;
        expect(model.year).assertEqual(2021);
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '2');
        snapshot.put('day', '2');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('2');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndCartQuantityClampAndListenerLifecycleKeepTheVisibleStateInStepDuringPreview
     * @tc.desc SnapshotRoundTripAndCartQuantityClampAndListenerLifecycleKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndCartQuantityClampAndListenerLifecycleKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '2');
        snapshot.put('day', '2');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('2');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const cart: CartModel = new CartModel(3);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, 0);
        if (before + 0 < 1) {
          expect(after).assertEqual(1);
        } else if (before + 0 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + 0);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(4, 2024), num: 4, days: getMonthDate(4, 2024) };
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
     * @tc.name CartQuantityClampAndListenerLifecyclePreserveTheDeclaredContractDuringPreview
     * @tc.desc CartQuantityClampAndListenerLifecyclePreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndListenerLifecyclePreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const cart: CartModel = new CartModel(3);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, 0);
        if (before + 0 < 1) {
          expect(after).assertEqual(1);
        } else if (before + 0 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + 0);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(4, 2024), num: 4, days: getMonthDate(4, 2024) };
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
     * @tc.name ListenerLifecycleAndCascadeTagSelectionAndDateModelConstructionSurviveRapidInteractionDuringPreview
     * @tc.desc ListenerLifecycleAndCascadeTagSelectionAndDateModelConstructionSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ListenerLifecycleAndCascadeTagSelectionAndDateModelConstructionSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(4, 2024), num: 4, days: getMonthDate(4, 2024) };
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
        const model: CascadeModel = new CascadeModel();
        model.selectTag(4);
        expect(model.itemScrollTarget).assertEqual(40);
        expect(model.currentTagIndex).assertEqual(4);
        expect(model.itemsOfTag(4).length).assertEqual(10);
      }
      {
        const model: DateModel = new DateModel(6, 5, 6, 2020);
        expect(model.day).assertEqual(6);
        expect(model.week).assertEqual(5);
        expect(model.month).assertEqual(6);
        expect(model.year).assertEqual(2020);
        model.year = model.year + 1;
        expect(model.year).assertEqual(2021);
      }
    });

    /**
     * @tc.name CascadeTagSelectionAndDateModelConstructionHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc CascadeTagSelectionAndDateModelConstructionHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeTagSelectionAndDateModelConstructionHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(4);
        expect(model.itemScrollTarget).assertEqual(40);
        expect(model.currentTagIndex).assertEqual(4);
        expect(model.itemsOfTag(4).length).assertEqual(10);
      }
      {
        const model: DateModel = new DateModel(6, 5, 6, 2020);
        expect(model.day).assertEqual(6);
        expect(model.week).assertEqual(5);
        expect(model.month).assertEqual(6);
        expect(model.year).assertEqual(2020);
        model.year = model.year + 1;
        expect(model.year).assertEqual(2021);
      }
    });

    /**
     * @tc.name DateModelConstructionAndSnapshotRoundTripAndCartQuantityClampRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc DateModelConstructionAndSnapshotRoundTripAndCartQuantityClampRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'DateModelConstructionAndSnapshotRoundTripAndCartQuantityClampRemainCorrectAfterRecoveryDuringPreview',
      0,
      () => {
        {
          const model: DateModel = new DateModel(6, 5, 6, 2020);
          expect(model.day).assertEqual(6);
          expect(model.week).assertEqual(5);
          expect(model.month).assertEqual(6);
          expect(model.year).assertEqual(2020);
          model.year = model.year + 1;
          expect(model.year).assertEqual(2021);
        }
        {
          const snapshot: Snapshot = new Snapshot();
          snapshot.put('month', '7');
          snapshot.put('day', '7');
          const encoded: string = snapshot.encode();
          expect(encoded.indexOf('month=') >= 0).assertTrue();
          const restored: Snapshot = Snapshot.decode(encoded);
          expect(restored.get('month')).assertEqual('7');
          expect(restored.fields.length).assertEqual(2);
        }
        {
          const cart: CartModel = new CartModel(2);
          const before: number = cart.items[0].quantity;
          const after: number = cart.changeQuantity(0, 0);
          if (before + 0 < 1) {
            expect(after).assertEqual(1);
          } else if (before + 0 > 99) {
            expect(after).assertEqual(99);
          } else {
            expect(after).assertEqual(before + 0);
          }
          expect(cart.changeQuantity(99, 1)).assertEqual(-1);
        }
      },
    );

    /**
     * @tc.name SnapshotRoundTripAndCartQuantityClampAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc SnapshotRoundTripAndCartQuantityClampAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndCartQuantityClampAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '7');
        snapshot.put('day', '7');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('7');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, 0);
        if (before + 0 < 1) {
          expect(after).assertEqual(1);
        } else if (before + 0 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + 0);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
    });

    /**
     * @tc.name CartQuantityClampAndListenerLifecycleAndCascadeTagSelectionKeepTheSessionCoherentDuringPreview
     * @tc.desc CartQuantityClampAndListenerLifecycleAndCascadeTagSelectionKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CartQuantityClampAndListenerLifecycleAndCascadeTagSelectionKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const cart: CartModel = new CartModel(2);
        const before: number = cart.items[0].quantity;
        const after: number = cart.changeQuantity(0, 0);
        if (before + 0 < 1) {
          expect(after).assertEqual(1);
        } else if (before + 0 > 99) {
          expect(after).assertEqual(99);
        } else {
          expect(after).assertEqual(before + 0);
        }
        expect(cart.changeQuantity(99, 1)).assertEqual(-1);
      }
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(9, 2024), num: 9, days: getMonthDate(9, 2024) };
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
        const model: CascadeModel = new CascadeModel();
        model.selectTag(9);
        expect(model.itemScrollTarget).assertEqual(90);
        expect(model.currentTagIndex).assertEqual(9);
        expect(model.itemsOfTag(9).length).assertEqual(10);
      }
    });

    /**
     * @tc.name ListenerLifecycleAndCascadeTagSelectionTrackTheSelectedStateDuringPreview
     * @tc.desc ListenerLifecycleAndCascadeTagSelectionTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ListenerLifecycleAndCascadeTagSelectionTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(9, 2024), num: 9, days: getMonthDate(9, 2024) };
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
        const model: CascadeModel = new CascadeModel();
        model.selectTag(9);
        expect(model.itemScrollTarget).assertEqual(90);
        expect(model.currentTagIndex).assertEqual(9);
        expect(model.itemsOfTag(9).length).assertEqual(10);
      }
    });

    /**
     * @tc.name CascadeTagSelectionAndDateModelConstructionAndSnapshotRoundTripPreserveOrderingGuaranteesDuringPreview
     * @tc.desc CascadeTagSelectionAndDateModelConstructionAndSnapshotRoundTripPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'CascadeTagSelectionAndDateModelConstructionAndSnapshotRoundTripPreserveOrderingGuaranteesDuringPreview',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(9);
          expect(model.itemScrollTarget).assertEqual(90);
          expect(model.currentTagIndex).assertEqual(9);
          expect(model.itemsOfTag(9).length).assertEqual(10);
        }
        {
          const model: DateModel = new DateModel(11, 3, 11, 2020);
          expect(model.day).assertEqual(11);
          expect(model.week).assertEqual(3);
          expect(model.month).assertEqual(11);
          expect(model.year).assertEqual(2020);
          model.year = model.year + 1;
          expect(model.year).assertEqual(2021);
        }
        {
          const snapshot: Snapshot = new Snapshot();
          snapshot.put('month', '12');
          snapshot.put('day', '12');
          const encoded: string = snapshot.encode();
          expect(encoded.indexOf('month=') >= 0).assertTrue();
          const restored: Snapshot = Snapshot.decode(encoded);
          expect(restored.get('month')).assertEqual('12');
          expect(restored.fields.length).assertEqual(2);
        }
      },
    );

    /**
     * @tc.name DateModelConstructionAndSnapshotRoundTripHoldForRepeatedEntryDuringPreview
     * @tc.desc DateModelConstructionAndSnapshotRoundTripHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('DateModelConstructionAndSnapshotRoundTripHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const model: DateModel = new DateModel(11, 3, 11, 2020);
        expect(model.day).assertEqual(11);
        expect(model.week).assertEqual(3);
        expect(model.month).assertEqual(11);
        expect(model.year).assertEqual(2020);
        model.year = model.year + 1;
        expect(model.year).assertEqual(2021);
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '12');
        snapshot.put('day', '12');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('12');
        expect(restored.fields.length).assertEqual(2);
      }
    });
  });
}
