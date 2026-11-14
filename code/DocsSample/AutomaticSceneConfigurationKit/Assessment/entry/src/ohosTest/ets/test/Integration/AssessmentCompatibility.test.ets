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
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_NO_ACTIVE_ASSESSMENT,
  TEXT_NO_EVENT,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  TEST_BUNDLE_PRIMARY,
  TEST_BUNDLE_SECONDARY,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  isAssessmentActive,
  isAssessmentInactive,
  isComponentEnabled,
  addAllowedApp,
  allowedAppRowCount,
  removeFirstAllowedApp,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The sample targets the release that ships the assessment kit. The three build versions are
// pinned to the same value, a mismatch between them is a release blocker.
const BUILD_TARGET_VERSION: string = '26.0.0';
const BUILD_COMPATIBLE_VERSION: string = '26.0.0';
const BUILD_COMPILE_VERSION: string = '26.0.0';

// Version of the kit that introduced the assessment APIs.
const API_SINCE_VERSION: string = '26.0.0';

// Minimum platform version of the assessment kit. The generic statement of the guide says the
// APIs are available from API version 20, the sample pins the build to the newer release.
const MIN_API_VERSION: number = 20;

// Sentinel of a version component that is not a decimal number.
const INVALID_COMPONENT: number = -1;
const VERSION_COMPONENT_COUNT: number = 3;

// Feature flags of the sample, they gate the optional surface of the assessment integration.
const FEATURE_COUNT: number = 6;

/**
 * Compatibility verdict of one feature.
 *
 * A feature is SUPPORTED when the running platform satisfies its gate, DEGRADED when the sample
 * still works but loses an optional capability, and UNSUPPORTED when the feature must be hidden.
 */
enum Verdict {
  SUPPORTED = 'supported', DEGRADED = 'degraded', UNSUPPORTED = 'unsupported'
}

/**
 * One feature of the assessment integration together with its gate.
 *
 * The minimum API version is the primary gate, the required SysCap is the secondary gate, because
 * a device can run a new platform without the customization capability that provides the service.
 */
interface FeatureGate {
  name: string;
  minApiVersion: number;
  sysCap: string;
  optional: boolean;
}

/**
 * Result of probing one feature.
 */
interface FeatureProbe {
  name: string;
  verdict: Verdict;
  reason: string;
}

/**
 * A semantic version of the form major.minor.patch.
 *
 * The class is intentionally small: parsing, comparing and a stable string form are the only
 * operations that the compatibility matrix needs.
 */
class SemVer {
  private major: number = 0;
  private minor: number = 0;
  private patch: number = 0;

  constructor(major: number, minor: number, patch: number) {
    this.major = major;
    this.minor = minor;
    this.patch = patch;
  }

  /**
   * Parses a version string.
   *
   * @param text version text, for example 26.0.0.
   * @returns the parsed version, every component is -1 when the text is malformed.
   */
  public static parse(text: string): SemVer {
    const parts: string[] = text.split('.');
    if (parts.length !== VERSION_COMPONENT_COUNT) {
      return new SemVer(INVALID_COMPONENT, INVALID_COMPONENT, INVALID_COMPONENT);
    }
    return new SemVer(SemVer.component(parts[0]), SemVer.component(parts[1]),
      SemVer.component(parts[2]));
  }

  /**
   * Parses one numeric component.
   *
   * @param text component text.
   * @returns the value, -1 when the component is empty or carries a non digit.
   */
  private static component(text: string): number {
    if (text.length === 0) {
      return INVALID_COMPONENT;
    }
    let value: number = 0;
    for (let i = 0; i < text.length; i++) {
      const code: number = text.charCodeAt(i);
      if (code < 48 || code > 57) {
        return INVALID_COMPONENT;
      }
      value = value * 10 + (code - 48);
    }
    return value;
  }

  public getMajor(): number {
    return this.major;
  }

  public getMinor(): number {
    return this.minor;
  }

  public getPatch(): number {
    return this.patch;
  }

  public isValid(): boolean {
    return this.major >= 0 && this.minor >= 0 && this.patch >= 0;
  }

  /**
   * Compares this version to another one.
   *
   * @param other version to compare against.
   * @returns a negative number when this one is older, zero when equal, positive when newer.
   */
  public compareTo(other: SemVer): number {
    if (this.major !== other.getMajor()) {
      return this.major - other.getMajor();
    }
    if (this.minor !== other.getMinor()) {
      return this.minor - other.getMinor();
    }
    return this.patch - other.getPatch();
  }

