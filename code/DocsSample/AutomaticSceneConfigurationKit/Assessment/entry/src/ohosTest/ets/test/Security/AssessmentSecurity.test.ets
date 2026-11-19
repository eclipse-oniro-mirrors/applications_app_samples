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
  ID_BUNDLE_INPUT,
  ID_ADD_BUTTON,
  ID_BEGIN_BUTTON,
  TEXT_WHITELIST_EMPTY,
  KEY_BACK,
  TIMEOUT_PAGE_TRANSITION,
  TEST_BUNDLE_PRIMARY,
  TEST_BUNDLE_SECONDARY,
  TEST_BUNDLE_TERTIARY,
  TEST_BUNDLE_INVALID,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  addAllowedApp,
  allowedAppRowCount,
  removeFirstAllowedApp,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Whitelist limits of the assessment service.
const MAX_ALLOWED_APPS: number = 20;
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';

// Hardening measures that the exam page applies itself, the assessment service does not cover
// the window form, the capture of the window, the pasteboard or the input method panel.
const HARDENING_PRIVACY_MODE: string = 'window_privacy_mode';
const HARDENING_CAPTURE_BLOCKED: string = 'capture_blocked';
const HARDENING_PASTEBOARD_CLEARED: string = 'pasteboard_cleared';
const HARDENING_SIMPLE_KEYBOARD: string = 'simple_keyboard';
const HARDENING_FULLSCREEN_LAYOUT: string = 'fullscreen_layout';

// Permissions that gate the assessment APIs and the privacy mode of the exam window.
const PERMISSION_ASSESSMENT: string = 'ohos.permission.ASSESSMENT_CONFIGURATION';
const PERMISSION_PRIVACY_WINDOW: string = 'ohos.permission.PRIVACY_WINDOW';

// Grant metadata of the two permissions, a system granted permission of the system_basic level
// cannot be revoked by the user at runtime.
const GRANT_MODE_SYSTEM: string = 'system_grant';
const AVAILABLE_LEVEL_SYSTEM_BASIC: string = 'system_basic';

// Business error codes that a denied call reports.
const CODE_PERMISSION_DENIED: number = 201;
const CODE_CAPABILITY_NOT_SUPPORT: number = 801;
const CODE_OK: number = 0;

// Number of entries used by the tamper cases.
const TAMPER_ROUNDS: number = 100;

/**
 * Kinds of protected data of the exam session.
 */
enum ProtectedAsset {
  PASTEBOARD = 'pasteboard',
  SCREEN_CAPTURE = 'screen_capture',
  WINDOW_CONTENT = 'window_content',
  INPUT_METHOD = 'input_method',
  WHITELIST = 'whitelist'
}

/**
 * State of one hardening measure on the exam page.
 */
enum HardeningState {
  NOT_APPLIED = 'not_applied',
  APPLIED = 'applied',
  RELEASED = 'released',
  FAILED = 'failed'
}

/**
 * Outcome of a permission check.
 */
enum PermissionOutcome {
  GRANTED = 0,
  DENIED = 1,
  UNSUPPORTED = 2
}

/**
 * One hardening measure with its owner and its protected asset.
 */
interface HardeningMeasure {
  id: string;
  asset: ProtectedAsset;
  appliedOnAppear: boolean;
  releasedOnDisappear: boolean;
  requiresPermission: boolean;
}

/**
 * Outcome of a single whitelist admission check.
 */
interface AdmissionResult {
  accepted: boolean;
  bundleName: string;
  reason: string;
  leaked: boolean;
}

/**
 * Model of the whitelist of the assessment configuration.
 *
 * The whitelist is an app name allow list: every entry is a bundle name that the assessment
 * service allows to keep running. The model reproduces the three guards of Index.addAllowedApp
 * and the removal of Index.removeAllowedApp, and it records whether a rejection message leaked
 * the rejected bundle name.
 */
class WhitelistGuard {
  private entries: string[] = [];
  private rejections: number = 0;
  private leaks: number = 0;
  private lastReason: string = '';

  constructor(initial: string[] = []) {
    this.entries = initial.slice();
  }

  public admit(bundleName: string): AdmissionResult {
    const trimmed: string = bundleName.trim();
    if (trimmed.length === 0) {
      this.rejections++;
      this.lastReason = 'the bundle name is empty';
      return this.result(false, trimmed, this.lastReason);
    }
    if (!WhitelistGuard.isBundleNameValid(trimmed)) {
      this.rejections++;
      this.lastReason = 'the bundle name does not match the bundle name pattern';
      return this.result(false, trimmed, this.lastReason);
    }
    if (this.entries.indexOf(trimmed) >= 0) {
      this.rejections++;
      this.lastReason = 'the bundle name is already in the whitelist';
      return this.result(false, trimmed, this.lastReason);
    }
    if (this.entries.length >= MAX_ALLOWED_APPS) {
      this.rejections++;
      this.lastReason = 'the whitelist is full';
      return this.result(false, trimmed, this.lastReason);
    }
    this.entries.push(trimmed);
    return this.result(true, trimmed, 'the bundle name is admitted');
  }

  public remove(bundleName: string): boolean {
    const index: number = this.entries.indexOf(bundleName);
    if (index < 0) {
      return false;
    }
    const next: string[] = this.entries.slice();
    next.splice(index, 1);
    this.entries = next;
    return true;
  }

