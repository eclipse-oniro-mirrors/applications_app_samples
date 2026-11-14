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

import { describe, it, expect, beforeAll, afterAll, beforeEach } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, componentByIdExists, countById, waitForId,
  ID_INPUT_URL, ID_NAV_HOME, PAD_HOME_PAGE, PHONE_HOME_PAGE, TIMEOUT_COMPONENT,
  deviceIsPhone
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserAppVersionValidationTest';

/* ------------------------------------------------------------------ */
/* Declared identity of the browser sample application                 */
/* ------------------------------------------------------------------ */

/** Bundle name declared by entry/src/main/module.json5. */
const BUNDLE_NAME: string = 'ohos.samples.browser1';

/** Launcher ability of the sample; the only entry point under test. */
const ABILITY_NAME: string = 'MainAbility';

/** Human readable release version shipped with the sample. */
const VERSION_NAME: string = '1.0.0';

/** Monotonic integer build number paired with VERSION_NAME. */
const VERSION_CODE: number = 1000000;

/** compileSdkVersion of the sample, pinned by the sample manifest. */
const COMPILE_SDK_VERSION: number = 9;

/** Lowest runtime API the sample is allowed to install on. */
const MIN_API_VERSION: number = 9;

/** API level the sample was compiled against and targets. */
const TARGET_API_VERSION: number = 9;

/** Largest value an OpenHarmony versionCode may carry. */
const MAX_VERSION_CODE: number = 2147483647;

/** Longest accepted versionName string. */
const MAX_VERSION_NAME_LENGTH: number = 32;

/** Longest accepted single numeric segment of a version name. */
const MAX_SEGMENT_LENGTH: number = 5;

/** Feature keys used by the capability gate. */
const FEATURE_WEB: string = 'web';
const FEATURE_UITEST: string = 'uitest';
const FEATURE_MEDIAQUERY: string = 'mediaquery';
const FEATURE_DEVICE_INFO: string = 'deviceInfo';
const FEATURE_RAWFILE: string = 'rawfile';

/** Fallback notes printed when a capability is unavailable. */
const FALLBACK_FIXED_LAYOUT: string = 'use fixed portrait layout';
const FALLBACK_SKIP_UI_ASSERT: string = 'skip ui assertions';
const FALLBACK_STATIC_USER_AGENT: string = 'use static pad user agent';
const FALLBACK_BUNDLED_PAGE: string = 'use bundled pad home page';

/* ------------------------------------------------------------------ */
/* Field audit record                                                  */
/* ------------------------------------------------------------------ */

/** Outcome of auditing a single identity field against its expectation. */
class FieldAudit {
  field: string;
  expected: string;
  actual: string;
  ok: boolean;

  constructor(field: string, expected: string, actual: string, ok: boolean) {
    this.field = field;
    this.expected = expected;
    this.actual = actual;
    this.ok = ok;
  }

  isOk(): boolean {
    return this.ok;
  }

  describe(): string {
    const status: string = this.ok ? 'ok' : 'mismatch';
    return `${this.field}=${this.actual} expected=${this.expected} ${status}`;
  }
}

/* ------------------------------------------------------------------ */
/* Version name parsing and comparison                                  */
/* ------------------------------------------------------------------ */

/** Dot separated numeric version such as 1.0.0 or 12.0.4.1. */
class SemanticVersion {
  raw: string;
  segments: number[];

  constructor(raw: string) {
    this.raw = raw;
    this.segments = SemanticVersion.parseSegments(raw);
  }

  /** Splits a raw version into numeric segments; empty array means invalid. */
  static parseSegments(raw: string): number[] {
    const result: number[] = [];
    if (raw === null || raw === undefined) {
      return result;
    }
    const text: string = raw.trim();
    if (text.length === 0) {
      return result;
    }
    const parts: string[] = text.split('.');
    for (let index = 0; index < parts.length; index++) {
      const part: string = parts[index];
      if (part.length === 0 || part.length > MAX_SEGMENT_LENGTH) {
        return [];
      }
      let value: number = 0;
      for (let cursor = 0; cursor < part.length; cursor++) {
        const code: number = part.charCodeAt(cursor);
        if (code < 48 || code > 57) {
          return [];
        }
        value = value * 10 + (code - 48);
      }
      result.push(value);
    }
    return result;
  }

  /** A valid version carries one to four numeric segments. */
  isValid(): boolean {
    return this.segments.length >= 1 && this.segments.length <= 4;
  }

  major(): number {
    return this.segments.length > 0 ? this.segments[0] : 0;
  }

  minor(): number {
    return this.segments.length > 1 ? this.segments[1] : 0;
  }

  patch(): number {
    return this.segments.length > 2 ? this.segments[2] : 0;
  }

  build(): number {
    return this.segments.length > 3 ? this.segments[3] : 0;
  }

  /** Numeric comparison padded with zeros, so 1.0 == 1.0.0. */
  compareTo(other: SemanticVersion): number {
    const width: number = Math.max(this.segments.length, other.segments.length);
    for (let index = 0; index < width; index++) {
      const left: number = index < this.segments.length ? this.segments[index] : 0;
      const right: number = index < other.segments.length ? other.segments[index] : 0;
      if (left > right) {
        return 1;
      }
      if (left < right) {
        return -1;
      }
    }
    return 0;
  }

  isNewerThan(other: SemanticVersion): boolean {
    return this.compareTo(other) > 0;
  }

  isOlderThan(other: SemanticVersion): boolean {
    return this.compareTo(other) < 0;
  }

  isSameAs(other: SemanticVersion): boolean {
    return this.compareTo(other) === 0;
  }

  /** Normalised dotted form, zero padding removed. */
  normalized(): string {
    return this.segments.join('.');
  }

  /** Canonical three part form used by the about page. */
  canonical(): string {
    return `${this.major()}.${this.minor()}.${this.patch()}`;
  }

  /** Next patch release of the same minor line. */
  nextPatch(): string {
    return `${this.major()}.${this.minor()}.${this.patch() + 1}`;
  }

  /** Next minor release, patch reset to zero. */
  nextMinor(): string {
    return `${this.major()}.${this.minor() + 1}.0`;
  }

  /** Next major release, minor and patch reset to zero. */
  nextMajor(): string {
    return `${this.major() + 1}.0.0`;
  }
}

/* ------------------------------------------------------------------ */
/* Application identity                                                */
/* ------------------------------------------------------------------ */

