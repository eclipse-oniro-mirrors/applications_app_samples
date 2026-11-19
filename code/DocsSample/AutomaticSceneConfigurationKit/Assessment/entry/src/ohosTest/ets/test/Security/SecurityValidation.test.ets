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
  KEY_BACK,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  waitForIndexPage,
  addAllowedApp,
  allowedAppRowCount,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Input limits of the bundle name field.
const MAX_BUNDLE_LENGTH: number = 128;
const MAX_ALLOWED_APPS: number = 20;
const MIN_BUNDLE_SEGMENTS: number = 2;
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';

// Maximum length of a log line that the sample writes, it bounds the local log growth.
const MAX_LOG_LINE_LENGTH: number = 512;

// Number of fuzz rounds used by the sanitisation cases.
const FUZZ_ROUNDS: number = 200;

/**
 * Kind of the payload that the sanitizer rejects.
 */
enum PayloadKind {
  CLEAN = 'clean',
  EMPTY = 'empty',
  WHITESPACE = 'whitespace',
  SEPARATOR = 'separator',
  INJECTION = 'injection',
  CONTROL_CHAR = 'control_char',
  OVERFLOW = 'overflow',
  ENCODED = 'encoded'
}

/**
 * Result of a sanitisation call.
 */
interface SanitiseResult {
  accepted: boolean;
  value: string;
  kind: PayloadKind;
  reason: string;
}

/**
 * One named probe of the sanitizer.
 */
interface PayloadProbe {
  label: string;
  payload: string;
  expectedKind: PayloadKind;
}

/**
 * Sanitiser of the bundle name input of the entry page.
 *
 * The field accepts a bundle name only. The sanitiser removes the surrounding whitespace,
 * rejects the control characters, the path separators, the shell metas and the encoded forms,
 * and enforces the length bound. A rejected payload never reaches the whitelist.
 */
class BundleNameSanitiser {
  private accepted: number = 0;
  private rejected: number = 0;
  private rejectedKinds: Map<string, number> = new Map<string, number>();

  public sanitise(input: string): SanitiseResult {
    const trimmed: string = input.trim();
    if (trimmed.length === 0) {
      return this.reject(PayloadKind.EMPTY, 'the bundle name is empty');
    }
    if (input.length !== trimmed.length) {
      return this.reject(PayloadKind.WHITESPACE, 'the bundle name carries surrounding whitespace');
    }
    if (trimmed.length > MAX_BUNDLE_LENGTH) {
      return this.reject(PayloadKind.OVERFLOW, 'the bundle name exceeds the length bound');
    }
    if (this.hasControlCharacter(trimmed)) {
      return this.reject(PayloadKind.CONTROL_CHAR, 'the bundle name carries a control character');
    }
    if (this.hasSeparator(trimmed)) {
      return this.reject(PayloadKind.SEPARATOR, 'the bundle name carries a path separator');
    }
    if (this.hasEncodedForm(trimmed)) {
      return this.reject(PayloadKind.ENCODED, 'the bundle name carries an encoded character');
    }
    if (this.hasInjection(trimmed)) {
      return this.reject(PayloadKind.INJECTION, 'the bundle name carries a shell metacharacter');
    }
    const segments: string[] = trimmed.split('.');
    if (segments.length < MIN_BUNDLE_SEGMENTS) {
      return this.reject(PayloadKind.SEPARATOR, 'the bundle name has one segment only');
    }
    for (let i = 0; i < segments.length; i++) {
      if (segments[i].length === 0) {
        return this.reject(PayloadKind.SEPARATOR, 'the bundle name has an empty segment');
      }
      if (!this.isSegmentValid(segments[i])) {
        return this.reject(PayloadKind.INJECTION, 'a segment carries an invalid character');
      }
      const first: number = segments[i].charCodeAt(0);
      if (first >= 48 && first <= 57) {
        return this.reject(PayloadKind.INJECTION, 'a segment starts with a digit');
      }
    }
    this.accepted++;
    return {
      accepted: true,
      value: trimmed,
      kind: PayloadKind.CLEAN,
      reason: 'the bundle name is accepted'
    };
  }

  private reject(kind: PayloadKind, reason: string): SanitiseResult {
    this.rejected++;
    const key: string = kind;
    const current: number = this.rejectedKinds.get(key) ?? 0;
    this.rejectedKinds.set(key, current + 1);
    return {
      accepted: false,
      value: '',
      kind: kind,
      reason: reason
    };
  }