  public contains(bundleName: string): boolean {
    return this.entries.indexOf(bundleName) >= 0;
  }

  public getEntries(): string[] {
    return this.entries.slice();
  }

  public size(): number {
    return this.entries.length;
  }

  public isEmpty(): boolean {
    return this.entries.length === 0;
  }

  public getRejections(): number {
    return this.rejections;
  }

  public getLeaks(): number {
    return this.leaks;
  }

  public getLastReason(): string {
    return this.lastReason;
  }

  public isFull(): boolean {
    return this.entries.length >= MAX_ALLOWED_APPS;
  }

  public allUnique(): boolean {
    const unique: Set<string> = new Set<string>(this.entries);
    return unique.size === this.entries.length;
  }

  private result(accepted: boolean, bundleName: string, reason: string): AdmissionResult {
    const leaked: boolean = !accepted && reason.indexOf(bundleName) >= 0 && bundleName.length > 0;
    if (leaked) {
      this.leaks++;
    }
    return {
      accepted: accepted,
      bundleName: bundleName,
      reason: reason,
      leaked: leaked
    };
  }

  // The bundle name pattern of the service: at least two dot separated segments, every segment
  // is made of letters, digits and underscores and never starts with a digit.
  public static isBundleNameValid(bundleName: string): boolean {
    const segments: string[] = bundleName.split('.');
    if (segments.length < 2) {
      return false;
    }
    for (let i = 0; i < segments.length; i++) {
      const segment: string = segments[i];
      if (segment.length === 0) {
        return false;
      }
      const first: number = segment.charCodeAt(0);
      if (first >= 48 && first <= 57) {
        return false;
      }
      for (let j = 0; j < segment.length; j++) {
        const code: number = segment.charCodeAt(j);
        const digit: boolean = code >= 48 && code <= 57;
        const upper: boolean = code >= 65 && code <= 90;
        const lower: boolean = code >= 97 && code <= 122;
        const underscore: boolean = code === 95;
        if (!digit && !upper && !lower && !underscore) {
          return false;
        }
      }
    }
    return true;
  }

  public static isReservedName(bundleName: string): boolean {
    return bundleName === 'com.samples.assessment' || bundleName === 'ohos.systemui' ||
      bundleName === 'com.ohos.settings';
  }
}

/**
 * Model of the hardening of the exam page.
 *
 * ExamHardeningUtil applies five measures when the exam page appears and releases them when it
 * disappears. The model keeps the state of every measure and checks that no measure stays
 * applied after the release phase, which would leave the device in a hardened state.
 */
class HardeningModel {
  private measures: HardeningMeasure[] = [];
  private states: Map<string, HardeningState> = new Map<string, HardeningState>();
  private applyCount: number = 0;
  private releaseCount: number = 0;
  private failMeasure: string = '';

  constructor() {
    this.measures = [
      {
        id: HARDENING_PASTEBOARD_CLEARED,
        asset: ProtectedAsset.PASTEBOARD,
        appliedOnAppear: true,
        releasedOnDisappear: true,
        requiresPermission: false
      },
      {
        id: HARDENING_PRIVACY_MODE,
        asset: ProtectedAsset.WINDOW_CONTENT,
        appliedOnAppear: true,
        releasedOnDisappear: true,
        requiresPermission: true
      },
      {
        id: HARDENING_CAPTURE_BLOCKED,
        asset: ProtectedAsset.SCREEN_CAPTURE,
        appliedOnAppear: true,
        releasedOnDisappear: true,
        requiresPermission: true
      },
      {
        id: HARDENING_SIMPLE_KEYBOARD,
        asset: ProtectedAsset.INPUT_METHOD,
        appliedOnAppear: true,
        releasedOnDisappear: true,
        requiresPermission: false
      },
      {
        id: HARDENING_FULLSCREEN_LAYOUT,
        asset: ProtectedAsset.WINDOW_CONTENT,
        appliedOnAppear: true,
        releasedOnDisappear: true,
        requiresPermission: false
      }
    ];
    for (let i = 0; i < this.measures.length; i++) {
      this.states.set(this.measures[i].id, HardeningState.NOT_APPLIED);
    }
  }

  public applyAll(): number {
    this.applyCount++;
    let applied: number = 0;
    for (let i = 0; i < this.measures.length; i++) {
      const measure: HardeningMeasure = this.measures[i];
      if (measure.id === this.failMeasure) {
        this.states.set(measure.id, HardeningState.FAILED);
        continue;
      }
      this.states.set(measure.id, HardeningState.APPLIED);
      applied++;
    }
    return applied;
  }

  public releaseAll(): number {
    this.releaseCount++;
    let released: number = 0;
    for (let i = 0; i < this.measures.length; i++) {
      const measure: HardeningMeasure = this.measures[i];
      if (this.states.get(measure.id) === HardeningState.APPLIED) {
        this.states.set(measure.id, HardeningState.RELEASED);
        released++;
      }
    }
    return released;
  }

  public failNextMeasure(id: string): void {
    this.failMeasure = id;
  }

  public stateOf(id: string): HardeningState {
    const state: HardeningState | undefined = this.states.get(id);
    return state === undefined ? HardeningState.NOT_APPLIED : state;
  }

  public isApplied(id: string): boolean {
    return this.stateOf(id) === HardeningState.APPLIED;
  }

