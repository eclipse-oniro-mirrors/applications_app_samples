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

export default function SessionManagementTest(): void {
  describe('SessionManagementTest', () => {
    beforeAll(() => {
      logSuite('SessionManagementTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('SessionManagementTest', 'end');
    });

    /**
     * @tc.name SessionTransitionsAndPanelStateMachineStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc SessionTransitionsAndPanelStateMachineStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SessionTransitionsAndPanelStateMachineStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
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
     * @tc.name PanelStateMachineAndSnapshotRoundTripRoleAuditTrailKeepTheVisibleStateInStepDuringPreview
     * @tc.desc PanelStateMachineAndSnapshotRoundTripRoleAuditTrailKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndSnapshotRoundTripRoleAuditTrailKeepTheVisibleStateInStepDuringPreview', 0, () => {
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
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '3');
        snapshot.put('day', '3');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('3');
        expect(restored.fields.length).assertEqual(2);
      }
      const trail: AuditTrail = new AuditTrail();
      trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
      trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
      expect(RolePolicy.canMutate('editor')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name SnapshotRoundTripRoleAuditTrailPreserveTheDeclaredContractDuringPreview
     * @tc.desc SnapshotRoundTripRoleAuditTrailPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripRoleAuditTrailPreserveTheDeclaredContractDuringPreview', 0, () => {
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
      const trail: AuditTrail = new AuditTrail();
      trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
      trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
      expect(RolePolicy.canMutate('editor')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name RoleAuditTrailAndConfigurationSnapshotAndSessionTransitionsSurviveRapidInteractionDuringPreview
     * @tc.desc RoleAuditTrailAndConfigurationSnapshotAndSessionTransitionsSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RoleAuditTrailAndConfigurationSnapshotAndSessionTransitionsSurviveRapidInteractionDuringPreview', 0, () => {
      const trail: AuditTrail = new AuditTrail();
      trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
      trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
      expect(RolePolicy.canMutate('editor')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name ConfigurationSnapshotAndSessionTransitionsHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc ConfigurationSnapshotAndSessionTransitionsHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndSessionTransitionsHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name SessionTransitionsAndPanelStateMachineAndSnapshotRoundTripRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc SessionTransitionsAndPanelStateMachineAndSnapshotRoundTripRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SessionTransitionsAndPanelStateMachineAndSnapshotRoundTripRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
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
     * @tc.name PanelStateMachineAndSnapshotRoundTripAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc PanelStateMachineAndSnapshotRoundTripAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndSnapshotRoundTripAgreeWithTheModelInvariantsDuringPreview', 0, () => {
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
     * @tc.name SnapshotRoundTripRoleAuditTrailAndConfigurationSnapshotKeepTheSessionCoherentDuringPreview
     * @tc.desc SnapshotRoundTripRoleAuditTrailAndConfigurationSnapshotKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripRoleAuditTrailAndConfigurationSnapshotKeepTheSessionCoherentDuringPreview', 0, () => {
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
      const trail: AuditTrail = new AuditTrail();
      trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
      trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
      expect(RolePolicy.canMutate('viewer')).assertEqual(false);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
    });

    /**
     * @tc.name RoleAuditTrailAndConfigurationSnapshotTrackTheSelectedStateDuringPreview
     * @tc.desc RoleAuditTrailAndConfigurationSnapshotTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RoleAuditTrailAndConfigurationSnapshotTrackTheSelectedStateDuringPreview', 0, () => {
      const trail: AuditTrail = new AuditTrail();
      trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
      trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
      expect(RolePolicy.canMutate('viewer')).assertEqual(false);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
    });

    /**
     * @tc.name ConfigurationSnapshotAndSessionTransitionsAndPanelStateMachinePreserveOrderingGuaranteesDuringPreview
     * @tc.desc ConfigurationSnapshotAndSessionTransitionsAndPanelStateMachinePreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ConfigurationSnapshotAndSessionTransitionsAndPanelStateMachinePreserveOrderingGuaranteesDuringPreview',
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
          const session: SessionStore = new SessionStore();
          expect(session.move('foreground')).assertTrue();
          expect(session.move('background')).assertTrue();
          expect(session.move('foreground')).assertTrue();
          expect(session.move('created')).assertFalse();
          expect(session.move('destroyed')).assertTrue();
          expect(session.rank()).assertEqual(3);
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
      },
    );

    /**
     * @tc.name PanelStateMachineAndSnapshotRoundTripRoleAuditTrailRemainStableUnderLoadDuringPreview
     * @tc.desc PanelStateMachineAndSnapshotRoundTripRoleAuditTrailRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndSnapshotRoundTripRoleAuditTrailRemainStableUnderLoadDuringPreview', 0, () => {
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
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '1');
        snapshot.put('day', '13');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('1');
        expect(restored.fields.length).assertEqual(2);
      }
      const trail: AuditTrail = new AuditTrail();
      trail.record('owner', 'editGrid', RolePolicy.canMutate('owner'));
      trail.record('owner', 'exportGrid', RolePolicy.canExport('owner'));
      expect(RolePolicy.canMutate('owner')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name SnapshotRoundTripRoleAuditTrailStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc SnapshotRoundTripRoleAuditTrailStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripRoleAuditTrailStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
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
      const trail: AuditTrail = new AuditTrail();
      trail.record('owner', 'editGrid', RolePolicy.canMutate('owner'));
      trail.record('owner', 'exportGrid', RolePolicy.canExport('owner'));
      expect(RolePolicy.canMutate('owner')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
    });

    /**
     * @tc.name RoleAuditTrailAndConfigurationSnapshotAndSessionTransitionsKeepTheVisibleStateInStepAfterRollover
     * @tc.desc RoleAuditTrailAndConfigurationSnapshotAndSessionTransitionsKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RoleAuditTrailAndConfigurationSnapshotAndSessionTransitionsKeepTheVisibleStateInStepAfterRollover', 0, () => {
      const trail: AuditTrail = new AuditTrail();
      trail.record('owner', 'editGrid', RolePolicy.canMutate('owner'));
      trail.record('owner', 'exportGrid', RolePolicy.canExport('owner'));
      expect(RolePolicy.canMutate('owner')).assertEqual(true);
      expect(trail.entries.length).assertEqual(2);
      expect(trail.allowed() + trail.denied()).assertEqual(2);
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name ConfigurationSnapshotAndSessionTransitionsPreserveTheDeclaredContractAfterRollover
     * @tc.desc ConfigurationSnapshotAndSessionTransitionsPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndSessionTransitionsPreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
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
     * @tc.name SessionTransitionsAndPanelStateMachineAndSnapshotRoundTripSurviveRapidInteractionAfterRollover
     * @tc.desc SessionTransitionsAndPanelStateMachineAndSnapshotRoundTripSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('SessionTransitionsAndPanelStateMachineAndSnapshotRoundTripSurviveRapidInteractionAfterRollover', 0, () => {
      {
        const session: SessionStore = new SessionStore();
        expect(session.move('destroyed')).assertTrue();
        expect(session.move('foreground')).assertFalse();
        expect(session.rank()).assertEqual(3);
        expect(SessionStore.canMove('background', 'foreground')).assertTrue();
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
     * @tc.name PanelStateMachineAndSnapshotRoundTripHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc PanelStateMachineAndSnapshotRoundTripHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelStateMachineAndSnapshotRoundTripHoldAcrossConfigurationChangesAfterRollover', 0, () => {
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
  });
}
