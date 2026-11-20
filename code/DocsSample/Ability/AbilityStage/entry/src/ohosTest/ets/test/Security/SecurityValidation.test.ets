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
import { Driver, Component } from '@ohos.UiTest';
import {
  BUNDLE_NAME,
  ENTRY_ABILITY_NAME,
  BACKUP_ABILITY_NAME,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_ABILITY_LAUNCH,
  DELAY_AFTER_LAUNCH,
  getDriver,
  getBundleName,
  launchEntryAbility,
  waitForIndexPageStable,
  checkComponentExistsByKey,
  findComponentsByText,
  collectAllTexts,
  waitForTextVisible,
  serializedDelay,
  logInfo,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum BundleFault {
  FAULT_NONE = 'none',
  FAULT_EMPTY = 'empty',
  FAULT_LENGTH = 'length',
  FAULT_UPPERCASE = 'uppercase',
  FAULT_WHITESPACE = 'whitespace',
  FAULT_ILLEGAL_CHAR = 'illegal_char',
  FAULT_EDGE_DOT = 'edge_dot',
  FAULT_DOUBLE_DOT = 'double_dot',
  FAULT_SEGMENT_COUNT = 'segment_count',
  FAULT_SEGMENT_START = 'segment_start'
}

enum VersionFault {
  FAULT_NONE = 'none',
  FAULT_EMPTY = 'empty',
  FAULT_SEGMENT_COUNT = 'segment_count',
  FAULT_NON_NUMERIC = 'non_numeric',
  FAULT_ILLEGAL_CHAR = 'illegal_char'
}

interface ConfigFields {
  bundleName: string;
  vendor: string;
  versionCode: number;
  versionName: string;
}

class ValidationError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'ValidationError';
  }
}

class SemanticVersion {
  public major: number = 0;

  public minor: number = 0;

  public patch: number = 0;
}

const BUNDLE_MIN_LENGTH: number = 3;

const BUNDLE_MAX_LENGTH: number = 128;

const BUNDLE_MIN_SEGMENTS: number = 3;

const VERSION_SEGMENT_COUNT: number = 3;

const VERSION_CODE_UPPER_BOUND: number = 2147483647;

const SHELL_BREAKERS: string[] = [';', '|', '&', '$', '`', '>', '<', '\\', '\n', '\r', '\t', ' ', '\''];
const DECLARED_ABILITIES: string[] = [ENTRY_ABILITY_NAME, BACKUP_ABILITY_NAME];

const STARTABLE_ABILITIES: string[] = [ENTRY_ABILITY_NAME];

class BundleNameValidator {
  public isLowerLetter(code: number): boolean {
    return code >= 97 && code <= 122;
  }

  public isDigit(code: number): boolean {
    return code >= 48 && code <= 57;
  }

  public isAllowedChar(code: number): boolean {
    return this.isLowerLetter(code) || this.isDigit(code) || code === 46 || code === 95;
  }

  public segmentCount(value: string): number {
    let count: number = 1;
    for (let i = 0; i < value.length; i++) {
      if (value.charCodeAt(i) === 46) {
        count++;
      }
    }
    return count;
  }

  public faultOf(value: string): BundleFault {
    if (value.length === 0) {
      return BundleFault.FAULT_EMPTY;
    }
    if (value.length < BUNDLE_MIN_LENGTH || value.length > BUNDLE_MAX_LENGTH) {
      return BundleFault.FAULT_LENGTH;
    }
    for (let i = 0; i < value.length; i++) {
      const code: number = value.charCodeAt(i);
      if (code >= 65 && code <= 90) {
        return BundleFault.FAULT_UPPERCASE;
      }
      if (code === 32) {
        return BundleFault.FAULT_WHITESPACE;
      }
      if (!this.isAllowedChar(code)) {
        return BundleFault.FAULT_ILLEGAL_CHAR;
      }
    }
    if (value.charCodeAt(0) === 46 || value.charCodeAt(value.length - 1) === 46) {
      return BundleFault.FAULT_EDGE_DOT;
    }
    if (value.indexOf('..') >= 0) {
      return BundleFault.FAULT_DOUBLE_DOT;
    }
    if (this.segmentCount(value) < BUNDLE_MIN_SEGMENTS) {
      return BundleFault.FAULT_SEGMENT_COUNT;
    }
    if (!this.areSegmentStartsValid(value)) {
      return BundleFault.FAULT_SEGMENT_START;
    }
    return BundleFault.FAULT_NONE;
  }

  public areSegmentStartsValid(value: string): boolean {
    let index: number = 0;
    while (index < value.length) {
      if (!this.isLowerLetter(value.charCodeAt(index))) {
        return false;
      }
      const nextDot: number = value.indexOf('.', index);
      if (nextDot < 0) {
        return true;
      }
      index = nextDot + 1;
    }
    return true;
  }

  public isValid(value: string): boolean {
    return this.faultOf(value) === BundleFault.FAULT_NONE;
  }

  public assertValid(value: string): void {
    const fault: BundleFault = this.faultOf(value);
    if (fault !== BundleFault.FAULT_NONE) {
      throw new ValidationError('bundle name rejected: ' + fault);
    }
  }

