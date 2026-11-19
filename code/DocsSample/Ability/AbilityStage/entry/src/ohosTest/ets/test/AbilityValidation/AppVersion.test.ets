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
  logInfo,
  launchEntryAbility,
  serializedDelay,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  pageComponentCount,
  collectAllTexts,
  tapComponentByText,
  waitForTextVisible,
  doAbilityBackground,
  doAbilityForeground,
  getBundleName,
  buildEntryWant,
  isQueueBusy,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  ENTRY_ABILITY_NAME,
  BUNDLE_NAME,
  DELAY_AFTER_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const FIXED_VERSION_CODE: number = 1000000;

const FIXED_VERSION_NAME: string = '1.0.0';

const VERSION_NAME_MAX_LENGTH: number = 16;

const MAJOR_STRIDE: number = 1000000;

const MINOR_STRIDE: number = 10000;

const PATCH_STRIDE: number = 100;

const MAX_SEGMENT_VALUE: number = 1000000;

const MAX_SAFE_CODE: number = 9007199254740992;

const INVALID_CODE: number = -1;

enum VersionFormat {
  SEMANTIC = 'semantic',
  INCOMPARABLE = 'incomparable'
}

enum VersionRelation {
  NEWER = 'newer',
  SAME = 'same',
  OLDER = 'older',
  INCOMPARABLE = 'incomparable'
}

class VersionParts {
  public major: number;
  public minor: number;
  public patch: number;

  constructor(major: number, minor: number, patch: number) {
    this.major = major;
    this.minor = minor;
    this.patch = patch;
  }
}

class ParseOutcome {
  public valid: boolean;
  public code: string;
  public parts: VersionParts;

  constructor(valid: boolean, code: string, parts: VersionParts) {
    this.valid = valid;
    this.code = code;
    this.parts = parts;
  }
}

class BundleVersion {
  public code: number;
  public name: string;

  constructor(code: number, name: string) {
    this.code = code;
    this.name = name;
  }
}

class VersionCodeMath {
  public static toCode(parts: VersionParts): number {
    return parts.major * MAJOR_STRIDE + parts.minor * MINOR_STRIDE + parts.patch * PATCH_STRIDE;
  }

  public static deriveParts(code: number): VersionParts {
    if (code < 0) {
      return new VersionParts(0, 0, 0);
    }
    const major: number = Math.floor(code / MAJOR_STRIDE);
    const remainder: number = code % MAJOR_STRIDE;
    const minor: number = Math.floor(remainder / MINOR_STRIDE);
    const patch: number = Math.floor((remainder % MINOR_STRIDE) / PATCH_STRIDE);
    return new VersionParts(major, minor, patch);
  }

  public static compareParts(left: VersionParts, right: VersionParts): VersionRelation {
    if (left.major !== right.major) {
      return left.major > right.major ? VersionRelation.NEWER : VersionRelation.OLDER;
    }
    if (left.minor !== right.minor) {
      return left.minor > right.minor ? VersionRelation.NEWER : VersionRelation.OLDER;
    }
    if (left.patch !== right.patch) {
      return left.patch > right.patch ? VersionRelation.NEWER : VersionRelation.OLDER;
    }
    return VersionRelation.SAME;
  }

  public static compareCodes(left: number, right: number): VersionRelation {
    if (left === right) {
      return VersionRelation.SAME;
    }
    return left > right ? VersionRelation.OLDER : VersionRelation.NEWER;
  }

  public static delta(current: number, next: number): number {
    return next - current;
  }

  public static isUpgrade(current: number, next: number): boolean {
    return next > current;
  }

  public static isCrossMajor(current: number, next: number): boolean {
    const currentMajor: number = VersionCodeMath.deriveParts(current).major;
    const nextMajor: number = VersionCodeMath.deriveParts(next).major;
    return currentMajor !== nextMajor;
  }

  public static isPatchOnly(current: number, next: number): boolean {
    const currentParts: VersionParts = VersionCodeMath.deriveParts(current);
    const nextParts: VersionParts = VersionCodeMath.deriveParts(next);
    if (currentParts.major !== nextParts.major) {
      return false;
    }
    if (currentParts.minor !== nextParts.minor) {
      return false;
    }
    return currentParts.patch !== nextParts.patch;
  }