  private isSegmentValid(segment: string): boolean {
    for (let i = 0; i < segment.length; i++) {
      const code: number = segment.charCodeAt(i);
      const digit: boolean = code >= 48 && code <= 57;
      const upper: boolean = code >= 65 && code <= 90;
      const lower: boolean = code >= 97 && code <= 122;
      const underscore: boolean = code === 95;
      if (!digit && !upper && !lower && !underscore) {
        return false;
      }
    }
    return true;
  }

  private hasControlCharacter(value: string): boolean {
    for (let i = 0; i < value.length; i++) {
      const code: number = value.charCodeAt(i);
      if (code < 32 || code === 127) {
        return true;
      }
    }
    return false;
  }

  private hasSeparator(value: string): boolean {
    if (value.indexOf('/') >= 0 || value.indexOf('\\') >= 0) {
      return true;
    }
    return false;
  }

  private hasInjection(value: string): boolean {
    const metas: string[] = [';', '|', '&', '$', '`', '<', '>', '(', ')', '\'', '"', ' ', '\t',
      '?', '*', '!', '#', '%', ':', '@', '='];
    for (let i = 0; i < metas.length; i++) {
      if (value.indexOf(metas[i]) >= 0) {
        return true;
      }
    }
    return false;
  }

  private hasEncodedForm(value: string): boolean {
    return value.indexOf('%2e') >= 0 || value.indexOf('%2E') >= 0 || value.indexOf('%00') >= 0 ||
      value.indexOf('%2f') >= 0;
  }

  public getAccepted(): number {
    return this.accepted;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public countOf(kind: PayloadKind): number {
    return this.rejectedKinds.get(kind) ?? 0;
  }

  public reset(): void {
    this.accepted = 0;
    this.rejected = 0;
    this.rejectedKinds = new Map<string, number>();
  }

  public describe(): string {
    return `BundleNameSanitiser{accepted=${this.accepted}, rejected=${this.rejected}}`;
  }
}

/**
 * Model of the whitelist that receives the sanitised values.
 *
 * The model is intentionally small: the point of the file is that a payload the sanitiser
 * rejects never reaches the list, and a payload that it accepts is stored verbatim.
 */
class SafeWhitelist {
  private entries: string[] = [];
  private sanitiser: BundleNameSanitiser;
  private refusedBySanitiser: number = 0;
  private refusedFull: number = 0;

  constructor(sanitiser: BundleNameSanitiser) {
    this.sanitiser = sanitiser;
  }

  public add(payload: string): SanitiseResult {
    const result: SanitiseResult = this.sanitiser.sanitise(payload);
    if (!result.accepted) {
      this.refusedBySanitiser++;
      return result;
    }
    if (this.entries.length >= MAX_ALLOWED_APPS) {
      this.refusedFull++;
      return {
        accepted: false,
        value: '',
        kind: PayloadKind.OVERFLOW,
        reason: 'the whitelist is full'
      };
    }
    if (this.entries.indexOf(result.value) >= 0) {
      return {
        accepted: false,
        value: result.value,
        kind: PayloadKind.CLEAN,
        reason: 'the bundle name is already in the whitelist'
      };
    }
    this.entries.push(result.value);
    return result;
  }

  public getEntries(): string[] {
    return this.entries.slice();
  }

  public size(): number {
    return this.entries.length;
  }

  public contains(value: string): boolean {
    return this.entries.indexOf(value) >= 0;
  }

  public getRefusedBySanitiser(): number {
    return this.refusedBySanitiser;
  }

  public getRefusedFull(): number {
    return this.refusedFull;
  }

  public everyEntryClean(sanitiser: BundleNameSanitiser): boolean {
    for (let i = 0; i < this.entries.length; i++) {
      if (!sanitiser.sanitise(this.entries[i]).accepted) {
        return false;
      }
    }
    return true;
  }

  public describe(): string {
    return `SafeWhitelist{entries=${this.entries.length}, refused=${this.refusedBySanitiser}}`;
  }
}

/**
 * Redactor of the log lines of the sample.
 *
 * AssessmentController appends `type code=N message=M` to its event log. The message of the
 * service may carry internals, so the redactor strips the bundle names, the paths and the line
 * numbers before the line reaches the status card and the hilog sink.
 */
class LogRedactor {
  private redactions: number = 0;

  public redact(line: string): string {
    let result: string = line;
    result = this.stripBundleNames(result);
    result = this.stripPaths(result);
    result = this.stripLineNumbers(result);
    return result;
  }

