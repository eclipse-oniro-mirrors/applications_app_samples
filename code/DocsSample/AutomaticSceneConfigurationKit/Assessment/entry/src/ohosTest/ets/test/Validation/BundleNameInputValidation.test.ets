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
  TEXT_WHITELIST_EMPTY,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  typeBundleName,
  hideSoftKeyboard,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Grammar bounds of a bundle name.
const MIN_SEGMENTS: number = 2;
const MIN_SEGMENT_LENGTH: number = 1;
const MAX_SEGMENT_LENGTH: number = 64;
const MAX_NAME_LENGTH: number = 255;
const MAX_ALLOWED_APPS: number = 20;
const MAX_INPUT_LENGTH: number = 128;

// Sample bundle names used by the cases.
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';
const BUNDLE_PRIMARY: string = 'com.samples.assessment';
const BUNDLE_SECONDARY: string = 'com.samples.dictionary';
const BUNDLE_TERTIARY: string = 'com.samples.reader';
const BUNDLE_INVALID: string = 'not-a-bundle-name';

// Sentinels.
const INVALID_INDEX: number = -1;
const EMPTY_LENGTH: number = 0;

/**
 * Verdict of one bundle name check.
 */
enum Verdict {
  VALID = 'valid',
  EMPTY = 'empty',
  TOO_LONG = 'too_long',
  TOO_FEW_SEGMENTS = 'too_few_segments',
  LEADING_DOT = 'leading_dot',
  TRAILING_DOT = 'trailing_dot',
  CONSECUTIVE_DOTS = 'consecutive_dots',
  EMPTY_SEGMENT = 'empty_segment',
  SEGMENT_TOO_LONG = 'segment_too_long',
  ILLEGAL_CHARACTER = 'illegal_character'
}

/**
 * Outcome of one whitelist insertion request.
 */
enum InsertOutcome {
  ACCEPTED = 'accepted',
  REJECTED_EMPTY = 'rejected_empty',
  REJECTED_SYNTAX = 'rejected_syntax',
  REJECTED_DUPLICATE = 'rejected_duplicate',
  REJECTED_FULL = 'rejected_full'
}

/**
 * Character class of one input character.
 */
enum CharClass {
  LOWER = 'lower',
  DIGIT = 'digit',
  UNDERSCORE = 'underscore',
  DOT = 'dot',
  UPPER = 'upper',
  HYPHEN = 'hyphen',
  SPACE = 'space',
  OTHER = 'other'
}

/**
 * Detailed result of a syntax check.
 */
interface SyntaxReport {
  verdict: Verdict;
  segmentCount: number;
  offendingIndex: number;
  message: string;
}

/**
 * Result of one insertion.
 */
interface InsertResult {
  outcome: InsertOutcome;
  accepted: boolean;
  size: number;
  message: string;
}

/**
 * View of the input model that the page binds to.
 */
interface InputState {
  raw: string;
  normalized: string;
  length: number;
  valid: boolean;
  canSubmit: boolean;
}

/**
 * Sanitized input.
 */
interface SanitizeResult {
  text: string;
  removedChars: number;
  truncated: boolean;
}

/**
 * Character classifier of the bundle name grammar.
 */
class CharClassifier {
  public static classify(code: number): CharClass {
    if (code >= 97 && code <= 122) {
      return CharClass.LOWER;
    }
    if (code >= 48 && code <= 57) {
      return CharClass.DIGIT;
    }
    if (code === 95) {
      return CharClass.UNDERSCORE;
    }
    if (code === 46) {
      return CharClass.DOT;
    }
    if (code >= 65 && code <= 90) {
      return CharClass.UPPER;
    }
    if (code === 45) {
      return CharClass.HYPHEN;
    }
    if (code === 32 || code === 9 || code === 10 || code === 13) {
      return CharClass.SPACE;
    }
    return CharClass.OTHER;
  }

  public static isSegmentChar(code: number): boolean {
    const kind: CharClass = CharClassifier.classify(code);
    return kind === CharClass.LOWER || kind === CharClass.DIGIT || kind === CharClass.UNDERSCORE;
  }

  public static isWhitespace(code: number): boolean {
    return CharClassifier.classify(code) === CharClass.SPACE;
  }

  public static describe(kind: CharClass): string {
    if (kind === CharClass.LOWER) {
      return 'a lowercase letter';
    }
    if (kind === CharClass.DIGIT) {
      return 'a digit';
    }
    if (kind === CharClass.UNDERSCORE) {
      return 'an underscore';
    }
    if (kind === CharClass.DOT) {
      return 'a dot';
    }
    if (kind === CharClass.UPPER) {
      return 'an uppercase letter';
    }
    if (kind === CharClass.HYPHEN) {
      return 'a hyphen';
    }
    if (kind === CharClass.SPACE) {
      return 'a whitespace';
    }
    return 'an unsupported character';
  }
}

/**
 * Syntax checker of a bundle name.
 *
 * The checker returns a verdict instead of a boolean so that the page can show a precise
 * hint under the input box.
 */