  public static sortCodes(codes: number[]): number[] {
    const sorted: number[] = [];
    for (let i = 0; i < codes.length; i++) {
      sorted.push(codes[i]);
    }
    for (let i = 1; i < sorted.length; i++) {
      const key: number = sorted[i];
      let position: number = i - 1;
      while (position >= 0 && sorted[position] > key) {
        sorted[position + 1] = sorted[position];
        position--;
      }
      sorted[position + 1] = key;
    }
    return sorted;
  }
}

class VersionNameParser {
  public isDigits(text: string): boolean {
    if (text.length === 0) {
      return false;
    }
    for (let i = 0; i < text.length; i++) {
      const ch: string = text.charAt(i);
      if (ch < '0' || ch > '9') {
        return false;
      }
    }
    return true;
  }

  public hasLeadingZero(text: string): boolean {
    return text.length > 1 && text.charAt(0) === '0';
  }

  public parse(name: string): ParseOutcome {
    if (name.length === 0) {
      return new ParseOutcome(false, 'EMPTY_NAME', new VersionParts(0, 0, 0));
    }
    if (name.length > VERSION_NAME_MAX_LENGTH) {
      return new ParseOutcome(false, 'NAME_TOO_LONG', new VersionParts(0, 0, 0));
    }
    const segments: string[] = name.split('.');
    if (segments.length > 3) {
      return new ParseOutcome(false, 'TOO_MANY_SEGMENTS', new VersionParts(0, 0, 0));
    }
    const numbers: number[] = [];
    for (let i = 0; i < segments.length; i++) {
      const segment: string = segments[i];
      if (segment.length === 0) {
        return new ParseOutcome(false, 'EMPTY_SEGMENT', new VersionParts(0, 0, 0));
      }
      if (!this.isDigits(segment)) {
        return new ParseOutcome(false, 'NON_NUMERIC_SEGMENT', new VersionParts(0, 0, 0));
      }
      if (this.hasLeadingZero(segment)) {
        return new ParseOutcome(false, 'LEADING_ZERO_SEGMENT', new VersionParts(0, 0, 0));
      }
      const value: number = parseInt(segment, 10);
      if (value >= MAX_SEGMENT_VALUE) {
        return new ParseOutcome(false, 'SEGMENT_TOO_LARGE', new VersionParts(0, 0, 0));
      }
      numbers.push(value);
    }
    const major: number = numbers.length > 0 ? numbers[0] : 0;
    const minor: number = numbers.length > 1 ? numbers[1] : 0;
    const patch: number = numbers.length > 2 ? numbers[2] : 0;
    return new ParseOutcome(true, 'OK', new VersionParts(major, minor, patch));
  }

  public format(parts: VersionParts): string {
    return `${parts.major}.${parts.minor}.${parts.patch}`;
  }

  public normalize(name: string): string {
    const outcome: ParseOutcome = this.parse(name);
    if (!outcome.valid) {
      return 'INVALID';
    }
    return this.format(outcome.parts);
  }

  public compareNames(left: string, right: string): VersionRelation {
    const leftOutcome: ParseOutcome = this.parse(left);
    const rightOutcome: ParseOutcome = this.parse(right);
    if (!leftOutcome.valid || !rightOutcome.valid) {
      return VersionRelation.INCOMPARABLE;
    }
    return VersionCodeMath.compareParts(leftOutcome.parts, rightOutcome.parts);
  }

  public formatStyle(name: string): VersionFormat {
    const outcome: ParseOutcome = this.parse(name);
    return outcome.valid ? VersionFormat.SEMANTIC : VersionFormat.INCOMPARABLE;
  }

  public segmentCount(name: string): number {
    if (name.length === 0) {
      return 0;
    }
    return name.split('.').length;
  }
}

class VersionConsistencyChecker {
  public expectedCode(name: string): number {
    const outcome: ParseOutcome = new VersionNameParser().parse(name);
    if (!outcome.valid) {
      return INVALID_CODE;
    }
    return VersionCodeMath.toCode(outcome.parts);
  }

