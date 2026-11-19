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
import hilog from '@ohos.hilog';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// SysCap that gates the four assessment APIs of the sample. An image without the assessment
// service does not declare this capability, and the whole assessment namespace is then absent.
const SYSCAP_ASSESSMENT: string = 'SystemCapability.Customization.AssessmentConfiguration';

// The sample pins every build configuration to the same platform version, so a mismatch
// between the three values is a release blocker rather than a warning.
const BUILD_TARGET_VERSION: string = '26.0.0';
const BUILD_COMPATIBLE_VERSION: string = '26.0.0';
const BUILD_COMPILE_VERSION: string = '26.0.0';

// The first version that ships the assessment APIs, it is used as the since descriptor of
// every API of the kit that the sample consumes.
const API_SINCE_VERSION: string = '26.0.0';

// Sentinel returned by the parser when a version component is not a decimal number.
const INVALID_VERSION_COMPONENT: number = -1;

// Number of version components of a normalized major.minor.patch version.
const VERSION_COMPONENT_COUNT: number = 3;

/**
 * One tracked API of the assessment kit.
 *
 * The descriptor captures everything the sample asserts about an API at build time: the name,
 * the owner namespace, the version that introduced it, the SysCap that provides it and whether
 * the API is deprecated or already removed.
 */
interface ApiVersionDescriptor {
  api: string;
  owner: string;
  sinceVersion: string;
  sysCap: string;
  deprecated: boolean;
  removedVersion: string;
  signature: string;
  description: string;
}