  public matchesRequired(value: string, required: string): boolean {
    return this.isValid(value) && value === required;
  }
}

class AbilityNameWhitelist {
  private declared: string[] = [];

  private startable: string[] = [];

  public constructor(declared: string[], startable: string[]) {
    this.declared = declared;
    this.startable = startable;
  }

  public isDeclared(name: string): boolean {
    return this.declared.indexOf(name) >= 0;
  }

  public isStartable(name: string): boolean {
    return this.startable.indexOf(name) >= 0;
  }

  public declaredCount(): number {
    return this.declared.length;
  }

  public startableCount(): number {
    return this.startable.length;
  }

  public isEmptyName(name: string): boolean {
    return name.length === 0;
  }

  public assertStartable(name: string): void {
    if (this.isEmptyName(name) || !this.isStartable(name)) {
      throw new ValidationError('ability name rejected: ' + name);
    }
  }

  public rejectedReason(name: string): string {
    if (this.isEmptyName(name)) {
      return 'empty';
    }
    if (!this.isDeclared(name)) {
      return 'undeclared';
    }
    if (!this.isStartable(name)) {
      return 'not_startable';
    }
    return 'accepted';
  }
}

class VersionCodeValidator {
  public isInteger(value: number): boolean {
    if (isNaN(value)) {
      return false;
    }
    if (!isFinite(value)) {
      return false;
    }
    return Math.floor(value) === value;
  }

  public isNonNegative(value: number): boolean {
    return this.isInteger(value) && value >= 0;
  }

  public isPositive(value: number): boolean {
    return this.isInteger(value) && value > 0;
  }

  public isWithinBound(value: number): boolean {
    return this.isPositive(value) && value <= VERSION_CODE_UPPER_BOUND;
  }

  public assertPositive(value: number): void {
    if (!this.isPositive(value)) {
      throw new ValidationError('version code rejected: ' + value);
    }
  }

  public faultOf(value: number): string {
    if (isNaN(value) || !isFinite(value)) {
      return 'not_finite';
    }
    if (!this.isInteger(value)) {
      return 'not_integer';
    }
    if (value < 0) {
      return 'negative';
    }
    if (value === 0) {
      return 'zero';
    }
    if (value > VERSION_CODE_UPPER_BOUND) {
      return 'overflow';
    }
    return 'accepted';
  }
}

class VersionStringValidator {
  public hasControlChar(value: string): boolean {
    for (let i = 0; i < value.length; i++) {
      if (value.charCodeAt(i) < 32) {
        return true;
      }
    }
    return false;
  }

  public firstShellBreaker(value: string): string {
    for (let i = 0; i < SHELL_BREAKERS.length; i++) {
      if (value.indexOf(SHELL_BREAKERS[i]) >= 0) {
        return SHELL_BREAKERS[i];
      }
    }
    return '';
  }

  public isAllDigits(value: string): boolean {
    if (value.length === 0) {
      return false;
    }
    for (let i = 0; i < value.length; i++) {
      const code: number = value.charCodeAt(i);
      if (code < 48 || code > 57) {
        return false;
      }
    }
    return true;
  }

  public faultOf(value: string): VersionFault {
    if (value.length === 0) {
      return VersionFault.FAULT_EMPTY;
    }
    if (this.hasControlChar(value)) {
      return VersionFault.FAULT_ILLEGAL_CHAR;
    }
    if (this.firstShellBreaker(value).length > 0) {
      return VersionFault.FAULT_ILLEGAL_CHAR;
    }
    const segments: string[] = value.split('.');
    if (segments.length !== VERSION_SEGMENT_COUNT) {
      return VersionFault.FAULT_SEGMENT_COUNT;
    }
    for (let i = 0; i < segments.length; i++) {
      if (!this.isAllDigits(segments[i])) {
        return VersionFault.FAULT_NON_NUMERIC;
      }
    }
    return VersionFault.FAULT_NONE;
  }

  public isSafe(value: string): boolean {
    return this.faultOf(value) === VersionFault.FAULT_NONE;
  }

  public parse(value: string): SemanticVersion | null {
    if (!this.isSafe(value)) {
      return null;
    }
    const segments: string[] = value.split('.');
    const parsed: SemanticVersion = new SemanticVersion();
    parsed.major = parseInt(segments[0], 10);
    parsed.minor = parseInt(segments[1], 10);
    parsed.patch = parseInt(segments[2], 10);
    return parsed;
  }

  public compare(left: string, right: string): number {
    const leftVersion: SemanticVersion | null = this.parse(left);
    const rightVersion: SemanticVersion | null = this.parse(right);
    if (leftVersion === null || rightVersion === null) {
      return -2;
    }
    if (leftVersion.major !== rightVersion.major) {
      return leftVersion.major > rightVersion.major ? 1 : -1;
    }
    if (leftVersion.minor !== rightVersion.minor) {
      return leftVersion.minor > rightVersion.minor ? 1 : -1;
    }
    if (leftVersion.patch !== rightVersion.patch) {
      return leftVersion.patch > rightVersion.patch ? 1 : -1;
    }
    return 0;
  }

  public assertSafe(value: string): void {
    const fault: VersionFault = this.faultOf(value);
    if (fault !== VersionFault.FAULT_NONE) {
      throw new ValidationError('version string rejected: ' + fault);
    }
  }
}

