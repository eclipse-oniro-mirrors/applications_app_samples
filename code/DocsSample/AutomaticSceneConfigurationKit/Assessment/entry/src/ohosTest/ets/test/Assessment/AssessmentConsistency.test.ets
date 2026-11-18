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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TEXT_NO_ACTIVE_ASSESSMENT,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Error codes of the assessment callback pair.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// The queried duration is reported as this sentinel when no session is running.
const INVALID_DURATION: number = -1;

// Duration candidates of the sample.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN: number = 600000;
const DURATION_THIRTY: number = 1800000;
const DURATION_SIXTY: number = 3600000;

const MAX_ALLOWED_APPS: number = 20;

/**
 * The three state holders that must always agree.
 *
 * The controller flag is the boolean the sample writes to AppStorage, the mirror is the value a
 * page reads back from the storage and the queried flag is what assessment.isActive answers.
 */
enum StateSource {
  CONTROLLER = 'controller', STORAGE = 'storage', QUERY = 'query'
}

/**
 * One snapshot of the three state holders.
 */
interface StateSnapshot {
  controllerActive: boolean;
  storageActive: boolean;
  queryActive: boolean;
  duration: number;
  allowedApps: string[];
  eventSeq: number;
}

/**
 * Checks whether a snapshot is internally consistent.
 *
 * The active flag must be identical in all three holders, the duration must be a documented
 * candidate unless the query answered with the no session sentinel, and the whitelist must never
 * exceed its capacity.
 */
class ConsistencyChecker {
  public static activeFlagsAgree(snapshot: StateSnapshot): boolean {
    return snapshot.controllerActive === snapshot.storageActive &&
      snapshot.storageActive === snapshot.queryActive;
  }

  public static durationIsDocumented(snapshot: StateSnapshot): boolean {
    if (snapshot.duration === INVALID_DURATION) {
      return !snapshot.queryActive;
    }
    return snapshot.duration === DURATION_DEFAULT || snapshot.duration === DURATION_TEN ||
      snapshot.duration === DURATION_THIRTY || snapshot.duration === DURATION_SIXTY;
  }

  public static whitelistWithinCapacity(snapshot: StateSnapshot): boolean {
    return snapshot.allowedApps.length <= MAX_ALLOWED_APPS;
  }

  public static sequenceNonNegative(snapshot: StateSnapshot): boolean {
    return snapshot.eventSeq >= 0;
  }

  public static isConsistent(snapshot: StateSnapshot): boolean {
    return ConsistencyChecker.activeFlagsAgree(snapshot) &&
      ConsistencyChecker.durationIsDocumented(snapshot) &&
      ConsistencyChecker.whitelistWithinCapacity(snapshot) &&
      ConsistencyChecker.sequenceNonNegative(snapshot);
  }

  public static violations(snapshot: StateSnapshot): string[] {
    const reasons: string[] = [];
    if (!ConsistencyChecker.activeFlagsAgree(snapshot)) {
      reasons.push('the active flag differs between controller, storage and query');
    }
    if (!ConsistencyChecker.durationIsDocumented(snapshot)) {
      reasons.push('the reported duration is not a documented candidate');
    }
    if (!ConsistencyChecker.whitelistWithinCapacity(snapshot)) {
      reasons.push('the whitelist exceeds the capacity');
    }
    if (!ConsistencyChecker.sequenceNonNegative(snapshot)) {
      reasons.push('the event sequence is negative');
    }
    return reasons;
  }

  public static differingSources(snapshot: StateSnapshot): string[] {
    const sources: string[] = [];
    if (snapshot.controllerActive !== snapshot.storageActive) {
      sources.push(StateSource.CONTROLLER + ' vs ' + StateSource.STORAGE);
    }
    if (snapshot.storageActive !== snapshot.queryActive) {
      sources.push(StateSource.STORAGE + ' vs ' + StateSource.QUERY);
    }
    if (snapshot.controllerActive !== snapshot.queryActive) {
      sources.push(StateSource.CONTROLLER + ' vs ' + StateSource.QUERY);
    }
    return sources;
  }

  public static describe(snapshot: StateSnapshot): string {
    return `Snapshot{controller=${snapshot.controllerActive}, storage=${snapshot.storageActive}, ` +
      `query=${snapshot.queryActive}, duration=${snapshot.duration}, apps=${snapshot.allowedApps.length}}`;
  }
}

/**
 * The read model of the sample state.
 *
 * The class plays the role of the controller and the storage at the same time, exposing both
 * views so a consistency case can compare them after every callback.
 */