  public isAtLeast(other: SemVer): boolean {
    return this.compareTo(other) >= 0;
  }

  public toString(): string {
    return `${this.major}.${this.minor}.${this.patch}`;
  }
}

/**
 * Probes the platform against the feature gates of the sample.
 *
 * The prober is pure: it receives the platform version and the set of declared SysCaps and never
 * calls into the device, so a case can assert the verdict for a platform that is not installed.
 */
class FeatureProber {
  private platformVersion: SemVer = new SemVer(0, 0, 0);
  private sysCaps: Set<string> = new Set<string>();

  constructor(platformVersion: SemVer, sysCaps: Set<string>) {
    this.platformVersion = platformVersion;
    this.sysCaps = sysCaps;
  }

  public probe(gate: FeatureGate): FeatureProbe {
    if (!this.platformVersion.isAtLeast(SemVer.parse(API_SINCE_VERSION))) {
      return {
        name: gate.name,
        verdict: gate.optional ? Verdict.DEGRADED : Verdict.UNSUPPORTED,
        reason: 'the platform is older than the assessment kit'
      };
    }
    if (!this.sysCaps.has(gate.sysCap)) {
      return {
        name: gate.name,
        verdict: gate.optional ? Verdict.DEGRADED : Verdict.UNSUPPORTED,
        reason: 'the required SysCap is not declared'
      };
    }
    return {
      name: gate.name,
      verdict: Verdict.SUPPORTED,
      reason: ''
    };
  }

  public probeAll(gates: FeatureGate[]): FeatureProbe[] {
    const results: FeatureProbe[] = [];
    for (let i = 0; i < gates.length; i++) {
      results.push(this.probe(gates[i]));
    }
    return results;
  }

  public supportedCount(gates: FeatureGate[]): number {
    let total: number = 0;
    const results: FeatureProbe[] = this.probeAll(gates);
    for (let i = 0; i < results.length; i++) {
      if (results[i].verdict === Verdict.SUPPORTED) {
        total++;
      }
    }
    return total;
  }

  public describe(): string {
    return `FeatureProber{platform=${this.platformVersion.toString()}, caps=${this.sysCaps.size}}`;
  }
}

/**
 * Matrix of the feature gates that the sample documents.
 *
 * The mandatory gates are the four APIs of the kit, the optional gates are the hardening measures
 * of the exam page and the localization of the two shipped locales.
 */
class CompatibilityMatrix {
  private gates: FeatureGate[] = [];

  public add(gate: FeatureGate): void {
    this.gates.push(gate);
  }

  public all(): FeatureGate[] {
    return this.gates.slice();
  }

  public count(): number {
    return this.gates.length;
  }

  public mandatory(): FeatureGate[] {
    return this.filter(false);
  }

  public optional(): FeatureGate[] {
    return this.filter(true);
  }

  public names(): string[] {
    const values: string[] = [];
    for (let i = 0; i < this.gates.length; i++) {
      values.push(this.gates[i].name);
    }
    return values;
  }

  private filter(optional: boolean): FeatureGate[] {
    const values: FeatureGate[] = [];
    for (let i = 0; i < this.gates.length; i++) {
      if (this.gates[i].optional === optional) {
        values.push(this.gates[i]);
      }
    }
    return values;
  }

  public describe(): string {
    return `CompatibilityMatrix{gates=${this.gates.length}, mandatory=${this.mandatory().length}}`;
  }
}

/**
 * Backward compatible fallbacks of the sample.
 *
 * When a gate is unsupported the page hides the entry point instead of failing, which is the
 * fallback that a sample must demonstrate. The catalogue keeps the fallback per feature.
 */
class FallbackCatalogue {
  private fallbacks: Map<string, string> = new Map<string, string>();

  public put(feature: string, fallback: string): void {
    this.fallbacks.set(feature, fallback);
  }

  public fallbackOf(feature: string): string {
    const value: string | undefined = this.fallbacks.get(feature);
    return value === undefined ? '' : value;
  }

  public has(feature: string): boolean {
    return this.fallbacks.has(feature);
  }

  public size(): number {
    return this.fallbacks.size;
  }

  public describe(): string {
    return `FallbackCatalogue{entries=${this.fallbacks.size}}`;
  }
}