class ConfigTypeChecker {
  public isStringFieldPresent(value: string): boolean {
    return value !== null && value !== undefined;
  }

  public isNumericField(value: number): boolean {
    return !isNaN(value) && isFinite(value);
  }

  public checkBundleField(fields: ConfigFields): string {
    if (!this.isStringFieldPresent(fields.bundleName)) {
      return 'bundle_missing';
    }
    if (fields.bundleName !== BUNDLE_NAME) {
      return 'bundle_mismatch';
    }
    return 'accepted';
  }

  public checkVendorField(fields: ConfigFields): string {
    if (!this.isStringFieldPresent(fields.vendor)) {
      return 'vendor_missing';
    }
    if (fields.vendor.trim().length === 0) {
      return 'vendor_blank';
    }
    return 'accepted';
  }

  public checkVersionCodeField(fields: ConfigFields): string {
    if (!this.isNumericField(fields.versionCode)) {
      return 'version_code_type';
    }
    if (fields.versionCode <= 0) {
      return 'version_code_range';
    }
    return 'accepted';
  }

  public checkVersionNameField(fields: ConfigFields): string {
    if (!this.isStringFieldPresent(fields.versionName)) {
      return 'version_name_missing';
    }
    const validator: VersionStringValidator = new VersionStringValidator();
    if (!validator.isSafe(fields.versionName)) {
      return 'version_name_format';
    }
    return 'accepted';
  }

  public allFieldsAccepted(fields: ConfigFields): boolean {
    const results: string[] = [];
    results.push(this.checkBundleField(fields));
    results.push(this.checkVendorField(fields));
    results.push(this.checkVersionCodeField(fields));
    results.push(this.checkVersionNameField(fields));
    for (let i = 0; i < results.length; i++) {
      if (results[i] !== 'accepted') {
        return false;
      }
    }
    return true;
  }
}

function buildValidFields(): ConfigFields {
  const fields: ConfigFields = {
    bundleName: BUNDLE_NAME,
    vendor: 'example',
    versionCode: 1000000,
    versionName: '1.0.0'
  };
  return fields;
}

function buildFields(bundle: string, vendor: string, code: number, name: string): ConfigFields {
  const fields: ConfigFields = {
    bundleName: bundle,
    vendor: vendor,
    versionCode: code,
    versionName: name
  };
  return fields;
}