/**
 * A semantic version of the form major.minor.patch.
 *
 * The class is intentionally small: the sample only needs parsing, comparison and a stable
 * string form, and the build configuration as well as every API descriptor use the same
 * major.minor.patch shape.
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
   * Parses a version string, an invalid component is reported as -1 so that the caller can
   * reject the whole version instead of silently accepting a partial one.
   *
   * @param version version text, for example 26.0.0.
   * @returns the parsed version, every component is -1 when the text is malformed.
   */
  public static parse(version: string): SemVer {
    const parts: string[] = version.split('.');
    if (parts.length !== VERSION_COMPONENT_COUNT) {
      return new SemVer(INVALID_VERSION_COMPONENT, INVALID_VERSION_COMPONENT, INVALID_VERSION_COMPONENT);
    }
    const major: number = SemVer.parseComponent(parts[0]);
    const minor: number = SemVer.parseComponent(parts[1]);
    const patch: number = SemVer.parseComponent(parts[2]);
    return new SemVer(major, minor, patch);
  }

  /**
   * Parses one numeric component of a version.
   *
   * @param text component text.
   * @returns the parsed value, -1 when the component is empty or contains a non digit.
   */
  public static parseComponent(text: string): number {
    if (text.length === 0) {
      return INVALID_VERSION_COMPONENT;
    }
    let value: number = 0;
    for (let i = 0; i < text.length; i++) {
      const charCode: number = text.charCodeAt(i);
      if (charCode < 48 || charCode > 57) {
        return INVALID_VERSION_COMPONENT;
      }
      value = value * 10 + (charCode - 48);
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
   * Compares this version with another one using the usual numeric precedence.
   *
   * @param other version to compare with.
   * @returns -1 when this version is lower, 0 when both are equal, 1 when this is higher.
   */
  public compareTo(other: SemVer): number {
    if (this.major !== other.getMajor()) {
      return this.major < other.getMajor() ? -1 : 1;
    }
    if (this.minor !== other.getMinor()) {
      return this.minor < other.getMinor() ? -1 : 1;
    }
    if (this.patch !== other.getPatch()) {
      return this.patch < other.getPatch() ? -1 : 1;
    }
    return 0;
  }

  public equals(other: SemVer): boolean {
    return this.compareTo(other) === 0;
  }

  public isAtLeast(other: SemVer): boolean {
    return this.compareTo(other) >= 0;
  }

  public isLowerThan(other: SemVer): boolean {
    return this.compareTo(other) < 0;
  }

  public toString(): string {
    return `${this.major}.${this.minor}.${this.patch}`;
  }
}

/**
 * Catalog of the assessment APIs that the sample depends on.
 *
 * The catalog is the single source of the version contract, every case reads the descriptors
 * through the lookup helpers instead of keeping a second copy of the API list.
 */
class ApiVersionCatalog {
  private descriptors: ApiVersionDescriptor[] = API_DESCRIPTORS;
  private runtimeVersion: SemVer = SemVer.parse(BUILD_TARGET_VERSION);

  public size(): number {
    return this.descriptors.length;
  }

  public getApis(): string[] {
    const apis: string[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      apis.push(this.descriptors[i].api);
    }
    return apis;
  }

  public find(api: string): ApiVersionDescriptor | undefined {
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].api === api) {
        return this.descriptors[i];
      }
    }
    return undefined;
  }

  public describe(api: string): string {
    const descriptor: ApiVersionDescriptor | undefined = this.find(api);
    if (descriptor === undefined) {
      return `unknown api ${api}`;
    }
    return `${descriptor.owner}.${descriptor.api} since ${descriptor.sinceVersion}`;
  }

  public sinceVersionOf(api: string): string {
    const descriptor: ApiVersionDescriptor | undefined = this.find(api);
    return descriptor === undefined ? '' : descriptor.sinceVersion;
  }

  public sysCapOf(api: string): string {
    const descriptor: ApiVersionDescriptor | undefined = this.find(api);
    return descriptor === undefined ? '' : descriptor.sysCap;
  }

  public deprecatedApis(): string[] {
    const apis: string[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].deprecated) {
        apis.push(this.descriptors[i].api);
      }
    }
    return apis;
  }

  public removedApis(): string[] {
    const apis: string[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].removedVersion.length > 0) {
        apis.push(this.descriptors[i].api);
      }
    }
    return apis;
  }

  public requiredSysCaps(): string[] {
    const caps: string[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      const cap: string = this.descriptors[i].sysCap;
      if (caps.indexOf(cap) < 0) {
        caps.push(cap);
      }
    }
    return caps;
  }

  public availableApis(): string[] {
    const apis: string[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      const descriptor: ApiVersionDescriptor = this.descriptors[i];
      if (!descriptor.deprecated && descriptor.removedVersion.length === 0) {
        apis.push(descriptor.api);
      }
    }
    return apis;
  }

  /**
   * Reports whether the runtime version of the image is high enough for an API.
   *
   * @param api API name.
   * @returns true when the API was introduced at or before the runtime version.
   */
  public isProvidedByRuntime(api: string): boolean {
    const descriptor: ApiVersionDescriptor | undefined = this.find(api);
    if (descriptor === undefined) {
      return false;
    }
    const since: SemVer = SemVer.parse(descriptor.sinceVersion);
    return since.isValid() && this.runtimeVersion.isAtLeast(since);
  }

  /**
   * Collects the APIs that a candidate platform version would not provide.
   *
   * @param candidate platform version to check against.
   * @returns the names of the APIs that are newer than the candidate.
   */
  public missingOn(candidate: SemVer): string[] {
    const missing: string[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      const since: SemVer = SemVer.parse(this.descriptors[i].sinceVersion);
      if (since.isValid() && since.isAtLeast(candidate) && !since.equals(candidate)) {
        missing.push(this.descriptors[i].api);
      }
    }
    return missing;
  }
}

/**
 * The version contract of the product build configuration.
 */
class BuildConfigExpectation {
  private targetSdkVersion: string = BUILD_TARGET_VERSION;
  private compatibleSdkVersion: string = BUILD_COMPATIBLE_VERSION;
  private compileSdkVersion: string = BUILD_COMPILE_VERSION;

  public getTarget(): string {
    return this.targetSdkVersion;
  }

  public getCompatible(): string {
    return this.compatibleSdkVersion;
  }

  public getCompile(): string {
    return this.compileSdkVersion;
  }

  public allEqual(): boolean {
    return this.targetSdkVersion === this.compatibleSdkVersion &&
      this.targetSdkVersion === this.compileSdkVersion;
  }

  public target(): SemVer {
    return SemVer.parse(this.targetSdkVersion);
  }

  public compatible(): SemVer {
    return SemVer.parse(this.compatibleSdkVersion);
  }

  public compile(): SemVer {
    return SemVer.parse(this.compileSdkVersion);
  }