/**
 * Builds the feature gates of the sample.
 *
 * @returns the populated compatibility matrix.
 */
function buildMatrix(): CompatibilityMatrix {
  const matrix: CompatibilityMatrix = new CompatibilityMatrix();
  matrix.add({
    name: 'assessment.begin',
    minApiVersion: MIN_API_VERSION,
    sysCap: 'SystemCapability.Customization.AssessmentConfiguration',
    optional: false
  });
  matrix.add({
    name: 'assessment.end',
    minApiVersion: MIN_API_VERSION,
    sysCap: 'SystemCapability.Customization.AssessmentConfiguration',
    optional: false
  });
  matrix.add({
    name: 'assessment.isActive',
    minApiVersion: MIN_API_VERSION,
    sysCap: 'SystemCapability.Customization.AssessmentConfiguration',
    optional: false
  });
  matrix.add({
    name: 'assessment.getConfiguration',
    minApiVersion: MIN_API_VERSION,
    sysCap: 'SystemCapability.Customization.AssessmentConfiguration',
    optional: false
  });
  matrix.add({
    name: 'window.setWindowPrivacyMode',
    minApiVersion: MIN_API_VERSION,
    sysCap: 'SystemCapability.WindowManager.WindowManager.Core',
    optional: true
  });
  matrix.add({
    name: 'inputMethod.setSimpleKeyboardEnabled',
    minApiVersion: MIN_API_VERSION,
    sysCap: 'SystemCapability.MiscServices.InputMethodFramework',
    optional: true
  });
  return matrix;
}

/**
 * Builds the declared SysCap set of a fully featured device.
 *
 * @returns the set that contains every SysCap of the matrix.
 */
function fullSysCaps(): Set<string> {
  const caps: Set<string> = new Set<string>();
  caps.add('SystemCapability.Customization.AssessmentConfiguration');
  caps.add('SystemCapability.WindowManager.WindowManager.Core');
  caps.add('SystemCapability.MiscServices.InputMethodFramework');
  return caps;
}