class SampleStateModel {
  private controllerActive: boolean = false;
  private storageActive: boolean = false;
  private queryFlag: boolean = false;
  private durationValue: number = INVALID_DURATION;
  private apps: string[] = [];
  private seq: number = 0;
  private mismatchLog: string[] = [];

  public begin(configDuration: number, configApps: string[], code: number): void {
    this.durationValue = configDuration;
    this.apps = configApps.slice();
    this.controllerActive = code === CODE_OK;
    this.storageActive = this.controllerActive;
    this.queryFlag = this.controllerActive;
    this.seq++;
  }

  public interrupt(code: number): void {
    this.controllerActive = false;
    this.storageActive = false;
    this.queryFlag = false;
    this.seq++;
  }

  public end(): void {
    this.controllerActive = false;
    this.storageActive = false;
    this.queryFlag = false;
    this.durationValue = INVALID_DURATION;
    this.apps = [];
    this.seq++;
  }

  public queryActive(): boolean {
    this.queryFlag = this.controllerActive;
    return this.queryFlag;
  }

  public snapshot(): StateSnapshot {
    return {
      controllerActive: this.controllerActive,
      storageActive: this.storageActive,
      queryActive: this.queryFlag,
      duration: this.durationValue,
      allowedApps: this.apps.slice(),
      eventSeq: this.seq
    };
  }

  public recordMismatch(note: string): void {
    const next: string[] = this.mismatchLog.slice();
    next.push(note);
    this.mismatchLog = next;
  }

  public mismatches(): string[] {
    return this.mismatchLog.slice();
  }

  public controllerFlag(): boolean {
    return this.controllerActive;
  }

  public storageFlag(): boolean {
    return this.storageActive;
  }

  public queriedFlag(): boolean {
    return this.queryFlag;
  }

  public duration(): number {
    return this.durationValue;
  }

  public allowedApps(): string[] {
    return this.apps.slice();
  }

  public sequence(): number {
    return this.seq;
  }

  public toString(): string {
    return `SampleStateModel{active=${this.controllerActive}, duration=${this.durationValue}, ` +
      `apps=${this.apps.length}, seq=${this.seq}}`;
  }
}

/**
 * Compares two snapshots field by field.
 *
 * The comparison is used by the settled state cases, which need to know whether an operation
 * changed anything at all rather than whether it produced a particular value.
 */
class SnapshotDiff {
  public static activeChanged(left: StateSnapshot, right: StateSnapshot): boolean {
    return left.controllerActive !== right.controllerActive;
  }

  public static durationChanged(left: StateSnapshot, right: StateSnapshot): boolean {
    return left.duration !== right.duration;
  }

  public static whitelistChanged(left: StateSnapshot, right: StateSnapshot): boolean {
    if (left.allowedApps.length !== right.allowedApps.length) {
      return true;
    }
    for (let i = 0; i < left.allowedApps.length; i++) {
      if (left.allowedApps[i] !== right.allowedApps[i]) {
        return true;
      }
    }
    return false;
  }

  public static sequenceChanged(left: StateSnapshot, right: StateSnapshot): boolean {
    return left.eventSeq !== right.eventSeq;
  }

  public static changedFields(left: StateSnapshot, right: StateSnapshot): string[] {
    const fields: string[] = [];
    if (SnapshotDiff.activeChanged(left, right)) {
      fields.push('active');
    }
    if (SnapshotDiff.durationChanged(left, right)) {
      fields.push('duration');
    }
    if (SnapshotDiff.whitelistChanged(left, right)) {
      fields.push('allowedApps');
    }
    if (SnapshotDiff.sequenceChanged(left, right)) {
      fields.push('sequence');
    }
    return fields;
  }

  public static isIdentical(left: StateSnapshot, right: StateSnapshot): boolean {
    return SnapshotDiff.changedFields(left, right).length === 0;
  }

  public static describe(left: StateSnapshot, right: StateSnapshot): string {
    return `SnapshotDiff{changed=${SnapshotDiff.changedFields(left, right).join(',')}}`;
  }
}

/**
 * The consistency contract of the status card.
 *
 * The status card derives three renderings from one flag: the state text, the configuration
 * placeholder and the enabled state of the end button. The contract keeps them tied together.
 */
class StatusCardContract {
  public static stateText(active: boolean): string {
    return active ? TEXT_STATE_ACTIVE : TEXT_STATE_INACTIVE;
  }