  private stripBundleNames(line: string): string {
    let result: string = line;
    let index: number = result.indexOf('com.');
    while (index >= 0) {
      let end: number = index;
      while (end < result.length) {
        const code: number = result.charCodeAt(end);
        const letter: boolean = (code >= 65 && code <= 90) || (code >= 97 && code <= 122);
        const digit: boolean = code >= 48 && code <= 57;
        const dot: boolean = code === 46;
        const underscore: boolean = code === 95;
        if (!letter && !digit && !dot && !underscore) {
          break;
        }
        end++;
      }
      result = result.slice(0, index) + '[bundle]' + result.slice(end);
      this.redactions++;
      index = result.indexOf('com.', index + '[bundle]'.length);
    }
    return result;
  }

  private stripPaths(line: string): string {
    let result: string = line;
    let index: number = result.indexOf('/data/');
    while (index >= 0) {
      let end: number = index;
      while (end < result.length) {
        const code: number = result.charCodeAt(end);
        if (code === 32 || code === 44 || code === 59) {
          break;
        }
        end++;
      }
      result = result.slice(0, index) + '[path]' + result.slice(end);
      this.redactions++;
      index = result.indexOf('/data/', index + '[path]'.length);
    }
    return result;
  }

  private stripLineNumbers(line: string): string {
    let result: string = line;
    let index: number = result.indexOf('.ets:');
    while (index >= 0) {
      let end: number = index + '.ets:'.length;
      while (end < result.length) {
        const code: number = result.charCodeAt(end);
        if (code < 48 || code > 57) {
          break;
        }
        end++;
      }
      result = result.slice(0, index) + '[frame]' + result.slice(end);
      this.redactions++;
      index = result.indexOf('.ets:', index + '[frame]'.length);
    }
    return result;
  }

  public isRedacted(line: string): boolean {
    return line.indexOf('com.') < 0 && line.indexOf('/data/') < 0 && line.indexOf('.ets:') < 0;
  }

  public truncate(line: string): string {
    if (line.length <= MAX_LOG_LINE_LENGTH) {
      return line;
    }
    return line.slice(0, MAX_LOG_LINE_LENGTH);
  }

  public getRedactions(): number {
    return this.redactions;
  }

  public reset(): void {
    this.redactions = 0;
  }

  public describe(): string {
    return `LogRedactor{redactions=${this.redactions}}`;
  }
}

/**
 * Guards the length of the input against the overflow of the field.
 *
 * The bundle name field of the entry page has no explicit maxLength, so the guard has to bound
 * the value itself. The guard rejects an over long value and reports the shortfall so the user
 * knows how many characters to remove.
 */
class LengthGuard {
  private limit: number;

  constructor(limit: number = MAX_BUNDLE_LENGTH) {
    this.limit = limit;
  }

  public isWithinLimit(value: string): boolean {
    return value.length <= this.limit;
  }

  public excess(value: string): number {
    if (value.length <= this.limit) {
      return 0;
    }
    return value.length - this.limit;
  }

  public clamp(value: string): string {
    if (value.length <= this.limit) {
      return value;
    }
    return value.slice(0, this.limit);
  }