/**
 * Launches the sample and waits for the entry page.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function prepareIndex(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'prepareIndex: the entry page is not rendered');
  }
  return rendered;
}

export default function assessmentCompatibilityTest() {
  describe('AssessmentCompatibility_Test', () => {
    let driver: Driver;
    let matrix: CompatibilityMatrix;
    let fallbacks: FallbackCatalogue;

    beforeAll(async () => {
      driver = getDriver();
      matrix = buildMatrix();
      fallbacks = new FallbackCatalogue();
      fallbacks.put('window.setWindowPrivacyMode', 'the exam page is captured normally');
      fallbacks.put('inputMethod.setSimpleKeyboardEnabled', 'the full keyboard stays available');
      fallbacks.put('assessment.begin', 'the begin button is disabled');
      fallbacks.put('assessment.getConfiguration', 'the config card shows the placeholder');
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: parse the three build versions.
     * Expectation: every version is valid and the three values are identical, which is the
     * pinning rule of the sample.
     */
    it('Assessment_AssessmentCompatibility_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_001, begin');
      const target: SemVer = SemVer.parse(BUILD_TARGET_VERSION);
      const compatible: SemVer = SemVer.parse(BUILD_COMPATIBLE_VERSION);
      const compile: SemVer = SemVer.parse(BUILD_COMPILE_VERSION);
      expect(target.isValid()).assertTrue();
      expect(compatible.isValid()).assertTrue();
      expect(compile.isValid()).assertTrue();
      expect(target.compareTo(compatible)).assertEqual(0);
      expect(compatible.compareTo(compile)).assertEqual(0);
      expect(target.toString()).assertEqual(BUILD_TARGET_VERSION);
      hilog.info(DOMAIN, TAG, '%{public}s target %{public}s', BUNDLE + 'AssessmentCompatibility_001',
        target.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_001, end');
    });

    /**
     * Scenario: parse a malformed version.
     * Expectation: every component becomes the invalid sentinel and the version reports itself as
     * invalid, so the caller can reject it instead of accepting a partial match.
     */
    it('Assessment_AssessmentCompatibility_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_002, begin');
      const twoParts: SemVer = SemVer.parse('26.0');
      expect(twoParts.isValid()).assertFalse();
      expect(twoParts.getMajor()).assertEqual(INVALID_COMPONENT);
      const nonNumeric: SemVer = SemVer.parse('26.x.0');
      expect(nonNumeric.isValid()).assertFalse();
      expect(nonNumeric.getMinor()).assertEqual(INVALID_COMPONENT);
      const empty: SemVer = SemVer.parse('');
      expect(empty.isValid()).assertFalse();
      expect(empty.getPatch()).assertEqual(INVALID_COMPONENT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_002, end');
    });

    /**
     * Scenario: inspect the feature matrix.
     * Expectation: the matrix carries the four mandatory APIs and two optional hardening
     * measures, and every gate declares the assessment SysCap of the platform release.
     */
    it('Assessment_AssessmentCompatibility_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_004, begin');
      expect(matrix.count()).assertEqual(FEATURE_COUNT);
      expect(matrix.mandatory().length).assertEqual(4);
      expect(matrix.optional().length).assertEqual(2);
      const names: string[] = matrix.names();
      const unique: Set<string> = new Set<string>(names);
      expect(unique.size).assertEqual(names.length);
      for (let i = 0; i < matrix.mandatory().length; i++) {
        expect(matrix.mandatory()[i].minApiVersion).assertEqual(MIN_API_VERSION);
        expect(matrix.mandatory()[i].sysCap).assertContain('AssessmentConfiguration');
      }
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'AssessmentCompatibility_004',
        matrix.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_004, end');
    });

    /**
     * Scenario: probe a fully featured platform.
     * Expectation: every gate is supported and no reason is reported.
     */
    it('Assessment_AssessmentCompatibility_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_005, begin');
      const prober: FeatureProber = new FeatureProber(SemVer.parse(BUILD_TARGET_VERSION), fullSysCaps());
      const probes: FeatureProbe[] = prober.probeAll(matrix.all());
      expect(probes.length).assertEqual(FEATURE_COUNT);
      for (let i = 0; i < probes.length; i++) {
        expect(probes[i].verdict).assertEqual(Verdict.SUPPORTED);
        expect(probes[i].reason).assertEqual('');
      }
      expect(prober.supportedCount(matrix.all())).assertEqual(FEATURE_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'AssessmentCompatibility_005',
        prober.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_005, end');
    });

    /**
     * Scenario: probe a platform older than the assessment kit.
     * Expectation: the mandatory gates become unsupported and the optional ones degrade, so the
     * page hides the begin entry point but keeps the rest of the demo readable.
     */
    it('Assessment_AssessmentCompatibility_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_006, begin');
      const prober: FeatureProber = new FeatureProber(SemVer.parse('18.0.0'), fullSysCaps());
      const mandatory: FeatureProbe[] = prober.probeAll(matrix.mandatory());
      const optional: FeatureProbe[] = prober.probeAll(matrix.optional());
      for (let i = 0; i < mandatory.length; i++) {
        expect(mandatory[i].verdict).assertEqual(Verdict.UNSUPPORTED);
        expect(mandatory[i].reason).assertContain('older');
      }
      for (let i = 0; i < optional.length; i++) {
        expect(optional[i].verdict).assertEqual(Verdict.DEGRADED);
      }
      expect(prober.supportedCount(matrix.all())).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'AssessmentCompatibility_006',
        prober.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_006, end');
    });

    /**
     * Scenario: probe a new platform without the customization SysCap.
     * Expectation: the four APIs are unsupported because the service is absent, while the two
     * hardening measures remain supported.
     */
    it('Assessment_AssessmentCompatibility_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_007, begin');
      const caps: Set<string> = new Set<string>();
      caps.add('SystemCapability.WindowManager.WindowManager.Core');
      caps.add('SystemCapability.MiscServices.InputMethodFramework');
      const prober: FeatureProber = new FeatureProber(SemVer.parse(BUILD_TARGET_VERSION), caps);
      expect(prober.supportedCount(matrix.mandatory())).assertEqual(0);
      expect(prober.supportedCount(matrix.optional())).assertEqual(2);
      const beginProbe: FeatureProbe = prober.probe(matrix.mandatory()[0]);
      expect(beginProbe.verdict).assertEqual(Verdict.UNSUPPORTED);
      expect(beginProbe.reason).assertContain('SysCap');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_007, end');
    });

    /**
     * Scenario: probe a platform newer than the pinned build version.
     * Expectation: a newer platform still satisfies the gate, the comparison is a lower bound and
     * not an equality.
     */
    it('Assessment_AssessmentCompatibility_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_008, begin');
      const future: SemVer = SemVer.parse('30.2.1');
      expect(future.isAtLeast(SemVer.parse(API_SINCE_VERSION))).assertTrue();
      const prober: FeatureProber = new FeatureProber(future, fullSysCaps());
      expect(prober.supportedCount(matrix.all())).assertEqual(FEATURE_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_008, end');
    });

    /**
     * Scenario: probe the exact boundary version.
     * Expectation: the version that introduced the API satisfies the gate, the rule is inclusive.
     */
    it('Assessment_AssessmentCompatibility_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_009, begin');
      const boundary: SemVer = SemVer.parse(API_SINCE_VERSION);
      expect(boundary.isAtLeast(boundary)).assertTrue();
      const prober: FeatureProber = new FeatureProber(boundary, fullSysCaps());
      expect(prober.supportedCount(matrix.all())).assertEqual(FEATURE_COUNT);
      const justBefore: SemVer = SemVer.parse('25.9.9');
      expect(justBefore.isAtLeast(boundary)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_009, end');
    });

    /**
     * Scenario: the fallback catalogue.
     * Expectation: every feature that the page can hide has a documented fallback and an unknown
     * feature resolves to the empty string rather than throwing.
     */
    it('Assessment_AssessmentCompatibility_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_010, begin');
      expect(fallbacks.size()).assertEqual(4);
      expect(fallbacks.has('assessment.begin')).assertTrue();
      expect(fallbacks.fallbackOf('assessment.begin')).assertContain('disabled');
      expect(fallbacks.fallbackOf('assessment.getConfiguration')).assertContain('placeholder');
      expect(fallbacks.has('assessment.unknown')).assertFalse();
      expect(fallbacks.fallbackOf('assessment.unknown')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'AssessmentCompatibility_010',
        fallbacks.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_010, end');
    });

    /**
     * Scenario: the minimum API version that the guide documents.
     * Expectation: the kit is available from a low API version and the sample pins a newer one,
     * so the pinned version is strictly newer than the documented minimum.
     */
    it('Assessment_AssessmentCompatibility_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_011, begin');
      const pinned: SemVer = SemVer.parse(API_SINCE_VERSION);
      expect(pinned.getMajor()).assertLargerOrEqual(MIN_API_VERSION);
      expect(pinned.getMajor()).assertEqual(26);
      expect(MIN_API_VERSION).assertEqual(20);
      expect(pinned.getMajor() > MIN_API_VERSION).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s pinned major %{public}d, guide minimum %{public}d',
        BUNDLE + 'AssessmentCompatibility_011', pinned.getMajor(), MIN_API_VERSION);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_011, end');
    });

    /**
     * Scenario: a degraded feature keeps the page usable.
     * Expectation: a degraded verdict never hides a mandatory card, only the optional measure is
     * skipped.
     */
    it('Assessment_AssessmentCompatibility_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_012, begin');
      const prober: FeatureProber = new FeatureProber(SemVer.parse('19.0.0'), fullSysCaps());
      const optionalProbes: FeatureProbe[] = prober.probeAll(matrix.optional());
      expect(optionalProbes.length).assertEqual(2);
      for (let i = 0; i < optionalProbes.length; i++) {
        expect(optionalProbes[i].verdict === Verdict.SUPPORTED).assertFalse();
        expect(optionalProbes[i].verdict === Verdict.DEGRADED).assertTrue();
      }
      expect(fallbacks.fallbackOf('window.setWindowPrivacyMode')).assertContain('captured');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_012, end');
    });

    /**
     * Scenario: a probe with a partially declared SysCap set.
     * Expectation: the prober answers per gate and never conflates the missing capability of one
     * gate with the capability of another one.
     */
    it('Assessment_AssessmentCompatibility_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_019, begin');
      const caps: Set<string> = new Set<string>();
      caps.add('SystemCapability.Customization.AssessmentConfiguration');
      const prober: FeatureProber = new FeatureProber(SemVer.parse(BUILD_TARGET_VERSION), caps);
      expect(prober.supportedCount(matrix.mandatory())).assertEqual(4);
      expect(prober.supportedCount(matrix.optional())).assertEqual(0);
      const privacyProbe: FeatureProbe = prober.probe(matrix.optional()[0]);
      expect(privacyProbe.verdict).assertEqual(Verdict.DEGRADED);
      expect(privacyProbe.reason).assertContain('SysCap');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'AssessmentCompatibility_019',
        prober.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_019, end');
    });

    /**
     * Scenario: a version with a leading zero component.
     * Expectation: the parser accepts the digits and normalizes the value, because the leading
     * zero is a formatting choice of the build file.
     */
    it('Assessment_AssessmentCompatibility_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_020, begin');
      const padded: SemVer = SemVer.parse('026.00.01');
      expect(padded.isValid()).assertTrue();
      expect(padded.getMajor()).assertEqual(26);
      expect(padded.getMinor()).assertEqual(0);
      expect(padded.getPatch()).assertEqual(1);
      expect(padded.isAtLeast(SemVer.parse(API_SINCE_VERSION))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s parsed %{public}s', BUNDLE + 'AssessmentCompatibility_020',
        padded.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_020, end');
    });

    /**
     * Scenario: the verdict naming.
     * Expectation: every verdict has a stable lowercase name, which the log lines and the report
     * rely on.
     */
    it('Assessment_AssessmentCompatibility_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_022, begin');
      expect(Verdict.SUPPORTED).assertEqual('supported');
      expect(Verdict.DEGRADED).assertEqual('degraded');
      expect(Verdict.UNSUPPORTED).assertEqual('unsupported');
      const values: string[] = [Verdict.SUPPORTED, Verdict.DEGRADED, Verdict.UNSUPPORTED];
      const unique: Set<string> = new Set<string>(values);
      expect(unique.size).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_022, end');
    });

    /**
     * Scenario: a matrix with no optional gate.
     * Expectation: the optional filter returns an empty array and the mandatory filter returns
     * the whole matrix.
     */
    it('Assessment_AssessmentCompatibility_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_023, begin');
      const local: CompatibilityMatrix = new CompatibilityMatrix();
      local.add({
        name: 'feature_a',
        minApiVersion: MIN_API_VERSION,
        sysCap: 'SystemCapability.Customization.AssessmentConfiguration',
        optional: false
      });
      expect(local.count()).assertEqual(1);
      expect(local.optional().length).assertEqual(0);
      expect(local.mandatory().length).assertEqual(1);
      expect(local.names()[0]).assertEqual('feature_a');
      const prober: FeatureProber = new FeatureProber(SemVer.parse(BUILD_TARGET_VERSION), fullSysCaps());
      expect(prober.supportedCount(local.all())).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'AssessmentCompatibility_023',
        local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_023, end');
    });

    /**
     * Scenario: a probe result is pure data.
     * Expectation: probing the same gate twice returns two independent records with the same
     * verdict, so a caller cannot mutate the prober state through a result.
     */
    it('Assessment_AssessmentCompatibility_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_024, begin');
      const prober: FeatureProber = new FeatureProber(SemVer.parse(BUILD_TARGET_VERSION), fullSysCaps());
      const first: FeatureProbe = prober.probe(matrix.mandatory()[0]);
      const second: FeatureProbe = prober.probe(matrix.mandatory()[0]);
      expect(first.name).assertEqual(second.name);
      expect(first.verdict).assertEqual(second.verdict);
      first.verdict = Verdict.UNSUPPORTED;
      const third: FeatureProbe = prober.probe(matrix.mandatory()[0]);
      expect(third.verdict).assertEqual(Verdict.SUPPORTED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_024, end');
    });

    /**
     * Scenario: the feature count of the matrix matches the documented surface.
     * Expectation: four APIs plus two hardening measures, and the optional gates are exactly the
     * ones that the exam page applies itself.
     */
    it('Assessment_AssessmentCompatibility_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_025, begin');
      const optionalNames: string[] = [];
      const optional: FeatureGate[] = matrix.optional();
      for (let i = 0; i < optional.length; i++) {
        optionalNames.push(optional[i].name);
      }
      expect(optionalNames.indexOf('window.setWindowPrivacyMode') >= 0).assertTrue();
      expect(optionalNames.indexOf('inputMethod.setSimpleKeyboardEnabled') >= 0).assertTrue();
      expect(matrix.count()).assertEqual(optional.length + matrix.mandatory().length);
      hilog.info(DOMAIN, TAG, '%{public}s optional %{public}s', BUNDLE + 'AssessmentCompatibility_025',
        optionalNames.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentCompatibility_025, end');
    });
  });
}
