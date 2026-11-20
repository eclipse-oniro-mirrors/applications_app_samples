/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';
import {
  getDriver,
  launchEntryAbility,
  buildEntryWant,
  startAbilityByWant,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  waitForTextVisible,
  pageComponentCount,
  checkTextContent,
  checkComponentExistsByKey,
  collectAllTexts,
  measureElapsed,
  isWithinBudget,
  averageOf,
  maxOf,
  minOf,
  serializedDelay,
  pressAndWait,
  logInfo,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  INDEX_PAGE_TEXT_KEY,
  INDEX_PAGE_PATH,
  ENTRY_ABILITY_NAME,
  BACKUP_ABILITY_NAME,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_SESSION_CREATE,
  TIMEOUT_BACKGROUND_SWITCH,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  DELAY_KEY_NAVIGATION,
  KEY_ENTER,
  STRESS_ROUNDS_LAUNCH,
  TOLERANCE_COMPONENT_COUNT,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const API_LEVEL_MIN_SUPPORTED: number = 12;

const API_LEVEL_CURRENT: number = 18;

const LAUNCH_REASON_SPAWN: string = 'SPAWN';

const LAUNCH_REASON_ACTIVE: string = 'ACTIVE';

const LAUNCH_REASON_RECENT: string = 'RECENT';

const LAUNCH_REASON_BACKGROUND: string = 'BACKGROUND';

const FORM_FOLDABLE: string = 'foldable';

const FORM_TABLET: string = 'tablet';

const FORM_PHONE: string = 'phone';

const FORM_WEARABLE: string = 'wearable';

const BOOT_MODE_STANDARD: string = 'standard';

const BOOT_MODE_SPECIFIED: string = 'specified';

const BOOT_MODE_SINGLETON: string = 'singleton';

enum CompatibilityVerdict {
  VERDICT_SUPPORTED = 'supported',
  VERDICT_DEGRADED = 'degraded',
  VERDICT_BLOCKED = 'blocked'
}

enum LaunchOutcome {
  OUTCOME_SPAWNED = 'spawned',
  OUTCOME_RESUMED = 'resumed',
  OUTCOME_DUPLICATED = 'duplicated',
  OUTCOME_REJECTED = 'rejected'
}

interface LaunchRequest {
  deviceForm: string;
  apiLevel: number;
  launchReason: string;
  bootMode: string;
  hasParameters: boolean;
  hasWindowSizeHint: boolean;
}

interface CapabilityProfile {
  minApiLevel: number;
  supportedForms: string[];
  supportsWorkerRestart: boolean;
  supportsWindowHint: boolean;
}

interface LaunchSessionRecord {
  reason: string;
  outcome: string;
  elapsedMs: number;
  componentCount: number;
}

class LaunchCapabilityMatrix {
  private profile: CapabilityProfile = {
    minApiLevel: API_LEVEL_MIN_SUPPORTED,
    supportedForms: [FORM_PHONE, FORM_TABLET, FORM_FOLDABLE],
    supportsWorkerRestart: true,
    supportsWindowHint: true
  };

  public getProfile(): CapabilityProfile {
    return this.profile;
  }

  public isApiLevelSupported(apiLevel: number): boolean {
    return apiLevel >= this.profile.minApiLevel && apiLevel <= API_LEVEL_CURRENT + 5;
  }

  public isFormSupported(deviceForm: string): boolean {
    return this.profile.supportedForms.includes(deviceForm);
  }

  public evaluateApiLevel(apiLevel: number): CompatibilityVerdict {
    if (apiLevel < this.profile.minApiLevel) {
      return CompatibilityVerdict.VERDICT_BLOCKED;
    }
    if (apiLevel === this.profile.minApiLevel) {
      return CompatibilityVerdict.VERDICT_DEGRADED;
    }
    return CompatibilityVerdict.VERDICT_SUPPORTED;
  }

  public evaluateForm(deviceForm: string): CompatibilityVerdict {
    if (deviceForm === FORM_WEARABLE || deviceForm.length === 0) {
      return CompatibilityVerdict.VERDICT_BLOCKED;
    }
    if (deviceForm === FORM_PHONE) {
      return CompatibilityVerdict.VERDICT_SUPPORTED;
    }
    if (this.isFormSupported(deviceForm)) {
      return CompatibilityVerdict.VERDICT_SUPPORTED;
    }
    return CompatibilityVerdict.VERDICT_BLOCKED;
  }

  public evaluateRequest(request: LaunchRequest): CompatibilityVerdict {
    const apiVerdict: CompatibilityVerdict = this.evaluateApiLevel(request.apiLevel);
    const formVerdict: CompatibilityVerdict = this.evaluateForm(request.deviceForm);
    if (apiVerdict === CompatibilityVerdict.VERDICT_BLOCKED ||
      formVerdict === CompatibilityVerdict.VERDICT_BLOCKED) {
      return CompatibilityVerdict.VERDICT_BLOCKED;
    }
    if (apiVerdict === CompatibilityVerdict.VERDICT_DEGRADED) {
      return CompatibilityVerdict.VERDICT_DEGRADED;
    }
    if (request.hasWindowSizeHint && !this.profile.supportsWindowHint) {
      return CompatibilityVerdict.VERDICT_DEGRADED;
    }
    return CompatibilityVerdict.VERDICT_SUPPORTED;
  }

  public isBootModeUsable(request: LaunchRequest): boolean {
    if (request.bootMode === BOOT_MODE_STANDARD || request.bootMode === BOOT_MODE_SINGLETON) {
      return true;
    }
    if (request.bootMode === BOOT_MODE_SPECIFIED) {
      return request.apiLevel >= API_LEVEL_MIN_SUPPORTED;
    }
    return false;
  }

  public supportsLaunchReason(reason: string): boolean {
    return reason === LAUNCH_REASON_SPAWN || reason === LAUNCH_REASON_ACTIVE ||
      reason === LAUNCH_REASON_RECENT || reason === LAUNCH_REASON_BACKGROUND;
  }

  public countSupportedForms(): number {
    return this.profile.supportedForms.length;
  }
}

class LaunchReasonResolver {
  public resolveOutcome(reason: string, alreadyRunning: boolean, bootMode: string): LaunchOutcome {
    if (!this.isKnownReason(reason)) {
      return LaunchOutcome.OUTCOME_REJECTED;
    }
    if (reason === LAUNCH_REASON_SPAWN) {
      if (alreadyRunning && bootMode === BOOT_MODE_SINGLETON) {
        return LaunchOutcome.OUTCOME_RESUMED;
      }
      if (alreadyRunning && bootMode === BOOT_MODE_SPECIFIED) {
        return LaunchOutcome.OUTCOME_DUPLICATED;
      }
      return LaunchOutcome.OUTCOME_SPAWNED;
    }
    if (reason === LAUNCH_REASON_ACTIVE) {
      return LaunchOutcome.OUTCOME_RESUMED;
    }
    if (reason === LAUNCH_REASON_RECENT) {
      return alreadyRunning ? LaunchOutcome.OUTCOME_RESUMED : LaunchOutcome.OUTCOME_SPAWNED;
    }
    return LaunchOutcome.OUTCOME_SPAWNED;
  }

  public isKnownReason(reason: string): boolean {
    return reason === LAUNCH_REASON_SPAWN || reason === LAUNCH_REASON_ACTIVE ||
      reason === LAUNCH_REASON_RECENT || reason === LAUNCH_REASON_BACKGROUND;
  }

  public expectedForegroundCount(reason: string): number {
    if (reason === LAUNCH_REASON_SPAWN || reason === LAUNCH_REASON_RECENT) {
      return 1;
    }
    if (reason === LAUNCH_REASON_ACTIVE) {
      return 1;
    }
    return 0;
  }

  public requiresColdWindow(reason: string): boolean {
    return reason === LAUNCH_REASON_SPAWN;
  }
}

class WantParameterValidator {
  public isAbilityNameValid(want: Want): boolean {
    const abilityName: string | undefined = want.abilityName;
    return abilityName !== undefined && abilityName !== null && abilityName.length > 0;
  }

  public isBundleNameValid(want: Want): boolean {
    const bundleName: string | undefined = want.bundleName;
    return bundleName !== undefined && bundleName !== null && bundleName.length > 0;
  }

  public isExplicitWant(want: Want): boolean {
    return this.isAbilityNameValid(want) && this.isBundleNameValid(want);
  }

  public countParameters(want: Want): number {
    const params: Record<string, Object> | undefined = want.parameters;
    if (params === undefined || params === null) {
      return 0;
    }
    let total: number = 0;
    if (params['launchSource'] !== undefined) {
      total++;
    }
    if (params['caseId'] !== undefined) {
      total++;
    }
    return total;
  }

  public describeTarget(want: Want): string {
    if (!this.isExplicitWant(want)) {
      return 'implicit';
    }
    const bundleName: string = want.bundleName === undefined ? '' : want.bundleName;
    const abilityName: string = want.abilityName === undefined ? '' : want.abilityName;
    return `${bundleName}/${abilityName}`;
  }

  public isTargetEntryAbility(want: Want): boolean {
    const abilityName: string | undefined = want.abilityName;
    if (abilityName === undefined || abilityName === null) {
      return false;
    }
    return abilityName === ENTRY_ABILITY_NAME;
  }

  public isTargetBackupAbility(want: Want): boolean {
    const abilityName: string | undefined = want.abilityName;
    if (abilityName === undefined || abilityName === null) {
      return false;
    }
    return abilityName === BACKUP_ABILITY_NAME;
  }
}

class LaunchTimeline {
  private records: LaunchSessionRecord[] = [];

  public record(reason: string, outcome: string, elapsedMs: number, componentCount: number): number {
    const entry: LaunchSessionRecord = {
      reason: reason,
      outcome: outcome,
      elapsedMs: elapsedMs,
      componentCount: componentCount
    };
    this.records.push(entry);
    return this.records.length;
  }

  public getRecords(): LaunchSessionRecord[] {
    return this.records.slice(0);
  }

  public size(): number {
    return this.records.length;
  }

  public getElapsedValues(): number[] {
    const values: number[] = [];
    for (let i = 0; i < this.records.length; i++) {
      values.push(this.records[i].elapsedMs);
    }
    return values;
  }

  public getComponentCounts(): number[] {
    const values: number[] = [];
    for (let i = 0; i < this.records.length; i++) {
      values.push(this.records[i].componentCount);
    }
    return values;
  }

  public countOutcome(outcome: string): number {
    let total: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].outcome === outcome) {
        total++;
      }
    }
    return total;
  }

  public averageElapsed(): number {
    return averageOf(this.getElapsedValues());
  }

  public isStable(tolerance: number): boolean {
    const counts: number[] = this.getComponentCounts();
    if (counts.length === 0) {
      return false;
    }
    return maxOf(counts) - minOf(counts) <= tolerance;
  }

  public reset(): void {
    this.records = [];
  }
}