  public check(version: BundleVersion): string {
    if (version.code < 0) {
      return 'CODE_NEGATIVE';
    }
    if (version.code > MAX_SAFE_CODE) {
      return 'CODE_TOO_LARGE';
    }
    const outcome: ParseOutcome = new VersionNameParser().parse(version.name);
    if (!outcome.valid) {
      return 'NAME_' + outcome.code;
    }
    const expected: number = VersionCodeMath.toCode(outcome.parts);
    if (expected !== version.code) {
      return 'CODE_NAME_MISMATCH';
    }
    return 'OK';
  }

  public isConsistent(version: BundleVersion): boolean {
    return this.check(version) === 'OK';
  }

  public describe(version: BundleVersion): string {
    return `${version.name}#${version.code}`;
  }
}

class VersionPolicy {
  public static isSameMajor(from: BundleVersion, to: BundleVersion): boolean {
    const fromMajor: number = VersionCodeMath.deriveParts(from.code).major;
    const toMajor: number = VersionCodeMath.deriveParts(to.code).major;
    return fromMajor === toMajor;
  }

  public static requiresMigration(from: BundleVersion, to: BundleVersion): boolean {
    return !VersionPolicy.isSameMajor(from, to);
  }

  public static isRollbackSafe(from: BundleVersion, to: BundleVersion): boolean {
    if (to.code >= from.code) {
      return false;
    }
    return VersionPolicy.isSameMajor(from, to);
  }

  public static cacheKey(version: BundleVersion): string {
    return `${version.name}#${version.code}`;
  }

  public static selectHighest(versions: BundleVersion[]): BundleVersion {
    if (versions.length === 0) {
      return new BundleVersion(INVALID_CODE, '');
    }
    let highest: BundleVersion = versions[0];
    for (let i = 1; i < versions.length; i++) {
      if (versions[i].code > highest.code) {
        highest = versions[i];
      }
    }
    return highest;
  }

  public static countUpgrades(versions: BundleVersion[], baseline: number): number {
    let count: number = 0;
    for (let i = 0; i < versions.length; i++) {
      if (versions[i].code > baseline) {
        count++;
      }
    }
    return count;
  }
}

class PageTextProbe {
  public static async current(driver: Driver): Promise<string> {
    if (await checkTextContent(driver, PAGE_TEXT_INITIAL)) {
      return PAGE_TEXT_INITIAL;
    }
    if (await checkTextContent(driver, PAGE_TEXT_CLICKED)) {
      return PAGE_TEXT_CLICKED;
    }
    return '';
  }

  public static isKnown(text: string): boolean {
    return text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED;
  }

  public static async ensureClicked(driver: Driver): Promise<boolean> {
    const currentText: string = await PageTextProbe.current(driver);
    if (currentText.length === 0) {
      return false;
    }
    await tapComponentByText(driver, currentText);
    return await waitForTextVisible(driver, PAGE_TEXT_CLICKED);
  }
}