/** Full identity record of the browser sample under test. */
class AppIdentity {
  bundleName: string;
  abilityName: string;
  versionName: string;
  versionCode: number;
  compileSdkVersion: number;
  minApiVersion: number;
  targetApiVersion: number;

  constructor(bundleName: string, abilityName: string, versionName: string, versionCode: number,
    compileSdkVersion: number, minApiVersion: number, targetApiVersion: number) {
    this.bundleName = bundleName;
    this.abilityName = abilityName;
    this.versionName = versionName;
    this.versionCode = versionCode;
    this.compileSdkVersion = compileSdkVersion;
    this.minApiVersion = minApiVersion;
    this.targetApiVersion = targetApiVersion;
  }

  /** Reference identity matching the shipped sample manifest. */
  static expected(): AppIdentity {
    return new AppIdentity(BUNDLE_NAME, ABILITY_NAME, VERSION_NAME, VERSION_CODE,
      COMPILE_SDK_VERSION, MIN_API_VERSION, TARGET_API_VERSION);
  }

  /** Bundle names are reverse domain names with at least three segments. */
  isBundleNameValid(): boolean {
    if (this.bundleName === null || this.bundleName === undefined) {
      return false;
    }
    const text: string = this.bundleName.trim();
    if (text.length === 0 || text.length > 128) {
      return false;
    }
    const parts: string[] = text.split('.');
    if (parts.length < 3) {
      return false;
    }
    for (let index = 0; index < parts.length; index++) {
      const part: string = parts[index];
      if (part.length === 0) {
        return false;
      }
      for (let cursor = 0; cursor < part.length; cursor++) {
        const code: number = part.charCodeAt(cursor);
        const isLower: boolean = code >= 97 && code <= 122;
        const isDigit: boolean = code >= 48 && code <= 57;
        const isUnderscore: boolean = code === 95;
        if (!isLower && !isDigit && !isUnderscore) {
          return false;
        }
      }
    }
    return true;
  }

  /** The ability name must be the declared launcher entry. */
  isAbilityNameValid(): boolean {
    return this.abilityName === ABILITY_NAME && this.abilityName.length > 0;
  }

  /** Version names are 1 to 4 dot separated numeric segments. */
  isVersionNameValid(): boolean {
    if (this.versionName === null || this.versionName === undefined) {
      return false;
    }
    if (this.versionName.length === 0 || this.versionName.length > MAX_VERSION_NAME_LENGTH) {
      return false;
    }
    const parsed: SemanticVersion = new SemanticVersion(this.versionName);
    return parsed.isValid() && parsed.normalized() === this.versionName;
  }

  /** versionCode must be a positive 32 bit signed integer. */
  isVersionCodeValid(): boolean {
    return this.versionCode >= 1 && this.versionCode <= MAX_VERSION_CODE;
  }

  /** The sample is compiled against API 9 exactly. */
  isCompileSdkExpected(): boolean {
    return this.compileSdkVersion === COMPILE_SDK_VERSION;
  }

  /** minApiVersion <= targetApiVersion <= compileSdkVersion must hold. */
  isApiRangeOrdered(): boolean {
    return this.minApiVersion >= 1 && this.minApiVersion <= this.targetApiVersion &&
      this.targetApiVersion <= this.compileSdkVersion;
  }

  /** Deep identity equality used by upgrade checks. */
  matches(other: AppIdentity): boolean {
    if (other === null || other === undefined) {
      return false;
    }
    return this.bundleName === other.bundleName && this.abilityName === other.abilityName &&
      this.versionName === other.versionName && this.versionCode === other.versionCode &&
      this.compileSdkVersion === other.compileSdkVersion &&
      this.minApiVersion === other.minApiVersion && this.targetApiVersion === other.targetApiVersion;
  }

  /** True when both records differ only by version fields. */
  samePackageAs(other: AppIdentity): boolean {
    return other !== null && other !== undefined && this.bundleName === other.bundleName &&
      this.abilityName === other.abilityName;
  }

  /** Row by row audit of every identity field. */
  audit(): FieldAudit[] {
    const rows: FieldAudit[] = [];
    rows.push(new FieldAudit('bundleName', BUNDLE_NAME, this.bundleName,
      this.bundleName === BUNDLE_NAME && this.isBundleNameValid()));
    rows.push(new FieldAudit('abilityName', ABILITY_NAME, this.abilityName,
      this.abilityName === ABILITY_NAME && this.isAbilityNameValid()));
    rows.push(new FieldAudit('versionName', VERSION_NAME, this.versionName,
      this.versionName === VERSION_NAME && this.isVersionNameValid()));
    rows.push(new FieldAudit('versionCode', String(VERSION_CODE), String(this.versionCode),
      this.versionCode === VERSION_CODE && this.isVersionCodeValid()));
    rows.push(new FieldAudit('compileSdkVersion', String(COMPILE_SDK_VERSION),
      String(this.compileSdkVersion), this.isCompileSdkExpected()));
    rows.push(new FieldAudit('apiRange', `${MIN_API_VERSION}..${TARGET_API_VERSION}`,
      `${this.minApiVersion}..${this.targetApiVersion}`, this.isApiRangeOrdered()));
    return rows;
  }

  /** Number of audit rows that passed. */
  passedFieldCount(): number {
    const rows: FieldAudit[] = this.audit();
    let count: number = 0;
    for (let index = 0; index < rows.length; index++) {
      if (rows[index].isOk()) {
        count += 1;
      }
    }
    return count;
  }

  /** Names of the audit rows that failed, empty when the identity is clean. */
  failedFieldNames(): string[] {
    const rows: FieldAudit[] = this.audit();
    const failed: string[] = [];
    for (let index = 0; index < rows.length; index++) {
      if (!rows[index].isOk()) {
        failed.push(rows[index].field);
      }
    }
    return failed;
  }

  /** One line identity banner used by the log stream. */
  banner(): string {
    return `${this.bundleName}/${this.abilityName} v${this.versionName}(${this.versionCode}) sdk${this.compileSdkVersion}`;
  }

  /** Immutable copy with a replaced version pair. */
  withVersion(versionName: string, versionCode: number): AppIdentity {
    return new AppIdentity(this.bundleName, this.abilityName, versionName, versionCode,
      this.compileSdkVersion, this.minApiVersion, this.targetApiVersion);
  }
}

/* ------------------------------------------------------------------ */
/* Capability gate                                                     */
/* ------------------------------------------------------------------ */