  public anyApplied(): boolean {
    for (let i = 0; i < this.measures.length; i++) {
      if (this.states.get(this.measures[i].id) === HardeningState.APPLIED) {
        return true;
      }
    }
    return false;
  }

  public appliedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.measures.length; i++) {
      if (this.states.get(this.measures[i].id) === HardeningState.APPLIED) {
        count++;
      }
    }
    return count;
  }

  public measuresFor(asset: ProtectedAsset): HardeningMeasure[] {
    const result: HardeningMeasure[] = [];
    for (let i = 0; i < this.measures.length; i++) {
      if (this.measures[i].asset === asset) {
        result.push(this.measures[i]);
      }
    }
    return result;
  }

  public isAssetCovered(asset: ProtectedAsset): boolean {
    const matching: HardeningMeasure[] = this.measuresFor(asset);
    if (matching.length === 0) {
      return false;
    }
    for (let i = 0; i < matching.length; i++) {
      if (!this.isApplied(matching[i].id)) {
        return false;
      }
    }
    return true;
  }

  public measureCount(): number {
    return this.measures.length;
  }

  public getApplyCount(): number {
    return this.applyCount;
  }

  public getReleaseCount(): number {
    return this.releaseCount;
  }

  public permissionedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.measures.length; i++) {
      if (this.measures[i].requiresPermission) {
        count++;
      }
    }
    return count;
  }

  public describe(): string {
    return `HardeningModel{applied=${this.appliedCount()}, measures=${this.measures.length}, ` +
      `apply=${this.applyCount}, release=${this.releaseCount}}`;
  }
}

/**
 * Model of the permission gate of the assessment APIs.
 *
 * The two permissions are system granted at the system_basic level, so the user cannot revoke
 * them and the sample never requests them at runtime. The model answers the permission check
 * that the service performs on the caller.
 */
class PermissionGate {
  private granted: Set<string> = new Set<string>();

  constructor() {
    this.granted.add(PERMISSION_ASSESSMENT);
    this.granted.add(PERMISSION_PRIVACY_WINDOW);
  }

  public checkAssessment(): PermissionOutcome {
    if (!this.granted.has(PERMISSION_ASSESSMENT)) {
      return PermissionOutcome.DENIED;
    }
    return PermissionOutcome.GRANTED;
  }

  public checkPrivacyWindow(): PermissionOutcome {
    if (!this.granted.has(PERMISSION_PRIVACY_WINDOW)) {
      return PermissionOutcome.DENIED;
    }
    return PermissionOutcome.GRANTED;
  }

  public check(capabilityAvailable: boolean): PermissionOutcome {
    if (!capabilityAvailable) {
      return PermissionOutcome.UNSUPPORTED;
    }
    return this.checkAssessment();
  }

  public revoke(permission: string): void {
    this.granted.delete(permission);
  }

  public restore(permission: string): void {
    this.granted.add(permission);
  }

  public isGranted(permission: string): boolean {
    return this.granted.has(permission);
  }

  public grantedCount(): number {
    return this.granted.size;
  }

  public codeOf(outcome: PermissionOutcome): number {
    if (outcome === PermissionOutcome.GRANTED) {
      return CODE_OK;
    }
    if (outcome === PermissionOutcome.DENIED) {
      return CODE_PERMISSION_DENIED;
    }
    return CODE_CAPABILITY_NOT_SUPPORT;
  }

  public isSystemGranted(permission: string): boolean {
    return permission === PERMISSION_ASSESSMENT || permission === PERMISSION_PRIVACY_WINDOW;
  }
}

/**
 * Checks the error strings that the sample renders for secret leaks.
 *
 * The error text must never contain a bundle name of a non whitelisted application, a file
 * path, a stack frame or a token. The sanitizer lists the patterns and rewrites the text so
 * that the dialog and the toast stay free of internal identifiers.
 */
class SecretLeakGuard {
  private patterns: string[] = ['com.', '/data/', 'at ', '.ets:', 'token', 'secret', 'password'];
  private redacted: number = 0;

  public leaks(text: string): string[] {
    const found: string[] = [];
    for (let i = 0; i < this.patterns.length; i++) {
      if (text.indexOf(this.patterns[i]) >= 0) {
        found.push(this.patterns[i]);
      }
    }
    return found;
  }

  public isClean(text: string): boolean {
    return this.leaks(text).length === 0;
  }

  public sanitize(text: string): string {
    let result: string = text;
    for (let i = 0; i < this.patterns.length; i++) {
      const pattern: string = this.patterns[i];
      let index: number = result.indexOf(pattern);
      while (index >= 0) {
        result = result.slice(0, index) + '[redacted]' + result.slice(index + pattern.length);
        this.redacted++;
        index = result.indexOf(pattern, index + '[redacted]'.length);
      }
    }
    return result;
  }

  public getRedacted(): number {
    return this.redacted;
  }

  public patternCount(): number {
    return this.patterns.length;
  }

  public errorTextOf(code: number): string {
    if (code === CODE_PERMISSION_DENIED) {
      return 'the caller is not allowed to change the assessment configuration';
    }
    if (code === CODE_CAPABILITY_NOT_SUPPORT) {
      return 'the device does not support the assessment configuration';
    }
    if (code === 3) {
      return 'the assessment service failed';
    }
    return 'the assessment call failed';
  }
}

