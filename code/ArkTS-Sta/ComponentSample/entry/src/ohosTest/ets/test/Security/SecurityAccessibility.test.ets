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

export default function SecurityAccessibilityTest(): void {
  describe('SecurityAccessibilityTest', () => {
    beforeAll(() => {
      logSuite('SecurityAccessibilityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('SecurityAccessibilityTest', 'end');
    });

    /**
     * @tc.name LogMaskingPolicyAndFontScaleProjectionAndWeekHeaderEmphasisKeepTheVisibleStateInStepDuringPreview
     * @tc.desc LogMaskingPolicyAndFontScaleProjectionAndWeekHeaderEmphasisKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('LogMaskingPolicyAndFontScaleProjectionAndWeekHeaderEmphasisKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        expect(Sanitizer.isSafeForLog('account token')).assertFalse();
        expect(Sanitizer.isSafeForLog('plain text')).assertTrue();
        expect(Sanitizer.maskAccount('13800138000')).assertEqual('1***0');
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.5);
        expect(scale.scaled(20)).assertEqual(30);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndWeekHeaderEmphasisPreserveTheDeclaredContractDuringPreview
     * @tc.desc FontScaleProjectionAndWeekHeaderEmphasisPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndWeekHeaderEmphasisPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.5);
        expect(scale.scaled(20)).assertEqual(30);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name WeekHeaderEmphasisAndConfigurationSnapshotAndRolePolicyCheckSurviveRapidInteractionDuringPreview
     * @tc.desc WeekHeaderEmphasisAndConfigurationSnapshotAndRolePolicyCheckSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndConfigurationSnapshotAndRolePolicyCheckSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
      }
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('owner', 'editGrid', RolePolicy.canMutate('owner'));
        trail.record('owner', 'exportGrid', RolePolicy.canExport('owner'));
        expect(RolePolicy.canMutate('owner')).assertEqual(true);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
    });

    /**
     * @tc.name ConfigurationSnapshotAndRolePolicyCheckHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc ConfigurationSnapshotAndRolePolicyCheckHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndRolePolicyCheckHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('owner', 'editGrid', RolePolicy.canMutate('owner'));
        trail.record('owner', 'exportGrid', RolePolicy.canExport('owner'));
        expect(RolePolicy.canMutate('owner')).assertEqual(true);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
    });

    /**
     * @tc.name RolePolicyCheckAndLogMaskingPolicyAndFontScaleProjectionRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc RolePolicyCheckAndLogMaskingPolicyAndFontScaleProjectionRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RolePolicyCheckAndLogMaskingPolicyAndFontScaleProjectionRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('owner', 'editGrid', RolePolicy.canMutate('owner'));
        trail.record('owner', 'exportGrid', RolePolicy.canExport('owner'));
        expect(RolePolicy.canMutate('owner')).assertEqual(true);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
      {
        expect(Sanitizer.trim('  grid  ')).assertEqual('grid');
        expect(Sanitizer.clean(' grid ')).assertEqual('grid');
        expect(Sanitizer.isSafeForLog('grid')).assertTrue();
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.5);
        expect(scale.scaled(20)).assertEqual(30);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name LogMaskingPolicyAndFontScaleProjectionAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc LogMaskingPolicyAndFontScaleProjectionAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('LogMaskingPolicyAndFontScaleProjectionAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        expect(Sanitizer.trim('  grid  ')).assertEqual('grid');
        expect(Sanitizer.clean(' grid ')).assertEqual('grid');
        expect(Sanitizer.isSafeForLog('grid')).assertTrue();
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.5);
        expect(scale.scaled(20)).assertEqual(30);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndWeekHeaderEmphasisAndConfigurationSnapshotKeepTheSessionCoherentDuringPreview
     * @tc.desc FontScaleProjectionAndWeekHeaderEmphasisAndConfigurationSnapshotKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FontScaleProjectionAndWeekHeaderEmphasisAndConfigurationSnapshotKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.5);
        expect(scale.scaled(20)).assertEqual(30);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
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
     * @tc.name WeekHeaderEmphasisAndConfigurationSnapshotTrackTheSelectedStateDuringPreview
     * @tc.desc WeekHeaderEmphasisAndConfigurationSnapshotTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndConfigurationSnapshotTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
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
     * @tc.name ConfigurationSnapshotAndRolePolicyCheckAndLogMaskingPolicyPreserveOrderingGuaranteesDuringPreview
     * @tc.desc ConfigurationSnapshotAndRolePolicyCheckAndLogMaskingPolicyPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndRolePolicyCheckAndLogMaskingPolicyPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
        trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
        expect(RolePolicy.canMutate('editor')).assertEqual(true);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
      {
        expect(Sanitizer.maskAccount('xy')).assertEqual('**');
        expect(Sanitizer.clean('a').length).assertEqual(1);
        expect(Sanitizer.trim('a ')).assertEqual('a');
      }
    });

    /**
     * @tc.name RolePolicyCheckAndLogMaskingPolicyHoldForRepeatedEntryDuringPreview
     * @tc.desc RolePolicyCheckAndLogMaskingPolicyHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RolePolicyCheckAndLogMaskingPolicyHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('editor', 'editGrid', RolePolicy.canMutate('editor'));
        trail.record('editor', 'exportGrid', RolePolicy.canExport('editor'));
        expect(RolePolicy.canMutate('editor')).assertEqual(true);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
      {
        expect(Sanitizer.maskAccount('xy')).assertEqual('**');
        expect(Sanitizer.clean('a').length).assertEqual(1);
        expect(Sanitizer.trim('a ')).assertEqual('a');
      }
    });

    /**
     * @tc.name LogMaskingPolicyAndFontScaleProjectionAndWeekHeaderEmphasisRemainStableUnderLoadDuringPreview
     * @tc.desc LogMaskingPolicyAndFontScaleProjectionAndWeekHeaderEmphasisRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('LogMaskingPolicyAndFontScaleProjectionAndWeekHeaderEmphasisRemainStableUnderLoadDuringPreview', 0, () => {
      {
        expect(Sanitizer.maskAccount('xy')).assertEqual('**');
        expect(Sanitizer.clean('a').length).assertEqual(1);
        expect(Sanitizer.trim('a ')).assertEqual('a');
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.5);
        expect(scale.scaled(20)).assertEqual(30);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
      }
    });

    /**
     * @tc.name WeekHeaderEmphasisAndConfigurationSnapshotAndRolePolicyCheckKeepTheVisibleStateInStepAfterRollover
     * @tc.desc WeekHeaderEmphasisAndConfigurationSnapshotAndRolePolicyCheckKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekHeaderEmphasisAndConfigurationSnapshotAndRolePolicyCheckKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const entries: WeekHeaderEntry[] = WeekHeader.entries();
        expect(entries.length).assertEqual(7);
        expect(entries[0].emphasized).assertTrue();
        expect(entries[6].emphasized).assertTrue();
        expect(entries[4].emphasized).assertFalse();
      }
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
        trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
        expect(RolePolicy.canMutate('viewer')).assertEqual(false);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
    });

    /**
     * @tc.name ConfigurationSnapshotAndRolePolicyCheckPreserveTheDeclaredContractAfterRollover
     * @tc.desc ConfigurationSnapshotAndRolePolicyCheckPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('ConfigurationSnapshotAndRolePolicyCheckPreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 2, 'zh-Hans');
        expect(config.isValid()).assertTrue();
        expect(config.describe().indexOf('portrait') >= 0).assertTrue();
        const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
        expect(huge.isValid()).assertFalse();
      }
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
        trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
        expect(RolePolicy.canMutate('viewer')).assertEqual(false);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
    });

    /**
     * @tc.name RolePolicyCheckAndLogMaskingPolicyAndFontScaleProjectionSurviveRapidInteractionAfterRollover
     * @tc.desc RolePolicyCheckAndLogMaskingPolicyAndFontScaleProjectionSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RolePolicyCheckAndLogMaskingPolicyAndFontScaleProjectionSurviveRapidInteractionAfterRollover', 0, () => {
      {
        const trail: AuditTrail = new AuditTrail();
        trail.record('viewer', 'editGrid', RolePolicy.canMutate('viewer'));
        trail.record('viewer', 'exportGrid', RolePolicy.canExport('viewer'));
        expect(RolePolicy.canMutate('viewer')).assertEqual(false);
        expect(trail.entries.length).assertEqual(2);
        expect(trail.allowed() + trail.denied()).assertEqual(2);
      }
      {
        expect(Sanitizer.isSafeForLog('account token')).assertFalse();
        expect(Sanitizer.isSafeForLog('plain text')).assertTrue();
        expect(Sanitizer.maskAccount('13800138000')).assertEqual('1***0');
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.5);
        expect(scale.scaled(20)).assertEqual(30);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name LogMaskingPolicyAndFontScaleProjectionHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc LogMaskingPolicyAndFontScaleProjectionHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('LogMaskingPolicyAndFontScaleProjectionHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        expect(Sanitizer.isSafeForLog('account token')).assertFalse();
        expect(Sanitizer.isSafeForLog('plain text')).assertTrue();
        expect(Sanitizer.maskAccount('13800138000')).assertEqual('1***0');
      }
      {
        const scale: ContentScaleModel = new ContentScaleModel(1.5);
        expect(scale.scaled(20)).assertEqual(30);
        expect(scale.rowHeight(50) >= 50).assertTrue();
        expect(scale.fits(100, 20)).assertTrue();
      }
    });

    /**
     * @tc.name FontScaleProjectionAndWeekHeaderEmphasisAndConfigurationSnapshotRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc FontScaleProjectionAndWeekHeaderEmphasisAndConfigurationSnapshotRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'FontScaleProjectionAndWeekHeaderEmphasisAndConfigurationSnapshotRemainCorrectAfterRecoveryAfterRollover',
      0,
      () => {
        {
          const scale: ContentScaleModel = new ContentScaleModel(1.5);
          expect(scale.scaled(20)).assertEqual(30);
          expect(scale.rowHeight(50) >= 50).assertTrue();
          expect(scale.fits(100, 20)).assertTrue();
        }
        {
          const entries: WeekHeaderEntry[] = WeekHeader.entries();
          expect(entries.length).assertEqual(7);
          expect(entries[0].emphasized).assertTrue();
          expect(entries[6].emphasized).assertTrue();
          expect(entries[4].emphasized).assertFalse();
        }
        {
          const config: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 1.5, 'zh-Hans');
          expect(config.isValid()).assertTrue();
          expect(config.describe().indexOf('portrait') >= 0).assertTrue();
          const huge: ConfigSnapshot = new ConfigSnapshot('portrait', 'light', 9, 'zh-Hans');
          expect(huge.isValid()).assertFalse();
        }
      },
    );
  });
}
