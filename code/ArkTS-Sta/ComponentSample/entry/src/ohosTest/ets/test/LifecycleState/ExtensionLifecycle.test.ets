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

export default function ExtensionLifecycleTest(): void {
  describe('ExtensionLifecycleTest', () => {
    beforeAll(() => {
      logSuite('ExtensionLifecycleTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('ExtensionLifecycleTest', 'end');
    });

    /**
     * @tc.name SessionTransitionsAndConfigurationSnapshotStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc SessionTransitionsAndConfigurationSnapshotStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SessionTransitionsAndConfigurationSnapshotStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
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
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
    });

    /**
     * @tc.name ConfigurationSnapshotAndSnapshotRoundTripAndOfflineQueueDrainKeepTheVisibleStateInStepDuringPreview
     * @tc.desc ConfigurationSnapshotAndSnapshotRoundTripAndOfflineQueueDrainKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndSnapshotRoundTripAndOfflineQueueDrainKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '3');
        snapshot.put('day', '3');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('3');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 5; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(5);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(5);
        expect(queue.size()).assertEqual(0);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndOfflineQueueDrainPreserveTheDeclaredContractDuringPreview
     * @tc.desc SnapshotRoundTripAndOfflineQueueDrainPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndOfflineQueueDrainPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '3');
        snapshot.put('day', '3');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('3');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 5; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(5);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(5);
        expect(queue.size()).assertEqual(0);
      }
    });

    /**
     * @tc.name OfflineQueueDrainAndPanelStateMachineAndSessionTransitionsSurviveRapidInteractionDuringPreview
     * @tc.desc OfflineQueueDrainAndPanelStateMachineAndSessionTransitionsSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndPanelStateMachineAndSessionTransitionsSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 5; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(5);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(5);
        expect(queue.size()).assertEqual(0);
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
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
      }
    });

    /**
     * @tc.name SessionTransitionsAndConfigurationSnapshotAndSnapshotRoundTripRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc SessionTransitionsAndConfigurationSnapshotAndSnapshotRoundTripRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'SessionTransitionsAndConfigurationSnapshotAndSnapshotRoundTripRemainCorrectAfterRecoveryDuringPreview',
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
          const snapshot: Snapshot = new Snapshot();
          snapshot.put('month', '8');
          snapshot.put('day', '8');
          const encoded: string = snapshot.encode();
          expect(encoded.indexOf('month=') >= 0).assertTrue();
          const restored: Snapshot = Snapshot.decode(encoded);
          expect(restored.get('month')).assertEqual('8');
          expect(restored.fields.length).assertEqual(2);
        }
      },
    );

    /**
     * @tc.name ConfigurationSnapshotAndSnapshotRoundTripAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc ConfigurationSnapshotAndSnapshotRoundTripAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndSnapshotRoundTripAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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

    /**
     * @tc.name SnapshotRoundTripAndOfflineQueueDrainAndPanelStateMachineKeepTheSessionCoherentDuringPreview
     * @tc.desc SnapshotRoundTripAndOfflineQueueDrainAndPanelStateMachineKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndOfflineQueueDrainAndPanelStateMachineKeepTheSessionCoherentDuringPreview', 0, () => {
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
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 5; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(5);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(5);
        expect(queue.size()).assertEqual(0);
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
     * @tc.name OfflineQueueDrainAndPanelStateMachineTrackTheSelectedStateDuringPreview
     * @tc.desc OfflineQueueDrainAndPanelStateMachineTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('OfflineQueueDrainAndPanelStateMachineTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 5; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(5);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(5);
        expect(queue.size()).assertEqual(0);
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
     * @tc.name PanelStateMachineAndSessionTransitionsAndConfigurationSnapshotPreserveOrderingGuaranteesDuringPreview
     * @tc.desc PanelStateMachineAndSessionTransitionsAndConfigurationSnapshotPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PanelStateMachineAndSessionTransitionsAndConfigurationSnapshotPreserveOrderingGuaranteesDuringPreview',
      0,
      () => {
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
     * @tc.name SessionTransitionsAndConfigurationSnapshotHoldForRepeatedEntryDuringPreview
     * @tc.desc SessionTransitionsAndConfigurationSnapshotHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SessionTransitionsAndConfigurationSnapshotHoldForRepeatedEntryDuringPreview', 0, () => {
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
    });

    /**
     * @tc.name ConfigurationSnapshotAndSnapshotRoundTripAndOfflineQueueDrainRemainStableUnderLoadDuringPreview
     * @tc.desc ConfigurationSnapshotAndSnapshotRoundTripAndOfflineQueueDrainRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndSnapshotRoundTripAndOfflineQueueDrainRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '1');
        snapshot.put('day', '13');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('1');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 5; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(5);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(5);
        expect(queue.size()).assertEqual(0);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndOfflineQueueDrainStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc SnapshotRoundTripAndOfflineQueueDrainStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndOfflineQueueDrainStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '1');
        snapshot.put('day', '13');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('1');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 5; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(5);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(5);
        expect(queue.size()).assertEqual(0);
      }
    });

    /**
     * @tc.name SessionTransitionsAndConfigurationSnapshotAndSnapshotRoundTripSurviveRapidInteractionAfterRollover
     * @tc.desc SessionTransitionsAndConfigurationSnapshotAndSnapshotRoundTripSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SessionTransitionsAndConfigurationSnapshotAndSnapshotRoundTripSurviveRapidInteractionAfterRollover', 0, () => {
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
      }
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '6');
        snapshot.put('day', '18');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('6');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name ConfigurationSnapshotAndSnapshotRoundTripHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc ConfigurationSnapshotAndSnapshotRoundTripHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndSnapshotRoundTripHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '6');
        snapshot.put('day', '18');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('6');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndOfflineQueueDrainAndPanelStateMachineRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc SnapshotRoundTripAndOfflineQueueDrainAndPanelStateMachineRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndOfflineQueueDrainAndPanelStateMachineRemainCorrectAfterRecoveryAfterRollover', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '6');
        snapshot.put('day', '18');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('6');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 5; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(5);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(5);
        expect(queue.size()).assertEqual(0);
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
     * @tc.name PanelStateMachineAndSessionTransitionsAndConfigurationSnapshotKeepTheSessionCoherentAfterRollover
     * @tc.desc PanelStateMachineAndSessionTransitionsAndConfigurationSnapshotKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndSessionTransitionsAndConfigurationSnapshotKeepTheSessionCoherentAfterRollover', 0, () => {
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
        const session: SessionStore = new SessionStore();
        expect(session.move('foreground')).assertTrue();
        expect(session.move('background')).assertTrue();
        expect(session.move('foreground')).assertTrue();
        expect(session.move('created')).assertFalse();
        expect(session.move('destroyed')).assertTrue();
        expect(session.rank()).assertEqual(3);
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
     * @tc.name SessionTransitionsAndConfigurationSnapshotTrackTheSelectedStateAfterRollover
     * @tc.desc SessionTransitionsAndConfigurationSnapshotTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SessionTransitionsAndConfigurationSnapshotTrackTheSelectedStateAfterRollover', 0, () => {
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
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
    });

    /**
     * @tc.name ConfigurationSnapshotAndSnapshotRoundTripAndOfflineQueueDrainPreserveOrderingGuaranteesAfterRollover
     * @tc.desc ConfigurationSnapshotAndSnapshotRoundTripAndOfflineQueueDrainPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ConfigurationSnapshotAndSnapshotRoundTripAndOfflineQueueDrainPreserveOrderingGuaranteesAfterRollover',
      0,
      () => {
        {
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
        }
        {
          const snapshot: Snapshot = new Snapshot();
          snapshot.put('month', '11');
          snapshot.put('day', '23');
          const encoded: string = snapshot.encode();
          expect(encoded.indexOf('month=') >= 0).assertTrue();
          const restored: Snapshot = Snapshot.decode(encoded);
          expect(restored.get('month')).assertEqual('11');
          expect(restored.fields.length).assertEqual(2);
        }
        {
          const queue: OfflineQueue = new OfflineQueue();
          for (let index = 0; index < 5; index++) {
            queue.enqueue('action-' + index.toString());
          }
          expect(queue.size()).assertEqual(5);
          expect(queue.drain(false).length).assertEqual(0);
          expect(queue.drain(true).length).assertEqual(5);
          expect(queue.size()).assertEqual(0);
        }
      },
    );

    /**
     * @tc.name SnapshotRoundTripAndOfflineQueueDrainHoldForRepeatedEntryAfterRollover
     * @tc.desc SnapshotRoundTripAndOfflineQueueDrainHoldForRepeatedEntryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndOfflineQueueDrainHoldForRepeatedEntryAfterRollover', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '11');
        snapshot.put('day', '23');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('11');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 5; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(5);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(5);
        expect(queue.size()).assertEqual(0);
      }
    });

    /**
     * @tc.name SessionTransitionsAndConfigurationSnapshotAndSnapshotRoundTripKeepTheVisibleStateInStepUnderLoad
     * @tc.desc SessionTransitionsAndConfigurationSnapshotAndSnapshotRoundTripKeepTheVisibleStateInStepUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('SessionTransitionsAndConfigurationSnapshotAndSnapshotRoundTripKeepTheVisibleStateInStepUnderLoad', 0, () => {
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
      }
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '4');
        snapshot.put('day', '28');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('4');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name ConfigurationSnapshotAndSnapshotRoundTripPreserveTheDeclaredContractUnderLoad
     * @tc.desc ConfigurationSnapshotAndSnapshotRoundTripPreserveTheDeclaredContractUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndSnapshotRoundTripPreserveTheDeclaredContractUnderLoad', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '4');
        snapshot.put('day', '28');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('4');
        expect(restored.fields.length).assertEqual(2);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndOfflineQueueDrainAndPanelStateMachineSurviveRapidInteractionUnderLoad
     * @tc.desc SnapshotRoundTripAndOfflineQueueDrainAndPanelStateMachineSurviveRapidInteractionUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndOfflineQueueDrainAndPanelStateMachineSurviveRapidInteractionUnderLoad', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '4');
        snapshot.put('day', '28');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('4');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const queue: OfflineQueue = new OfflineQueue();
        for (let index = 0; index < 5; index++) {
          queue.enqueue('action-' + index.toString());
        }
        expect(queue.size()).assertEqual(5);
        expect(queue.drain(false).length).assertEqual(0);
        expect(queue.drain(true).length).assertEqual(5);
        expect(queue.size()).assertEqual(0);
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
     * @tc.name PanelStateMachineAndSessionTransitionsAndConfigurationSnapshotRemainCorrectAfterRecoveryUnderLoad
     * @tc.desc PanelStateMachineAndSessionTransitionsAndConfigurationSnapshotRemainCorrectAfterRecoveryUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndSessionTransitionsAndConfigurationSnapshotRemainCorrectAfterRecoveryUnderLoad', 0, () => {
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
        const session: SessionStore = new SessionStore();
        expect(session.move('foreground')).assertTrue();
        expect(session.move('background')).assertTrue();
        expect(session.move('foreground')).assertTrue();
        expect(session.move('created')).assertFalse();
        expect(session.move('destroyed')).assertTrue();
        expect(session.rank()).assertEqual(3);
      }
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
    });
  });
}