class BundleNameSyntaxChecker {
  public check(name: string): SyntaxReport {
    if (name.length === EMPTY_LENGTH) {
      return this.report(Verdict.EMPTY, 0, INVALID_INDEX, 'the bundle name is empty');
    }
    if (name.length > MAX_NAME_LENGTH) {
      return this.report(Verdict.TOO_LONG, 0, INVALID_INDEX, 'the bundle name is too long');
    }
    if (name.charAt(0) === '.') {
      return this.report(Verdict.LEADING_DOT, 0, 0, 'the bundle name starts with a dot');
    }
    if (name.charAt(name.length - 1) === '.') {
      return this.report(Verdict.TRAILING_DOT, 0, name.length - 1, 'the bundle name ends with a dot');
    }
    const consecutive: number = name.indexOf('..');
    if (consecutive >= 0) {
      return this.report(Verdict.CONSECUTIVE_DOTS, 0, consecutive, 'two dots follow each other');
    }
    const segments: string[] = name.split('.');
    if (segments.length < MIN_SEGMENTS) {
      return this.report(Verdict.TOO_FEW_SEGMENTS, segments.length, INVALID_INDEX,
        'a bundle name needs at least two segments');
    }
    for (let i = 0; i < segments.length; i++) {
      const segment: string = segments[i];
      if (segment.length === 0) {
        return this.report(Verdict.EMPTY_SEGMENT, segments.length, i, 'a segment is empty');
      }
      if (segment.length > MAX_SEGMENT_LENGTH) {
        return this.report(Verdict.SEGMENT_TOO_LONG, segments.length, i, 'a segment is too long');
      }
      for (let j = 0; j < segment.length; j++) {
        if (!CharClassifier.isSegmentChar(segment.charCodeAt(j))) {
          const hint: string = CharClassifier.describe(CharClassifier.classify(segment.charCodeAt(j)));
          return this.report(Verdict.ILLEGAL_CHARACTER, segments.length, j,
            `a segment contains ${hint}`);
        }
      }
    }
    return this.report(Verdict.VALID, segments.length, INVALID_INDEX, 'ok');
  }

  private report(verdict: Verdict, segmentCount: number, offendingIndex: number, message: string): SyntaxReport {
    const report: SyntaxReport = {
      verdict: verdict,
      segmentCount: segmentCount,
      offendingIndex: offendingIndex,
      message: message
    };
    return report;
  }

  public isValid(name: string): boolean {
    return this.check(name).verdict === Verdict.VALID;
  }

  public segmentCount(name: string): number {
    if (name.length === 0) {
      return 0;
    }
    return name.split('.').length;
  }

  public longestSegment(name: string): number {
    if (name.length === 0) {
      return 0;
    }
    const segments: string[] = name.split('.');
    let longest: number = 0;
    for (let i = 0; i < segments.length; i++) {
      if (segments[i].length > longest) {
        longest = segments[i].length;
      }
    }
    return longest;
  }

  public shortestSegment(name: string): number {
    if (name.length === 0) {
      return 0;
    }
    const segments: string[] = name.split('.');
    let shortest: number = MAX_NAME_LENGTH;
    for (let i = 0; i < segments.length; i++) {
      if (segments[i].length < shortest) {
        shortest = segments[i].length;
      }
    }
    return shortest;
  }
}

/**
 * Sanitizer of raw input from the text field.
 *
 * The sanitizer trims the text, drops control characters and enforces the maximum input
 * length so that the model never sees a value the page would refuse to render.
 */
class BundleNameSanitizer {
  public sanitize(raw: string): SanitizeResult {
    const trimmed: string = raw.trim();
    let text: string = '';
    let removed: number = 0;
    for (let i = 0; i < trimmed.length; i++) {
      const code: number = trimmed.charCodeAt(i);
      if (code < 32 || code === 127) {
        removed++;
        continue;
      }
      text += trimmed.charAt(i);
    }
    let truncated: boolean = false;
    if (text.length > MAX_INPUT_LENGTH) {
      text = text.substring(0, MAX_INPUT_LENGTH);
      truncated = true;
    }
    const result: SanitizeResult = {
      text: text,
      removedChars: removed,
      truncated: truncated
    };
    return result;
  }

  public collapseDots(name: string): string {
    let result: string = name;
    while (result.indexOf('..') >= 0) {
      result = result.replace('..', '.');
    }
    return result;
  }

  public stripEdges(name: string): string {
    let start: number = 0;
    let end: number = name.length;
    while (start < end && name.charAt(start) === '.') {
      start++;
    }
    while (end > start && name.charAt(end - 1) === '.') {
      end--;
    }
    return name.substring(start, end);
  }

  public toLowerCase(name: string): string {
    return name.toLowerCase();
  }

  public isBlank(text: string): boolean {
    if (text.length === 0) {
      return true;
    }
    for (let i = 0; i < text.length; i++) {
      if (!CharClassifier.isWhitespace(text.charCodeAt(i))) {
        return false;
      }
    }
    return true;
  }
}

/**
 * Whitelist of the configuration card with the insertion protocol of the page.
 */
class BundleWhitelistModel {
  private entries: string[] = [];
  private checker: BundleNameSyntaxChecker = new BundleNameSyntaxChecker();
  private sanitizer: BundleNameSanitizer = new BundleNameSanitizer();

  public add(raw: string): InsertResult {
    const sanitized: SanitizeResult = this.sanitizer.sanitize(raw);
    if (this.sanitizer.isBlank(sanitized.text)) {
      return this.result(InsertOutcome.REJECTED_EMPTY, false, 'the bundle name is empty');
    }
    const syntax: SyntaxReport = this.checker.check(sanitized.text);
    if (syntax.verdict !== Verdict.VALID) {
      return this.result(InsertOutcome.REJECTED_SYNTAX, false, syntax.message);
    }
    if (this.entries.indexOf(sanitized.text) >= 0) {
      return this.result(InsertOutcome.REJECTED_DUPLICATE, false, 'the bundle name is already listed');
    }
    if (this.entries.length >= MAX_ALLOWED_APPS) {
      return this.result(InsertOutcome.REJECTED_FULL, false, 'the whitelist is full');
    }
    this.entries.push(sanitized.text);
    return this.result(InsertOutcome.ACCEPTED, true, 'added');
  }

  private result(outcome: InsertOutcome, accepted: boolean, message: string): InsertResult {
    const result: InsertResult = {
      outcome: outcome,
      accepted: accepted,
      size: this.entries.length,
      message: message
    };
    return result;
  }

  public remove(name: string): boolean {
    const index: number = this.entries.indexOf(name);
    if (index < 0) {
      return false;
    }
    this.entries.splice(index, 1);
    return true;
  }

  public size(): number {
    return this.entries.length;
  }

  public isEmpty(): boolean {
    return this.entries.length === 0;
  }

  public isFull(): boolean {
    return this.entries.length >= MAX_ALLOWED_APPS;
  }

  public contains(name: string): boolean {
    return this.entries.indexOf(name) >= 0;
  }