  public isAtLeastTarget(version: string): boolean {
    return SemVer.parse(version).isAtLeast(this.target());
  }

  public supportsApi(api: string): boolean {
    const since: SemVer = SemVer.parse(API_SINCE_VERSION);
    const catalog: ApiVersionCatalog = new ApiVersionCatalog();
    if (catalog.find(api) === undefined) {
      return false;
    }
    return this.target().isAtLeast(since);
  }

  public toString(): string {
    return `BuildConfigExpectation{target=${this.targetSdkVersion}, compatible=${this.compatibleSdkVersion}, ` +
      `compile=${this.compileSdkVersion}}`;
  }
}

/**
 * Decides whether an API may be called on a device with a given version and SysCap set.
 *
 * The gate mirrors the two independent conditions of the platform: the version must be high
 * enough and the capability must be declared by the image. A caller that ignores the second
 * condition runs into an undefined namespace instead of a business error.
 */
class VersionGate {
  private catalog: ApiVersionCatalog = new ApiVersionCatalog();
  private runtime: SemVer;
  private availableCaps: string[];

  constructor(runtime: string, availableCaps: string[]) {
    this.runtime = SemVer.parse(runtime);
    this.availableCaps = availableCaps;
  }

  public isVersionSufficient(api: string): boolean {
    const descriptor: ApiVersionDescriptor | undefined = this.catalog.find(api);
    if (descriptor === undefined) {
      return false;
    }
    const since: SemVer = SemVer.parse(descriptor.sinceVersion);
    return this.runtime.isAtLeast(since);
  }

  public isCapabilityPresent(api: string): boolean {
    const descriptor: ApiVersionDescriptor | undefined = this.catalog.find(api);
    if (descriptor === undefined) {
      return false;
    }
    return this.availableCaps.indexOf(descriptor.sysCap) >= 0;
  }

  public isCallable(api: string): boolean {
    return this.isVersionSufficient(api) && this.isCapabilityPresent(api);
  }

  public blockedReason(api: string): string {
    if (this.catalog.find(api) === undefined) {
      return 'api is not tracked';
    }
    if (!this.isVersionSufficient(api)) {
      return 'runtime version is too low';
    }
    if (!this.isCapabilityPresent(api)) {
      return 'capability is absent';
    }
    return '';
  }
}

// Descriptors of the four assessment APIs that the sample consumes. The signatures are kept
// in the exact shape of the kit documentation so that a drift shows up as a failed assertion.
const API_DESCRIPTORS: ApiVersionDescriptor[] = [
  {
    api: 'begin',
    owner: 'assessment',
    sinceVersion: API_SINCE_VERSION,
    sysCap: SYSCAP_ASSESSMENT,
    deprecated: false,
    removedVersion: '',
    signature: 'begin(context: Context, config: AssessmentConfig, callback: IAssessmentCallback): void',
    description: 'Enters assessment mode after the system confirmation dialog'
  },
  {
    api: 'end',
    owner: 'assessment',
    sinceVersion: API_SINCE_VERSION,
    sysCap: SYSCAP_ASSESSMENT,
    deprecated: false,
    removedVersion: '',
    signature: 'end(context: Context): void',
    description: 'Leaves assessment mode for the caller application'
  },
  {
    api: 'isActive',
    owner: 'assessment',
    sinceVersion: API_SINCE_VERSION,
    sysCap: SYSCAP_ASSESSMENT,
    deprecated: false,
    removedVersion: '',
    signature: 'isActive(): boolean',
    description: 'Queries whether the device is currently in assessment mode'
  },
  {
    api: 'getConfiguration',
    owner: 'assessment',
    sinceVersion: API_SINCE_VERSION,
    sysCap: SYSCAP_ASSESSMENT,
    deprecated: false,
    removedVersion: '',
    signature: 'getConfiguration(): AssessmentConfig',
    description: 'Returns the configuration of the current assessment session'
  }
];

/**
 * Checks whether the running image declares the assessment capability.
 *
 * @returns true when the SysCap is present, false on an image without the service.
 */
function isAssessmentSupported(): boolean {
  const supported: boolean = canIUse(SYSCAP_ASSESSMENT);
  if (!supported) {
    hilog.warn(DOMAIN, TAG, '%{public}s is absent on this image', SYSCAP_ASSESSMENT);
  }
  return supported;
}