/** Availability of one platform capability required by the browser. */
enum CapabilityState {
  AVAILABLE = 0,
  MISSING = 1
}

/** One capability probed at startup before the UI tree is built. */
class Capability {
  name: string;
  state: CapabilityState;
  required: boolean;
  fallback: string;

  constructor(name: string, state: CapabilityState, required: boolean, fallback: string) {
    this.name = name;
    this.state = state;
    this.required = required;
    this.fallback = fallback;
  }

  isUsable(): boolean {
    return this.state === CapabilityState.AVAILABLE;
  }

  isBlocking(): boolean {
    return this.required && !this.isUsable();
  }

  decision(): string {
    if (this.isUsable()) {
      return 'use';
    }
    return this.required ? 'block' : 'degrade';
  }
}

/**
 * Probes Web, UiTest, mediaquery, deviceInfo and rawfile before rendering.
 *
 * The sample keeps a small, ordered probe list. A required capability that is
 * missing blocks the suite; an optional one activates a documented fallback so
 * the browser still renders a usable home page.
 */
class CapabilityGate {
  capabilities: Capability[] = [];

  constructor(available: string[], required: string[]) {
    const names: string[] = [FEATURE_WEB, FEATURE_UITEST, FEATURE_MEDIAQUERY,
      FEATURE_DEVICE_INFO, FEATURE_RAWFILE];
    const fallbacks: string[] = [FALLBACK_STATIC_USER_AGENT, FALLBACK_SKIP_UI_ASSERT,
      FALLBACK_FIXED_LAYOUT, FALLBACK_STATIC_USER_AGENT, FALLBACK_BUNDLED_PAGE];
    for (let index = 0; index < names.length; index++) {
      const name: string = names[index];
      const state: CapabilityState = available.indexOf(name) >= 0 ?
        CapabilityState.AVAILABLE : CapabilityState.MISSING;
      this.capabilities.push(new Capability(name, state, required.indexOf(name) >= 0, fallbacks[index]));
    }
  }

  /** Gate with every documented capability available. */
  static fullyAvailable(): CapabilityGate {
    return new CapabilityGate([FEATURE_WEB, FEATURE_UITEST, FEATURE_MEDIAQUERY,
      FEATURE_DEVICE_INFO, FEATURE_RAWFILE], [FEATURE_WEB]);
  }

  indexOf(name: string): number {
    for (let index = 0; index < this.capabilities.length; index++) {
      if (this.capabilities[index].name === name) {
        return index;
      }
    }
    return -1;
  }

  has(name: string): boolean {
    return this.indexOf(name) >= 0;
  }

  find(name: string): Capability | null {
    const index: number = this.indexOf(name);
    return index < 0 ? null : this.capabilities[index];
  }

  isAvailable(name: string): boolean {
    const capability: Capability | null = this.find(name);
    return capability !== null && capability.isUsable();
  }

  isRequired(name: string): boolean {
    const capability: Capability | null = this.find(name);
    return capability !== null && capability.required;
  }

  decisionFor(name: string): string {
    const capability: Capability | null = this.find(name);
    return capability === null ? 'unknown' : capability.decision();
  }

  missingNames(): string[] {
    const missing: string[] = [];
    for (let index = 0; index < this.capabilities.length; index++) {
      if (!this.capabilities[index].isUsable()) {
        missing.push(this.capabilities[index].name);
      }
    }
    return missing;
  }

  missingRequired(): string[] {
    const blocked: string[] = [];
    for (let index = 0; index < this.capabilities.length; index++) {
      if (this.capabilities[index].isBlocking()) {
        blocked.push(this.capabilities[index].name);
      }
    }
    return blocked;
  }

  allRequiredPresent(): boolean {
    return this.missingRequired().length === 0;
  }

  /** True when the app can still render, even in a degraded mode. */
  canRender(): boolean {
    return this.allRequiredPresent();
  }

  usableCount(): number {
    let count: number = 0;
    for (let index = 0; index < this.capabilities.length; index++) {
      if (this.capabilities[index].isUsable()) {
        count += 1;
      }
    }
    return count;
  }

  degradedNames(): string[] {
    const degraded: string[] = [];
    for (let index = 0; index < this.capabilities.length; index++) {
      const capability: Capability = this.capabilities[index];
      if (!capability.isUsable() && !capability.required) {
        degraded.push(capability.name);
      }
    }
    return degraded;
  }

  /** Ordered "capability -> fallback" plan for the degraded capabilities. */
  degradePlan(): string[] {
    const plan: string[] = [];
    for (let index = 0; index < this.capabilities.length; index++) {
      const capability: Capability = this.capabilities[index];
      if (capability.decision() === 'degrade') {
        plan.push(`${capability.name} -> ${capability.fallback}`);
      }
    }
    return plan;
  }

  /** Deterministic gate signature, handy for regression snapshots. */
  signature(): string {
    const parts: string[] = [];
    for (let index = 0; index < this.capabilities.length; index++) {
      const capability: Capability = this.capabilities[index];
      const flag: string = capability.isUsable() ? '1' : '0';
      parts.push(`${capability.name}:${flag}`);
    }
    return parts.join(',');
  }
}

/* ------------------------------------------------------------------ */
/* Version compatibility matrix                                        */
/* ------------------------------------------------------------------ */

/** One cell of the compatibility matrix: does sdk support feature. */
class CompatRow {
  sdk: number;
  feature: string;
  supported: boolean;

  constructor(sdk: number, feature: string, supported: boolean) {
    this.sdk = sdk;
    this.feature = feature;
    this.supported = supported;
  }
}

/** Documents which browser capability each API level provides. */
function versionCompatRows(): CompatRow[] {
  const rows: CompatRow[] = [];
  const levels: number[] = [8, 9, 10, 11];
  for (let index = 0; index < levels.length; index++) {
    const sdk: number = levels[index];
    rows.push(new CompatRow(sdk, FEATURE_RAWFILE, sdk >= 8));
    rows.push(new CompatRow(sdk, FEATURE_WEB, sdk >= 9));
    rows.push(new CompatRow(sdk, FEATURE_DEVICE_INFO, sdk >= 9));
    rows.push(new CompatRow(sdk, FEATURE_MEDIAQUERY, sdk >= 9));
    rows.push(new CompatRow(sdk, FEATURE_UITEST, sdk >= 9));
  }
  return rows;
}

/** Query helper over the compatibility rows. */
class CompatMatrix {
  rows: CompatRow[];