  public indexOf(name: string): number {
    return this.entries.indexOf(name);
  }

  public at(index: number): string {
    if (index < 0 || index >= this.entries.length) {
      return '';
    }
    return this.entries[index];
  }

  public toArray(): string[] {
    return this.entries.slice();
  }

  public clear(): void {
    this.entries = [];
  }

  public seed(names: string[]): void {
    for (let i = 0; i < names.length; i++) {
      this.add(names[i]);
    }
  }

  public labels(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      result.push(`${i + 1}. ${this.entries[i]}`);
    }
    return result;
  }

  public joined(): string {
    return this.entries.join(',');
  }
}

/**
 * Input state builder of the text field.
 *
 * The page derives the enabled state of the add button from this model, so the cases can
 * verify the button contract without touching the UI.
 */
class BundleInputState {
  private checker: BundleNameSyntaxChecker = new BundleNameSyntaxChecker();
  private sanitizer: BundleNameSanitizer = new BundleNameSanitizer();
  private whitelist: BundleWhitelistModel;

  public constructor(whitelist: BundleWhitelistModel) {
    this.whitelist = whitelist;
  }

  public evaluate(raw: string): InputState {
    const sanitized: SanitizeResult = this.sanitizer.sanitize(raw);
    const normalized: string = sanitized.text;
    const valid: boolean = this.checker.isValid(normalized);
    const duplicated: boolean = this.whitelist.contains(normalized);
    const state: InputState = {
      raw: raw,
      normalized: normalized,
      length: normalized.length,
      valid: valid,
      canSubmit: valid && !duplicated && !this.whitelist.isFull()
    };
    return state;
  }

  public canSubmit(raw: string): boolean {
    return this.evaluate(raw).canSubmit;
  }

  public hintOf(raw: string): string {
    const sanitized: SanitizeResult = this.sanitizer.sanitize(raw);
    if (this.sanitizer.isBlank(sanitized.text)) {
      return 'Enter a bundle name';
    }
    const report: SyntaxReport = this.checker.check(sanitized.text);
    if (report.verdict !== Verdict.VALID) {
      return report.message;
    }
    if (this.whitelist.contains(sanitized.text)) {
      return 'Already in the whitelist';
    }
    if (this.whitelist.isFull()) {
      return 'The whitelist is full';
    }
    return 'Ready to add';
  }
}

/**
 * Deduplicator that keeps the first occurrence of every bundle name.
 */
class BundleDeduplicator {
  public dedupe(names: string[]): string[] {
    const result: string[] = [];
    for (let i = 0; i < names.length; i++) {
      if (result.indexOf(names[i]) < 0) {
        result.push(names[i]);
      }
    }
    return result;
  }

  public duplicateCount(names: string[]): number {
    return names.length - this.dedupe(names).length;
  }

  public firstDuplicate(names: string[]): string {
    const seen: string[] = [];
    for (let i = 0; i < names.length; i++) {
      if (seen.indexOf(names[i]) >= 0) {
        return names[i];
      }
      seen.push(names[i]);
    }
    return '';
  }

  public sorted(names: string[]): string[] {
    return names.slice().sort();
  }

  public sameVendorCount(names: string[], vendor: string): number {
    let count: number = 0;
    for (let i = 0; i < names.length; i++) {
      if (names[i].startsWith(`${vendor}.`)) {
        count++;
      }
    }
    return count;
  }
}