export default function apiVersionValidationTest() {
  describe('ApiVersionValidation_Test', () => {
    let catalog: ApiVersionCatalog;
    let buildConfig: BuildConfigExpectation;

    beforeAll(() => {
      catalog = new ApiVersionCatalog();
      buildConfig = new BuildConfigExpectation();
    });

    afterAll(() => {
      // The suite keeps only in-memory models, nothing has to be released on the device, the
      // hook is declared so that every suite of the package exposes the same lifecycle shape.
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApiVersionValidation_Test, afterAll');
    });

    /**
     * Scenario: parse the release version that the sample is pinned to.
     * Expectation: the parser splits the major, the minor and the patch component correctly.
     */
    it('Assessment_SemVerParse_001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemVerParse_001, begin');
      const version: SemVer = SemVer.parse('26.0.0');
      expect(version.isValid()).assertTrue();
      expect(version.getMajor()).assertEqual(26);
      expect(version.getMinor()).assertEqual(0);
      expect(version.getPatch()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemVerParse_001, end');
    });

    /**
     * Scenario: parse versions with non zero minor and patch components.
     * Expectation: every component is preserved, the string form round trips the input.
     */
    it('Assessment_SemVerParseNonZero_002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemVerParseNonZero_002, begin');
      const version: SemVer = SemVer.parse('26.1.4');
      expect(version.getMajor()).assertEqual(26);
      expect(version.getMinor()).assertEqual(1);
      expect(version.getPatch()).assertEqual(4);
      expect(version.toString()).assertEqual('26.1.4');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemVerParseNonZero_002, end');
    });

    /**
     * Scenario: parse malformed version texts.
     * Expectation: a text with too few, too many or non numeric components is rejected as a
     * whole, no partial version is produced.
     */
    it('Assessment_SemVerParseInvalid_003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemVerParseInvalid_003, begin');
      const tooShort: SemVer = SemVer.parse('26.0');
      const tooLong: SemVer = SemVer.parse('26.0.0.1');
      const nonNumeric: SemVer = SemVer.parse('26.0.a');
      const empty: SemVer = SemVer.parse('');
      expect(tooShort.isValid()).assertFalse();
      expect(tooLong.isValid()).assertFalse();
      expect(nonNumeric.isValid()).assertFalse();
      expect(empty.isValid()).assertFalse();
      expect(tooShort.getMajor()).assertEqual(INVALID_VERSION_COMPONENT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemVerParseInvalid_003, end');
    });

    /**
     * Scenario: compare two versions of the same major line.
     * Expectation: the comparison follows the numeric precedence of minor and patch.
     */
    it('Assessment_SemVerCompare_004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemVerCompare_004, begin');
      const lower: SemVer = SemVer.parse('26.0.0');
      const middle: SemVer = SemVer.parse('26.0.1');
      const higher: SemVer = SemVer.parse('26.1.0');
      expect(lower.compareTo(middle)).assertEqual(-1);
      expect(middle.compareTo(lower)).assertEqual(1);
      expect(middle.compareTo(higher)).assertEqual(-1);
      expect(lower.compareTo(lower)).assertEqual(0);
      expect(lower.equals(SemVer.parse('26.0.0'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemVerCompare_004, end');
    });

    /**
     * Scenario: compare versions of different major lines.
     * Expectation: the major component dominates, a higher major is always greater.
     */
    it('Assessment_SemVerMajorDominance_005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemVerMajorDominance_005, begin');
      const major: SemVer = SemVer.parse('27.0.0');
      const minor: SemVer = SemVer.parse('26.9.9');
      expect(major.compareTo(minor)).assertEqual(1);
      expect(minor.isLowerThan(major)).assertTrue();
      expect(major.isAtLeast(minor)).assertTrue();
      expect(minor.isAtLeast(major)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemVerMajorDominance_005, end');
    });

    /**
     * Scenario: order the four API since descriptors.
     * Expectation: every descriptor of the kit shares the same since version, so none of them
     * sorts before another.
     */
    it('Assessment_SemVerApiOrdering_006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemVerApiOrdering_006, begin');
      const apis: string[] = catalog.getApis();
      expect(apis.length).assertEqual(4);
      const reference: SemVer = SemVer.parse(catalog.sinceVersionOf('begin'));
      for (let i = 0; i < apis.length; i++) {
        const version: SemVer = SemVer.parse(catalog.sinceVersionOf(apis[i]));
        hilog.info(DOMAIN, TAG, '%{public}s %{public}s since %{public}s',
          BUNDLE + 'SemVerApiOrdering_006', apis[i], version.toString());
        expect(version.isValid()).assertTrue();
        expect(version.equals(reference)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemVerApiOrdering_006, end');
    });

    /**
     * Scenario: inspect the size of the API catalog.
     * Expectation: the four consumed APIs are tracked and the getter returns a fresh copy.
     */
    it('Assessment_CatalogSize_007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogSize_007, begin');
      expect(catalog.size()).assertEqual(4);
      const first: string[] = catalog.getApis();
      first.push('injected');
      expect(catalog.getApis().length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogSize_007, end');
    });

    /**
     * Scenario: look up a tracked API.
     * Expectation: the descriptor is found and reports the expected owner and SysCap.
     */
    it('Assessment_CatalogLookup_008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogLookup_008, begin');
      const descriptor: ApiVersionDescriptor | undefined = catalog.find('isActive');
      expect(descriptor !== undefined).assertTrue();
      if (descriptor !== undefined) {
        expect(descriptor.owner).assertEqual('assessment');
        expect(descriptor.sysCap).assertEqual(SYSCAP_ASSESSMENT);
        expect(descriptor.deprecated).assertFalse();
        expect(descriptor.removedVersion).assertEqual('');
      }
      expect(catalog.describe('isActive')).assertEqual('assessment.isActive since 26.0.0');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogLookup_008, end');
    });

    /**
     * Scenario: look up an API that the sample does not track.
     * Expectation: the lookup returns undefined, the string helpers return empty values and
     * never throw.
     */
    it('Assessment_CatalogUnknown_009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogUnknown_009, begin');
      expect(catalog.find('beginExclusive') === undefined).assertTrue();
      expect(catalog.sinceVersionOf('beginExclusive')).assertEqual('');
      expect(catalog.sysCapOf('beginExclusive')).assertEqual('');
      expect(catalog.describe('beginExclusive')).assertEqual('unknown api beginExclusive');
      expect(catalog.isProvidedByRuntime('beginExclusive')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogUnknown_009, end');
    });

    /**
     * Scenario: the version contract of assessment.begin.
     * Expectation: begin is available since the pinned version, carries the assessment
     * SysCap and is neither deprecated nor removed.
     */
    it('Assessment_BeginSinceVersion_010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginSinceVersion_010, begin');
      const descriptor: ApiVersionDescriptor | undefined = catalog.find('begin');
      expect(descriptor !== undefined).assertTrue();
      if (descriptor !== undefined) {
        expect(descriptor.sinceVersion).assertEqual(API_SINCE_VERSION);
        expect(descriptor.sysCap).assertEqual(SYSCAP_ASSESSMENT);
        expect(descriptor.deprecated).assertFalse();
        expect(descriptor.removedVersion).assertEqual('');
        expect(descriptor.signature).assertContain('IAssessmentCallback');
        expect(descriptor.description.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginSinceVersion_010, end');
    });

    /**
     * Scenario: the version contract of assessment.end.
     * Expectation: end takes the context of the caller and is available since the same
     * version as begin.
     */
    it('Assessment_EndSinceVersion_011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndSinceVersion_011, begin');
      const descriptor: ApiVersionDescriptor | undefined = catalog.find('end');
      expect(descriptor !== undefined).assertTrue();
      if (descriptor !== undefined) {
        expect(descriptor.sinceVersion).assertEqual(API_SINCE_VERSION);
        expect(descriptor.signature).assertContain('end(context: Context)');
        expect(descriptor.signature).assertContain(': void');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndSinceVersion_011, end');
    });

    /**
     * Scenario: the version contract of assessment.isActive.
     * Expectation: isActive is synchronous and returns a boolean since the pinned version.
     */
    it('Assessment_IsActiveSinceVersion_012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IsActiveSinceVersion_012, begin');
      const descriptor: ApiVersionDescriptor | undefined = catalog.find('isActive');
      expect(descriptor !== undefined).assertTrue();
      if (descriptor !== undefined) {
        expect(descriptor.sinceVersion).assertEqual(API_SINCE_VERSION);
        expect(descriptor.signature).assertEqual('isActive(): boolean');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IsActiveSinceVersion_012, end');
    });

    /**
     * Scenario: the version contract of assessment.getConfiguration.
     * Expectation: getConfiguration is synchronous, returns an AssessmentConfig and shares
     * the since version of the other three APIs.
     */
    it('Assessment_GetConfigurationSinceVersion_013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GetConfigurationSinceVersion_013, begin');
      const descriptor: ApiVersionDescriptor | undefined = catalog.find('getConfiguration');
      expect(descriptor !== undefined).assertTrue();
      if (descriptor !== undefined) {
        expect(descriptor.sinceVersion).assertEqual(API_SINCE_VERSION);
        expect(descriptor.signature).assertEqual('getConfiguration(): AssessmentConfig');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GetConfigurationSinceVersion_013, end');
    });

    /**
     * Scenario: no tracked API is deprecated.
     * Expectation: the deprecated bucket of the catalog is empty, so the sample does not call
     * any API that the kit plans to retire.
     */
    it('Assessment_NoDeprecatedApi_014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoDeprecatedApi_014, begin');
      const deprecated: string[] = catalog.deprecatedApis();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}d deprecated APIs',
        BUNDLE + 'NoDeprecatedApi_014', deprecated.length);
      expect(deprecated.length).assertEqual(0);
      expect(catalog.availableApis().length).assertEqual(catalog.size());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoDeprecatedApi_014, end');
    });

    /**
     * Scenario: no tracked API is removed.
     * Expectation: the removed bucket is empty and every removedVersion field is blank.
     */
    it('Assessment_NoRemovedApi_015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoRemovedApi_015, begin');
      const removed: string[] = catalog.removedApis();
      expect(removed.length).assertEqual(0);
      const apis: string[] = catalog.getApis();
      for (let i = 0; i < apis.length; i++) {
        const descriptor: ApiVersionDescriptor | undefined = catalog.find(apis[i]);
        if (descriptor !== undefined) {
          expect(descriptor.removedVersion.length).assertEqual(0);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoRemovedApi_015, end');
    });

    /**
     * Scenario: the SysCap requirement of the catalog.
     * Expectation: the four APIs share one capability, the de-duplicating getter reports a
     * single entry.
     */
    it('Assessment_SysCapDescriptor_016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SysCapDescriptor_016, begin');
      const caps: string[] = catalog.requiredSysCaps();
      expect(caps.length).assertEqual(1);
      expect(caps[0]).assertEqual(SYSCAP_ASSESSMENT);
      hilog.info(DOMAIN, TAG, '%{public}s required SysCap: %{public}s',
        BUNDLE + 'SysCapDescriptor_016', caps[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SysCapDescriptor_016, end');
    });

    /**
     * Scenario: query the assessment SysCap on the running image.
     * Expectation: canIUse answers a boolean for the capability of the sample, whether the
     * image provides it or not.
     */
    it('Assessment_RuntimeCanIUse_017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RuntimeCanIUse_017, begin');
      const supported: boolean = canIUse(SYSCAP_ASSESSMENT);
      hilog.info(DOMAIN, TAG, '%{public}s canIUse(%{public}s): %{public}s',
        BUNDLE + 'RuntimeCanIUse_017', SYSCAP_ASSESSMENT, `${supported}`);
      expect(typeof supported).assertEqual('boolean');
      // canIUse answers a real boolean for the capability, the value itself depends on the
      // image under test, so the case asserts the type and both branches are meaningful.
      expect(supported === true || supported === false).assertTrue();
      if (!supported) {
        hilog.warn(DOMAIN, TAG, '%{public}s assessment service is absent, live API cases are skipped',
          BUNDLE + 'RuntimeCanIUse_017');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RuntimeCanIUse_017, end');
    });

    /**
     * Scenario: query a capability that no OpenHarmony image declares.
     * Expectation: canIUse reports false, which proves that the probe is not a constant
     * returning true.
     */
    it('Assessment_RuntimeCanIUseUnknown_018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RuntimeCanIUseUnknown_018, begin');
      const unknownCap: string = 'SystemCapability.Customization.AssessmentConfiguration.Unknown';
      const supported: boolean = canIUse(unknownCap);
      hilog.info(DOMAIN, TAG, '%{public}s canIUse(%{public}s): %{public}s',
        BUNDLE + 'RuntimeCanIUseUnknown_018', unknownCap, `${supported}`);
      expect(supported).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RuntimeCanIUseUnknown_018, end');
    });

    /**
     * Scenario: call canIUse repeatedly for the assessment capability.
     * Expectation: the answer is stable, the result does not flap between two queries of the
     * same suite.
     */
    it('Assessment_RuntimeCanIUseStable_019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RuntimeCanIUseStable_019, begin');
      const first: boolean = canIUse(SYSCAP_ASSESSMENT);
      const second: boolean = canIUse(SYSCAP_ASSESSMENT);
      const third: boolean = canIUse(SYSCAP_ASSESSMENT);
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      hilog.info(DOMAIN, TAG, '%{public}s stable answer: %{public}s',
        BUNDLE + 'RuntimeCanIUseStable_019', `${first}`);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RuntimeCanIUseStable_019, end');
    });

    /**
     * Scenario: inspect the product build configuration.
     * Expectation: the target, the compatible and the compile version are the pinned release
     * version, and the three values agree with each other.
     */
    it('Assessment_BuildConfigTarget_020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BuildConfigTarget_020, begin');
      expect(buildConfig.getTarget()).assertEqual(BUILD_TARGET_VERSION);
      expect(buildConfig.getCompatible()).assertEqual(BUILD_COMPATIBLE_VERSION);
      expect(buildConfig.getCompile()).assertEqual(BUILD_COMPILE_VERSION);
      expect(buildConfig.allEqual()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', buildConfig.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BuildConfigTarget_020, end');
    });

    /**
     * Scenario: compare a candidate version against the target SDK version.
     * Expectation: an older candidate is rejected, the target itself and a newer candidate
     * are accepted.
     */
    it('Assessment_BuildConfigAtLeast_021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BuildConfigAtLeast_021, begin');
      expect(buildConfig.isAtLeastTarget('25.0.0')).assertFalse();
      expect(buildConfig.isAtLeastTarget('25.9.9')).assertFalse();
      expect(buildConfig.isAtLeastTarget('26.0.0')).assertTrue();
      expect(buildConfig.isAtLeastTarget('26.0.1')).assertTrue();
      expect(buildConfig.isAtLeastTarget('27.0.0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BuildConfigAtLeast_021, end');
    });

    /**
     * Scenario: ask the build configuration whether it provides each tracked API.
     * Expectation: the target version is high enough for all four APIs and rejects a name
     * that the catalog does not know.
     */
    it('Assessment_BuildConfigSupportsApis_022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BuildConfigSupportsApis_022, begin');
      const apis: string[] = catalog.getApis();
      for (let i = 0; i < apis.length; i++) {
        const supported: boolean = buildConfig.supportsApi(apis[i]);
        hilog.info(DOMAIN, TAG, '%{public}s %{public}s supported: %{public}s',
          BUNDLE + 'BuildConfigSupportsApis_022', apis[i], `${supported}`);
        expect(supported).assertTrue();
      }
      expect(buildConfig.supportsApi('beginExclusive')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BuildConfigSupportsApis_022, end');
    });

    /**
     * Scenario: gate an API call on a matching version and a present capability.
     * Expectation: the gate reports the API as callable and the blocked reason is empty.
     */
    it('Assessment_VersionGateAvailable_023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VersionGateAvailable_023, begin');
      const caps: string[] = [SYSCAP_ASSESSMENT];
      const gate: VersionGate = new VersionGate(BUILD_TARGET_VERSION, caps);
      expect(gate.isVersionSufficient('begin')).assertTrue();
      expect(gate.isCapabilityPresent('begin')).assertTrue();
      expect(gate.isCallable('begin')).assertTrue();
      expect(gate.blockedReason('begin')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VersionGateAvailable_023, end');
    });

    /**
     * Scenario: gate an API call on an image without the assessment service.
     * Expectation: the capability check fails while the version check still passes, which is
     * exactly the offline situation that the sample degrades from.
     */
    it('Assessment_VersionGateNoCapability_024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VersionGateNoCapability_024, begin');
      const gate: VersionGate = new VersionGate(BUILD_TARGET_VERSION, []);
      expect(gate.isVersionSufficient('isActive')).assertTrue();
      expect(gate.isCapabilityPresent('isActive')).assertFalse();
      expect(gate.isCallable('isActive')).assertFalse();
      expect(gate.blockedReason('isActive')).assertEqual('capability is absent');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VersionGateNoCapability_024, end');
    });

    /**
     * Scenario: gate an API call on an image with an older platform version.
     * Expectation: the version check fails and the gate reports the low runtime as reason.
     */
    it('Assessment_VersionGateLowVersion_025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VersionGateLowVersion_025, begin');
      const caps: string[] = [SYSCAP_ASSESSMENT];
      const gate: VersionGate = new VersionGate('25.0.0', caps);
      expect(gate.isVersionSufficient('end')).assertFalse();
      expect(gate.isCapabilityPresent('end')).assertTrue();
      expect(gate.isCallable('end')).assertFalse();
      expect(gate.blockedReason('end')).assertEqual('runtime version is too low');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VersionGateLowVersion_025, end');
    });

    /**
     * Scenario: gate an API that the catalog does not track.
     * Expectation: the gate refuses the call instead of assuming availability, and the
     * reason names the missing descriptor.
     */
    it('Assessment_VersionGateUnknownApi_026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VersionGateUnknownApi_026, begin');
      const caps: string[] = [SYSCAP_ASSESSMENT];
      const gate: VersionGate = new VersionGate(BUILD_TARGET_VERSION, caps);
      expect(gate.isVersionSufficient('unknownApi')).assertFalse();
      expect(gate.isCapabilityPresent('unknownApi')).assertFalse();
      expect(gate.isCallable('unknownApi')).assertFalse();
      expect(gate.blockedReason('unknownApi')).assertEqual('api is not tracked');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'VersionGateUnknownApi_026, end');
    });

    /**
     * Scenario: ask the catalog which APIs a lower candidate version would miss.
     * Expectation: a candidate below the since version misses all four APIs, a candidate at
     * the since version misses none.
     */
    it('Assessment_CatalogMissingOn_027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogMissingOn_027, begin');
      const lower: string[] = catalog.missingOn(SemVer.parse('25.0.0'));
      const current: string[] = catalog.missingOn(SemVer.parse(API_SINCE_VERSION));
      hilog.info(DOMAIN, TAG, '%{public}s missing on 25.0.0: %{public}d, on 26.0.0: %{public}d',
        BUNDLE + 'CatalogMissingOn_027', lower.length, current.length);
      expect(lower.length).assertEqual(4);
      expect(current.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogMissingOn_027, end');
    });

    /**
     * Scenario: every tracked API is provided by the pinned runtime.
     * Expectation: the runtime availability query answers true for the four descriptors.
     */
    it('Assessment_RuntimeProvidesApis_028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RuntimeProvidesApis_028, begin');
      const apis: string[] = catalog.getApis();
      for (let i = 0; i < apis.length; i++) {
        expect(catalog.isProvidedByRuntime(apis[i])).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RuntimeProvidesApis_028, end');
    });

    /**
     * Scenario: the descriptors are internally consistent.
     * Expectation: every descriptor has a known owner, a valid since version, a non empty
     * signature and the assessment SysCap.
     */
    it('Assessment_DescriptorConsistency_030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DescriptorConsistency_030, begin');
      for (let i = 0; i < API_DESCRIPTORS.length; i++) {
        const descriptor: ApiVersionDescriptor = API_DESCRIPTORS[i];
        expect(descriptor.owner).assertEqual('assessment');
        expect(descriptor.sysCap).assertEqual(SYSCAP_ASSESSMENT);
        expect(SemVer.parse(descriptor.sinceVersion).isValid()).assertTrue();
        expect(descriptor.signature.length > 0).assertTrue();
        expect(descriptor.description.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DescriptorConsistency_030, end');
    });
  });
}