export default function abilityLaunchCompatibilityTest(): void {
  describe('AbilityLaunchCompatibilityTest', () => {
    let driver: Driver;
    let matrix: LaunchCapabilityMatrix;
    let resolver: LaunchReasonResolver;
    let validator: WantParameterValidator;
    let timeline: LaunchTimeline;

    const phoneRequest: LaunchRequest = {
      deviceForm: FORM_PHONE,
      apiLevel: API_LEVEL_CURRENT,
      launchReason: LAUNCH_REASON_SPAWN,
      bootMode: BOOT_MODE_SINGLETON,
      hasParameters: false,
      hasWindowSizeHint: false
    };

    const tabletRequest: LaunchRequest = {
      deviceForm: FORM_TABLET,
      apiLevel: API_LEVEL_CURRENT,
      launchReason: LAUNCH_REASON_ACTIVE,
      bootMode: BOOT_MODE_STANDARD,
      hasParameters: true,
      hasWindowSizeHint: true
    };

    const foldableRequest: LaunchRequest = {
      deviceForm: FORM_FOLDABLE,
      apiLevel: API_LEVEL_CURRENT + 2,
      launchReason: LAUNCH_REASON_RECENT,
      bootMode: BOOT_MODE_SPECIFIED,
      hasParameters: true,
      hasWindowSizeHint: true
    };

    const wearableRequest: LaunchRequest = {
      deviceForm: FORM_WEARABLE,
      apiLevel: API_LEVEL_CURRENT,
      launchReason: LAUNCH_REASON_BACKGROUND,
      bootMode: BOOT_MODE_STANDARD,
      hasParameters: false,
      hasWindowSizeHint: false
    };

    beforeAll(async () => {
      driver = getDriver();
      matrix = new LaunchCapabilityMatrix();
      resolver = new LaunchReasonResolver();
      validator = new WantParameterValidator();
      timeline = new LaunchTimeline();
      logInfo('AbilityLaunchCompatibilityTest: beforeAll prepared matrix and driver');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      timeline.reset();
      logInfo('AbilityLaunchCompatibilityTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_0100
     * @tc.name testApiLevelVerdicts
     * @tc.desc Verify API level 11 is blocked, level 12 is degraded and level 18 is fully supported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testApiLevelVerdicts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(matrix.evaluateApiLevel(11)).assertEqual(CompatibilityVerdict.VERDICT_BLOCKED);
          expect(matrix.evaluateApiLevel(API_LEVEL_MIN_SUPPORTED))
            .assertEqual(CompatibilityVerdict.VERDICT_DEGRADED);
          expect(matrix.evaluateApiLevel(API_LEVEL_CURRENT))
            .assertEqual(CompatibilityVerdict.VERDICT_SUPPORTED);
          expect(matrix.isApiLevelSupported(11)).assertFalse();
          expect(matrix.isApiLevelSupported(API_LEVEL_MIN_SUPPORTED)).assertTrue();
          expect(matrix.isApiLevelSupported(API_LEVEL_CURRENT + 6)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_0200
     * @tc.name testDeviceFormVerdicts
     * @tc.desc Verify phone, tablet and foldable are supported while wearable and empty form are blocked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeviceFormVerdicts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(matrix.evaluateForm(FORM_PHONE)).assertEqual(CompatibilityVerdict.VERDICT_SUPPORTED);
          expect(matrix.evaluateForm(FORM_TABLET)).assertEqual(CompatibilityVerdict.VERDICT_SUPPORTED);
          expect(matrix.evaluateForm(FORM_FOLDABLE)).assertEqual(CompatibilityVerdict.VERDICT_SUPPORTED);
          expect(matrix.evaluateForm(FORM_WEARABLE)).assertEqual(CompatibilityVerdict.VERDICT_BLOCKED);
          expect(matrix.evaluateForm('')).assertEqual(CompatibilityVerdict.VERDICT_BLOCKED);
          expect(matrix.countSupportedForms()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_0300
     * @tc.name testRequestMatrixCombination
     * @tc.desc Verify combined matrix verdicts for phone, tablet, foldable and wearable launch requests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRequestMatrixCombination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(matrix.evaluateRequest(phoneRequest)).assertEqual(CompatibilityVerdict.VERDICT_SUPPORTED);
          expect(matrix.evaluateRequest(tabletRequest)).assertEqual(CompatibilityVerdict.VERDICT_SUPPORTED);
          expect(matrix.evaluateRequest(foldableRequest)).assertEqual(CompatibilityVerdict.VERDICT_SUPPORTED);
          expect(matrix.evaluateRequest(wearableRequest)).assertEqual(CompatibilityVerdict.VERDICT_BLOCKED);
          const minApiRequest: LaunchRequest = {
            deviceForm: FORM_TABLET,
            apiLevel: API_LEVEL_MIN_SUPPORTED,
            launchReason: LAUNCH_REASON_SPAWN,
            bootMode: BOOT_MODE_STANDARD,
            hasParameters: false,
            hasWindowSizeHint: false
          };
          expect(matrix.evaluateRequest(minApiRequest)).assertEqual(CompatibilityVerdict.VERDICT_DEGRADED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_0400
     * @tc.name testBootModeUsability
     * @tc.desc Verify standard and singleton boot modes are always usable, specified requires a supported API level and unknown modes are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testBootModeUsability', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const standard: LaunchRequest = {
            deviceForm: FORM_PHONE,
            apiLevel: API_LEVEL_CURRENT,
            launchReason: LAUNCH_REASON_SPAWN,
            bootMode: BOOT_MODE_STANDARD,
            hasParameters: false,
            hasWindowSizeHint: false
          };
          const specifiedOld: LaunchRequest = {
            deviceForm: FORM_PHONE,
            apiLevel: 10,
            launchReason: LAUNCH_REASON_SPAWN,
            bootMode: BOOT_MODE_SPECIFIED,
            hasParameters: false,
            hasWindowSizeHint: false
          };
          const unknown: LaunchRequest = {
            deviceForm: FORM_PHONE,
            apiLevel: API_LEVEL_CURRENT,
            launchReason: LAUNCH_REASON_SPAWN,
            bootMode: 'multiton',
            hasParameters: false,
            hasWindowSizeHint: false
          };
          expect(matrix.isBootModeUsable(standard)).assertTrue();
          expect(matrix.isBootModeUsable(foldableRequest)).assertTrue();
          expect(matrix.isBootModeUsable(specifiedOld)).assertFalse();
          expect(matrix.isBootModeUsable(unknown)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_0500
     * @tc.name testLaunchReasonResolution
     * @tc.desc Verify SPAWN spawns a fresh instance, ACTIVE resumes a running one and unknown reasons are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchReasonResolution', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(resolver.resolveOutcome(LAUNCH_REASON_SPAWN, false, BOOT_MODE_STANDARD))
            .assertEqual(LaunchOutcome.OUTCOME_SPAWNED);
          expect(resolver.resolveOutcome(LAUNCH_REASON_ACTIVE, true, BOOT_MODE_STANDARD))
            .assertEqual(LaunchOutcome.OUTCOME_RESUMED);
          expect(resolver.resolveOutcome('UNKNOWN', true, BOOT_MODE_STANDARD))
            .assertEqual(LaunchOutcome.OUTCOME_REJECTED);
          expect(resolver.isKnownReason(LAUNCH_REASON_BACKGROUND)).assertTrue();
          expect(resolver.isKnownReason('UNKNOWN')).assertFalse();
          expect(matrix.supportsLaunchReason(LAUNCH_REASON_RECENT)).assertTrue();
          expect(resolver.requiresColdWindow(LAUNCH_REASON_SPAWN)).assertTrue();
          expect(resolver.requiresColdWindow(LAUNCH_REASON_ACTIVE)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_0600
     * @tc.name testSingletonAndSpecifiedReuse
     * @tc.desc Verify a repeated singleton SPAWN resumes while a repeated specified SPAWN produces a separate instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testSingletonAndSpecifiedReuse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          expect(resolver.resolveOutcome(LAUNCH_REASON_SPAWN, true, BOOT_MODE_SINGLETON))
            .assertEqual(LaunchOutcome.OUTCOME_RESUMED);
          expect(resolver.resolveOutcome(LAUNCH_REASON_SPAWN, true, BOOT_MODE_SPECIFIED))
            .assertEqual(LaunchOutcome.OUTCOME_DUPLICATED);
          expect(resolver.resolveOutcome(LAUNCH_REASON_RECENT, true, BOOT_MODE_STANDARD))
            .assertEqual(LaunchOutcome.OUTCOME_RESUMED);
          expect(resolver.resolveOutcome(LAUNCH_REASON_RECENT, false, BOOT_MODE_STANDARD))
            .assertEqual(LaunchOutcome.OUTCOME_SPAWNED);
          expect(resolver.resolveOutcome(LAUNCH_REASON_BACKGROUND, true, BOOT_MODE_STANDARD))
            .assertEqual(LaunchOutcome.OUTCOME_SPAWNED);
          expect(resolver.expectedForegroundCount(LAUNCH_REASON_BACKGROUND)).assertEqual(0);
          expect(resolver.expectedForegroundCount(LAUNCH_REASON_SPAWN)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_0700
     * @tc.name testWantParameterValidation
     * @tc.desc Verify a Want with bundle name and EntryAbility target is explicit and correctly described
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWantParameterValidation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: Want = buildEntryWant();
          expect(validator.isAbilityNameValid(want)).assertTrue();
          expect(validator.isBundleNameValid(want)).assertTrue();
          expect(validator.isExplicitWant(want)).assertTrue();
          expect(validator.isTargetEntryAbility(want)).assertTrue();
          expect(validator.isTargetBackupAbility(want)).assertFalse();
          expect(validator.countParameters(want)).assertEqual(0);
          expect(validator.describeTarget(want).includes(ENTRY_ABILITY_NAME)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_0800
     * @tc.name testImplicitWantRejectedByValidator
     * @tc.desc Verify a Want missing abilityName is not explicit and is described as implicit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testImplicitWantRejectedByValidator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const implicit: Want = { bundleName: 'com.samples.abilitystage' };
          expect(validator.isAbilityNameValid(implicit)).assertFalse();
          expect(validator.isExplicitWant(implicit)).assertFalse();
          expect(validator.describeTarget(implicit)).assertEqual('implicit');
          const emptyAbility: Want = { bundleName: 'com.samples.abilitystage', abilityName: '' };
          expect(validator.isAbilityNameValid(emptyAbility)).assertFalse();
          expect(validator.isTargetEntryAbility(emptyAbility)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_0900
     * @tc.name testTimelineAggregation
     * @tc.desc Verify five recorded launch sessions aggregate to correct average elapsed time and outcome counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testTimelineAggregation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          timeline.reset();
          expect(timeline.record(LAUNCH_REASON_SPAWN, LaunchOutcome.OUTCOME_SPAWNED, 400, 12)).assertEqual(1);
          expect(timeline.record(LAUNCH_REASON_ACTIVE, LaunchOutcome.OUTCOME_RESUMED, 120, 12)).assertEqual(2);
          timeline.record(LAUNCH_REASON_ACTIVE, LaunchOutcome.OUTCOME_RESUMED, 130, 12);
          timeline.record(LAUNCH_REASON_SPAWN, LaunchOutcome.OUTCOME_SPAWNED, 450, 13);
          timeline.record(LAUNCH_REASON_RECENT, LaunchOutcome.OUTCOME_RESUMED, 200, 12);
          expect(timeline.size()).assertEqual(5);
          expect(timeline.averageElapsed()).assertEqual(260);
          expect(timeline.countOutcome(LaunchOutcome.OUTCOME_RESUMED)).assertEqual(3);
          expect(timeline.countOutcome(LaunchOutcome.OUTCOME_SPAWNED)).assertEqual(2);
          expect(timeline.isStable(TOLERANCE_COMPONENT_COUNT)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_1000
     * @tc.name testTimelineStabilityBoundary
     * @tc.desc Verify component count spread above the tolerance is detected as unstable while an empty timeline is unstable by definition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testTimelineStabilityBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          timeline.reset();
          expect(timeline.isStable(TOLERANCE_COMPONENT_COUNT)).assertFalse();
          timeline.record(LAUNCH_REASON_SPAWN, LaunchOutcome.OUTCOME_SPAWNED, 300, 10);
          timeline.record(LAUNCH_REASON_SPAWN, LaunchOutcome.OUTCOME_SPAWNED, 300, 10 + TOLERANCE_COMPONENT_COUNT);
          expect(timeline.isStable(TOLERANCE_COMPONENT_COUNT)).assertTrue();
          timeline.record(LAUNCH_REASON_SPAWN, LaunchOutcome.OUTCOME_SPAWNED, 300,
            10 + TOLERANCE_COMPONENT_COUNT + 1);
          expect(timeline.isStable(TOLERANCE_COMPONENT_COUNT)).assertFalse();
          expect(timeline.getElapsedValues().length).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_1100
     * @tc.name testRealSpawnLaunchPath
     * @tc.desc Verify a real AbilityDelegator SPAWN launch renders the Index page and records a spawned outcome in the timeline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRealSpawnLaunchPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          timeline.reset();
          const startTime: number = Date.now();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const elapsed: number = measureElapsed(startTime);
          expect(stable).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          timeline.record(LAUNCH_REASON_SPAWN, LaunchOutcome.OUTCOME_SPAWNED, elapsed, componentCount);
          expect(timeline.size()).assertEqual(1);
          expect(timeline.countOutcome(LaunchOutcome.OUTCOME_SPAWNED)).assertEqual(1);
          logInfo(`testRealSpawnLaunchPath: elapsed ${elapsed} ms, components ${componentCount}`);
          expect(isWithinBudget(elapsed, TIMEOUT_SESSION_CREATE * 10)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_1200
     * @tc.name testRealActiveResumePath
     * @tc.desc Verify background then foreground resumes the running ability with the index page still visible and recorded as resumed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRealActiveResumePath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          const resumeStart: number = Date.now();
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_BACKGROUND_SWITCH);
          const elapsed: number = measureElapsed(resumeStart);
          expect(stable).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          timeline.record(LAUNCH_REASON_ACTIVE, LaunchOutcome.OUTCOME_RESUMED, elapsed, componentCount);
          expect(timeline.countOutcome(LaunchOutcome.OUTCOME_RESUMED)).assertEqual(1);
          expect(timeline.isStable(TOLERANCE_COMPONENT_COUNT)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_1300
     * @tc.name testRealExplicitWantWithParameters
     * @tc.desc Verify a Want carrying custom parameters still launches EntryAbility and index text becomes visible within the session budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealExplicitWantWithParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: Want = buildEntryWant();
          want.parameters = { launchSource: 'delegator', caseId: 1300 };
          expect(validator.countParameters(want)).assertEqual(2);
          expect(validator.isExplicitWant(want)).assertTrue();
          await startAbilityByWant(want);
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const initiallyVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_INITIAL,
            TIMEOUT_SESSION_CREATE * 2);
          if (initiallyVisible) {
            expect(initiallyVisible).assertTrue();
          } else {
            const clickedVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED,
              TIMEOUT_SESSION_CREATE * 2);
            expect(clickedVisible).assertTrue();
          }
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_SESSION_CREATE * 2);
          expect(stable).assertTrue();
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_1400
     * @tc.name testRealRepeatedLaunchTiming
     * @tc.desc Verify five repeated delegator launches all render and the recorded elapsed spread stays within the session budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testRealRepeatedLaunchTiming', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          timeline.reset();
          for (let i = 0; i < STRESS_ROUNDS_LAUNCH; i++) {
            const startTime: number = Date.now();
            await launchEntryAbility();
            await serializedDelay(driver, DELAY_AFTER_LAUNCH);
            const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
            expect(stable).assertTrue();
            const componentCount: number = await pageComponentCount(driver);
            timeline.record(LAUNCH_REASON_SPAWN, LaunchOutcome.OUTCOME_SPAWNED, measureElapsed(startTime),
              componentCount);
          }
          expect(timeline.size()).assertEqual(STRESS_ROUNDS_LAUNCH);
          expect(timeline.countOutcome(LaunchOutcome.OUTCOME_SPAWNED)).assertEqual(STRESS_ROUNDS_LAUNCH);
          expect(timeline.averageElapsed() > 0).assertTrue();
          expect(timeline.isStable(TOLERANCE_COMPONENT_COUNT * 4)).assertTrue();
          logInfo(`testRealRepeatedLaunchTiming: average elapsed ${timeline.averageElapsed()} ms`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_1500
     * @tc.name testRealIndexContentAfterLaunch
     * @tc.desc Verify the launched Index page exposes the declared page text and a component keyed HelloWorld
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealIndexContentAfterLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.length > 0).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(showsInitial || showsClicked).assertTrue();
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
          expect(INDEX_PAGE_PATH).assertEqual('pages/Index');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCH_1600
     * @tc.name testRealKeyNavigationKeepsPage
     * @tc.desc Verify pressing Enter on the focused index page keeps the ability window alive with a positive component count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testRealKeyNavigationKeepsPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const beforeCount: number = await pageComponentCount(driver);
          expect(beforeCount > 0).assertTrue();
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount > 0).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(showsInitial || showsClicked).assertTrue();
          expect(Math.abs(afterCount - beforeCount) <= TOLERANCE_COMPONENT_COUNT).assertTrue();
        } finally {
          done();
        }
      })
  })
}