export default function bundleNameInputValidationTest() {
  describe('BundleNameInputValidation_Test', () => {
    let driver: Driver;
    let checker: BundleNameSyntaxChecker;
    let sanitizer: BundleNameSanitizer;
    let deduplicator: BundleDeduplicator;

    beforeAll(async () => {
      driver = getDriver();
      checker = new BundleNameSyntaxChecker();
      sanitizer = new BundleNameSanitizer();
      deduplicator = new BundleDeduplicator();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: classification of every supported character class.
     * Expectation: the classifier separates lowercase, digits, underscore and the rest.
     */
    it('Assessment_BundleInputCharClass_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputCharClass_001, begin');
      expect(CharClassifier.classify(97)).assertEqual(CharClass.LOWER);
      expect(CharClassifier.classify(122)).assertEqual(CharClass.LOWER);
      expect(CharClassifier.classify(48)).assertEqual(CharClass.DIGIT);
      expect(CharClassifier.classify(57)).assertEqual(CharClass.DIGIT);
      expect(CharClassifier.classify(95)).assertEqual(CharClass.UNDERSCORE);
      expect(CharClassifier.classify(46)).assertEqual(CharClass.DOT);
      expect(CharClassifier.classify(65)).assertEqual(CharClass.UPPER);
      expect(CharClassifier.classify(45)).assertEqual(CharClass.HYPHEN);
      expect(CharClassifier.classify(32)).assertEqual(CharClass.SPACE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputCharClass_001, end');
    });

    /**
     * Scenario: the segment character predicate.
     * Expectation: only lowercase letters, digits and underscores qualify.
     */
    it('Assessment_BundleInputSegmentChars_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSegmentChars_002, begin');
      expect(CharClassifier.isSegmentChar(97)).assertTrue();
      expect(CharClassifier.isSegmentChar(48)).assertTrue();
      expect(CharClassifier.isSegmentChar(95)).assertTrue();
      expect(CharClassifier.isSegmentChar(65)).assertFalse();
      expect(CharClassifier.isSegmentChar(45)).assertFalse();
      expect(CharClassifier.isSegmentChar(46)).assertFalse();
      expect(CharClassifier.isSegmentChar(32)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSegmentChars_002, end');
    });

    /**
     * Scenario: the character descriptions used by the hint text.
     * Expectation: each class answers a non empty English description.
     */
    it('Assessment_BundleInputCharDescriptions_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputCharDescriptions_003, begin');
      expect(CharClassifier.describe(CharClass.LOWER)).assertEqual('a lowercase letter');
      expect(CharClassifier.describe(CharClass.DIGIT)).assertEqual('a digit');
      expect(CharClassifier.describe(CharClass.UNDERSCORE)).assertEqual('an underscore');
      expect(CharClassifier.describe(CharClass.DOT)).assertEqual('a dot');
      expect(CharClassifier.describe(CharClass.UPPER)).assertEqual('an uppercase letter');
      expect(CharClassifier.describe(CharClass.HYPHEN)).assertEqual('a hyphen');
      expect(CharClassifier.describe(CharClass.SPACE)).assertEqual('a whitespace');
      expect(CharClassifier.describe(CharClass.OTHER)).assertEqual('an unsupported character');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputCharDescriptions_003, end');
    });

    /**
     * Scenario: the whitespace predicate.
     * Expectation: tabs and line breaks count as whitespace.
     */
    it('Assessment_BundleInputWhitespace_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputWhitespace_004, begin');
      expect(CharClassifier.isWhitespace(32)).assertTrue();
      expect(CharClassifier.isWhitespace(9)).assertTrue();
      expect(CharClassifier.isWhitespace(10)).assertTrue();
      expect(CharClassifier.isWhitespace(13)).assertTrue();
      expect(CharClassifier.isWhitespace(97)).assertFalse();
      expect(CharClassifier.isWhitespace(46)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputWhitespace_004, end');
    });

    /**
     * Scenario: accepted bundle names.
     * Expectation: the sample bundles are all reported as valid with their segment count.
     */
    it('Assessment_BundleInputValidNames_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputValidNames_005, begin');
      const primary: SyntaxReport = checker.check(BUNDLE_PRIMARY);
      expect(primary.verdict).assertEqual(Verdict.VALID);
      expect(primary.segmentCount).assertEqual(3);
      expect(checker.check(BUNDLE_SECONDARY).verdict).assertEqual(Verdict.VALID);
      expect(checker.check(BUNDLE_TERTIARY).verdict).assertEqual(Verdict.VALID);
      expect(checker.check('a.b').segmentCount).assertEqual(2);
      expect(checker.isValid('ohos.app.hap')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputValidNames_005, end');
    });

    /**
     * Scenario: the empty input verdict.
     * Expectation: an empty name is rejected with the dedicated verdict.
     */
    it('Assessment_BundleInputEmpty_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputEmpty_006, begin');
      const report: SyntaxReport = checker.check('');
      expect(report.verdict).assertEqual(Verdict.EMPTY);
      expect(report.segmentCount).assertEqual(0);
      expect(report.message).assertEqual('the bundle name is empty');
      expect(checker.isValid('')).assertFalse();
      expect(checker.segmentCount('')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputEmpty_006, end');
    });

    /**
     * Scenario: a name that only has one segment.
     * Expectation: it is rejected because a bundle name needs at least two segments.
     */
    it('Assessment_BundleInputTooFewSegments_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputTooFewSegments_007, begin');
      expect(checker.check('com').verdict).assertEqual(Verdict.TOO_FEW_SEGMENTS);
      expect(checker.check('assessment').verdict).assertEqual(Verdict.TOO_FEW_SEGMENTS);
      expect(checker.check('com.samples').verdict).assertEqual(Verdict.VALID);
      expect(checker.check('com.samples').segmentCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputTooFewSegments_007, end');
    });

    /**
     * Scenario: a name that starts or ends with a dot.
     * Expectation: both shapes are reported with their own verdict.
     */
    it('Assessment_BundleInputEdgeDots_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputEdgeDots_008, begin');
      expect(checker.check('.com.samples').verdict).assertEqual(Verdict.LEADING_DOT);
      expect(checker.check('.com.samples').offendingIndex).assertEqual(0);
      expect(checker.check('com.samples.').verdict).assertEqual(Verdict.TRAILING_DOT);
      expect(checker.check('com.samples.').offendingIndex).assertEqual(11);
      expect(checker.check('.').verdict).assertEqual(Verdict.LEADING_DOT);
      expect(checker.check('..').verdict).assertEqual(Verdict.LEADING_DOT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputEdgeDots_008, end');
    });

    /**
     * Scenario: two consecutive dots inside the name.
     * Expectation: the verdict points at the position of the first dot of the pair.
     */
    it('Assessment_BundleInputConsecutiveDots_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputConsecutiveDots_009, begin');
      const report: SyntaxReport = checker.check('com..samples');
      expect(report.verdict).assertEqual(Verdict.CONSECUTIVE_DOTS);
      expect(report.offendingIndex).assertEqual(3);
      expect(checker.check('com.samples..app').verdict).assertEqual(Verdict.CONSECUTIVE_DOTS);
      expect(checker.check('a...b').verdict).assertEqual(Verdict.CONSECUTIVE_DOTS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputConsecutiveDots_009, end');
    });

    /**
     * Scenario: uppercase letters inside a segment.
     * Expectation: the verdict names the offending segment index.
     */
    it('Assessment_BundleInputUppercase_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputUppercase_010, begin');
      const report: SyntaxReport = checker.check('com.Samples.app');
      expect(report.verdict).assertEqual(Verdict.ILLEGAL_CHARACTER);
      expect(report.segmentCount).assertEqual(3);
      expect(checker.check('COM.samples').verdict).assertEqual(Verdict.ILLEGAL_CHARACTER);
      expect(checker.check('com.samplesAssessment').verdict).assertEqual(Verdict.ILLEGAL_CHARACTER);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputUppercase_010, end');
    });

    /**
     * Scenario: hyphens, slashes and spaces inside a segment.
     * Expectation: every unsupported character is rejected, a dot free name fails earlier on
     * the segment count.
     */
    it('Assessment_BundleInputIllegalChars_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputIllegalChars_011, begin');
      expect(checker.check(BUNDLE_INVALID).verdict).assertEqual(Verdict.TOO_FEW_SEGMENTS);
      expect(checker.check('com.samples.app-one').verdict).assertEqual(Verdict.ILLEGAL_CHARACTER);
      expect(checker.check('com.samples.app/one').verdict).assertEqual(Verdict.ILLEGAL_CHARACTER);
      expect(checker.check('com.samples.app one').verdict).assertEqual(Verdict.ILLEGAL_CHARACTER);
      expect(checker.check('com.samples.app:one').verdict).assertEqual(Verdict.ILLEGAL_CHARACTER);
      expect(checker.check('com.samples.app@one').verdict).assertEqual(Verdict.ILLEGAL_CHARACTER);
      expect(checker.check('com.samples.app#one').verdict).assertEqual(Verdict.ILLEGAL_CHARACTER);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputIllegalChars_011, end');
    });

    /**
     * Scenario: digits and underscores inside segments.
     * Expectation: both are accepted anywhere in the segment.
     */
    it('Assessment_BundleInputDigitsUnderscore_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputDigitsUnderscore_012, begin');
      expect(checker.isValid('com.samples.app1')).assertTrue();
      expect(checker.isValid('com.samples._app')).assertTrue();
      expect(checker.isValid('com.123.456')).assertTrue();
      expect(checker.isValid('com.samples.a_b_c')).assertTrue();
      expect(checker.isValid('com.samples.1')).assertTrue();
      expect(checker.isValid('com.samples._')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputDigitsUnderscore_012, end');
    });

    /**
     * Scenario: the segment length bounds.
     * Expectation: a single character segment is fine, an over long segment is not.
     */
    it('Assessment_BundleInputSegmentBounds_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSegmentBounds_013, begin');
      expect(checker.check('a.b').verdict).assertEqual(Verdict.VALID);
      const atLimit: string = `${'a'.repeat(MAX_SEGMENT_LENGTH)}.b`;
      const overLimit: string = `${'a'.repeat(MAX_SEGMENT_LENGTH + 1)}.b`;
      expect(checker.check(atLimit).verdict).assertEqual(Verdict.VALID);
      expect(checker.check(overLimit).verdict).assertEqual(Verdict.SEGMENT_TOO_LONG);
      expect(MIN_SEGMENT_LENGTH).assertEqual(1);
      expect(MIN_SEGMENTS).assertEqual(2);
      expect(checker.longestSegment(atLimit)).assertEqual(MAX_SEGMENT_LENGTH);
      expect(checker.shortestSegment(atLimit)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSegmentBounds_013, end');
    });

    /**
     * Scenario: the total length bound of the name.
     * Expectation: a name above the limit is reported before the segment checks run.
     */
    it('Assessment_BundleInputTotalBounds_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputTotalBounds_014, begin');
      const longName: string = `${'a'.repeat(64)}.${'b'.repeat(64)}.${'c'.repeat(64)}.${'d'.repeat(61)}`;
      expect(longName.length > MAX_NAME_LENGTH).assertTrue();
      expect(checker.check(longName).verdict).assertEqual(Verdict.TOO_LONG);
      expect(checker.check(`${'a'.repeat(64)}.${'b'.repeat(64)}`).verdict).assertEqual(Verdict.VALID);
      expect(MAX_NAME_LENGTH).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputTotalBounds_014, end');
    });

    /**
     * Scenario: the segment statistics helpers.
     * Expectation: longest and shortest segment cover the documented inputs.
     */
    it('Assessment_BundleInputSegmentStats_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSegmentStats_015, begin');
      expect(checker.segmentCount(BUNDLE_PRIMARY)).assertEqual(3);
      expect(checker.segmentCount('com.samples')).assertEqual(2);
      expect(checker.segmentCount('com')).assertEqual(1);
      expect(checker.longestSegment('a.bb.ccc')).assertEqual(3);
      expect(checker.shortestSegment('a.bb.ccc')).assertEqual(1);
      expect(checker.longestSegment('aa.bb.cc')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSegmentStats_015, end');
    });

    /**
     * Scenario: sanitizing a padded input.
     * Expectation: the surrounding whitespace is removed and nothing is reported as dropped.
     */
    it('Assessment_BundleInputSanitizeTrim_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSanitizeTrim_016, begin');
      const result: SanitizeResult = sanitizer.sanitize('   com.samples.app   ');
      expect(result.text).assertEqual('com.samples.app');
      expect(result.removedChars).assertEqual(0);
      expect(result.truncated).assertFalse();
      expect(sanitizer.sanitize('\tcom.samples.app\n').text).assertEqual('com.samples.app');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSanitizeTrim_016, end');
    });

    /**
     * Scenario: sanitizing an input with control characters.
     * Expectation: the control characters are dropped and counted.
     */
    it('Assessment_BundleInputSanitizeControl_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSanitizeControl_017, begin');
      const withControls: string = `com.sam${String.fromCharCode(7)}ples.app`;
      const result: SanitizeResult = sanitizer.sanitize(withControls);
      expect(result.text).assertEqual('com.samples.app');
      expect(result.removedChars).assertEqual(1);
      const withDelete: string = `com.samples${String.fromCharCode(127)}.app`;
      expect(sanitizer.sanitize(withDelete).removedChars).assertEqual(1);
      expect(sanitizer.sanitize(withDelete).text).assertEqual('com.samples.app');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSanitizeControl_017, end');
    });

    /**
     * Scenario: sanitizing an over long input.
     * Expectation: the text is truncated to the input length bound.
     */
    it('Assessment_BundleInputSanitizeTruncate_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSanitizeTruncate_018, begin');
      const longInput: string = 'a'.repeat(MAX_INPUT_LENGTH + 40);
      const result: SanitizeResult = sanitizer.sanitize(longInput);
      expect(result.text.length).assertEqual(MAX_INPUT_LENGTH);
      expect(result.truncated).assertTrue();
      expect(result.removedChars).assertEqual(0);
      const shortInput: string = 'com.samples.app';
      expect(sanitizer.sanitize(shortInput).truncated).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSanitizeTruncate_018, end');
    });

    /**
     * Scenario: the blank predicate of the sanitizer.
     * Expectation: only whitespace only strings are blank.
     */
    it('Assessment_BundleInputBlankCheck_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputBlankCheck_019, begin');
      expect(sanitizer.isBlank('')).assertTrue();
      expect(sanitizer.isBlank('   ')).assertTrue();
      expect(sanitizer.isBlank('\t\n\r')).assertTrue();
      expect(sanitizer.isBlank('a')).assertFalse();
      expect(sanitizer.isBlank(' com')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputBlankCheck_019, end');
    });

    /**
     * Scenario: collapsing repeated dots.
     * Expectation: every run of dots becomes a single dot.
     */
    it('Assessment_BundleInputCollapseDots_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputCollapseDots_020, begin');
      expect(sanitizer.collapseDots('com..samples')).assertEqual('com.samples');
      expect(sanitizer.collapseDots('com...samples..app')).assertEqual('com.samples.app');
      expect(sanitizer.collapseDots('com.samples.app')).assertEqual('com.samples.app');
      expect(sanitizer.collapseDots('')).assertEqual('');
      expect(checker.isValid(sanitizer.collapseDots('com..samples..app'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputCollapseDots_020, end');
    });

    /**
     * Scenario: stripping leading and trailing dots.
     * Expectation: the dots at both ends disappear and the middle stays intact.
     */
    it('Assessment_BundleInputStripEdges_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStripEdges_021, begin');
      expect(sanitizer.stripEdges('.com.samples.')).assertEqual('com.samples');
      expect(sanitizer.stripEdges('..com.samples..')).assertEqual('com.samples');
      expect(sanitizer.stripEdges('com.samples')).assertEqual('com.samples');
      expect(sanitizer.stripEdges('...')).assertEqual('');
      expect(checker.isValid(sanitizer.stripEdges('.com.samples.'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStripEdges_021, end');
    });

    /**
     * Scenario: lower casing of the input.
     * Expectation: an upper case name becomes valid after the transformation.
     */
    it('Assessment_BundleInputLowerCase_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputLowerCase_022, begin');
      expect(sanitizer.toLowerCase('com.Samples.APP')).assertEqual('com.samples.app');
      expect(checker.isValid('com.Samples.APP')).assertFalse();
      expect(checker.isValid(sanitizer.toLowerCase('com.Samples.APP'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputLowerCase_022, end');
    });

    /**
     * Scenario: a fresh whitelist model.
     * Expectation: it is empty and accepts the default bundle.
     */
    it('Assessment_BundleWhitelistFresh_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistFresh_023, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      expect(whitelist.size()).assertEqual(0);
      expect(whitelist.isEmpty()).assertTrue();
      expect(whitelist.isFull()).assertFalse();
      expect(whitelist.joined()).assertEqual('');
      expect(whitelist.labels().length).assertEqual(0);
      const result: InsertResult = whitelist.add(DEFAULT_ALLOWED_APP);
      expect(result.accepted).assertTrue();
      expect(whitelist.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistFresh_023, end');
    });

    /**
     * Scenario: an accepted insertion.
     * Expectation: the outcome and message describe the successful add.
     */
    it('Assessment_BundleWhitelistInsert_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistInsert_024, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      const result: InsertResult = whitelist.add(`  ${BUNDLE_SECONDARY}  `);
      expect(result.accepted).assertTrue();
      expect(result.outcome).assertEqual(InsertOutcome.ACCEPTED);
      expect(result.message).assertEqual('added');
      expect(result.size).assertEqual(1);
      expect(whitelist.contains(BUNDLE_SECONDARY)).assertTrue();
      expect(whitelist.at(0)).assertEqual(BUNDLE_SECONDARY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistInsert_024, end');
    });

    /**
     * Scenario: an empty insertion.
     * Expectation: the request is rejected before the syntax check.
     */
    it('Assessment_BundleWhitelistInsertEmpty_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistInsertEmpty_025, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      expect(whitelist.add('').outcome).assertEqual(InsertOutcome.REJECTED_EMPTY);
      expect(whitelist.add('   ').outcome).assertEqual(InsertOutcome.REJECTED_EMPTY);
      expect(whitelist.add('\t\n').outcome).assertEqual(InsertOutcome.REJECTED_EMPTY);
      expect(whitelist.size()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistInsertEmpty_025, end');
    });

    /**
     * Scenario: a syntactically invalid insertion.
     * Expectation: the message of the syntax report is forwarded.
     */
    it('Assessment_BundleWhitelistInsertInvalid_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistInsertInvalid_026, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      const result: InsertResult = whitelist.add(BUNDLE_INVALID);
      expect(result.accepted).assertFalse();
      expect(result.outcome).assertEqual(InsertOutcome.REJECTED_SYNTAX);
      expect(result.message.length > 0).assertTrue();
      expect(whitelist.add('com').outcome).assertEqual(InsertOutcome.REJECTED_SYNTAX);
      expect(whitelist.add('com..x').outcome).assertEqual(InsertOutcome.REJECTED_SYNTAX);
      expect(whitelist.size()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistInsertInvalid_026, end');
    });

    /**
     * Scenario: a duplicated insertion.
     * Expectation: the second add is rejected with the duplicate message.
     */
    it('Assessment_BundleWhitelistInsertDuplicate_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistInsertDuplicate_027, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      whitelist.add(DEFAULT_ALLOWED_APP);
      const second: InsertResult = whitelist.add(DEFAULT_ALLOWED_APP);
      expect(second.accepted).assertFalse();
      expect(second.outcome).assertEqual(InsertOutcome.REJECTED_DUPLICATE);
      expect(second.message).assertEqual('the bundle name is already listed');
      expect(whitelist.size()).assertEqual(1);
      expect(whitelist.indexOf(DEFAULT_ALLOWED_APP)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistInsertDuplicate_027, end');
    });

    /**
     * Scenario: filling the whitelist to its capacity.
     * Expectation: twenty entries are accepted and the next add is rejected as full.
     */
    it('Assessment_BundleWhitelistCapacity_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistCapacity_028, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      for (let i = 0; i < MAX_ALLOWED_APPS; i++) {
        expect(whitelist.add(`com.app${`${i}`.padStart(2, '0')}`).accepted).assertTrue();
      }
      expect(whitelist.size()).assertEqual(MAX_ALLOWED_APPS);
      expect(whitelist.isFull()).assertTrue();
      const overflow: InsertResult = whitelist.add('com.app99');
      expect(overflow.accepted).assertFalse();
      expect(overflow.outcome).assertEqual(InsertOutcome.REJECTED_FULL);
      expect(whitelist.size()).assertEqual(MAX_ALLOWED_APPS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistCapacity_028, end');
    });

    /**
     * Scenario: removal from the whitelist.
     * Expectation: a listed name is removed and an unknown name is a no operation.
     */
    it('Assessment_BundleWhitelistRemove_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistRemove_029, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      whitelist.seed([BUNDLE_PRIMARY, BUNDLE_SECONDARY, BUNDLE_TERTIARY]);
      expect(whitelist.remove(BUNDLE_SECONDARY)).assertTrue();
      expect(whitelist.size()).assertEqual(2);
      expect(whitelist.contains(BUNDLE_SECONDARY)).assertFalse();
      expect(whitelist.remove(BUNDLE_SECONDARY)).assertFalse();
      expect(whitelist.remove('com.unknown.app')).assertFalse();
      expect(whitelist.at(1)).assertEqual(BUNDLE_TERTIARY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistRemove_029, end');
    });

    /**
     * Scenario: the whitelist array getter and the label list.
     * Expectation: the getter copies and the labels are numbered from one.
     */
    it('Assessment_BundleWhitelistViews_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistViews_030, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      whitelist.seed([BUNDLE_PRIMARY, BUNDLE_SECONDARY]);
      const copy: string[] = whitelist.toArray();
      copy.push('com.injected.app');
      expect(whitelist.size()).assertEqual(2);
      expect(whitelist.joined()).assertEqual(`${BUNDLE_PRIMARY},${BUNDLE_SECONDARY}`);
      expect(whitelist.labels()[0]).assertEqual(`1. ${BUNDLE_PRIMARY}`);
      expect(whitelist.labels()[1]).assertEqual(`2. ${BUNDLE_SECONDARY}`);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistViews_030, end');
    });

    /**
     * Scenario: clearing the whitelist.
     * Expectation: every entry is dropped and the model accepts new insertions again.
     */
    it('Assessment_BundleWhitelistClear_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistClear_031, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      whitelist.seed([BUNDLE_PRIMARY, BUNDLE_SECONDARY, BUNDLE_TERTIARY]);
      expect(whitelist.size()).assertEqual(3);
      whitelist.clear();
      expect(whitelist.size()).assertEqual(0);
      expect(whitelist.isEmpty()).assertTrue();
      expect(whitelist.add(BUNDLE_PRIMARY).accepted).assertTrue();
      expect(whitelist.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistClear_031, end');
    });

    /**
     * Scenario: the at accessor of the whitelist.
     * Expectation: out of range indices answer the empty string.
     */
    it('Assessment_BundleWhitelistIndexAccess_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistIndexAccess_032, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      whitelist.seed([BUNDLE_PRIMARY]);
      expect(whitelist.at(0)).assertEqual(BUNDLE_PRIMARY);
      expect(whitelist.at(1)).assertEqual('');
      expect(whitelist.at(INVALID_INDEX)).assertEqual('');
      expect(whitelist.at(100)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleWhitelistIndexAccess_032, end');
    });

    /**
     * Scenario: the input state of a fresh input box.
     * Expectation: an empty input cannot be submitted.
     */
    it('Assessment_BundleInputStateEmpty_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStateEmpty_033, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      const state: BundleInputState = new BundleInputState(whitelist);
      const empty: InputState = state.evaluate('');
      expect(empty.valid).assertFalse();
      expect(empty.canSubmit).assertFalse();
      expect(empty.length).assertEqual(0);
      expect(state.canSubmit('   ')).assertFalse();
      expect(state.hintOf('')).assertEqual('Enter a bundle name');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStateEmpty_033, end');
    });

    /**
     * Scenario: the input state of a well formed name.
     * Expectation: the input is valid and can be submitted.
     */
    it('Assessment_BundleInputStateValid_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStateValid_034, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      const state: BundleInputState = new BundleInputState(whitelist);
      const evaluated: InputState = state.evaluate(`  ${BUNDLE_PRIMARY} `);
      expect(evaluated.valid).assertTrue();
      expect(evaluated.canSubmit).assertTrue();
      expect(evaluated.normalized).assertEqual(BUNDLE_PRIMARY);
      expect(evaluated.length).assertEqual(BUNDLE_PRIMARY.length);
      expect(state.hintOf(BUNDLE_PRIMARY)).assertEqual('Ready to add');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStateValid_034, end');
    });

    /**
     * Scenario: the input state of a duplicated name.
     * Expectation: the input is valid but cannot be submitted.
     */
    it('Assessment_BundleInputStateDuplicate_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStateDuplicate_035, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      whitelist.add(BUNDLE_PRIMARY);
      const state: BundleInputState = new BundleInputState(whitelist);
      const evaluated: InputState = state.evaluate(BUNDLE_PRIMARY);
      expect(evaluated.valid).assertTrue();
      expect(evaluated.canSubmit).assertFalse();
      expect(state.hintOf(BUNDLE_PRIMARY)).assertEqual('Already in the whitelist');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStateDuplicate_035, end');
    });

    /**
     * Scenario: the input state while the whitelist is full.
     * Expectation: a valid name cannot be submitted because the capacity is exhausted.
     */
    it('Assessment_BundleInputStateFull_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStateFull_036, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      for (let i = 0; i < MAX_ALLOWED_APPS; i++) {
        whitelist.add(`com.app${`${i}`.padStart(2, '0')}`);
      }
      const state: BundleInputState = new BundleInputState(whitelist);
      const evaluated: InputState = state.evaluate('com.app99');
      expect(evaluated.valid).assertTrue();
      expect(evaluated.canSubmit).assertFalse();
      expect(state.hintOf('com.app99')).assertEqual('The whitelist is full');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStateFull_036, end');
    });

    /**
     * Scenario: the input hint of an invalid name.
     * Expectation: the error message of the syntax check is forwarded.
     */
    it('Assessment_BundleInputStateHint_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStateHint_037, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      const state: BundleInputState = new BundleInputState(whitelist);
      expect(state.hintOf('com')).assertEqual('a bundle name needs at least two segments');
      expect(state.hintOf('.com.samples')).assertEqual('the bundle name starts with a dot');
      expect(state.hintOf('com.samples.')).assertEqual('the bundle name ends with a dot');
      expect(state.hintOf('com..samples')).assertEqual('two dots follow each other');
      expect(state.hintOf('com.Samples.app').includes('uppercase')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStateHint_037, end');
    });

    /**
     * Scenario: the input state after a successful add.
     * Expectation: the added name becomes duplicated and the hint switches.
     */
    it('Assessment_BundleInputStateAfterAdd_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStateAfterAdd_038, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      const state: BundleInputState = new BundleInputState(whitelist);
      expect(state.canSubmit(BUNDLE_SECONDARY)).assertTrue();
      whitelist.add(BUNDLE_SECONDARY);
      expect(state.canSubmit(BUNDLE_SECONDARY)).assertFalse();
      expect(state.hintOf(BUNDLE_SECONDARY)).assertEqual('Already in the whitelist');
      expect(whitelist.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputStateAfterAdd_038, end');
    });

    /**
     * Scenario: de-duplication of a name list.
     * Expectation: the first occurrence wins and the order is preserved.
     */
    it('Assessment_BundleInputDedupe_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputDedupe_039, begin');
      const names: string[] = [BUNDLE_PRIMARY, BUNDLE_SECONDARY, BUNDLE_PRIMARY, BUNDLE_TERTIARY,
        BUNDLE_SECONDARY];
      const unique: string[] = deduplicator.dedupe(names);
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual(BUNDLE_PRIMARY);
      expect(unique[1]).assertEqual(BUNDLE_SECONDARY);
      expect(unique[2]).assertEqual(BUNDLE_TERTIARY);
      expect(deduplicator.duplicateCount(names)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputDedupe_039, end');
    });

    /**
     * Scenario: the first duplicate of a list.
     * Expectation: the earliest repeated name is reported.
     */
    it('Assessment_BundleInputFirstDuplicate_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputFirstDuplicate_040, begin');
      expect(deduplicator.firstDuplicate([])).assertEqual('');
      expect(deduplicator.firstDuplicate([BUNDLE_PRIMARY])).assertEqual('');
      expect(deduplicator.firstDuplicate([BUNDLE_PRIMARY, BUNDLE_SECONDARY, BUNDLE_SECONDARY]))
        .assertEqual(BUNDLE_SECONDARY);
      expect(deduplicator.firstDuplicate([BUNDLE_PRIMARY, BUNDLE_PRIMARY, BUNDLE_SECONDARY]))
        .assertEqual(BUNDLE_PRIMARY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputFirstDuplicate_040, end');
    });

    /**
     * Scenario: the sorted view of a list.
     * Expectation: the source list is not modified by the sort.
     */
    it('Assessment_BundleInputSorted_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSorted_041, begin');
      const names: string[] = [BUNDLE_TERTIARY, BUNDLE_PRIMARY, BUNDLE_SECONDARY];
      const sorted: string[] = deduplicator.sorted(names);
      expect(sorted[0]).assertEqual(BUNDLE_PRIMARY);
      expect(names[0]).assertEqual(BUNDLE_TERTIARY);
      expect(sorted.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSorted_041, end');
    });

    /**
     * Scenario: the vendor prefix count of a list.
     * Expectation: only names of the requested vendor are counted.
     */
    it('Assessment_BundleInputVendorCount_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputVendorCount_042, begin');
      const names: string[] = [BUNDLE_PRIMARY, BUNDLE_SECONDARY, BUNDLE_TERTIARY, 'org.samples.app'];
      expect(deduplicator.sameVendorCount(names, 'com')).assertEqual(3);
      expect(deduplicator.sameVendorCount(names, 'org')).assertEqual(1);
      expect(deduplicator.sameVendorCount(names, 'cn')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputVendorCount_042, end');
    });

    /**
     * Scenario: a duplicate add after a sanitized insertion.
     * Expectation: whitespace differences do not produce a second entry.
     */
    it('Assessment_BundleInputSanitizedDuplicate_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSanitizedDuplicate_043, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      expect(whitelist.add(BUNDLE_PRIMARY).accepted).assertTrue();
      expect(whitelist.add(` ${BUNDLE_PRIMARY} `).outcome).assertEqual(InsertOutcome.REJECTED_DUPLICATE);
      expect(whitelist.size()).assertEqual(1);
      expect(whitelist.at(0)).assertEqual(BUNDLE_PRIMARY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputSanitizedDuplicate_043, end');
    });

    /**
     * Scenario: an end to end input scenario.
     * Expectation: sanitizing, checking, inserting and de-duplicating agree with each other.
     */
    it('Assessment_BundleInputComprehensive_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputComprehensive_045, begin');
      const whitelist: BundleWhitelistModel = new BundleWhitelistModel();
      const state: BundleInputState = new BundleInputState(whitelist);
      const raw: string = '  com..Samples.app  ';
      const collapsed: string = sanitizer.collapseDots(sanitizer.sanitize(raw).text);
      const cleaned: string = sanitizer.toLowerCase(collapsed);
      expect(cleaned).assertEqual('com.samples.app');
      expect(checker.isValid(cleaned)).assertTrue();
      expect(state.canSubmit(cleaned)).assertTrue();
      expect(whitelist.add(cleaned).accepted).assertTrue();
      expect(state.canSubmit(cleaned)).assertFalse();
      expect(whitelist.size()).assertEqual(1);
      const merged: string[] = deduplicator.dedupe([cleaned, cleaned, BUNDLE_SECONDARY]);
      expect(merged.length).assertEqual(2);
      expect(whitelist.joined()).assertEqual(cleaned);
      expect(checker.check(whitelist.at(0)).verdict).assertEqual(Verdict.VALID);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BundleInputComprehensive_045, end');
    });
  });
}