export default function securityValidationTest(): void {
  describe('SecurityValidationTest', () => {
    let driver: Driver = getDriver();
    let bundleValidator: BundleNameValidator = new BundleNameValidator();
    let abilityWhitelist: AbilityNameWhitelist = new AbilityNameWhitelist(DECLARED_ABILITIES, STARTABLE_ABILITIES);
    let versionCodeValidator: VersionCodeValidator = new VersionCodeValidator();
    let versionStringValidator: VersionStringValidator = new VersionStringValidator();
    let typeChecker: ConfigTypeChecker = new ConfigTypeChecker();

    beforeAll(async (): Promise<void> => {
      driver = getDriver();
      bundleValidator = new BundleNameValidator();
      abilityWhitelist = new AbilityNameWhitelist(DECLARED_ABILITIES, STARTABLE_ABILITIES);
      versionCodeValidator = new VersionCodeValidator();
      versionStringValidator = new VersionStringValidator();
      typeChecker = new ConfigTypeChecker();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      logInfo('securityValidationTest: validators prepared');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async (): Promise<void> => {
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      logInfo('securityValidationTest: finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_0100
     * @tc.name testDeclaredBundleNameAccepted
     * @tc.desc Verify com.samples.abilitystage passes format validation with 3 segments and no fault
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeclaredBundleNameAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(bundleValidator.isValid(BUNDLE_NAME)).assertTrue();
          expect(bundleValidator.faultOf(BUNDLE_NAME)).assertEqual(BundleFault.FAULT_NONE);
          expect(bundleValidator.segmentCount(BUNDLE_NAME)).assertEqual(3);
          expect(bundleValidator.matchesRequired(BUNDLE_NAME, BUNDLE_NAME)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_0200
     * @tc.name testEmptyBundleNameRejected
     * @tc.desc Verify an empty bundle name is rejected with the empty fault while the declared one is not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyBundleNameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(bundleValidator.isValid('')).assertFalse();
          expect(bundleValidator.faultOf('')).assertEqual(BundleFault.FAULT_EMPTY);
          expect(bundleValidator.matchesRequired('', BUNDLE_NAME)).assertFalse();
          expect(bundleValidator.isValid(BUNDLE_NAME)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_0300
     * @tc.name testUppercaseBundleNameRejected
     * @tc.desc Verify every uppercase character position makes the bundle name invalid with the uppercase fault
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUppercaseBundleNameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(bundleValidator.isValid('Com.samples.abilitystage')).assertFalse();
          expect(bundleValidator.faultOf('Com.samples.abilitystage')).assertEqual(BundleFault.FAULT_UPPERCASE);
          expect(bundleValidator.isValid('com.Samples.abilitystage')).assertFalse();
          expect(bundleValidator.isValid('com.samples.ABILITYSTAGE')).assertFalse();
          expect(bundleValidator.faultOf('com.samples.ABILITYSTAGE')).assertEqual(BundleFault.FAULT_UPPERCASE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_0400
     * @tc.name testWhitespaceBundleNameRejected
     * @tc.desc Verify an embedded or trailing space is reported as the whitespace fault and never accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWhitespaceBundleNameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(bundleValidator.isValid('com.samples. abilitystage')).assertFalse();
          expect(bundleValidator.faultOf('com.samples. abilitystage'))
            .assertEqual(BundleFault.FAULT_WHITESPACE);
          expect(bundleValidator.isValid('com.samples.abilitystage ')).assertFalse();
          expect(bundleValidator.faultOf('com.samples.abilitystage '))
            .assertEqual(BundleFault.FAULT_WHITESPACE);
          expect(bundleValidator.isValid(' com.samples.abilitystage')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_0500
     * @tc.name testShellInjectionBundleNameRejected
     * @tc.desc Verify shell metacharacters and path traversal forms are rejected as illegal characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testShellInjectionBundleNameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(bundleValidator.faultOf('com.samples.abilitystage;rm')).assertEqual(BundleFault.FAULT_ILLEGAL_CHAR);
          expect(bundleValidator.isValid('com.samples.abilitystage;rm')).assertFalse();
          expect(bundleValidator.faultOf('com.samples.abilit$ystage')).assertEqual(BundleFault.FAULT_ILLEGAL_CHAR);
          expect(bundleValidator.faultOf('com/samples/abilitystage')).assertEqual(BundleFault.FAULT_ILLEGAL_CHAR);
          expect(bundleValidator.isValid('com.samples.abilitystage?x=1')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_0600
     * @tc.name testDottedBundleNameRejected
     * @tc.desc Verify leading dot, trailing dot and consecutive dots map to their dedicated faults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDottedBundleNameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(bundleValidator.faultOf('.com.samples.abilitystage')).assertEqual(BundleFault.FAULT_EDGE_DOT);
          expect(bundleValidator.faultOf('com.samples.abilitystage.')).assertEqual(BundleFault.FAULT_EDGE_DOT);
          expect(bundleValidator.faultOf('com..samples.abilitystage')).assertEqual(BundleFault.FAULT_DOUBLE_DOT);
          expect(bundleValidator.isValid('com..samples.abilitystage')).assertFalse();
          expect(bundleValidator.isValid('com.samples.abilitystage')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_0700
     * @tc.name testSegmentShapeBundleNameRejected
     * @tc.desc Verify too few segments and a segment starting with a digit are rejected with distinct faults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSegmentShapeBundleNameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(bundleValidator.faultOf('com.samples')).assertEqual(BundleFault.FAULT_SEGMENT_COUNT);
          expect(bundleValidator.segmentCount('com.samples')).assertEqual(2);
          expect(bundleValidator.faultOf('com.9samples.abilitystage'))
            .assertEqual(BundleFault.FAULT_SEGMENT_START);
          expect(bundleValidator.isValid('com.9samples.abilitystage')).assertFalse();
          expect(bundleValidator.isValid('a.b.c')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_0800
     * @tc.name testBundleLengthBoundary
     * @tc.desc Verify 2 chars fail on length, the 5-char minimal a.b.c passes, and an over long name fails on length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBundleLengthBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(bundleValidator.faultOf('ab')).assertEqual(BundleFault.FAULT_LENGTH);
          expect(bundleValidator.faultOf('a.b')).assertEqual(BundleFault.FAULT_SEGMENT_COUNT);
          expect(bundleValidator.isValid('a.b.c')).assertTrue();
          expect(bundleValidator.segmentCount('a.b.c')).assertEqual(3);
          let longName: string = 'com';
          for (let i = 0; i < 45; i++) {
            longName = longName + '.sample';
          }
          expect(longName.length > BUNDLE_MAX_LENGTH).assertTrue();
          expect(bundleValidator.faultOf(longName)).assertEqual(BundleFault.FAULT_LENGTH);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_0900
     * @tc.name testBundleValidationThrowsWithPreciseName
     * @tc.desc Verify asserting an empty bundle name throws ValidationError with the exact error name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBundleValidationThrowsWithPreciseName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          try {
            bundleValidator.assertValid('');
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ValidationError');
            expect(e.message.indexOf('empty') >= 0).assertTrue();
          }
          bundleValidator.assertValid(BUNDLE_NAME);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_1000
     * @tc.name testAbilityWhitelistAcceptsEntryAbility
     * @tc.desc Verify EntryAbility is declared and startable while the whitelists hold exactly 2 and 1 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityWhitelistAcceptsEntryAbility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(abilityWhitelist.declaredCount()).assertEqual(2);
          expect(abilityWhitelist.startableCount()).assertEqual(1);
          expect(abilityWhitelist.isDeclared(ENTRY_ABILITY_NAME)).assertTrue();
          expect(abilityWhitelist.isStartable(ENTRY_ABILITY_NAME)).assertTrue();
          expect(abilityWhitelist.rejectedReason(ENTRY_ABILITY_NAME)).assertEqual('accepted');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_1100
     * @tc.name testAbilityWhitelistRejectsBackupAsStartTarget
     * @tc.desc Verify EntryBackupAbility is declared but not startable, reported with the not_startable reason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityWhitelistRejectsBackupAsStartTarget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(abilityWhitelist.isDeclared(BACKUP_ABILITY_NAME)).assertTrue();
          expect(abilityWhitelist.isStartable(BACKUP_ABILITY_NAME)).assertFalse();
          expect(abilityWhitelist.rejectedReason(BACKUP_ABILITY_NAME)).assertEqual('not_startable');
          expect(abilityWhitelist.rejectedReason('GhostAbility')).assertEqual('undeclared');
          expect(abilityWhitelist.rejectedReason('')).assertEqual('empty');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_1200
     * @tc.name testAbilityWhitelistThrowsOnForeignName
     * @tc.desc Verify asserting a foreign ability name throws ValidationError with the exact error name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityWhitelistThrowsOnForeignName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          try {
            abilityWhitelist.assertStartable('InjectedAbility');
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ValidationError');
            expect(e.message.indexOf('InjectedAbility') >= 0).assertTrue();
          }
          abilityWhitelist.assertStartable(ENTRY_ABILITY_NAME);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_1300
     * @tc.name testVersionCodePositiveIntegerAccepted
     * @tc.desc Verify 1000000 is a positive integer within bound while 1 and the upper bound still pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVersionCodePositiveIntegerAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(versionCodeValidator.isPositive(1000000)).assertTrue();
          expect(versionCodeValidator.isNonNegative(1000000)).assertTrue();
          expect(versionCodeValidator.isPositive(1)).assertTrue();
          expect(versionCodeValidator.isWithinBound(VERSION_CODE_UPPER_BOUND)).assertTrue();
          expect(versionCodeValidator.faultOf(1000000)).assertEqual('accepted');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_1400
     * @tc.name testVersionCodeZeroAndNegativeRejected
     * @tc.desc Verify 0 maps to the zero fault, -1 to negative, and both fail the positive predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVersionCodeZeroAndNegativeRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(versionCodeValidator.faultOf(0)).assertEqual('zero');
          expect(versionCodeValidator.isPositive(0)).assertFalse();
          expect(versionCodeValidator.isNonNegative(0)).assertTrue();
          expect(versionCodeValidator.faultOf(-1)).assertEqual('negative');
          expect(versionCodeValidator.isNonNegative(-1)).assertFalse();
          expect(versionCodeValidator.isPositive(-1)).assertFalse();
          expect(versionCodeValidator.isWithinBound(-1)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_1500
     * @tc.name testVersionCodeFractionAndOverflowRejected
     * @tc.desc Verify a fractional code maps to not_integer and an over bound code maps to overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVersionCodeFractionAndOverflowRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(versionCodeValidator.isInteger(1.5)).assertFalse();
          expect(versionCodeValidator.faultOf(1.5)).assertEqual('not_integer');
          expect(versionCodeValidator.isPositive(1.5)).assertFalse();
          expect(versionCodeValidator.faultOf(VERSION_CODE_UPPER_BOUND + 1)).assertEqual('overflow');
          expect(versionCodeValidator.isWithinBound(VERSION_CODE_UPPER_BOUND + 1)).assertFalse();
          expect(versionCodeValidator.faultOf(VERSION_CODE_UPPER_BOUND)).assertEqual('accepted');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_1600
     * @tc.name testVersionCodeNonFiniteRejected
     * @tc.desc Verify a NaN code maps to not_finite and is rejected by every predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVersionCodeNonFiniteRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notANumber: number = parseInt('abc', 10);
          expect(isNaN(notANumber)).assertTrue();
          expect(versionCodeValidator.faultOf(notANumber)).assertEqual('not_finite');
          expect(versionCodeValidator.isInteger(notANumber)).assertFalse();
          expect(versionCodeValidator.isNonNegative(notANumber)).assertFalse();
          expect(versionCodeValidator.isPositive(notANumber)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_1700
     * @tc.name testVersionCodeAssertThrowsWithPreciseName
     * @tc.desc Verify asserting a zero version code throws ValidationError with the exact error name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVersionCodeAssertThrowsWithPreciseName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          try {
            versionCodeValidator.assertPositive(0);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ValidationError');
            expect(e.message.indexOf('version code') >= 0).assertTrue();
          }
          versionCodeValidator.assertPositive(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_1800
     * @tc.name testValidVersionStringParsed
     * @tc.desc Verify 1.0.0 is safe, parses into 1/0/0, and compares equal against itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValidVersionStringParsed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(versionStringValidator.isSafe('1.0.0')).assertTrue();
          expect(versionStringValidator.faultOf('1.0.0')).assertEqual(VersionFault.FAULT_NONE);
          const parsed: SemanticVersion | null = versionStringValidator.parse('1.0.0');
          expect(parsed !== null).assertTrue();
          if (parsed !== null) {
            expect(parsed.major).assertEqual(1);
            expect(parsed.minor).assertEqual(0);
            expect(parsed.patch).assertEqual(0);
          }
          expect(versionStringValidator.compare('1.0.0', '1.0.0')).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_1900
     * @tc.name testInjectedVersionStringRejected
     * @tc.desc Verify 1.0.0;rm -rf is rejected as an illegal character and parses to null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInjectedVersionStringRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const injected: string = '1.0.0;rm -rf';
          expect(versionStringValidator.isSafe(injected)).assertFalse();
          expect(versionStringValidator.faultOf(injected)).assertEqual(VersionFault.FAULT_ILLEGAL_CHAR);
          expect(versionStringValidator.firstShellBreaker(injected)).assertEqual(';');
          expect(versionStringValidator.parse(injected)).assertEqual(null);
          expect(versionStringValidator.compare(injected, '1.0.0')).assertEqual(-2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_2000
     * @tc.name testSubstitutionInVersionStringRejected
     * @tc.desc Verify command substitution and pipe forms are rejected as illegal characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubstitutionInVersionStringRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(versionStringValidator.faultOf('1.0.0$(id)')).assertEqual(VersionFault.FAULT_ILLEGAL_CHAR);
          expect(versionStringValidator.faultOf('1.0.0|reboot')).assertEqual(VersionFault.FAULT_ILLEGAL_CHAR);
          expect(versionStringValidator.faultOf('1.0.0&&halt')).assertEqual(VersionFault.FAULT_ILLEGAL_CHAR);
          expect(versionStringValidator.faultOf('1.0.0>/tmp/x')).assertEqual(VersionFault.FAULT_ILLEGAL_CHAR);
          expect(versionStringValidator.isSafe('1.0.0$(id)')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_2100
     * @tc.name testVersionStringSegmentShapeRejected
     * @tc.desc Verify 1.0 has too few segments, 1.0.0.0 too many, and v1.0.0 is non numeric
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVersionStringSegmentShapeRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(versionStringValidator.faultOf('1.0')).assertEqual(VersionFault.FAULT_SEGMENT_COUNT);
          expect(versionStringValidator.faultOf('1.0.0.0')).assertEqual(VersionFault.FAULT_SEGMENT_COUNT);
          expect(versionStringValidator.faultOf('v1.0.0')).assertEqual(VersionFault.FAULT_NON_NUMERIC);
          expect(versionStringValidator.faultOf('')).assertEqual(VersionFault.FAULT_EMPTY);
          expect(versionStringValidator.isSafe('1.0.0.0')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_2200
     * @tc.name testVersionStringCompareOrdering
     * @tc.desc Verify semantic ordering: 1.0.0 below 2.0.0, 1.2.0 above 1.1.9, patch difference detected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVersionStringCompareOrdering', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(versionStringValidator.compare('1.0.0', '2.0.0')).assertEqual(-1);
          expect(versionStringValidator.compare('2.0.0', '1.0.0')).assertEqual(1);
          expect(versionStringValidator.compare('1.2.0', '1.1.9')).assertEqual(1);
          expect(versionStringValidator.compare('1.0.1', '1.0.0')).assertEqual(1);
          expect(versionStringValidator.compare('1.0', '1.0.0')).assertEqual(-2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_2300
     * @tc.name testVersionStringAssertThrowsWithPreciseName
     * @tc.desc Verify asserting an injected version string throws ValidationError with the exact error name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testVersionStringAssertThrowsWithPreciseName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          try {
            versionStringValidator.assertSafe('1.0.0;rm -rf');
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ValidationError');
            expect(e.message.indexOf('illegal_char') >= 0).assertTrue();
          }
          versionStringValidator.assertSafe('1.0.0');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_2400
     * @tc.name testConfigFieldsAcceptedForDeclaredApp
     * @tc.desc Verify the declared config snapshot passes every field check and all four results are accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigFieldsAcceptedForDeclaredApp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const fields: ConfigFields = buildValidFields();
          expect(typeChecker.checkBundleField(fields)).assertEqual('accepted');
          expect(typeChecker.checkVendorField(fields)).assertEqual('accepted');
          expect(typeChecker.checkVersionCodeField(fields)).assertEqual('accepted');
          expect(typeChecker.checkVersionNameField(fields)).assertEqual('accepted');
          expect(typeChecker.allFieldsAccepted(fields)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_2500
     * @tc.name testConfigBundleMismatchRejected
     * @tc.desc Verify a foreign bundle name in the config is reported as bundle_mismatch and fails the whole check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigBundleMismatchRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const fields: ConfigFields = buildFields('com.samples.other', 'example', 1000000, '1.0.0');
          expect(typeChecker.checkBundleField(fields)).assertEqual('bundle_mismatch');
          expect(typeChecker.allFieldsAccepted(fields)).assertFalse();
          const emptyFields: ConfigFields = buildFields('', 'example', 1000000, '1.0.0');
          expect(typeChecker.checkBundleField(emptyFields)).assertEqual('bundle_mismatch');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_2600
     * @tc.name testConfigRangeFieldsRejected
     * @tc.desc Verify a zero version code reports version_code_range and a blank vendor reports vendor_blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigRangeFieldsRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const zeroCode: ConfigFields = buildFields(BUNDLE_NAME, 'example', 0, '1.0.0');
          expect(typeChecker.checkVersionCodeField(zeroCode)).assertEqual('version_code_range');
          expect(typeChecker.allFieldsAccepted(zeroCode)).assertFalse();
          const blankVendor: ConfigFields = buildFields(BUNDLE_NAME, '   ', 1000000, '1.0.0');
          expect(typeChecker.checkVendorField(blankVendor)).assertEqual('vendor_blank');
          const negativeCode: ConfigFields = buildFields(BUNDLE_NAME, 'example', -5, '1.0.0');
          expect(typeChecker.checkVersionCodeField(negativeCode)).assertEqual('version_code_range');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_2700
     * @tc.name testConfigInjectedVersionNameRejected
     * @tc.desc Verify an injected version name fails the format check while a clean semantic version passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConfigInjectedVersionNameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const injectedFields: ConfigFields = buildFields(BUNDLE_NAME, 'example', 1000000, '1.0.0;rm -rf');
          expect(typeChecker.checkVersionNameField(injectedFields)).assertEqual('version_name_format');
          expect(typeChecker.allFieldsAccepted(injectedFields)).assertFalse();
          const cleanFields: ConfigFields = buildFields(BUNDLE_NAME, 'example', 1000000, '1.0.1');
          expect(typeChecker.checkVersionNameField(cleanFields)).assertEqual('accepted');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_2800
     * @tc.name testRuntimeBundleNamePassesValidator
     * @tc.desc Verify the runtime bundle name read from the delegator is valid and equals the required literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeBundleNamePassesValidator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const runtimeBundle: string = getBundleName();
          expect(bundleValidator.isValid(runtimeBundle)).assertTrue();
          expect(bundleValidator.matchesRequired(runtimeBundle, BUNDLE_NAME)).assertTrue();
          expect(bundleValidator.faultOf(runtimeBundle)).assertEqual(BundleFault.FAULT_NONE);
          expect(bundleValidator.segmentCount(runtimeBundle)).assertEqual(3);
          logInfo(`testRuntimeBundleNamePassesValidator: ${runtimeBundle}`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_2900
     * @tc.name testRuntimeValidatedLaunchReachesPage
     * @tc.desc Verify a launch gated by bundle and ability validation reaches the index page with its declared text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeValidatedLaunchReachesPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const runtimeBundle: string = getBundleName();
          expect(bundleValidator.isValid(runtimeBundle)).assertTrue();
          expect(abilityWhitelist.isStartable(ENTRY_ABILITY_NAME)).assertTrue();
          await launchEntryAbility();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const visible: boolean = await waitForTextVisible(driver, PAGE_TEXT_INITIAL, TIMEOUT_ABILITY_LAUNCH);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_3000
     * @tc.name testRuntimePageNodeIdSurvivesValidation
     * @tc.desc Verify the declared page node id remains queryable after the validated launch path completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimePageNodeIdSurvivesValidation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const present: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(present).assertTrue();
          expect(abilityWhitelist.isDeclared(ENTRY_ABILITY_NAME)).assertTrue();
          expect(abilityWhitelist.rejectedReason(ENTRY_ABILITY_NAME)).assertEqual('accepted');
          expect(typeChecker.checkBundleField(buildValidFields())).assertEqual('accepted');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_3100
     * @tc.name testRuntimeBackupAbilityNotStartable
     * @tc.desc Verify the backup extension passes bundle validation yet stays outside the startable whitelist at runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeBackupAbilityNotStartable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const runtimeBundle: string = getBundleName();
          expect(bundleValidator.isValid(runtimeBundle)).assertTrue();
          expect(abilityWhitelist.isDeclared(BACKUP_ABILITY_NAME)).assertTrue();
          expect(abilityWhitelist.isStartable(BACKUP_ABILITY_NAME)).assertFalse();
          expect(abilityWhitelist.rejectedReason(BACKUP_ABILITY_NAME)).assertEqual('not_startable');
          const present: boolean = await checkComponentExistsByKey(driver, BACKUP_ABILITY_NAME);
          expect(present).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_3200
     * @tc.name testRuntimeDeclaredTextPassesVersionScan
     * @tc.desc Verify the live page copy carries no control characters yet is correctly rejected as a version
     * string because it contains a space, while the declared 1.0.0 form is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeDeclaredTextPassesVersionScan', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.length > 0).assertTrue();
          for (let i = 0; i < texts.length; i++) {
            expect(versionStringValidator.hasControlChar(texts[i])).assertFalse();
          }
          expect(versionStringValidator.firstShellBreaker(PAGE_TEXT_INITIAL)).assertEqual(' ');
          expect(versionStringValidator.firstShellBreaker(PAGE_TEXT_CLICKED)).assertEqual('');
          expect(versionStringValidator.isSafe(PAGE_TEXT_INITIAL)).assertFalse();
          expect(versionStringValidator.isSafe(PAGE_TEXT_CLICKED)).assertFalse();
          expect(versionStringValidator.isSafe('1.0.0')).assertTrue();
          expect(versionStringValidator.faultOf(PAGE_TEXT_INITIAL)).assertEqual(VersionFault.FAULT_ILLEGAL_CHAR);
          expect(versionStringValidator.faultOf(PAGE_TEXT_CLICKED)).assertEqual(VersionFault.FAULT_SEGMENT_COUNT);
          const declaredSeen: boolean = texts.indexOf(PAGE_TEXT_INITIAL) >= 0 ||
            texts.indexOf(PAGE_TEXT_CLICKED) >= 0;
          expect(declaredSeen).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_3300
     * @tc.name testRuntimeBundleGatedLaunchReason
     * @tc.desc Verify the launch gate reports accepted for the runtime bundle and rejects an oversized bundle literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeBundleGatedLaunchReason', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const runtimeBundle: string = getBundleName();
          expect(bundleValidator.faultOf(runtimeBundle)).assertEqual(BundleFault.FAULT_NONE);
          expect(bundleValidator.isValid(runtimeBundle + ';')).assertFalse();
          expect(bundleValidator.faultOf(runtimeBundle + ';')).assertEqual(BundleFault.FAULT_ILLEGAL_CHAR);
          await launchEntryAbility();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_3400
     * @tc.name testRuntimePageAbsentOfInjectedVersionLiteral
     * @tc.desc Verify the injected version literal never becomes queryable page text on the live entry page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimePageAbsentOfInjectedVersionLiteral', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const injected: string = '1.0.0;rm -rf';
          const nodes: Component[] = await findComponentsByText(driver, injected);
          expect(nodes.length).assertEqual(0);
          const texts: string[] = await collectAllTexts(driver);
          let injectedHits: number = 0;
          for (let i = 0; i < texts.length; i++) {
            if (texts[i].indexOf('rm -rf') >= 0) {
              injectedHits++;
            }
          }
          expect(injectedHits).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_3500
     * @tc.name testRuntimeValidatedFieldsMatchRuntimeBundle
     * @tc.desc Verify the declared config snapshot bundle equals the runtime bundle and all four fields are accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeValidatedFieldsMatchRuntimeBundle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const runtimeBundle: string = getBundleName();
          const fields: ConfigFields = buildFields(runtimeBundle, 'example', 1000000, '1.0.0');
          expect(fields.bundleName).assertEqual(BUNDLE_NAME);
          expect(bundleValidator.matchesRequired(fields.bundleName, BUNDLE_NAME)).assertTrue();
          expect(typeChecker.checkBundleField(fields)).assertEqual('accepted');
          expect(typeChecker.allFieldsAccepted(fields)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_3600
     * @tc.name testRuntimeRepeatedValidatedLaunchStaysStable
     * @tc.desc Verify 3 consecutive validated launches each keep the declared node id present on the live page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeRepeatedValidatedLaunchStaysStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const runtimeBundle: string = getBundleName();
          expect(bundleValidator.isValid(runtimeBundle)).assertTrue();
          let presentRounds: number = 0;
          for (let round = 0; round < 3; round++) {
            await launchEntryAbility();
            await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
            const present: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
            if (present) {
              presentRounds++;
            }
            await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          }
          expect(presentRounds).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_3700
     * @tc.name testRuntimeWhitelistReasonAfterLaunch
     * @tc.desc Verify after a real launch the entry ability still reports accepted and the empty name stays empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeWhitelistReasonAfterLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          expect(abilityWhitelist.rejectedReason(ENTRY_ABILITY_NAME)).assertEqual('accepted');
          expect(abilityWhitelist.rejectedReason('')).assertEqual('empty');
          expect(abilityWhitelist.rejectedReason('EntryAbilityExtra')).assertEqual('undeclared');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_3800
     * @tc.name testRuntimeVersionCodeConsistentAcrossReads
     * @tc.desc Verify validating the declared version code twice yields the identical accepted verdict and bound check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeVersionCodeConsistentAcrossReads', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const fields: ConfigFields = buildValidFields();
          const firstVerdict: string = versionCodeValidator.faultOf(fields.versionCode);
          const secondVerdict: string = versionCodeValidator.faultOf(fields.versionCode);
          expect(firstVerdict).assertEqual(secondVerdict);
          expect(firstVerdict).assertEqual('accepted');
          expect(versionCodeValidator.isWithinBound(fields.versionCode)).assertTrue();
          const visible: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_3900
     * @tc.name testRuntimePageTextIsNotJsonPayload
     * @tc.desc Verify no live page text carries structural JSON markers that would indicate a leaked config dump
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimePageTextIsNotJsonPayload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const texts: string[] = await collectAllTexts(driver);
          let structuralHits: number = 0;
          for (let i = 0; i < texts.length; i++) {
            if (texts[i].indexOf('{') >= 0 || texts[i].indexOf('module') >= 0) {
              structuralHits++;
            }
          }
          expect(structuralHits).assertEqual(0);
          expect(texts.length > 0).assertTrue();
          expect(typeChecker.allFieldsAccepted(buildValidFields())).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SECVALID_4000
     * @tc.name testRuntimeIdQueryRejectsTraversalKey
     * @tc.desc Verify a path traversal style node id resolves to nothing on the live page while the declared id resolves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRuntimeIdQueryRejectsTraversalKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const declared: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          const traversal: boolean = await checkComponentExistsByKey(driver, '../HelloWorld');
          expect(declared).assertTrue();
          expect(traversal).assertFalse();
          expect(INDEX_PAGE_TEXT_KEY.indexOf('..')).assertEqual(-1);
        } finally {
          done();
        }
      })
  })
}