/**
 * Checks whether a bundle name is admitted by the whitelist guard.
 *
 * @param guard guard to query.
 * @param bundleName bundle name to check.
 * @returns true when the guard admits the bundle name.
 */
function admits(guard: WhitelistGuard, bundleName: string): boolean {
  return guard.admit(bundleName).accepted;
}

/**
 * Evaluates a predicate over the hardening measure identifiers.
 *
 * @param predicate condition evaluated for one measure identifier.
 * @returns true when the predicate holds for every measure identifier.
 */
function holdsForEveryMeasure(predicate: (id: string) => boolean): boolean {
  const ids: string[] = [
    HARDENING_PASTEBOARD_CLEARED,
    HARDENING_PRIVACY_MODE,
    HARDENING_CAPTURE_BLOCKED,
    HARDENING_SIMPLE_KEYBOARD,
    HARDENING_FULLSCREEN_LAYOUT
  ];
  for (let i = 0; i < ids.length; i++) {
    if (!predicate(ids[i])) {
      return false;
    }
  }
  return true;
}

export default function assessmentSecurityTest() {
  describe('AssessmentSecurity_Test', () => {
    let driver: Driver;
    let gate: PermissionGate;
    let leakGuard: SecretLeakGuard;

    beforeAll(async () => {
      driver = getDriver();
      gate = new PermissionGate();
      leakGuard = new SecretLeakGuard();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the whitelist guard of the sample.
     * Expectation: the default entry is admitted and a second distinct bundle name is admitted
     * as well.
     */
    it('Assessment_WhitelistAdmitsValidNames_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistAdmitsValidNames_001, begin');
      const local: WhitelistGuard = new WhitelistGuard();
      expect(admits(local, TEST_BUNDLE_PRIMARY)).assertTrue();
      expect(admits(local, TEST_BUNDLE_SECONDARY)).assertTrue();
      expect(admits(local, TEST_BUNDLE_TERTIARY)).assertTrue();
      expect(local.size()).assertEqual(3);
      expect(local.getRejections()).assertEqual(0);
      expect(local.allUnique()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistAdmitsValidNames_001, end');
    });

    /**
     * Scenario: the whitelist guard rejects a malformed bundle name.
     * Expectation: a name without a dot, a name with a hyphen and a name with a leading digit
     * segment are all rejected.
     */
    it('Assessment_WhitelistRejectsMalformedNames_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRejectsMalformedNames_002, begin');
      const local: WhitelistGuard = new WhitelistGuard();
      expect(admits(local, TEST_BUNDLE_INVALID)).assertFalse();
      expect(admits(local, 'com.samples-assessment')).assertFalse();
      expect(admits(local, 'com.1sample')).assertFalse();
      expect(admits(local, 'com..reader')).assertFalse();
      expect(admits(local, '   ')).assertFalse();
      expect(local.size()).assertEqual(0);
      expect(local.getRejections()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRejectsMalformedNames_002, end');
    });

    /**
     * Scenario: the whitelist guard rejects a duplicate entry.
     * Expectation: a bundle name that is already admitted is rejected without growing the list.
     */
    it('Assessment_WhitelistRejectsDuplicate_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRejectsDuplicate_003, begin');
      const local: WhitelistGuard = new WhitelistGuard();
      expect(admits(local, TEST_BUNDLE_PRIMARY)).assertTrue();
      const second: AdmissionResult = local.admit(TEST_BUNDLE_PRIMARY);
      expect(second.accepted).assertFalse();
      expect(second.reason).assertContain('already');
      expect(local.size()).assertEqual(1);
      expect(local.allUnique()).assertTrue();
      expect(local.getRejections()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRejectsDuplicate_003, end');
    });

    /**
     * Scenario: the whitelist guard enforces the twenty entry cap.
     * Expectation: the twentieth entry is admitted, the twenty first is rejected because the
     * list is full.
     */
    it('Assessment_WhitelistEnforcesCap_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistEnforcesCap_004, begin');
      const local: WhitelistGuard = new WhitelistGuard();
      let admitted: number = 0;
      for (let i = 0; i < MAX_ALLOWED_APPS; i++) {
        if (admits(local, `com.samples.app${i}`)) {
          admitted++;
        }
      }
      expect(admitted).assertEqual(MAX_ALLOWED_APPS);
      expect(local.isFull()).assertTrue();
      const overflow: AdmissionResult = local.admit('com.samples.extra');
      expect(overflow.accepted).assertFalse();
      expect(overflow.reason).assertContain('full');
      expect(local.size()).assertEqual(MAX_ALLOWED_APPS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistEnforcesCap_004, end');
    });

    /**
     * Scenario: the removal of a whitelist entry.
     * Expectation: a present entry is removed, an absent entry answers false and the list stays
     * consistent.
     */
    it('Assessment_WhitelistRemoval_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRemoval_005, begin');
      const local: WhitelistGuard = new WhitelistGuard([TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      expect(local.remove(TEST_BUNDLE_PRIMARY)).assertTrue();
      expect(local.contains(TEST_BUNDLE_PRIMARY)).assertFalse();
      expect(local.contains(TEST_BUNDLE_SECONDARY)).assertTrue();
      expect(local.size()).assertEqual(1);
      expect(local.remove(TEST_BUNDLE_PRIMARY)).assertFalse();
      expect(local.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRemoval_005, end');
    });

    /**
     * Scenario: the guard trims the surrounding whitespace of a name.
     * Expectation: a padded valid name is admitted under its trimmed form, so the stored list
     * never carries whitespace.
     */
    it('Assessment_WhitelistTrimsInput_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistTrimsInput_006, begin');
      const local: WhitelistGuard = new WhitelistGuard();
      const result: AdmissionResult = local.admit(`  ${TEST_BUNDLE_PRIMARY}  `);
      expect(result.accepted).assertTrue();
      expect(result.bundleName).assertEqual(TEST_BUNDLE_PRIMARY);
      expect(local.getEntries()[0]).assertEqual(TEST_BUNDLE_PRIMARY);
      expect(local.getEntries()[0].length).assertEqual(TEST_BUNDLE_PRIMARY.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistTrimsInput_006, end');
    });

    /**
     * Scenario: the bundle name pattern of the service.
     * Expectation: dotted, underlined and mixed case names are valid, single segment names and
     * empty segments are not.
     */
    it('Assessment_BundleNamePattern_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleNamePattern_007, begin');
      expect(WhitelistGuard.isBundleNameValid('com.samples.assessment')).assertTrue();
      expect(WhitelistGuard.isBundleNameValid('com.samples.app_1')).assertTrue();
      expect(WhitelistGuard.isBundleNameValid('Com.Samples.Reader')).assertTrue();
      expect(WhitelistGuard.isBundleNameValid('a.b')).assertTrue();
      expect(WhitelistGuard.isBundleNameValid('assessment')).assertFalse();
      expect(WhitelistGuard.isBundleNameValid('com.')).assertFalse();
      expect(WhitelistGuard.isBundleNameValid('.com')).assertFalse();
      expect(WhitelistGuard.isBundleNameValid('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleNamePattern_007, end');
    });

    /**
     * Scenario: the reserved names of the platform.
     * Expectation: the sample and the system applications are recognised as reserved, an
     * arbitrary third party bundle name is not.
     */
    it('Assessment_ReservedBundleNames_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReservedBundleNames_008, begin');
      expect(WhitelistGuard.isReservedName('com.samples.assessment')).assertTrue();
      expect(WhitelistGuard.isReservedName('ohos.systemui')).assertTrue();
      expect(WhitelistGuard.isReservedName('com.ohos.settings')).assertTrue();
      expect(WhitelistGuard.isReservedName(TEST_BUNDLE_SECONDARY)).assertFalse();
      expect(WhitelistGuard.isReservedName('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReservedBundleNames_008, end');
    });

    /**
     * Scenario: a rejection never names the rejected bundle name.
     * Expectation: the reason of every rejection is generic, so the status card cannot disclose
     * the bundle names that the user tried to add.
     */
    it('Assessment_RejectionDoesNotLeakName_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RejectionDoesNotLeakName_009, begin');
      const local: WhitelistGuard = new WhitelistGuard([TEST_BUNDLE_PRIMARY]);
      const results: AdmissionResult[] = [
        local.admit(TEST_BUNDLE_PRIMARY),
        local.admit(TEST_BUNDLE_INVALID),
        local.admit('com.samples-assessment'),
        local.admit('   ')
      ];
      for (let i = 0; i < results.length; i++) {
        expect(results[i].accepted).assertFalse();
        expect(results[i].leaked).assertFalse();
      }
      expect(local.getLeaks()).assertEqual(0);
      expect(local.getLastReason().indexOf(TEST_BUNDLE_INVALID)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RejectionDoesNotLeakName_009, end');
    });

    /**
     * Scenario: the full whitelist rejection.
     * Expectation: the overflow message names the cap but never the rejected bundle name.
     */
    it('Assessment_FullRejectionDoesNotLeakName_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FullRejectionDoesNotLeakName_010, begin');
      const local: WhitelistGuard = new WhitelistGuard();
      for (let i = 0; i < MAX_ALLOWED_APPS; i++) {
        local.admit(`com.samples.app${i}`);
      }
      const overflow: AdmissionResult = local.admit('com.private.banking.app');
      expect(overflow.accepted).assertFalse();
      expect(overflow.leaked).assertFalse();
      expect(overflow.reason.indexOf('com.private.banking.app')).assertEqual(-1);
      expect(leakGuard.isClean(overflow.reason)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FullRejectionDoesNotLeakName_010, end');
    });

    /**
     * Scenario: the hardening measures of the exam page.
     * Expectation: five measures are declared and all of them are applied when the page appears.
     */
    it('Assessment_HardeningAppliedOnAppear_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningAppliedOnAppear_011, begin');
      const local: HardeningModel = new HardeningModel();
      expect(local.measureCount()).assertEqual(5);
      const applied: number = local.applyAll();
      expect(applied).assertEqual(5);
      expect(local.appliedCount()).assertEqual(5);
      expect(local.anyApplied()).assertTrue();
      expect(local.getApplyCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningAppliedOnAppear_011, end');
    });

    /**
     * Scenario: the hardening measures are released when the page disappears.
     * Expectation: no measure stays applied after the release phase.
     */
    it('Assessment_HardeningReleasedOnDisappear_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningReleasedOnDisappear_012, begin');
      const local: HardeningModel = new HardeningModel();
      local.applyAll();
      const released: number = local.releaseAll();
      expect(released).assertEqual(5);
      expect(local.appliedCount()).assertEqual(0);
      expect(local.anyApplied()).assertFalse();
      expect(local.stateOf(HARDENING_PRIVACY_MODE)).assertEqual(HardeningState.RELEASED);
      expect(local.stateOf(HARDENING_SIMPLE_KEYBOARD)).assertEqual(HardeningState.RELEASED);
      expect(local.getReleaseCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningReleasedOnDisappear_012, end');
    });

    /**
     * Scenario: the pasteboard is cleared while the exam page is displayed.
     * Expectation: the pasteboard measure covers the pasteboard asset and is applied on appear.
     */
    it('Assessment_HardeningPasteboard_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningPasteboard_013, begin');
      const local: HardeningModel = new HardeningModel();
      local.applyAll();
      expect(local.isApplied(HARDENING_PASTEBOARD_CLEARED)).assertTrue();
      expect(local.isAssetCovered(ProtectedAsset.PASTEBOARD)).assertTrue();
      const measures: HardeningMeasure[] = local.measuresFor(ProtectedAsset.PASTEBOARD);
      expect(measures.length).assertEqual(1);
      expect(measures[0].appliedOnAppear).assertTrue();
      expect(measures[0].releasedOnDisappear).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningPasteboard_013, end');
    });

    /**
     * Scenario: the window privacy mode protects the exam content.
     * Expectation: the window content asset is covered and the measure requires the privacy
     * window permission.
     */
    it('Assessment_HardeningPrivacyMode_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningPrivacyMode_014, begin');
      const local: HardeningModel = new HardeningModel();
      local.applyAll();
      expect(local.isApplied(HARDENING_PRIVACY_MODE)).assertTrue();
      expect(local.isAssetCovered(ProtectedAsset.WINDOW_CONTENT)).assertTrue();
      const measures: HardeningMeasure[] = local.measuresFor(ProtectedAsset.WINDOW_CONTENT);
      expect(measures.length).assertEqual(2);
      expect(local.permissionedCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningPrivacyMode_014, end');
    });

    /**
     * Scenario: the screen capture restriction of the exam window.
     * Expectation: the capture asset is covered so a screenshot of the paper is refused by the
     * window manager.
     */
    it('Assessment_HardeningCaptureRestriction_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningCaptureRestriction_015, begin');
      const local: HardeningModel = new HardeningModel();
      local.applyAll();
      expect(local.isApplied(HARDENING_CAPTURE_BLOCKED)).assertTrue();
      expect(local.isAssetCovered(ProtectedAsset.SCREEN_CAPTURE)).assertTrue();
      expect(local.isAssetCovered(ProtectedAsset.PASTEBOARD)).assertTrue();
      expect(local.isAssetCovered(ProtectedAsset.INPUT_METHOD)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningCaptureRestriction_015, end');
    });

    /**
     * Scenario: the input method is restricted to the simple keyboard.
     * Expectation: the input method asset is covered by the simple keyboard measure.
     */
    it('Assessment_HardeningImeRestriction_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningImeRestriction_016, begin');
      const local: HardeningModel = new HardeningModel();
      local.applyAll();
      expect(local.isApplied(HARDENING_SIMPLE_KEYBOARD)).assertTrue();
      expect(local.isAssetCovered(ProtectedAsset.INPUT_METHOD)).assertTrue();
      const measures: HardeningMeasure[] = local.measuresFor(ProtectedAsset.INPUT_METHOD);
      expect(measures.length).assertEqual(1);
      expect(measures[0].requiresPermission).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningImeRestriction_016, end');
    });

    /**
     * Scenario: one hardening measure fails.
     * Expectation: the failure is recorded for that measure only and the other measures stay
     * applied, so a single failure does not disable the whole hardening.
     */
    it('Assessment_HardeningPartialFailure_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningPartialFailure_017, begin');
      const local: HardeningModel = new HardeningModel();
      local.failNextMeasure(HARDENING_PRIVACY_MODE);
      const applied: number = local.applyAll();
      expect(applied).assertEqual(4);
      expect(local.stateOf(HARDENING_PRIVACY_MODE)).assertEqual(HardeningState.FAILED);
      expect(local.isApplied(HARDENING_PASTEBOARD_CLEARED)).assertTrue();
      expect(local.isApplied(HARDENING_CAPTURE_BLOCKED)).assertTrue();
      expect(local.isAssetCovered(ProtectedAsset.WINDOW_CONTENT)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningPartialFailure_017, end');
    });

    /**
     * Scenario: the release phase after a partial failure.
     * Expectation: only the applied measures are released, the failed measure stays failed.
     */
    it('Assessment_HardeningReleaseAfterFailure_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningReleaseAfterFailure_018, begin');
      const local: HardeningModel = new HardeningModel();
      local.failNextMeasure(HARDENING_SIMPLE_KEYBOARD);
      local.applyAll();
      const released: number = local.releaseAll();
      expect(released).assertEqual(4);
      expect(local.stateOf(HARDENING_SIMPLE_KEYBOARD)).assertEqual(HardeningState.FAILED);
      expect(local.anyApplied()).assertFalse();
      expect(local.appliedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningReleaseAfterFailure_018, end');
    });

    /**
     * Scenario: a second apply and release cycle of the exam page.
     * Expectation: every measure is re-applied and released again, no state leaks between the
     * two cycles.
     */
    it('Assessment_HardeningRepeatedCycles_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningRepeatedCycles_019, begin');
      const local: HardeningModel = new HardeningModel();
      for (let i = 0; i < 5; i++) {
        expect(local.applyAll()).assertEqual(5);
        expect(local.appliedCount()).assertEqual(5);
        expect(local.releaseAll()).assertEqual(5);
        expect(local.appliedCount()).assertEqual(0);
      }
      expect(local.getApplyCount()).assertEqual(5);
      expect(local.getReleaseCount()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningRepeatedCycles_019, end');
    });

    /**
     * Scenario: the state of every measure after the apply phase.
     * Expectation: every measure is applied, fails only when injected and is released on
     * disappear.
     */
    it('Assessment_HardeningMeasureMatrix_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningMeasureMatrix_020, begin');
      const local: HardeningModel = new HardeningModel();
      local.applyAll();
      expect(holdsForEveryMeasure((id: string) => local.isApplied(id))).assertTrue();
      expect(holdsForEveryMeasure((id: string) =>
        local.stateOf(id) === HardeningState.APPLIED)).assertTrue();
      local.releaseAll();
      expect(holdsForEveryMeasure((id: string) =>
        local.stateOf(id) === HardeningState.RELEASED)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningMeasureMatrix_020, end');
    });

    /**
     * Scenario: the permission gate of the assessment API.
     * Expectation: the assessment permission is granted at install time and the check answers
     * granted.
     */
    it('Assessment_PermissionAssessmentGranted_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PermissionAssessmentGranted_021, begin');
      expect(gate.checkAssessment()).assertEqual(PermissionOutcome.GRANTED);
      expect(gate.codeOf(gate.checkAssessment())).assertEqual(CODE_OK);
      expect(gate.isGranted(PERMISSION_ASSESSMENT)).assertTrue();
      expect(gate.isSystemGranted(PERMISSION_ASSESSMENT)).assertTrue();
      expect(gate.grantedCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PermissionAssessmentGranted_021, end');
    });

    /**
     * Scenario: the privacy window permission of the exam page.
     * Expectation: the permission is granted and the check answers granted, so the privacy mode
     * can be enabled.
     */
    it('Assessment_PermissionPrivacyWindowGranted_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PermissionPrivacyWindowGranted_022, begin');
      expect(gate.checkPrivacyWindow()).assertEqual(PermissionOutcome.GRANTED);
      expect(gate.isGranted(PERMISSION_PRIVACY_WINDOW)).assertTrue();
      expect(gate.isSystemGranted(PERMISSION_PRIVACY_WINDOW)).assertTrue();
      expect(PERMISSION_PRIVACY_WINDOW).assertContain('PRIVACY');
      expect(GRANT_MODE_SYSTEM).assertEqual('system_grant');
      expect(AVAILABLE_LEVEL_SYSTEM_BASIC).assertEqual('system_basic');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PermissionPrivacyWindowGranted_022, end');
    });

    /**
     * Scenario: a permission that an application does not hold.
     * Expectation: the check answers denied and maps onto the permission denied business code.
     */
    it('Assessment_PermissionDeniedCode_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PermissionDeniedCode_023, begin');
      const local: PermissionGate = new PermissionGate();
      local.revoke(PERMISSION_ASSESSMENT);
      expect(local.checkAssessment()).assertEqual(PermissionOutcome.DENIED);
      expect(local.codeOf(local.checkAssessment())).assertEqual(CODE_PERMISSION_DENIED);
      expect(local.codeOf(local.checkAssessment())).assertEqual(201);
      expect(local.isGranted(PERMISSION_ASSESSMENT)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PermissionDeniedCode_023, end');
    });

    /**
     * Scenario: a device without the assessment capability.
     * Expectation: the check answers unsupported and maps onto the capability business code.
     */
    it('Assessment_PermissionUnsupportedCapability_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PermissionUnsupportedCapability_024, begin');
      expect(gate.check(false)).assertEqual(PermissionOutcome.UNSUPPORTED);
      expect(gate.codeOf(PermissionOutcome.UNSUPPORTED)).assertEqual(CODE_CAPABILITY_NOT_SUPPORT);
      expect(gate.codeOf(PermissionOutcome.UNSUPPORTED)).assertEqual(801);
      expect(gate.check(true)).assertEqual(PermissionOutcome.GRANTED);
      expect(gate.isSystemGranted('ohos.permission.INTERNET')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PermissionUnsupportedCapability_024, end');
    });

    /**
     * Scenario: a revoked permission is restored.
     * Expectation: the restore brings the check back to granted, so the sample recovers without
     * a reinstall.
     */
    it('Assessment_PermissionRestore_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PermissionRestore_025, begin');
      const local: PermissionGate = new PermissionGate();
      local.revoke(PERMISSION_PRIVACY_WINDOW);
      expect(local.checkPrivacyWindow()).assertEqual(PermissionOutcome.DENIED);
      local.restore(PERMISSION_PRIVACY_WINDOW);
      expect(local.checkPrivacyWindow()).assertEqual(PermissionOutcome.GRANTED);
      expect(local.grantedCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PermissionRestore_025, end');
    });

    /**
     * Scenario: the error text that the sample renders for a denied call.
     * Expectation: the text describes the denial without naming a bundle or a path.
     */
    it('Assessment_ErrorTextNoSecret_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorTextNoSecret_026, begin');
      const text: string = leakGuard.errorTextOf(CODE_PERMISSION_DENIED);
      expect(leakGuard.isClean(text)).assertTrue();
      expect(leakGuard.leaks(text).length).assertEqual(0);
      expect(text.indexOf('com.')).assertEqual(-1);
      expect(text.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorTextNoSecret_026, end');
    });

    /**
     * Scenario: the error text of every business code.
     * Expectation: all four messages are clean, so no code path leaks an internal identifier.
     */
    it('Assessment_ErrorTextEveryCode_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorTextEveryCode_027, begin');
      const codes: number[] = [CODE_PERMISSION_DENIED, CODE_CAPABILITY_NOT_SUPPORT, 3, 0];
      for (let i = 0; i < codes.length; i++) {
        const text: string = leakGuard.errorTextOf(codes[i]);
        expect(text.length).assertLarger(0);
        expect(leakGuard.isClean(text)).assertTrue();
      }
      expect(leakGuard.patternCount()).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorTextEveryCode_027, end');
    });

    /**
     * Scenario: the leak guard detects a bundle name and a path.
     * Expectation: both patterns are reported and the sanitized text carries neither of them.
     */
    it('Assessment_LeakGuardDetectsAndRedacts_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LeakGuardDetectsAndRedacts_028, begin');
      const dirty: string = 'failed to start com.samples.dictionary from /data/app/el2';
      expect(leakGuard.isClean(dirty)).assertFalse();
      const found: string[] = leakGuard.leaks(dirty);
      expect(found.length).assertEqual(2);
      expect(found.indexOf('com.') >= 0).assertTrue();
      expect(found.indexOf('/data/') >= 0).assertTrue();
      const clean: string = leakGuard.sanitize(dirty);
      expect(leakGuard.isClean(clean)).assertTrue();
      expect(clean).assertContain('[redacted]');
      expect(leakGuard.getRedacted()).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LeakGuardDetectsAndRedacts_028, end');
    });

    /**
     * Scenario: the sanitizer of a clean text.
     * Expectation: the text is returned unchanged and the redaction counter is untouched.
     */
    it('Assessment_LeakGuardCleanTextUntouched_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LeakGuardCleanTextUntouched_029, begin');
      const local: SecretLeakGuard = new SecretLeakGuard();
      const text: string = 'the caller is not allowed to change the assessment configuration';
      expect(local.sanitize(text)).assertEqual(text);
      expect(local.getRedacted()).assertEqual(0);
      expect(local.isClean(text)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LeakGuardCleanTextUntouched_029, end');
    });

    /**
     * Scenario: the tamper resistance of the hardening model.
     * Expectation: a hundred apply and release cycles never leave a measure applied.
     */
    it('Assessment_HardeningTamperResistance_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningTamperResistance_031, begin');
      const local: HardeningModel = new HardeningModel();
      let leaked: number = 0;
      for (let i = 0; i < TAMPER_ROUNDS; i++) {
        local.applyAll();
        local.releaseAll();
        if (local.anyApplied()) {
          leaked++;
        }
      }
      expect(leaked).assertEqual(0);
      expect(local.appliedCount()).assertEqual(0);
      expect(local.getApplyCount()).assertEqual(TAMPER_ROUNDS);
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningTamperResistance_031, end');
    });

    /**
     * Scenario: the sample exposes no plaintext secret.
     * Expectation: the whitelist holds bundle names only and the permission names follow the
     * platform naming scheme.
     */
    it('Assessment_NoPlaintextSecret_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoPlaintextSecret_033, begin');
      const local: WhitelistGuard = new WhitelistGuard([TEST_BUNDLE_PRIMARY]);
      const entries: string[] = local.getEntries();
      for (let i = 0; i < entries.length; i++) {
        expect(WhitelistGuard.isBundleNameValid(entries[i])).assertTrue();
        expect(entries[i].indexOf('=')).assertEqual(-1);
        expect(entries[i].indexOf('token')).assertEqual(-1);
        expect(entries[i].indexOf('secret')).assertEqual(-1);
        expect(entries[i].indexOf('password')).assertEqual(-1);
      }
      expect(PERMISSION_ASSESSMENT.indexOf('ohos.permission.')).assertEqual(0);
      expect(PERMISSION_PRIVACY_WINDOW.indexOf('ohos.permission.')).assertEqual(0);
      expect(DEFAULT_ALLOWED_APP).assertEqual('com.samples.assessment');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoPlaintextSecret_033, end');
    });

    /**
     * Scenario: the description of the hardening model.
     * Expectation: the description names the applied count, the measure count and the two cycle
     * counters.
     */
    it('Assessment_HardeningDescription_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningDescription_034, begin');
      const local: HardeningModel = new HardeningModel();
      expect(local.describe()).assertContain('applied=0');
      expect(local.describe()).assertContain('measures=5');
      local.applyAll();
      expect(local.describe()).assertContain('applied=5');
      expect(local.describe()).assertContain('apply=1');
      const text: string = local.describe();
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HardeningDescription_034, end');
    });
  });
}