export default function appVersionTest(): void {
  describe('AppVersionTest', () => {
    const parser: VersionNameParser = new VersionNameParser();

    const checker: VersionConsistencyChecker = new VersionConsistencyChecker();

    beforeAll(async () => {
      await launchEntryAbility();
      await ensureIndexPageInitial(getDriver());
    });

    afterAll(async () => {
      logInfo('AppVersionTest suite finished');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_0100
     * @tc.name testAppVersionFixedNameSegments
     * @tc.desc Verify versionName 1.0.0 parses into major 1 minor 0 patch 0 with OK code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionFixedNameSegments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const outcome: ParseOutcome = parser.parse(FIXED_VERSION_NAME);
          expect(outcome.valid).assertTrue();
          expect(outcome.code).assertEqual('OK');
          expect(outcome.parts.major).assertEqual(1);
          expect(outcome.parts.minor).assertEqual(0);
          expect(outcome.parts.patch).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_0200
     * @tc.name testAppVersionFixedCodeDerivation
     * @tc.desc Verify versionCode 1000000 derives major 1 minor 0 patch 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionFixedCodeDerivation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const parts: VersionParts = VersionCodeMath.deriveParts(FIXED_VERSION_CODE);
          expect(parts.major).assertEqual(1);
          expect(parts.minor).assertEqual(0);
          expect(parts.patch).assertEqual(0);
          expect(VersionCodeMath.toCode(parts)).assertEqual(FIXED_VERSION_CODE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_0300
     * @tc.name testAppVersionFixedConsistency
     * @tc.desc Verify versionCode 1000000 and versionName 1.0.0 are mutually consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionFixedConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const version: BundleVersion = new BundleVersion(FIXED_VERSION_CODE, FIXED_VERSION_NAME);
          expect(checker.check(version)).assertEqual('OK');
          expect(checker.isConsistent(version)).assertTrue();
          expect(checker.expectedCode(FIXED_VERSION_NAME)).assertEqual(FIXED_VERSION_CODE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_0400
     * @tc.name testAppVersionCodeNameMismatch
     * @tc.desc Verify versionCode 1000000 with versionName 1.0.1 reports CODE_NAME_MISMATCH
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionCodeNameMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const version: BundleVersion = new BundleVersion(FIXED_VERSION_CODE, '1.0.1');
          expect(checker.check(version)).assertEqual('CODE_NAME_MISMATCH');
          expect(checker.isConsistent(version)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_0500
     * @tc.name testAppVersionCodeNegative
     * @tc.desc Verify negative versionCode is rejected with CODE_NEGATIVE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionCodeNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(checker.check(new BundleVersion(-1, FIXED_VERSION_NAME))).assertEqual('CODE_NEGATIVE');
          expect(checker.check(new BundleVersion(-1000000, FIXED_VERSION_NAME))).assertEqual('CODE_NEGATIVE');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_0600
     * @tc.name testAppVersionEmptyName
     * @tc.desc Verify empty versionName is rejected with EMPTY_NAME
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionEmptyName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const outcome: ParseOutcome = parser.parse('');
          expect(outcome.valid).assertFalse();
          expect(outcome.code).assertEqual('EMPTY_NAME');
          expect(outcome.parts.major).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_0700
     * @tc.name testAppVersionNonNumericName
     * @tc.desc Verify alphabetic versionName a.b.c is rejected with NON_NUMERIC_SEGMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionNonNumericName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const outcome: ParseOutcome = parser.parse('a.b.c');
          expect(outcome.valid).assertFalse();
          expect(outcome.code).assertEqual('NON_NUMERIC_SEGMENT');
          expect(parser.parse('1.2.x').code).assertEqual('NON_NUMERIC_SEGMENT');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_0800
     * @tc.name testAppVersionNegativeName
     * @tc.desc Verify signed versionName -1.0.0 is rejected with NON_NUMERIC_SEGMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionNegativeName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(parser.parse('-1.0.0').code).assertEqual('NON_NUMERIC_SEGMENT');
          expect(parser.parse('1.-2.3').code).assertEqual('NON_NUMERIC_SEGMENT');
          expect(parser.parse('-1').valid).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_0900
     * @tc.name testAppVersionTooManySegments
     * @tc.desc Verify four-segment versionName 1.2.3.4 is rejected with TOO_MANY_SEGMENTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionTooManySegments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(parser.parse('1.2.3.4').code).assertEqual('TOO_MANY_SEGMENTS');
          expect(parser.parse('1.2.3.4.5').code).assertEqual('TOO_MANY_SEGMENTS');
          expect(parser.parse('1.2.3').valid).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_1000
     * @tc.name testAppVersionEmptySegment
     * @tc.desc Verify double-dot versionName 1..3 is rejected with EMPTY_SEGMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionEmptySegment', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(parser.parse('1..3').code).assertEqual('EMPTY_SEGMENT');
          expect(parser.parse('.1.3').code).assertEqual('EMPTY_SEGMENT');
          expect(parser.parse('1.3.').code).assertEqual('EMPTY_SEGMENT');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_1100
     * @tc.name testAppVersionLeadingZero
     * @tc.desc Verify versionName 01.0.0 is rejected with LEADING_ZERO_SEGMENT while 0.1.0 passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionLeadingZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(parser.parse('01.0.0').code).assertEqual('LEADING_ZERO_SEGMENT');
          expect(parser.parse('1.00.0').code).assertEqual('LEADING_ZERO_SEGMENT');
          expect(parser.parse('0.1.0').valid).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_1200
     * @tc.name testAppVersionNameTooLong
     * @tc.desc Verify the length guard at the 16-character boundary: 17 characters is rejected with
     * NAME_TOO_LONG before any segment parsing, exactly 16 characters is accepted when every segment
     * stays below the 1000000 cap, and a 16-character single segment is rejected with SEGMENT_TOO_LARGE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionNameTooLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(parser.parse('12345678901234567').code).assertEqual('NAME_TOO_LONG');
          expect('12345678901234567'.length).assertEqual(VERSION_NAME_MAX_LENGTH + 1);
          expect(parser.parse('1234567890123456').code).assertEqual('SEGMENT_TOO_LARGE');
          expect('1234567890123456'.length).assertEqual(VERSION_NAME_MAX_LENGTH);
          expect(parser.parse('10000.20000.3000').code).assertEqual('OK');
          expect('10000.20000.3000'.length).assertEqual(VERSION_NAME_MAX_LENGTH);
          const boundary: ParseOutcome = parser.parse('10000.20000.3000');
          expect(boundary.valid).assertTrue();
          expect(boundary.parts.major).assertEqual(10000);
          expect(boundary.parts.minor).assertEqual(20000);
          expect(boundary.parts.patch).assertEqual(3000);
          expect(parser.parse('10000.2000.3000').valid).assertTrue();
          expect('10000.2000.3000'.length).assertEqual(VERSION_NAME_MAX_LENGTH - 1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_1300
     * @tc.name testAppVersionSingleSegment
     * @tc.desc Verify single segment versionName 2 expands to 2.0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionSingleSegment', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const outcome: ParseOutcome = parser.parse('2');
          expect(outcome.valid).assertTrue();
          expect(outcome.parts.major).assertEqual(2);
          expect(outcome.parts.minor).assertEqual(0);
          expect(outcome.parts.patch).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_1400
     * @tc.name testAppVersionTwoSegments
     * @tc.desc Verify two segment versionName 1.2 expands to 1.2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionTwoSegments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const outcome: ParseOutcome = parser.parse('1.2');
          expect(outcome.parts.major).assertEqual(1);
          expect(outcome.parts.minor).assertEqual(2);
          expect(outcome.parts.patch).assertEqual(0);
          expect(VersionCodeMath.toCode(outcome.parts)).assertEqual(1020000);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_1500
     * @tc.name testAppVersionSegmentTooLarge
     * @tc.desc Verify segment value 1000000 is rejected with SEGMENT_TOO_LARGE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionSegmentTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(parser.parse('1000000.0.0').code).assertEqual('SEGMENT_TOO_LARGE');
          expect(parser.parse('999999.0.0').valid).assertTrue();
          expect(parser.parse('999999.0.0').parts.major).assertEqual(999999);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_1600
     * @tc.name testAppVersionNormalizeValid
     * @tc.desc Verify normalize returns canonical dotted form for valid names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionNormalizeValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(parser.normalize('1.0.0')).assertEqual('1.0.0');
          expect(parser.normalize('3')).assertEqual('3.0.0');
          expect(parser.normalize('7.5')).assertEqual('7.5.0');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_1700
     * @tc.name testAppVersionNormalizeInvalid
     * @tc.desc Verify normalize returns INVALID for malformed names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionNormalizeInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(parser.normalize('x')).assertEqual('INVALID');
          expect(parser.normalize('')).assertEqual('INVALID');
          expect(parser.normalize('1.2.3.4')).assertEqual('INVALID');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_1800
     * @tc.name testAppVersionFormatRoundTrip
     * @tc.desc Verify parse then format reproduces the canonical version string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionFormatRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const outcome: ParseOutcome = parser.parse('1.2.3');
          expect(parser.format(outcome.parts)).assertEqual('1.2.3');
          expect(parser.format(new VersionParts(0, 0, 0))).assertEqual('0.0.0');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_1900
     * @tc.name testAppVersionToCodeFormula
     * @tc.desc Verify 1.2.3 maps to versionCode 1020300 by major minor patch layout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionToCodeFormula', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(VersionCodeMath.toCode(new VersionParts(1, 2, 3))).assertEqual(1020300);
          expect(VersionCodeMath.toCode(new VersionParts(0, 0, 1))).assertEqual(100);
          expect(VersionCodeMath.toCode(new VersionParts(0, 1, 0))).assertEqual(10000);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_2000
     * @tc.name testAppVersionCompareMajor
     * @tc.desc Verify major version increase reports NEWER relation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionCompareMajor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(VersionCodeMath.compareCodes(1000000, 2000000)).assertEqual(VersionRelation.NEWER);
          expect(VersionCodeMath.compareCodes(2000000, 1000000)).assertEqual(VersionRelation.OLDER);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_2100
     * @tc.name testAppVersionCompareMinor
     * @tc.desc Verify minor version increase reports NEWER relation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionCompareMinor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(VersionCodeMath.compareCodes(1000000, 1010000)).assertEqual(VersionRelation.NEWER);
          expect(VersionCodeMath.compareParts(new VersionParts(1, 1, 0), new VersionParts(1, 2, 0)))
            .assertEqual(VersionRelation.OLDER);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_2200
     * @tc.name testAppVersionComparePatch
     * @tc.desc Verify patch version increase reports NEWER relation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionComparePatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(VersionCodeMath.compareCodes(1000000, 1000100)).assertEqual(VersionRelation.NEWER);
          expect(VersionCodeMath.compareCodes(1000100, 1000000)).assertEqual(VersionRelation.OLDER);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_2300
     * @tc.name testAppVersionCompareSame
     * @tc.desc Verify identical codes and parts report SAME relation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionCompareSame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(VersionCodeMath.compareCodes(FIXED_VERSION_CODE, FIXED_VERSION_CODE))
            .assertEqual(VersionRelation.SAME);
          expect(VersionCodeMath.compareParts(new VersionParts(1, 0, 0), new VersionParts(1, 0, 0)))
            .assertEqual(VersionRelation.SAME);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_2400
     * @tc.name testAppVersionCompareNames
     * @tc.desc Verify compareNames orders 1.0.0 before 1.0.1 and treats equal names as SAME
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionCompareNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(parser.compareNames('1.0.0', '1.0.1')).assertEqual(VersionRelation.OLDER);
          expect(parser.compareNames('2.0.0', '1.9.9')).assertEqual(VersionRelation.NEWER);
          expect(parser.compareNames('1.0.0', '1.0.0')).assertEqual(VersionRelation.SAME);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_2500
     * @tc.name testAppVersionCompareNamesInvalid
     * @tc.desc Verify compareNames returns INCOMPARABLE when either name is malformed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionCompareNamesInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(parser.compareNames('1.0.0', 'x')).assertEqual(VersionRelation.INCOMPARABLE);
          expect(parser.compareNames('', '1.0.0')).assertEqual(VersionRelation.INCOMPARABLE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_2600
     * @tc.name testAppVersionDeltaAndUpgrade
     * @tc.desc Verify delta arithmetic and upgrade predicate across adjacent codes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionDeltaAndUpgrade', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(VersionCodeMath.delta(1000000, 1000000)).assertEqual(0);
          expect(VersionCodeMath.delta(1000000, 1000001)).assertEqual(1);
          expect(VersionCodeMath.isUpgrade(1000000, 1000001)).assertTrue();
          expect(VersionCodeMath.isUpgrade(1000001, 1000000)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_2700
     * @tc.name testAppVersionCrossMajor
     * @tc.desc Verify cross major detection distinguishes major bumps from patch bumps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionCrossMajor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(VersionCodeMath.isCrossMajor(1000000, 2000000)).assertTrue();
          expect(VersionCodeMath.isCrossMajor(1000000, 1010000)).assertFalse();
          expect(VersionCodeMath.isCrossMajor(FIXED_VERSION_CODE, FIXED_VERSION_CODE + PATCH_STRIDE))
            .assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_2800
     * @tc.name testAppVersionPatchOnly
     * @tc.desc Verify patch-only detection ignores major and minor bumps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionPatchOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(VersionCodeMath.isPatchOnly(1000000, 1000100)).assertTrue();
          expect(VersionCodeMath.isPatchOnly(1000000, 1010000)).assertFalse();
          expect(VersionCodeMath.isPatchOnly(1000000, 1000000)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_2900
     * @tc.name testAppVersionSegmentCount
     * @tc.desc Verify segment counting for empty one two and three segment names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionSegmentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(parser.segmentCount('')).assertEqual(0);
          expect(parser.segmentCount('1')).assertEqual(1);
          expect(parser.segmentCount('1.2')).assertEqual(2);
          expect(parser.segmentCount('1.2.3')).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_3000
     * @tc.name testAppVersionFormatStyle
     * @tc.desc Verify semantic format classification accepts 1.0.0 and rejects lettered names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionFormatStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(parser.formatStyle(FIXED_VERSION_NAME)).assertEqual(VersionFormat.SEMANTIC);
          expect(parser.formatStyle('1.0.0-beta')).assertEqual(VersionFormat.INCOMPARABLE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_3100
     * @tc.name testAppVersionSortCodes
     * @tc.desc Verify sortCodes orders 3.0.0 2.0.0 1.0.0 ascending without mutating input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionSortCodes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const input: number[] = [3000000, 1000000, 2000000];
          const sorted: number[] = VersionCodeMath.sortCodes(input);
          expect(sorted[0]).assertEqual(1000000);
          expect(sorted[1]).assertEqual(2000000);
          expect(sorted[2]).assertEqual(3000000);
          expect(input[0]).assertEqual(3000000);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_3200
     * @tc.name testAppVersionSelectHighest
     * @tc.desc Verify selectHighest picks 2.0.0 from a mixed list and handles empty list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionSelectHighest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const versions: BundleVersion[] = [
            new BundleVersion(1000000, '1.0.0'),
            new BundleVersion(2000000, '2.0.0'),
            new BundleVersion(1010000, '1.1.0')
          ];
          expect(VersionPolicy.selectHighest(versions).name).assertEqual('2.0.0');
          const empty: BundleVersion[] = [];
          expect(VersionPolicy.selectHighest(empty).code).assertEqual(INVALID_CODE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_3300
     * @tc.name testAppVersionCacheKey
     * @tc.desc Verify cache key joins version name and code with a stable separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionCacheKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const version: BundleVersion = new BundleVersion(FIXED_VERSION_CODE, FIXED_VERSION_NAME);
          expect(VersionPolicy.cacheKey(version)).assertEqual('1.0.0#1000000');
          expect(checker.describe(version)).assertEqual('1.0.0#1000000');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_3400
     * @tc.name testAppVersionCountUpgrades
     * @tc.desc Verify countUpgrades counts only codes strictly above baseline 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionCountUpgrades', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const versions: BundleVersion[] = [
            new BundleVersion(1000000, '1.0.0'),
            new BundleVersion(1000001, '1.0.1'),
            new BundleVersion(2000000, '2.0.0')
          ];
          expect(VersionPolicy.countUpgrades(versions, FIXED_VERSION_CODE)).assertEqual(2);
          expect(VersionPolicy.countUpgrades(versions, 3000000)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_3500
     * @tc.name testAppVersionRequiresMigration
     * @tc.desc Verify migration is required only across major versions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionRequiresMigration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const from: BundleVersion = new BundleVersion(1000000, '1.0.0');
          expect(VersionPolicy.requiresMigration(from, new BundleVersion(2000000, '2.0.0'))).assertTrue();
          expect(VersionPolicy.requiresMigration(from, new BundleVersion(1010000, '1.1.0'))).assertFalse();
          expect(VersionPolicy.isSameMajor(from, new BundleVersion(1999999, '1.999999.99'))).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_3600
     * @tc.name testAppVersionRollbackSafe
     * @tc.desc Verify rollback is safe only within the same major version
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionRollbackSafe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const high: BundleVersion = new BundleVersion(1010000, '1.1.0');
          expect(VersionPolicy.isRollbackSafe(high, new BundleVersion(1000000, '1.0.0'))).assertTrue();
          expect(VersionPolicy.isRollbackSafe(high, new BundleVersion(2000000, '2.0.0'))).assertFalse();
          expect(VersionPolicy.isRollbackSafe(high, high)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_3700
     * @tc.name testAppVersionExpectedCodeInvalid
     * @tc.desc Verify expectedCode returns -1 for malformed names such as empty and dotted junk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionExpectedCodeInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(checker.expectedCode('')).assertEqual(INVALID_CODE);
          expect(checker.expectedCode('a.b.c')).assertEqual(INVALID_CODE);
          expect(checker.expectedCode('1.2.3.4')).assertEqual(INVALID_CODE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_3800
     * @tc.name testAppVersionLaunchRendersIndex
     * @tc.desc Verify EntryAbility launch reaches the Index page under the fixed bundle version
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionLaunchRendersIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const stable: boolean = await waitForIndexPageStable(driver);
          expect(stable).assertTrue();
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_3900
     * @tc.name testAppVersionRuntimeBundleName
     * @tc.desc Verify runtime bundle name equals configured bundleName com.samples.abilitystage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionRuntimeBundleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(getBundleName()).assertEqual(BUNDLE_NAME);
          expect(BUNDLE_NAME).assertEqual('com.samples.abilitystage');
          expect(getBundleName().length).assertEqual(24);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_4000
     * @tc.name testAppVersionEntryWantAbility
     * @tc.desc Verify buildEntryWant targets EntryAbility with the runtime bundle name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionEntryWantAbility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: Want = buildEntryWant();
          expect(want.abilityName as string).assertEqual(ENTRY_ABILITY_NAME);
          expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_4100
     * @tc.name testAppVersionIndexRendersKnownText
     * @tc.desc Verify the launched Index page renders one of the known page texts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionIndexRendersKnownText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          const currentText: string = await PageTextProbe.current(driver);
          expect(PageTextProbe.isKnown(currentText)).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.length >= 1).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_4200
     * @tc.name testAppVersionPageHasComponents
     * @tc.desc Verify Index page renders at least one component and the UI queue is idle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionPageHasComponents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const count: number = await pageComponentCount(driver);
          expect(count > 0).assertTrue();
          expect(isQueueBusy()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_4300
     * @tc.name testAppVersionClickUpdatesText
     * @tc.desc Verify clicking the current page text switches it to Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionClickUpdatesText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const clicked: boolean = await PageTextProbe.ensureClicked(driver);
          expect(clicked).assertTrue();
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_4400
     * @tc.name testAppVersionCollectTextsAfterClick
     * @tc.desc Verify Welcome text is present in collected texts after the click transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionCollectTextsAfterClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await PageTextProbe.ensureClicked(driver)).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.indexOf(PAGE_TEXT_CLICKED) >= 0).assertTrue();
          expect(texts.length >= 1).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_4500
     * @tc.name testAppVersionBackgroundForeground
     * @tc.desc Verify the Index page is still visible after background and foreground round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionBackgroundForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_4600
     * @tc.name testAppVersionRelaunchStable
     * @tc.desc Verify a second launch keeps the Index page stable and visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionRelaunchStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_4700
     * @tc.name testAppVersionGatedLaunchConsistency
     * @tc.desc Verify the shipped version pair passes consistency before the gated launch succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionGatedLaunchConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const shipped: BundleVersion = new BundleVersion(FIXED_VERSION_CODE, FIXED_VERSION_NAME);
          const gatePassed: boolean = checker.isConsistent(shipped);
          expect(gatePassed).assertTrue();
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_4800
     * @tc.name testAppVersionGatedLaunchMismatch
     * @tc.desc Verify a mismatched version pair is rejected while the real app page still renders
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionGatedLaunchMismatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tampered: BundleVersion = new BundleVersion(2000000, FIXED_VERSION_NAME);
          expect(checker.check(tampered)).assertEqual('CODE_NAME_MISMATCH');
          const driver: Driver = getDriver();
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_APPVERSION_4900
     * @tc.name testAppVersionTapIdempotent
     * @tc.desc Verify tapping the already switched Welcome text keeps the page consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAppVersionTapIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          expect(await PageTextProbe.ensureClicked(driver)).assertTrue();
          const clicked: boolean = await tapComponentByText(driver, PAGE_TEXT_CLICKED);
          expect(clicked).assertTrue();
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
        } finally {
          done();
        }
      })
  })
}