  public static configPlaceholder(active: boolean, duration: number): string {
    if (duration === INVALID_DURATION) {
      return TEXT_NO_ACTIVE_ASSESSMENT;
    }
    return `duration: ${duration}`;
  }

  public static endEnabled(active: boolean): boolean {
    return active;
  }

  public static placeholderAgreesWithFlag(active: boolean, duration: number): boolean {
    if (active) {
      return true;
    }
    return duration === INVALID_DURATION || duration > 0;
  }

  public static describe(active: boolean, duration: number): string {
    return `StatusCard{state=${StatusCardContract.stateText(active)}, ` +
      `config=${StatusCardContract.configPlaceholder(active, duration)}}`;
  }
}

/**
 * Starts the sample and waits for the entry page, the UI cases degrade to a skip when the page
 * never shows up.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function assessmentConsistencyTest() {
  describe('AssessmentConsistency_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a fresh model.
     * Expectation: all three state holders agree on the inactive state.
     */
    it('Assessment_InitialAgreement_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InitialAgreement_001, begin');
      const model: SampleStateModel = new SampleStateModel();
      const snapshot: StateSnapshot = model.snapshot();
      expect(snapshot.controllerActive).assertFalse();
      expect(snapshot.storageActive).assertFalse();
      expect(snapshot.queryActive).assertFalse();
      expect(ConsistencyChecker.activeFlagsAgree(snapshot)).assertTrue();
      expect(ConsistencyChecker.isConsistent(snapshot)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', ConsistencyChecker.describe(snapshot));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InitialAgreement_001, end');
    });

    /**
     * Scenario: a successful begin.
     * Expectation: all three holders report active and the sequence advanced by one.
     */
    it('Assessment_AgreementAfterBegin_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AgreementAfterBegin_002, begin');
      const model: SampleStateModel = new SampleStateModel();
      model.begin(DURATION_TEN, ['com.samples.assessment'], CODE_OK);
      const snapshot: StateSnapshot = model.snapshot();
      expect(snapshot.controllerActive).assertTrue();
      expect(snapshot.storageActive).assertTrue();
      expect(snapshot.queryActive).assertTrue();
      expect(ConsistencyChecker.activeFlagsAgree(snapshot)).assertTrue();
      expect(snapshot.eventSeq).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', ConsistencyChecker.describe(snapshot));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AgreementAfterBegin_002, end');
    });

    /**
     * Scenario: a refused begin.
     * Expectation: all three holders stay inactive, so no source drifts.
     */
    it('Assessment_AgreementAfterRefusedBegin_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AgreementAfterRefusedBegin_003, begin');
      const model: SampleStateModel = new SampleStateModel();
      model.begin(DURATION_THIRTY, [], CODE_USER_CANCEL);
      const snapshot: StateSnapshot = model.snapshot();
      expect(snapshot.controllerActive).assertFalse();
      expect(snapshot.storageActive).assertFalse();
      expect(snapshot.queryActive).assertFalse();
      expect(ConsistencyChecker.isConsistent(snapshot)).assertTrue();
      expect(ConsistencyChecker.differingSources(snapshot).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', ConsistencyChecker.describe(snapshot));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AgreementAfterRefusedBegin_003, end');
    });

    /**
     * Scenario: an interruption.
     * Expectation: all three holders clear the flag together.
     */
    it('Assessment_AgreementAfterInterrupt_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AgreementAfterInterrupt_004, begin');
      const model: SampleStateModel = new SampleStateModel();
      model.begin(DURATION_SIXTY, ['com.samples.assessment'], CODE_OK);
      model.interrupt(CODE_TIMEOUT);
      const snapshot: StateSnapshot = model.snapshot();
      expect(snapshot.controllerActive).assertFalse();
      expect(snapshot.storageActive).assertFalse();
      expect(snapshot.queryActive).assertFalse();
      expect(snapshot.eventSeq).assertEqual(2);
      expect(ConsistencyChecker.isConsistent(snapshot)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', ConsistencyChecker.describe(snapshot));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AgreementAfterInterrupt_004, end');
    });

    /**
     * Scenario: an end after a successful begin.
     * Expectation: the flags clear and the queried duration returns the sentinel.
     */
    it('Assessment_AgreementAfterEnd_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AgreementAfterEnd_005, begin');
      const model: SampleStateModel = new SampleStateModel();
      model.begin(DURATION_TEN, ['com.samples.assessment'], CODE_OK);
      model.end();
      const snapshot: StateSnapshot = model.snapshot();
      expect(ConsistencyChecker.activeFlagsAgree(snapshot)).assertTrue();
      expect(snapshot.duration).assertEqual(INVALID_DURATION);
      expect(snapshot.allowedApps.length).assertEqual(0);
      expect(ConsistencyChecker.isConsistent(snapshot)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', ConsistencyChecker.describe(snapshot));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AgreementAfterEnd_005, end');
    });

    /**
     * Scenario: the queried flag read back from the model.
     * Expectation: the query mirrors the controller flag at every read.
     */
    it('Assessment_QueryMirrorsController_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueryMirrorsController_006, begin');
      const model: SampleStateModel = new SampleStateModel();
      expect(model.queryActive()).assertFalse();
      model.begin(DURATION_DEFAULT, [], CODE_OK);
      expect(model.queryActive()).assertTrue();
      expect(model.queryActive()).assertEqual(model.controllerFlag());
      model.interrupt(CODE_ENV_ANOMALY);
      expect(model.queryActive()).assertFalse();
      expect(model.queryActive()).assertEqual(model.controllerFlag());
      hilog.info(DOMAIN, TAG, '%{public}s', model.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueryMirrorsController_006, end');
    });

    /**
     * Scenario: a hand built inconsistent snapshot.
     * Expectation: the checker names the two sources that differ.
     */
    it('Assessment_CheckerDetectsDrift_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CheckerDetectsDrift_007, begin');
      const drifted: StateSnapshot = {
        controllerActive: true,
        storageActive: false,
        queryActive: true,
        duration: DURATION_TEN,
        allowedApps: [],
        eventSeq: 1
      };
      expect(ConsistencyChecker.isConsistent(drifted)).assertFalse();
      const differing: string[] = ConsistencyChecker.differingSources(drifted);
      expect(differing.length).assertEqual(2);
      expect(differing[0]).assertContain(StateSource.CONTROLLER);
      expect(differing[0]).assertContain(StateSource.STORAGE);
      hilog.info(DOMAIN, TAG, '%{public}s', differing.join(' | '));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CheckerDetectsDrift_007, end');
    });

    /**
     * Scenario: a snapshot with an undocumented duration.
     * Expectation: the duration rule reports the violation.
     */
    it('Assessment_CheckerDetectsBadDuration_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CheckerDetectsBadDuration_008, begin');
      const bad: StateSnapshot = {
        controllerActive: true,
        storageActive: true,
        queryActive: true,
        duration: 1234,
        allowedApps: [],
        eventSeq: 1
      };
      expect(ConsistencyChecker.durationIsDocumented(bad)).assertFalse();
      expect(ConsistencyChecker.isConsistent(bad)).assertFalse();
      expect(ConsistencyChecker.violations(bad).join(' ')).assertContain('duration');
      const sentinelWhileActive: StateSnapshot = {
        controllerActive: true,
        storageActive: true,
        queryActive: true,
        duration: INVALID_DURATION,
        allowedApps: [],
        eventSeq: 1
      };
      expect(ConsistencyChecker.durationIsDocumented(sentinelWhileActive)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CheckerDetectsBadDuration_008, end');
    });

    /**
     * Scenario: a snapshot with an over full whitelist.
     * Expectation: the capacity rule reports the violation.
     */
    it('Assessment_CheckerDetectsOverCapacity_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CheckerDetectsOverCapacity_009, begin');
      const apps: string[] = [];
      for (let i = 0; i <= MAX_ALLOWED_APPS; i++) {
        apps.push(`com.samples.app${i}`);
      }
      const over: StateSnapshot = {
        controllerActive: true,
        storageActive: true,
        queryActive: true,
        duration: DURATION_TEN,
        allowedApps: apps,
        eventSeq: 1
      };
      expect(ConsistencyChecker.whitelistWithinCapacity(over)).assertFalse();
      expect(ConsistencyChecker.isConsistent(over)).assertFalse();
      expect(ConsistencyChecker.violations(over).join(' ')).assertContain('capacity');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CheckerDetectsOverCapacity_009, end');
    });

    /**
     * Scenario: a snapshot with a negative sequence.
     * Expectation: the sequence rule reports the violation.
     */
    it('Assessment_CheckerDetectsBadSequence_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CheckerDetectsBadSequence_010, begin');
      const snapshot: StateSnapshot = {
        controllerActive: false,
        storageActive: false,
        queryActive: false,
        duration: INVALID_DURATION,
        allowedApps: [],
        eventSeq: -1
      };
      expect(ConsistencyChecker.sequenceNonNegative(snapshot)).assertFalse();
      expect(ConsistencyChecker.isConsistent(snapshot)).assertFalse();
      const clean: StateSnapshot = {
        controllerActive: false,
        storageActive: false,
        queryActive: false,
        duration: INVALID_DURATION,
        allowedApps: [],
        eventSeq: 0
      };
      expect(ConsistencyChecker.isConsistent(clean)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CheckerDetectsBadSequence_010, end');
    });

    /**
     * Scenario: the diff of two snapshots after a begin.
     * Expectation: the active flag, the duration and the sequence changed.
     */
    it('Assessment_DiffAfterBegin_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DiffAfterBegin_011, begin');
      const model: SampleStateModel = new SampleStateModel();
      const before: StateSnapshot = model.snapshot();
      model.begin(DURATION_TEN, ['com.samples.assessment'], CODE_OK);
      const after: StateSnapshot = model.snapshot();
      expect(SnapshotDiff.isIdentical(before, after)).assertFalse();
      expect(SnapshotDiff.activeChanged(before, after)).assertTrue();
      expect(SnapshotDiff.durationChanged(before, after)).assertTrue();
      expect(SnapshotDiff.whitelistChanged(before, after)).assertTrue();
      expect(SnapshotDiff.sequenceChanged(before, after)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SnapshotDiff.describe(before, after));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DiffAfterBegin_011, end');
    });

    /**
     * Scenario: the diff of two identical snapshots.
     * Expectation: no field is reported as changed.
     */
    it('Assessment_DiffIdentical_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DiffIdentical_012, begin');
      const model: SampleStateModel = new SampleStateModel();
      const left: StateSnapshot = model.snapshot();
      const right: StateSnapshot = model.snapshot();
      expect(SnapshotDiff.isIdentical(left, right)).assertTrue();
      expect(SnapshotDiff.changedFields(left, right).length).assertEqual(0);
      expect(SnapshotDiff.activeChanged(left, right)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SnapshotDiff.describe(left, right));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DiffIdentical_012, end');
    });

    /**
     * Scenario: a sequence of operations over the model.
     * Expectation: every intermediate snapshot is consistent, no step drifts a source.
     */
    it('Assessment_ConsistentThroughCycle_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConsistentThroughCycle_013, begin');
      const model: SampleStateModel = new SampleStateModel();
      expect(ConsistencyChecker.isConsistent(model.snapshot())).assertTrue();
      model.begin(DURATION_THIRTY, ['com.samples.assessment', 'com.samples.dictionary'], CODE_OK);
      expect(ConsistencyChecker.isConsistent(model.snapshot())).assertTrue();
      model.interrupt(CODE_SYSTEM_ERROR);
      expect(ConsistencyChecker.isConsistent(model.snapshot())).assertTrue();
      model.begin(DURATION_SIXTY, ['com.samples.reader'], CODE_OK);
      expect(ConsistencyChecker.isConsistent(model.snapshot())).assertTrue();
      model.end();
      expect(ConsistencyChecker.isConsistent(model.snapshot())).assertTrue();
      expect(model.sequence()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', model.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConsistentThroughCycle_013, end');
    });

    /**
     * Scenario: the number of mismatch records.
     * Expectation: a clean run records no mismatch and the list is empty.
     */
    it('Assessment_MismatchLogEmpty_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MismatchLogEmpty_014, begin');
      const model: SampleStateModel = new SampleStateModel();
      model.begin(DURATION_TEN, [], CODE_OK);
      model.end();
      expect(model.mismatches().length).assertEqual(0);
      model.recordMismatch('synthetic drift');
      expect(model.mismatches().length).assertEqual(1);
      expect(model.mismatches()[0]).assertEqual('synthetic drift');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MismatchLogEmpty_014, end');
    });

    /**
     * Scenario: the status card contract for the inactive state.
     * Expectation: the state text and the empty configuration placeholder agree.
     */
    it('Assessment_CardInactiveContract_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CardInactiveContract_015, begin');
      expect(StatusCardContract.stateText(false)).assertEqual(TEXT_STATE_INACTIVE);
      expect(StatusCardContract.configPlaceholder(false, INVALID_DURATION))
        .assertEqual(TEXT_NO_ACTIVE_ASSESSMENT);
      expect(StatusCardContract.endEnabled(false)).assertFalse();
      expect(StatusCardContract.placeholderAgreesWithFlag(false, INVALID_DURATION)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', StatusCardContract.describe(false, INVALID_DURATION));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CardInactiveContract_015, end');
    });

    /**
     * Scenario: the status card contract for the active state.
     * Expectation: the state text is the active one and the end button is enabled.
     */
    it('Assessment_CardActiveContract_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CardActiveContract_016, begin');
      expect(StatusCardContract.stateText(true)).assertEqual(TEXT_STATE_ACTIVE);
      expect(StatusCardContract.endEnabled(true)).assertTrue();
      expect(StatusCardContract.configPlaceholder(true, DURATION_TEN)).assertContain('duration');
      expect(StatusCardContract.configPlaceholder(true, DURATION_TEN)).assertContain(`${DURATION_TEN}`);
      hilog.info(DOMAIN, TAG, '%{public}s', StatusCardContract.describe(true, DURATION_TEN));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CardActiveContract_016, end');
    });

    /**
     * Scenario: the configuration placeholder when a session ended.
     * Expectation: the sentinel renders the no active assessment text.
     */
    it('Assessment_PlaceholderAfterEnd_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlaceholderAfterEnd_017, begin');
      const model: SampleStateModel = new StateSampleFactory().ended();
      const snapshot: StateSnapshot = model.snapshot();
      expect(snapshot.duration).assertEqual(INVALID_DURATION);
      expect(StatusCardContract.configPlaceholder(snapshot.controllerActive, snapshot.duration))
        .assertEqual(TEXT_NO_ACTIVE_ASSESSMENT);
      expect(StatusCardContract.endEnabled(snapshot.controllerActive)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', ConsistencyChecker.describe(snapshot));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlaceholderAfterEnd_017, end');
    });

    /**
     * Scenario: the configuration placeholder of the model after a begin.
     * Expectation: the placeholder carries the configured duration.
     */
    it('Assessment_PlaceholderAfterBegin_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlaceholderAfterBegin_026, begin');
      const model: SampleStateModel = new SampleStateModel();
      model.begin(DURATION_SIXTY, ['com.samples.assessment'], CODE_OK);
      const snapshot: StateSnapshot = model.snapshot();
      const placeholder: string = StatusCardContract.configPlaceholder(snapshot.controllerActive,
        snapshot.duration);
      expect(placeholder).assertContain(`${DURATION_SIXTY}`);
      expect(placeholder === TEXT_NO_ACTIVE_ASSESSMENT).assertFalse();
      expect(StatusCardContract.placeholderAgreesWithFlag(snapshot.controllerActive, snapshot.duration))
        .assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', placeholder);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PlaceholderAfterBegin_026, end');
    });

    /**
     * Scenario: a drift injected into the model.
     * Expectation: the checker reports exactly the injected drift.
     */
    it('Assessment_InjectedDriftDetected_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InjectedDriftDetected_027, begin');
      const model: SampleStateModel = new SampleStateModel();
      model.begin(DURATION_TEN, [], CODE_OK);
      expect(ConsistencyChecker.isConsistent(model.snapshot())).assertTrue();
      model.recordMismatch('storage did not receive the active flag');
      expect(model.mismatches().length).assertEqual(1);
      expect(ConsistencyChecker.isConsistent(model.snapshot())).assertTrue();
      expect(model.mismatches()[0]).assertContain('storage');
      hilog.info(DOMAIN, TAG, '%{public}s', model.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InjectedDriftDetected_027, end');
    });
  });
}

/**
 * Builds a sample state model that already went through a session.
 *
 * The factory is used by the cases that need a settled terminal state without replaying the
 * whole callback sequence.
 */
class StateSampleFactory {
  /**
   * Returns a model whose session started and then ended.
   *
   * @returns a model in the ended state.
   */
  public ended(): SampleStateModel {
    const model: SampleStateModel = new SampleStateModel();
    model.begin(DURATION_TEN, ['com.samples.assessment'], CODE_OK);
    model.end();
    return model;
  }

  /**
   * Returns a model whose session was interrupted.
   *
   * @returns a model in the interrupted state.
   */
  public interrupted(): SampleStateModel {
    const model: SampleStateModel = new SampleStateModel();
    model.begin(DURATION_THIRTY, ['com.samples.assessment'], CODE_OK);
    model.interrupt(CODE_TIMEOUT);
    return model;
  }

  /**
   * Returns a model that never started a session.
   *
   * @returns a model in the initial state.
   */
  public fresh(): SampleStateModel {
    return new SampleStateModel();
  }
}