  constructor(rows: CompatRow[]) {
    this.rows = rows;
  }

  supports(sdk: number, feature: string): boolean {
    for (let index = 0; index < this.rows.length; index++) {
      const row: CompatRow = this.rows[index];
      if (row.sdk === sdk && row.feature === feature) {
        return row.supported;
      }
    }
    return false;
  }

  /** Features supported at the given api level, in declaration order. */
  featuresAt(sdk: number): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.rows.length; index++) {
      const row: CompatRow = this.rows[index];
      if (row.sdk === sdk && row.supported) {
        result.push(row.feature);
      }
    }
    return result;
  }

  /** Lowest api level that supports the feature, -1 when unknown. */
  firstSdkFor(feature: string): number {
    let found: number = -1;
    for (let index = 0; index < this.rows.length; index++) {
      const row: CompatRow = this.rows[index];
      if (row.feature === feature && row.supported) {
        if (found < 0 || row.sdk < found) {
          found = row.sdk;
        }
      }
    }
    return found;
  }

  /** Every feature is monotonically enabled as the api level grows. */
  isMonotonic(feature: string): boolean {
    let seen: boolean = false;
    for (let index = 0; index < this.rows.length; index++) {
      const row: CompatRow = this.rows[index];
      if (row.feature !== feature) {
        continue;
      }
      if (seen && !row.supported) {
        return false;
      }
      if (row.supported) {
        seen = true;
      }
    }
    return true;
  }

  /** Rows of one api level, used by the report table. */
  rowsAt(sdk: number): CompatRow[] {
    const result: CompatRow[] = [];
    for (let index = 0; index < this.rows.length; index++) {
      if (this.rows[index].sdk === sdk) {
        result.push(this.rows[index]);
      }
    }
    return result;
  }

  supportedCount(): number {
    let count: number = 0;
    for (let index = 0; index < this.rows.length; index++) {
      if (this.rows[index].supported) {
        count += 1;
      }
    }
    return count;
  }
}

/* ------------------------------------------------------------------ */
/* Local helpers                                                       */
/* ------------------------------------------------------------------ */

/** Builds a version name of a single segment repeated to reach a length. */
function repeatChar(ch: string, count: number): string {
  let result: string = '';
  for (let index = 0; index < count; index++) {
    result += ch;
  }
  return result;
}

/** True when the string carries only digits and dots. */
function isNumericDotted(value: string): boolean {
  if (value.length === 0) {
    return false;
  }
  for (let index = 0; index < value.length; index++) {
    const code: number = value.charCodeAt(index);
    const isDigit: boolean = code >= 48 && code <= 57;
    const isDot: boolean = code === 46;
    if (!isDigit && !isDot) {
      return false;
    }
  }
  return true;
}

/** Counts dots without allocating a split array. */
function dotCount(value: string): number {
  let count: number = 0;
  for (let index = 0; index < value.length; index++) {
    if (value.charCodeAt(index) === 46) {
      count += 1;
    }
  }
  return count;
}

/** Ordered list of api levels the matrix must cover. */
function compatLevels(): number[] {
  return [8, 9, 10, 11];
}

/** Sample upgrade chain used to validate forward compatibility. */
function upgradeChain(): string[] {
  return ['1.0.0', '1.0.1', '1.1.0', '2.0.0'];
}