  public getLimit(): number {
    return this.limit;
  }
}

/**
 * Builds a long text of a given length.
 *
 * @param length number of characters.
 * @param character character that the text is made of.
 * @returns the text.
 */
function buildText(length: number, character: string): string {
  let text: string = '';
  for (let i = 0; i < length; i++) {
    text += character;
  }
  return text;
}

/**
 * Builds the standard probe table of the sanitiser.
 *
 * @returns the probes with the payload kind that each of them must trigger.
 */
function buildProbes(): PayloadProbe[] {
  return [
    { label: 'clean name', payload: 'com.samples.reader', expectedKind: PayloadKind.CLEAN },
    { label: 'clean name with underscore', payload: 'com.samples.app_1', expectedKind: PayloadKind.CLEAN },
    { label: 'empty', payload: '', expectedKind: PayloadKind.EMPTY },
    { label: 'blank', payload: '   ', expectedKind: PayloadKind.EMPTY },
    { label: 'single segment', payload: 'assessment', expectedKind: PayloadKind.SEPARATOR },
    { label: 'trailing dot', payload: 'com.samples.', expectedKind: PayloadKind.SEPARATOR },
    { label: 'double dot', payload: 'com..reader', expectedKind: PayloadKind.SEPARATOR },
    { label: 'path separator', payload: 'com/samples/reader', expectedKind: PayloadKind.SEPARATOR },
    { label: 'backslash', payload: 'com\\samples\\reader', expectedKind: PayloadKind.SEPARATOR },    { label: 'semicolon', payload: 'com.samples.reader;rm', expectedKind: PayloadKind.INJECTION },
    { label: 'pipe', payload: 'com.samples.reader|cat', expectedKind: PayloadKind.INJECTION },
    { label: 'dollar', payload: 'com.samples.$HOME', expectedKind: PayloadKind.INJECTION },
    { label: 'backtick', payload: 'com.samples.`id`', expectedKind: PayloadKind.INJECTION },
    { label: 'quote', payload: 'com.samples.\'reader\'', expectedKind: PayloadKind.INJECTION },
    { label: 'space', payload: 'com.samples.reader app', expectedKind: PayloadKind.INJECTION },
    { label: 'null byte', payload: 'com.samples.\u0000reader', expectedKind: PayloadKind.CONTROL_CHAR },
    { label: 'tab', payload: 'com.samples.\treader', expectedKind: PayloadKind.CONTROL_CHAR },
    { label: 'encoded dot', payload: 'com%2esamples', expectedKind: PayloadKind.ENCODED },
    { label: 'encoded slash', payload: 'com%2fsamples', expectedKind: PayloadKind.ENCODED },
    { label: 'overflow', payload: buildText(MAX_BUNDLE_LENGTH + 1, 'a'), expectedKind: PayloadKind.OVERFLOW }
  ];
}

export default function securityValidationTest() {
  describe('SecurityValidation_Test', () => {
    let driver: Driver;
    let sanitiser: BundleNameSanitiser;
    let redactor: LogRedactor;
    let lengthGuard: LengthGuard;

    beforeAll(async () => {
      driver = getDriver();
      sanitiser = new BundleNameSanitiser();
      redactor = new LogRedactor();
      lengthGuard = new LengthGuard();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the payload kind enumeration used by the sanitiser.
     * Expectation: the eight documented kinds keep their literal values.
     */
    it('Assessment_SanitiserKinds_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserKinds_001, begin');
      expect(PayloadKind.CLEAN).assertEqual('clean');
      expect(PayloadKind.EMPTY).assertEqual('empty');
      expect(PayloadKind.WHITESPACE).assertEqual('whitespace');
      expect(PayloadKind.SEPARATOR).assertEqual('separator');
      expect(PayloadKind.INJECTION).assertEqual('injection');
      expect(PayloadKind.CONTROL_CHAR).assertEqual('control_char');
      expect(PayloadKind.OVERFLOW).assertEqual('overflow');
      expect(PayloadKind.ENCODED).assertEqual('encoded');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserKinds_001, end');
    });

    /**
     * Scenario: a clean bundle name passes the sanitiser unchanged.
     * Expectation: the value is accepted, the result carries the trimmed value and the counters
     * move once.
     */
    it('Assessment_SanitiserAcceptsCleanName_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserAcceptsCleanName_002, begin');
      sanitiser.reset();
      const result: SanitiseResult = sanitiser.sanitise('com.samples.reader');
      expect(result.accepted).assertTrue();
      expect(result.value).assertEqual('com.samples.reader');
      expect(result.kind).assertEqual(PayloadKind.CLEAN);
      expect(sanitiser.getAccepted()).assertEqual(1);
      expect(sanitiser.getRejected()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', sanitiser.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserAcceptsCleanName_002, end');
    });

    /**
     * Scenario: an empty and a blank payload.
     * Expectation: both are reported as empty, the value of the result stays empty and the
     * rejection counter moves twice.
     */
    it('Assessment_SanitiserRejectsEmpty_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsEmpty_003, begin');
      sanitiser.reset();
      expect(sanitiser.sanitise('').accepted).assertFalse();
      expect(sanitiser.sanitise('   ').accepted).assertFalse();
      expect(sanitiser.sanitise('').kind).assertEqual(PayloadKind.EMPTY);
      expect(sanitiser.sanitise('   ').kind).assertEqual(PayloadKind.EMPTY);
      expect(sanitiser.getRejected()).assertEqual(4);
      expect(sanitiser.countOf(PayloadKind.EMPTY)).assertEqual(4);
      expect(sanitiser.sanitise('   ').value).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsEmpty_003, end');
    });

    /**
     * Scenario: a payload that carries a shell metacharacter.
     * Expectation: a semicolon, a pipe, a dollar sign and a backtick are all reported as an
     * injection attempt.
     */
    it('Assessment_SanitiserRejectsInjection_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsInjection_004, begin');
      sanitiser.reset();
      const payloads: string[] = [
        'com.samples.reader;rm',
        'com.samples.reader|cat',
        'com.samples.$HOME',
        'com.samples.`id`',
        'com.samples.reader app'
      ];
      for (let i = 0; i < payloads.length; i++) {
        const result: SanitiseResult = sanitiser.sanitise(payloads[i]);
        expect(result.accepted).assertFalse();
        expect(result.kind).assertEqual(PayloadKind.INJECTION);
      }
      expect(sanitiser.getRejected()).assertEqual(5);
      expect(sanitiser.countOf(PayloadKind.INJECTION)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsInjection_004, end');
    });

    /**
     * Scenario: a payload that carries a path separator.
     * Expectation: a slash and a backslash are rejected, so no path can be stored as a bundle
     * name.
     */
    it('Assessment_SanitiserRejectsPathSeparator_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsPathSeparator_005, begin');
      sanitiser.reset();
      const slash: SanitiseResult = sanitiser.sanitise('com/samples/reader');
      expect(slash.accepted).assertFalse();
      expect(slash.kind).assertEqual(PayloadKind.SEPARATOR);
      const backslash: SanitiseResult = sanitiser.sanitise('com\\samples\\reader');
      expect(backslash.accepted).assertFalse();
      expect(backslash.kind).assertEqual(PayloadKind.SEPARATOR);
      expect(sanitiser.countOf(PayloadKind.SEPARATOR)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsPathSeparator_005, end');
    });

    /**
     * Scenario: a payload that carries a control character.
     * Expectation: a null byte and a tab are reported as control characters.
     */
    it('Assessment_SanitiserRejectsControlCharacter_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsControlCharacter_006, begin');
      sanitiser.reset();
      const nullByte: SanitiseResult = sanitiser.sanitise('com.samples.\u0000reader');
      expect(nullByte.accepted).assertFalse();
      expect(nullByte.kind).assertEqual(PayloadKind.CONTROL_CHAR);
      const tab: SanitiseResult = sanitiser.sanitise('com.samples.\treader');
      expect(tab.accepted).assertFalse();
      expect(tab.kind).assertEqual(PayloadKind.CONTROL_CHAR);
      expect(sanitiser.getRejected()).assertEqual(2);
      expect(sanitiser.countOf(PayloadKind.CONTROL_CHAR)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsControlCharacter_006, end');
    });

    /**
     * Scenario: a payload with an encoded dot or slash.
     * Expectation: the percent encoded forms are rejected as encoded input, the sanitiser never
     * decodes them.
     */
    it('Assessment_SanitiserRejectsEncodedForm_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsEncodedForm_007, begin');
      sanitiser.reset();
      const dot: SanitiseResult = sanitiser.sanitise('com%2esamples');
      expect(dot.accepted).assertFalse();
      expect(dot.kind).assertEqual(PayloadKind.ENCODED);
      const slash: SanitiseResult = sanitiser.sanitise('com%2fsamples');
      expect(slash.accepted).assertFalse();
      expect(slash.kind).assertEqual(PayloadKind.ENCODED);
      const upper: SanitiseResult = sanitiser.sanitise('com%2Esamples');
      expect(upper.accepted).assertFalse();
      expect(sanitiser.countOf(PayloadKind.ENCODED)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsEncodedForm_007, end');
    });

    /**
     * Scenario: a payload longer than the length bound.
     * Expectation: the over long value is rejected with the overflow kind and the excess is
     * reported by the guard.
     */
    it('Assessment_SanitiserRejectsOverflow_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsOverflow_008, begin');
      sanitiser.reset();
      const payload: string = buildText(MAX_BUNDLE_LENGTH + 10, 'a');
      const result: SanitiseResult = sanitiser.sanitise(payload);
      expect(result.accepted).assertFalse();
      expect(result.kind).assertEqual(PayloadKind.OVERFLOW);
      expect(result.reason).assertContain('length');
      expect(lengthGuard.excess(payload)).assertEqual(10);
      expect(lengthGuard.isWithinLimit(payload)).assertFalse();
      expect(lengthGuard.clamp(payload).length).assertEqual(MAX_BUNDLE_LENGTH);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsOverflow_008, end');
    });

    /**
     * Scenario: the length guard boundary.
     * Expectation: one hundred and twenty eight characters are within the bound, one hundred
     * and twenty nine are not.
     */
    it('Assessment_LengthGuardBoundary_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LengthGuardBoundary_009, begin');
      const exact: string = buildText(MAX_BUNDLE_LENGTH, 'a');
      expect(exact.length).assertEqual(128);
      expect(lengthGuard.isWithinLimit(exact)).assertTrue();
      expect(lengthGuard.excess(exact)).assertEqual(0);
      expect(lengthGuard.clamp(exact)).assertEqual(exact);
      const longer: string = buildText(MAX_BUNDLE_LENGTH + 1, 'a');
      expect(lengthGuard.isWithinLimit(longer)).assertFalse();
      expect(lengthGuard.excess(longer)).assertEqual(1);
      expect(lengthGuard.clamp(longer).length).assertEqual(128);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LengthGuardBoundary_009, end');
    });

    /**
     * Scenario: a segment that starts with a digit.
     * Expectation: the payload is rejected and the reason names the digit rule.
     */
    it('Assessment_SanitiserRejectsLeadingDigit_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsLeadingDigit_010, begin');
      sanitiser.reset();
      const result: SanitiseResult = sanitiser.sanitise('com.1sample');
      expect(result.accepted).assertFalse();
      expect(result.reason).assertContain('digit');
      expect(sanitiser.sanitise('1com.sample').accepted).assertFalse();
      expect(sanitiser.getRejected()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserRejectsLeadingDigit_010, end');
    });

    /**
     * Scenario: the sanitiser against the full probe table.
     * Expectation: every probe triggers its own payload kind and the table holds twenty probes.
     */
    it('Assessment_SanitiserProbeTable_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserProbeTable_011, begin');
      const local: BundleNameSanitiser = new BundleNameSanitiser();
      const probes: PayloadProbe[] = buildProbes();
      expect(probes.length).assertEqual(20);
      let matched: number = 0;
      for (let i = 0; i < probes.length; i++) {
        const result: SanitiseResult = local.sanitise(probes[i].payload);
        if (result.kind === probes[i].expectedKind) {
          matched++;
        } else {
          hilog.warn(DOMAIN, TAG, 'probe %{public}s produced %{public}s instead of %{public}s',
            probes[i].label, result.kind, probes[i].expectedKind);
        }
      }
      expect(matched).assertEqual(probes.length);
      expect(local.getAccepted() + local.getRejected()).assertEqual(probes.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserProbeTable_011, end');
    });

    /**
     * Scenario: a rejected payload never reaches the whitelist.
     * Expectation: the list stays empty after every rejected payload and the refusal counter
     * matches the number of attempts.
     */
    it('Assessment_RejectedPayloadNeverStored_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RejectedPayloadNeverStored_012, begin');
      const localSanitiser: BundleNameSanitiser = new BundleNameSanitiser();
      const localList: SafeWhitelist = new SafeWhitelist(localSanitiser);
      const payloads: string[] = [
        'com/samples',
        'com.samples;rm -rf /',
        'com..reader',
        'com%2esamples',
        'com.samples.\u0000reader'
      ];
      for (let i = 0; i < payloads.length; i++) {
        const result: SanitiseResult = localList.add(payloads[i]);
        expect(result.accepted).assertFalse();
      }
      expect(localList.size()).assertEqual(0);
      expect(localList.getRefusedBySanitiser()).assertEqual(payloads.length);
      hilog.info(DOMAIN, TAG, '%{public}s', localList.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RejectedPayloadNeverStored_012, end');
    });

    /**
     * Scenario: an accepted payload reaches the whitelist.
     * Expectation: the accepted value is stored and the list stays clean when re-sanitised.
     */
    it('Assessment_AcceptedPayloadStored_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AcceptedPayloadStored_013, begin');
      const localSanitiser: BundleNameSanitiser = new BundleNameSanitiser();
      const localList: SafeWhitelist = new SafeWhitelist(localSanitiser);
      const result: SanitiseResult = localList.add(DEFAULT_ALLOWED_APP);
      expect(result.accepted).assertTrue();
      expect(localList.size()).assertEqual(1);
      expect(localList.contains(DEFAULT_ALLOWED_APP)).assertTrue();
      expect(localList.everyEntryClean(localSanitiser)).assertTrue();
      expect(localList.getRefusedBySanitiser()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AcceptedPayloadStored_013, end');
    });

    /**
     * Scenario: a duplicate payload reaches the whitelist twice.
     * Expectation: the second attempt is refused and the list does not grow.
     */
    it('Assessment_DuplicatePayloadRefused_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DuplicatePayloadRefused_014, begin');
      const localSanitiser: BundleNameSanitiser = new BundleNameSanitiser();
      const localList: SafeWhitelist = new SafeWhitelist(localSanitiser);
      localList.add(DEFAULT_ALLOWED_APP);
      const second: SanitiseResult = localList.add(DEFAULT_ALLOWED_APP);
      expect(second.accepted).assertFalse();
      expect(second.reason).assertContain('already');
      expect(localList.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DuplicatePayloadRefused_014, end');
    });

    /**
     * Scenario: the whitelist cap after the sanitiser.
     * Expectation: twenty accepted names fill the list, the twenty first is refused with the
     * overflow reason.
     */
    it('Assessment_WhitelistCapAfterSanitiser_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistCapAfterSanitiser_015, begin');
      const localSanitiser: BundleNameSanitiser = new BundleNameSanitiser();
      const localList: SafeWhitelist = new SafeWhitelist(localSanitiser);
      for (let i = 0; i < MAX_ALLOWED_APPS; i++) {
        localList.add(`com.samples.app${i}`);
      }
      expect(localList.size()).assertEqual(MAX_ALLOWED_APPS);
      const overflow: SanitiseResult = localList.add('com.samples.extra');
      expect(overflow.accepted).assertFalse();
      expect(overflow.reason).assertContain('full');
      expect(localList.getRefusedFull()).assertEqual(1);
      expect(localList.size()).assertEqual(MAX_ALLOWED_APPS);
      hilog.info(DOMAIN, TAG, '%{public}s', localList.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistCapAfterSanitiser_015, end');
    });

    /**
     * Scenario: the log redactor on a line that carries a bundle name.
     * Expectation: the bundle name is replaced by a placeholder and the rest of the line is kept.
     */
    it('Assessment_RedactorBundleName_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RedactorBundleName_017, begin');
      redactor.reset();
      const line: string = 'onInterrupted code=3 message=failed for com.samples.dictionary';
      const redacted: string = redactor.redact(line);
      expect(redacted.indexOf('com.')).assertEqual(-1);
      expect(redacted).assertContain('[bundle]');
      expect(redacted).assertContain('onInterrupted code=3');
      expect(redacted).assertContain('failed for');
      expect(redactor.isRedacted(redacted)).assertTrue();
      expect(redactor.getRedactions()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'RedactorBundleName_017', redacted);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RedactorBundleName_017, end');
    });

    /**
     * Scenario: the log redactor on a line that carries a path and a stack frame.
     * Expectation: both are replaced and the redaction counter counts both.
     */
    it('Assessment_RedactorPathAndFrame_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RedactorPathAndFrame_018, begin');
      redactor.reset();
      const line: string = 'onApiError code=3 message=failed /data/app/el2 at ExamPage.ets:313';
      const redacted: string = redactor.redact(line);
      expect(redacted.indexOf('/data/')).assertEqual(-1);
      expect(redacted.indexOf('.ets:')).assertEqual(-1);
      expect(redacted).assertContain('[path]');
      expect(redacted).assertContain('[frame]');
      expect(redactor.isRedacted(redacted)).assertTrue();
      expect(redactor.getRedactions()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'RedactorPathAndFrame_018', redacted);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RedactorPathAndFrame_018, end');
    });

    /**
     * Scenario: the log redactor on a clean line.
     * Expectation: the line is returned unchanged and the redaction counter stays at zero.
     */
    it('Assessment_RedactorCleanLine_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RedactorCleanLine_019, begin');
      const local: LogRedactor = new LogRedactor();
      const line: string = 'onBegin code=0 message=';
      expect(local.redact(line)).assertEqual(line);
      expect(local.getRedactions()).assertEqual(0);
      expect(local.isRedacted(line)).assertTrue();
      expect(local.isRedacted('failed for com.samples.reader')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RedactorCleanLine_019, end');
    });

    /**
     * Scenario: a line with several bundle names.
     * Expectation: every occurrence is replaced, the counter matches the number of names.
     */
    it('Assessment_RedactorSeveralBundleNames_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RedactorSeveralBundleNames_020, begin');
      redactor.reset();
      const line: string = 'com.samples.assessment allowed com.samples.dictionary denied';
      const redacted: string = redactor.redact(line);
      expect(redacted.indexOf('com.')).assertEqual(-1);
      expect(redacted).assertContain('allowed');
      expect(redacted).assertContain('denied');
      expect(redactor.getRedactions()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'RedactorSeveralBundleNames_020', redacted);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RedactorSeveralBundleNames_020, end');
    });

    /**
     * Scenario: a redacted line is idempotent.
     * Expectation: redacting an already redacted line changes nothing and adds no counter.
     */
    it('Assessment_RedactorIdempotent_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RedactorIdempotent_022, begin');
      const local: LogRedactor = new LogRedactor();
      const line: string = 'failed for com.samples.reader from /data/app at X.ets:12';
      const once: string = local.redact(line);
      const twice: string = local.redact(once);
      expect(twice).assertEqual(once);
      expect(local.getRedactions()).assertEqual(3);
      expect(local.isRedacted(twice)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RedactorIdempotent_022, end');
    });

    /**
     * Scenario: the description of the sanitiser and of the whitelist.
     * Expectation: both descriptions name their two counters.
     */
    it('Assessment_ModelDescriptions_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ModelDescriptions_023, begin');
      const localSanitiser: BundleNameSanitiser = new BundleNameSanitiser();
      const localList: SafeWhitelist = new SafeWhitelist(localSanitiser);
      expect(localSanitiser.describe()).assertContain('accepted=0');
      expect(localSanitiser.describe()).assertContain('rejected=0');
      expect(localList.describe()).assertContain('entries=0');
      localSanitiser.sanitise('com.samples.reader');
      localSanitiser.sanitise('bad');
      expect(localSanitiser.describe()).assertContain('accepted=1');
      expect(localSanitiser.describe()).assertContain('rejected=1');
      localList.add('com.samples.reader');
      expect(localList.describe()).assertContain('entries=1');
      hilog.info(DOMAIN, TAG, '%{public}s', localList.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ModelDescriptions_023, end');
    });

    /**
     * Scenario: the reset of the sanitiser.
     * Expectation: the counters and the per kind buckets are dropped.
     */
    it('Assessment_SanitiserReset_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserReset_024, begin');
      const local: BundleNameSanitiser = new BundleNameSanitiser();
      local.sanitise('com.samples.reader');
      local.sanitise('com.samples.reader;rm');
      local.sanitise('com..reader');
      expect(local.getAccepted()).assertEqual(1);
      expect(local.getRejected()).assertEqual(2);
      local.reset();
      expect(local.getAccepted()).assertEqual(0);
      expect(local.getRejected()).assertEqual(0);
      expect(local.countOf(PayloadKind.INJECTION)).assertEqual(0);
      expect(local.sanitise('com.samples.reader').accepted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserReset_024, end');
    });

    /**
     * Scenario: the redactor keeps the event log format intact.
     * Expectation: the type, the code and the message label of a log line survive the redaction.
     */
    it('Assessment_RedactorKeepsLogFormat_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RedactorKeepsLogFormat_025, begin');
      const local: LogRedactor = new LogRedactor();
      const line: string = 'onApiError code=201 message=denied for com.samples.reader';
      const redacted: string = local.redact(line);
      expect(redacted.indexOf('onApiError')).assertEqual(0);
      expect(redacted).assertContain('code=201');
      expect(redacted).assertContain('message=');
      expect(redacted.indexOf('com.')).assertEqual(-1);
      const parts: string[] = redacted.split(' ');
      expect(parts[0]).assertEqual('onApiError');
      expect(parts[1]).assertEqual('code=201');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RedactorKeepsLogFormat_025, end');
    });

    /**
     * Scenario: the constants of the input validation.
     * Expectation: the length bound, the whitelist cap and the segment minimum match the sample.
     */
    it('Assessment_ValidationConstants_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidationConstants_026, begin');
      expect(MAX_BUNDLE_LENGTH).assertEqual(128);
      expect(MAX_ALLOWED_APPS).assertEqual(20);
      expect(MIN_BUNDLE_SEGMENTS).assertEqual(2);
      expect(MAX_LOG_LINE_LENGTH).assertEqual(512);
      expect(DEFAULT_ALLOWED_APP).assertEqual('com.samples.assessment');
      expect(FUZZ_ROUNDS).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidationConstants_026, end');
    });

    /**
     * Scenario: a mixed case bundle name.
     * Expectation: the mixed case name is accepted, the sanitiser never lower cases the value.
     */
    it('Assessment_SanitiserKeepsCase_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserKeepsCase_027, begin');
      sanitiser.reset();
      const result: SanitiseResult = sanitiser.sanitise('Com.Samples.Reader');
      expect(result.accepted).assertTrue();
      expect(result.value).assertEqual('Com.Samples.Reader');
      expect(result.value).assertEqual('Com.Samples.Reader');
      expect(result.value).assertEqual('Com.Samples.Reader');
      expect(result.value === 'com.samples.reader').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserKeepsCase_027, end');
    });

    /**
     * Scenario: an underscored segment.
     * Expectation: the underscore is part of the accepted alphabet, so the value is stored.
     */
    it('Assessment_SanitiserAcceptsUnderscore_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserAcceptsUnderscore_028, begin');
      sanitiser.reset();
      const result: SanitiseResult = sanitiser.sanitise('com.samples.app_1');
      expect(result.accepted).assertTrue();
      expect(result.value).assertEqual('com.samples.app_1');
      expect(result.value).assertContain('_');
      expect(sanitiser.getAccepted()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SanitiserAcceptsUnderscore_028, end');
    });
  });
}