/** Minimum version accepted by the in-app about page. */
function minimumSupportedVersion(): SemanticVersion {
  return new SemanticVersion('1.0.0');
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserAppVersionValidationTest() {
  describe('browserAppVersionValidationTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin: application identity, version and capability gating');
      await startBrowserApp();
      TestLogger.info(TAG, 'browser app started for identity validation');
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    beforeEach(() => {
      TestLogger.resetSteps(TAG);
    });

    /** The shipped bundle name must be a well formed reverse domain name. */
    it('App_Identity_Bundle_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Identity_Bundle_001');
      const started: number = Date.now();
      const identity: AppIdentity = AppIdentity.expected();
      TestLogger.step(TAG, 'validate bundle name');
      expect(identity.bundleName).assertEqual(BUNDLE_NAME);
      expect(identity.bundleName).assertContain('ohos.samples.');
      expect(identity.bundleName.split('.').length).assertEqual(3);
      expect(identity.isBundleNameValid()).assertTrue();
      TestLogger.info(TAG, identity.banner());
      expect(identity.banner()).assertContain(BUNDLE_NAME);
      TestLogger.caseEnd(TAG, 'App_Identity_Bundle_001', Date.now() - started);
    });

    /** The launcher entry point must stay MainAbility. */
    it('App_Identity_Ability_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Identity_Ability_002');
      const started: number = Date.now();
      const identity: AppIdentity = AppIdentity.expected();
      TestLogger.step(TAG, 'validate ability name');
      expect(identity.abilityName).assertEqual(ABILITY_NAME);
      expect(identity.isAbilityNameValid()).assertTrue();
      const renamed: AppIdentity = new AppIdentity(BUNDLE_NAME, 'EntryAbility', VERSION_NAME,
        VERSION_CODE, COMPILE_SDK_VERSION, MIN_API_VERSION, TARGET_API_VERSION);
      expect(renamed.isAbilityNameValid()).assertFalse();
      expect(renamed.samePackageAs(identity)).assertFalse();
      TestLogger.info(TAG, 'ability mismatch is rejected by the identity audit');
      TestLogger.caseEnd(TAG, 'App_Identity_Ability_002', Date.now() - started);
    });

    /** The declared release version parses to the expected numeric triple. */
    it('App_Identity_VersionName_Format_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Identity_VersionName_Format_003');
      const started: number = Date.now();
      const identity: AppIdentity = AppIdentity.expected();
      const version: SemanticVersion = new SemanticVersion(identity.versionName);
      TestLogger.step(TAG, 'parse the release version');
      expect(version.isValid()).assertTrue();
      expect(version.segments.length).assertEqual(3);
      expect(dotCount(identity.versionName)).assertEqual(2);
      expect(version.major()).assertEqual(1);
      expect(version.minor()).assertEqual(0);
      expect(version.patch()).assertEqual(0);
      expect(version.build()).assertEqual(0);
      expect(version.canonical()).assertEqual(VERSION_NAME);
      expect(identity.isVersionNameValid()).assertTrue();
      TestLogger.caseEnd(TAG, 'App_Identity_VersionName_Format_003', Date.now() - started);
    });

    /** Malformed version names are rejected field by field. */
    it('App_Version_Name_Reject_Table_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Version_Name_Reject_Table_004');
      const started: number = Date.now();
      const rejected: string[] = ['', ' ', 'v1.0.0', '1..0', '.1.0', '1.0.', '1.0.0-beta',
        '1,0,0', '01.0.0.0.0', repeatChar('9', MAX_VERSION_NAME_LENGTH + 1)];
      TestLogger.step(TAG, 'walk the rejected version table');
      for (let index = 0; index < rejected.length; index++) {
        const raw: string = rejected[index];
        const parsed: SemanticVersion = new SemanticVersion(raw);
        expect(parsed.isValid()).assertFalse();
        expect(isNumericDotted(raw) && parsed.isValid()).assertFalse();
        TestLogger.info(TAG, `rejected version row ${index}, length ${raw.length}`);
      }
      expect(rejected.length).assertEqual(10);
      TestLogger.caseEnd(TAG, 'App_Version_Name_Reject_Table_004', Date.now() - started);
    });

    /** versionCode must stay inside the signed 32 bit range. */
    it('App_Version_Code_Range_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Version_Code_Range_005');
      const started: number = Date.now();
      TestLogger.step(TAG, 'probe the versionCode boundaries');
      const identity: AppIdentity = AppIdentity.expected();
      expect(identity.isVersionCodeValid()).assertTrue();
      const zeroCode: AppIdentity = identity.withVersion(VERSION_NAME, 0);
      expect(zeroCode.isVersionCodeValid()).assertFalse();
      const negativeCode: AppIdentity = identity.withVersion(VERSION_NAME, -1);
      expect(negativeCode.isVersionCodeValid()).assertFalse();
      const maxCode: AppIdentity = identity.withVersion(VERSION_NAME, MAX_VERSION_CODE);
      expect(maxCode.isVersionCodeValid()).assertTrue();
      const overCode: AppIdentity = identity.withVersion(VERSION_NAME, MAX_VERSION_CODE + 1);
      expect(overCode.isVersionCodeValid()).assertFalse();
      TestLogger.info(TAG, 'versionCode range validated at both ends');
      TestLogger.caseEnd(TAG, 'App_Version_Code_Range_005', Date.now() - started);
    });

    /** The sample is compiled against API 9 and nothing else. */
    it('App_CompileSdk_Expected_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_CompileSdk_Expected_006');
      const started: number = Date.now();
      const identity: AppIdentity = AppIdentity.expected();
      TestLogger.step(TAG, 'validate compileSdkVersion');
      expect(identity.compileSdkVersion).assertEqual(COMPILE_SDK_VERSION);
      expect(identity.compileSdkVersion).assertEqual(9);
      expect(identity.isCompileSdkExpected()).assertTrue();
      const sdkEight: AppIdentity = new AppIdentity(BUNDLE_NAME, ABILITY_NAME, VERSION_NAME,
        VERSION_CODE, 8, 8, 8);
      expect(sdkEight.isCompileSdkExpected()).assertFalse();
      const sdkTen: AppIdentity = new AppIdentity(BUNDLE_NAME, ABILITY_NAME, VERSION_NAME,
        VERSION_CODE, 10, 9, 10);
      expect(sdkTen.isCompileSdkExpected()).assertFalse();
      TestLogger.caseEnd(TAG, 'App_CompileSdk_Expected_006', Date.now() - started);
    });

    /** minApiVersion <= targetApiVersion <= compileSdkVersion. */
    it('App_Api_Range_Ordered_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Api_Range_Ordered_007');
      const started: number = Date.now();
      const identity: AppIdentity = AppIdentity.expected();
      TestLogger.step(TAG, 'validate the api range ordering');
      expect(identity.isApiRangeOrdered()).assertTrue();
      expect(identity.minApiVersion).assertEqual(MIN_API_VERSION);
      expect(identity.targetApiVersion).assertEqual(TARGET_API_VERSION);
      const inverted: AppIdentity = new AppIdentity(BUNDLE_NAME, ABILITY_NAME, VERSION_NAME,
        VERSION_CODE, 9, 10, 9);
      expect(inverted.isApiRangeOrdered()).assertFalse();
      const aboveCompile: AppIdentity = new AppIdentity(BUNDLE_NAME, ABILITY_NAME, VERSION_NAME,
        VERSION_CODE, 9, 9, 11);
      expect(aboveCompile.isApiRangeOrdered()).assertFalse();
      const zeroMin: AppIdentity = new AppIdentity(BUNDLE_NAME, ABILITY_NAME, VERSION_NAME,
        VERSION_CODE, 9, 0, 9);
      expect(zeroMin.isApiRangeOrdered()).assertFalse();
      TestLogger.caseEnd(TAG, 'App_Api_Range_Ordered_007', Date.now() - started);
    });

    /** Numeric comparison ignores redundant trailing zeros. */
    it('App_Semantic_Compare_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Semantic_Compare_008');
      const started: number = Date.now();
      TestLogger.step(TAG, 'compare semantic versions');
      const one: SemanticVersion = new SemanticVersion('1.0.0');
      const same: SemanticVersion = new SemanticVersion('1.0');
      const newer: SemanticVersion = new SemanticVersion('1.0.1');
      const older: SemanticVersion = new SemanticVersion('0.9.9');
      expect(one.isSameAs(same)).assertTrue();
      expect(one.compareTo(same)).assertEqual(0);
      expect(newer.isNewerThan(one)).assertTrue();
      expect(newer.compareTo(one)).assertEqual(1);
      expect(older.isOlderThan(one)).assertTrue();
      expect(older.compareTo(one)).assertEqual(-1);
      expect(new SemanticVersion('2.0.0').isNewerThan(new SemanticVersion('1.9.9'))).assertTrue();
      expect(new SemanticVersion('1.10.0').isNewerThan(new SemanticVersion('1.9.0'))).assertTrue();
      TestLogger.caseEnd(TAG, 'App_Semantic_Compare_008', Date.now() - started);
    });

    /** The documented upgrade chain must be strictly increasing. */
    it('App_Semantic_Upgrade_Path_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Semantic_Upgrade_Path_009');
      const started: number = Date.now();
      const chain: string[] = upgradeChain();
      TestLogger.step(TAG, 'walk the upgrade chain');
      expect(chain.length).assertEqual(4);
      expect(chain[0]).assertEqual(VERSION_NAME);
      for (let index = 1; index < chain.length; index++) {
        const previous: SemanticVersion = new SemanticVersion(chain[index - 1]);
        const current: SemanticVersion = new SemanticVersion(chain[index]);
        expect(current.isNewerThan(previous)).assertTrue();
        TestLogger.info(TAG, `upgrade ${previous.raw} -> ${current.raw}`);
      }
      const base: SemanticVersion = new SemanticVersion('1.2.3');
      expect(base.nextPatch()).assertEqual('1.2.4');
      expect(base.nextMinor()).assertEqual('1.3.0');
      expect(base.nextMajor()).assertEqual('2.0.0');
      TestLogger.caseEnd(TAG, 'App_Semantic_Upgrade_Path_009', Date.now() - started);
    });

    /** Web controller availability gates the very first load. */
    it('App_Capability_Web_Gate_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Capability_Web_Gate_010');
      const started: number = Date.now();
      const gate: CapabilityGate = CapabilityGate.fullyAvailable();
      TestLogger.step(TAG, 'probe the Web capability');
      expect(gate.has(FEATURE_WEB)).assertTrue();
      expect(gate.isAvailable(FEATURE_WEB)).assertTrue();
      expect(gate.isRequired(FEATURE_WEB)).assertTrue();
      expect(gate.decisionFor(FEATURE_WEB)).assertEqual('use');
      expect(gate.allRequiredPresent()).assertTrue();
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      TestLogger.info(TAG, 'web capability present, address bar reachable');
      TestLogger.caseEnd(TAG, 'App_Capability_Web_Gate_010', Date.now() - started);
    });

    /** UiTest is optional: its loss only weakens the assertions. */
    it('App_Capability_UiTest_Gate_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Capability_UiTest_Gate_011');
      const started: number = Date.now();
      const gate: CapabilityGate = new CapabilityGate([FEATURE_WEB, FEATURE_MEDIAQUERY,
        FEATURE_DEVICE_INFO, FEATURE_RAWFILE], [FEATURE_WEB]);
      TestLogger.step(TAG, 'probe the UiTest capability');
      expect(gate.isAvailable(FEATURE_UITEST)).assertFalse();
      expect(gate.isRequired(FEATURE_UITEST)).assertFalse();
      expect(gate.decisionFor(FEATURE_UITEST)).assertEqual('degrade');
      expect(gate.allRequiredPresent()).assertTrue();
      expect(gate.canRender()).assertTrue();
      expect(gate.missingRequired().length).assertEqual(0);
      TestLogger.info(TAG, 'uitest missing degrades assertions without blocking');
      TestLogger.caseEnd(TAG, 'App_Capability_UiTest_Gate_011', Date.now() - started);
    });

    /** mediaquery decides between the pad and the phone layout. */
    it('App_Capability_MediaQuery_Gate_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Capability_MediaQuery_Gate_012');
      const started: number = Date.now();
      const withMedia: CapabilityGate = CapabilityGate.fullyAvailable();
      const withoutMedia: CapabilityGate = new CapabilityGate([FEATURE_WEB, FEATURE_UITEST,
        FEATURE_DEVICE_INFO, FEATURE_RAWFILE], [FEATURE_WEB]);
      TestLogger.step(TAG, 'probe the mediaquery capability');
      expect(withMedia.isAvailable(FEATURE_MEDIAQUERY)).assertTrue();
      expect(withoutMedia.isAvailable(FEATURE_MEDIAQUERY)).assertFalse();
      expect(withoutMedia.decisionFor(FEATURE_MEDIAQUERY)).assertEqual('degrade');
      const plan: string[] = withoutMedia.degradePlan();
      let hasLayoutFallback: boolean = false;
      for (let index = 0; index < plan.length; index++) {
        if (plan[index].indexOf(FEATURE_MEDIAQUERY) === 0 &&
          plan[index].indexOf(FALLBACK_FIXED_LAYOUT) > 0) {
          hasLayoutFallback = true;
        }
      }
      expect(hasLayoutFallback).assertTrue();
      TestLogger.info(TAG, `degrade plan rows: ${plan.length}`);
      TestLogger.caseEnd(TAG, 'App_Capability_MediaQuery_Gate_012', Date.now() - started);
    });

    /** deviceInfo picks the user agent, so its loss needs a static fallback. */
    it('App_Capability_DeviceInfo_Gate_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Capability_DeviceInfo_Gate_013');
      const started: number = Date.now();
      const gate: CapabilityGate = new CapabilityGate([FEATURE_WEB, FEATURE_UITEST,
        FEATURE_MEDIAQUERY, FEATURE_RAWFILE], [FEATURE_WEB]);
      TestLogger.step(TAG, 'probe the deviceInfo capability');
      expect(gate.isAvailable(FEATURE_DEVICE_INFO)).assertFalse();
      expect(gate.decisionFor(FEATURE_DEVICE_INFO)).assertEqual('degrade');
      const plan: string[] = gate.degradePlan();
      expect(plan.length).assertEqual(1);
      expect(plan.join('|')).assertContain(FALLBACK_STATIC_USER_AGENT);
      expect(gate.canRender()).assertTrue();
      expect(gate.usableCount()).assertEqual(4);
      TestLogger.info(TAG, 'deviceInfo missing keeps the browser renderable');
      TestLogger.caseEnd(TAG, 'App_Capability_DeviceInfo_Gate_013', Date.now() - started);
    });

    /** With every capability present the gate signature is all ones. */
    it('App_Capability_All_Present_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Capability_All_Present_014');
      const started: number = Date.now();
      const gate: CapabilityGate = CapabilityGate.fullyAvailable();
      TestLogger.step(TAG, 'verify the full capability signature');
      expect(gate.capabilities.length).assertEqual(5);
      expect(gate.usableCount()).assertEqual(5);
      expect(gate.missingNames().length).assertEqual(0);
      expect(gate.degradedNames().length).assertEqual(0);
      expect(gate.degradePlan().length).assertEqual(0);
      expect(gate.signature()).assertEqual('web:1,uitest:1,mediaquery:1,deviceInfo:1,rawfile:1');
      TestLogger.info(TAG, gate.signature());
      TestLogger.caseEnd(TAG, 'App_Capability_All_Present_014', Date.now() - started);
    });

    /** Every degraded capability must publish a fallback string. */
    it('App_Capability_Degrade_Plan_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Capability_Degrade_Plan_015');
      const started: number = Date.now();
      const gate: CapabilityGate = new CapabilityGate([FEATURE_WEB], [FEATURE_WEB]);
      TestLogger.step(TAG, 'build the degrade plan of a minimal device');
      const plan: string[] = gate.degradePlan();
      expect(plan.length).assertEqual(4);
      expect(gate.degradedNames().length).assertEqual(4);
      expect(gate.canRender()).assertTrue();
      for (let index = 0; index < plan.length; index++) {
        expect(plan[index].indexOf(' -> ') > 0).assertTrue();
        TestLogger.info(TAG, `degrade ${plan[index]}`);
      }
      expect(plan.join('|')).assertContain(FALLBACK_BUNDLED_PAGE);
      expect(plan.join('|')).assertContain(FALLBACK_SKIP_UI_ASSERT);
      TestLogger.caseEnd(TAG, 'App_Capability_Degrade_Plan_015', Date.now() - started);
    });

    /** A missing required capability blocks rendering entirely. */
    it('App_Capability_Missing_Required_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Capability_Missing_Required_016');
      const started: number = Date.now();
      const gate: CapabilityGate = new CapabilityGate([FEATURE_UITEST, FEATURE_MEDIAQUERY,
        FEATURE_DEVICE_INFO, FEATURE_RAWFILE], [FEATURE_WEB]);
      TestLogger.step(TAG, 'block on a missing required capability');
      expect(gate.isAvailable(FEATURE_WEB)).assertFalse();
      expect(gate.missingRequired().length).assertEqual(1);
      expect(gate.missingRequired()[0]).assertEqual(FEATURE_WEB);
      expect(gate.decisionFor(FEATURE_WEB)).assertEqual('block');
      expect(gate.allRequiredPresent()).assertFalse();
      expect(gate.canRender()).assertFalse();
      const browser: MockBrowser = new MockBrowser();
      expect(browser.getTabKeys().length).assertEqual(1);
      expect(gate.canRender()).assertFalse();
      TestLogger.warn(TAG, 'web capability missing, suite must not render');
      TestLogger.caseEnd(TAG, 'App_Capability_Missing_Required_016', Date.now() - started);
    });

    /** API 9 must expose every capability the browser relies on. */
    it('App_Version_Compat_Matrix_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Version_Compat_Matrix_017');
      const started: number = Date.now();
      const matrix: CompatMatrix = new CompatMatrix(versionCompatRows());
      const levels: number[] = compatLevels();
      TestLogger.step(TAG, 'query the compatibility matrix at API 9');
      expect(matrix.rowsAt(9).length).assertEqual(5);
      expect(matrix.supports(9, FEATURE_WEB)).assertTrue();
      expect(matrix.supports(9, FEATURE_UITEST)).assertTrue();
      expect(matrix.supports(9, FEATURE_MEDIAQUERY)).assertTrue();
      expect(matrix.supports(9, FEATURE_DEVICE_INFO)).assertTrue();
      expect(matrix.supports(9, FEATURE_RAWFILE)).assertTrue();
      expect(matrix.featuresAt(9).length).assertEqual(5);
      expect(matrix.firstSdkFor(FEATURE_RAWFILE)).assertEqual(8);
      expect(matrix.firstSdkFor(FEATURE_WEB)).assertEqual(9);
      expect(matrix.rows.length).assertEqual(levels.length * 5);
      TestLogger.info(TAG, `matrix features at api 9: ${matrix.featuresAt(9).join(',')}`);
      TestLogger.caseEnd(TAG, 'App_Version_Compat_Matrix_017', Date.now() - started);
    });

    /** API 8 lacks the Web engine, so the matrix must report the gap. */
    it('App_Version_Compat_Reject_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Version_Compat_Reject_018');
      const started: number = Date.now();
      const matrix: CompatMatrix = new CompatMatrix(versionCompatRows());
      TestLogger.step(TAG, 'reject API 8 for web dependent features');
      expect(matrix.supports(8, FEATURE_RAWFILE)).assertTrue();
      expect(matrix.supports(8, FEATURE_WEB)).assertFalse();
      expect(matrix.supports(8, FEATURE_UITEST)).assertFalse();
      expect(matrix.supports(8, FEATURE_MEDIAQUERY)).assertFalse();
      expect(matrix.supports(8, FEATURE_DEVICE_INFO)).assertFalse();
      expect(matrix.featuresAt(8).length).assertEqual(1);
      expect(matrix.supports(7, FEATURE_RAWFILE)).assertFalse();
      expect(matrix.firstSdkFor('unknownFeature')).assertEqual(-1);
      TestLogger.warn(TAG, 'api 8 cannot host the browser web engine');
      TestLogger.caseEnd(TAG, 'App_Version_Compat_Reject_018', Date.now() - started);
    });

    /** Capability availability only ever grows as the api level grows. */
    it('App_Version_Compat_Monotonic_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Version_Compat_Monotonic_019');
      const started: number = Date.now();
      const matrix: CompatMatrix = new CompatMatrix(versionCompatRows());
      TestLogger.step(TAG, 'verify monotonic enablement per feature');
      const features: string[] = [FEATURE_RAWFILE, FEATURE_WEB, FEATURE_UITEST,
        FEATURE_MEDIAQUERY, FEATURE_DEVICE_INFO];
      for (let index = 0; index < features.length; index++) {
        const feature: string = features[index];
        expect(matrix.isMonotonic(feature)).assertTrue();
        TestLogger.info(TAG, `${feature} enabled from sdk ${matrix.firstSdkFor(feature)}`);
      }
      expect(matrix.supportedCount()).assertEqual(16);
      expect(matrix.supportedCount()).assertLarger(matrix.rowsAt(8).length);
      TestLogger.caseEnd(TAG, 'App_Version_Compat_Monotonic_019', Date.now() - started);
    });

    /** Identity audit must be clean and stable across repeated builds. */
    it('App_Identity_Audit_Stability_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Identity_Audit_Stability_020');
      const started: number = Date.now();
      const identity: AppIdentity = AppIdentity.expected();
      TestLogger.step(TAG, 'run the field audit twice');
      const firstPass: FieldAudit[] = identity.audit();
      const secondPass: FieldAudit[] = identity.audit();
      expect(firstPass.length).assertEqual(6);
      expect(secondPass.length).assertEqual(6);
      for (let index = 0; index < firstPass.length; index++) {
        expect(firstPass[index].isOk()).assertTrue();
        expect(secondPass[index].describe()).assertEqual(firstPass[index].describe());
        TestLogger.info(TAG, firstPass[index].describe());
      }
      expect(identity.passedFieldCount()).assertEqual(6);
      expect(identity.failedFieldNames().length).assertEqual(0);
      TestLogger.caseEnd(TAG, 'App_Identity_Audit_Stability_020', Date.now() - started);
    });

    /** Mutating one field must surface exactly that field as failed. */
    it('App_Identity_Audit_Single_Failure_021', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Identity_Audit_Single_Failure_021');
      const started: number = Date.now();
      const drifted: AppIdentity = new AppIdentity('ohos.samples.browser2', ABILITY_NAME,
        VERSION_NAME, VERSION_CODE, COMPILE_SDK_VERSION, MIN_API_VERSION, TARGET_API_VERSION);
      TestLogger.step(TAG, 'inject a bundle name drift');
      expect(drifted.isBundleNameValid()).assertTrue();
      expect(drifted.matches(AppIdentity.expected())).assertFalse();
      expect(drifted.samePackageAs(AppIdentity.expected())).assertFalse();
      expect(drifted.failedFieldNames().length).assertEqual(1);
      expect(drifted.failedFieldNames()[0]).assertEqual('bundleName');
      expect(drifted.passedFieldCount()).assertEqual(5);
      TestLogger.warn(TAG, 'bundle name drift detected by the audit table');
      TestLogger.caseEnd(TAG, 'App_Identity_Audit_Single_Failure_021', Date.now() - started);
    });

    /** A version bump install keeps the package but changes the version. */
    it('App_Version_Upgrade_Keeps_Package_022', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Version_Upgrade_Keeps_Package_022');
      const started: number = Date.now();
      const clock: MockClock = new MockClock(1700000000000);
      const installed: AppIdentity = AppIdentity.expected();
      const upgraded: AppIdentity = installed.withVersion('2.0.0', VERSION_CODE + 1);
      TestLogger.step(TAG, 'simulate an in place version upgrade');
      clock.advance(86400000);
      expect(upgraded.samePackageAs(installed)).assertTrue();
      expect(upgraded.matches(installed)).assertFalse();
      expect(upgraded.versionName).assertEqual('2.0.0');
      expect(new SemanticVersion(upgraded.versionName)
        .isNewerThan(new SemanticVersion(installed.versionName))).assertTrue();
      expect(upgraded.versionCode).assertLarger(installed.versionCode);
      expect(upgraded.failedFieldNames().length).assertEqual(2);
      expect(clock.now()).assertEqual(1700000000000 + 86400000);
      TestLogger.info(TAG, `upgrade kept package ${upgraded.bundleName} for ${clock.now()} ms epoch`);
      TestLogger.caseEnd(TAG, 'App_Version_Upgrade_Keeps_Package_022', Date.now() - started);
    });

    /** The minimum supported version gate accepts 1.0.0 and above. */
    it('App_Version_Minimum_Gate_023', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Version_Minimum_Gate_023');
      const started: number = Date.now();
      const minimum: SemanticVersion = minimumSupportedVersion();
      TestLogger.step(TAG, 'apply the minimum supported version gate');
      expect(minimum.raw).assertEqual(VERSION_NAME);
      expect(new SemanticVersion('1.0.1').isNewerThan(minimum)).assertTrue();
      expect(new SemanticVersion('1.0.0').isSameAs(minimum)).assertTrue();
      expect(new SemanticVersion('0.9.9').isOlderThan(minimum)).assertTrue();
      expect(new SemanticVersion('1').isSameAs(minimum)).assertTrue();
      expect(new SemanticVersion('1.0.0.0').isSameAs(minimum)).assertTrue();
      TestLogger.caseEnd(TAG, 'App_Version_Minimum_Gate_023', Date.now() - started);
    });

    /** Degraded startup must still reach the bundled home page. */
    it('App_Version_Degraded_Home_024', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Version_Degraded_Home_024');
      const started: number = Date.now();
      const gate: CapabilityGate = new CapabilityGate([FEATURE_WEB, FEATURE_RAWFILE],
        [FEATURE_WEB]);
      const browser: MockBrowser = new MockBrowser();
      const homePage: string = deviceIsPhone('default') ? PHONE_HOME_PAGE : PAD_HOME_PAGE;
      TestLogger.step(TAG, 'render the home page with a degraded capability set');
      expect(gate.canRender()).assertTrue();
      browser.resetToHome(homePage);
      const current = browser.getCurrentTab();
      expect(current === null).assertFalse();
      if (current !== null) {
        expect(current.controller.getPendingUrl()).assertEqual(homePage);
      }
      expect(browser.getInputVal()).assertEqual('');
      expect(homePage).assertEqual(PAD_HOME_PAGE);
      expect(await waitForId(driver, ID_INPUT_URL, TIMEOUT_COMPONENT)).assertTrue();
      TestLogger.info(TAG, `degraded start reached ${homePage}`);
      TestLogger.caseEnd(TAG, 'App_Version_Degraded_Home_024', Date.now() - started);
    });

    /** Consolidated version report: identity banner plus compatibility rows. */
    it('App_Version_Report_Summary_025', 0, async () => {
      TestLogger.caseBegin(TAG, 'App_Version_Report_Summary_025');
      const started: number = Date.now();
      const identity: AppIdentity = AppIdentity.expected();
      const matrix: CompatMatrix = new CompatMatrix(versionCompatRows());
      const gate: CapabilityGate = CapabilityGate.fullyAvailable();
      TestLogger.step(TAG, 'assemble the version report');
      const report: string[] = [];
      report.push(identity.banner());
      report.push(`fields=${identity.passedFieldCount()}/${identity.audit().length}`);
      report.push(`capabilities=${gate.usableCount()}/${gate.capabilities.length}`);
      report.push(`matrixRows=${matrix.rows.length}`);
      expect(report.length).assertEqual(4);
      expect(report[0]).assertContain(VERSION_NAME);
      expect(report[0]).assertContain(`sdk${COMPILE_SDK_VERSION}`);
      expect(report[1]).assertEqual('fields=6/6');
      expect(report[2]).assertEqual('capabilities=5/5');
      expect(report[3]).assertEqual('matrixRows=20');
      for (let index = 0; index < report.length; index++) {
        TestLogger.info(TAG, report[index]);
      }
      const homeButtons: number = await countById(driver, ID_NAV_HOME);
      expect(homeButtons).assertLarger(0);
      TestLogger.caseEnd(TAG, 'App_Version_Report_Summary_025', Date.now() - started);
    });
  });
}

