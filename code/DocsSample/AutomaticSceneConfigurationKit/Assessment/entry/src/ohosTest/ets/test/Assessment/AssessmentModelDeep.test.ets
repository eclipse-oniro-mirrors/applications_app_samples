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
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TIMEOUT_PAGE_RENDER,
  TEST_BUNDLE_PRIMARY,
  TEST_BUNDLE_SECONDARY,
  TEST_BUNDLE_TERTIARY,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  addAllowedApp,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Limits and defaults of the assessment models.
const MAX_ALLOWED_APPS: number = 20;
const MAX_CONFIG_CHARS: number = 2048;
const MAX_EVENT_LOG: number = 20;
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';
const INVALID_DURATION: number = -1;
const INVALID_ANSWER: number = -1;

// Duration candidates.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN: number = 600000;
const DURATION_THIRTY: number = 1800000;
const DURATION_SIXTY: number = 3600000;
const DURATIONS: number[] = [DURATION_DEFAULT, DURATION_TEN, DURATION_THIRTY, DURATION_SIXTY];

// Ordinal values of AssessmentErrorCode.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Event types recorded by the controller.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

/**
 * Immutable value object of the AssessmentConfig interface.
 *
 * The class is the deep model used by the configuration cases: it validates its own fields at
 * construction, exposes a normalised whitelist and knows how to serialise and compare itself.
 */
class DeepConfig {
  private readonly durationValue: number;
  private readonly appValues: string[];

  private constructor(duration: number, apps: string[]) {
    this.durationValue = duration;
    this.appValues = apps.slice();
  }

  public static of(duration: number, apps: string[]): DeepConfig {
    const normalised: string[] = [];
    for (let i = 0; i < apps.length; i++) {
      const value: string = apps[i].trim();
      if (value.length === 0 || normalised.indexOf(value) >= 0) {
        continue;
      }
      if (normalised.length >= MAX_ALLOWED_APPS) {
        break;
      }
      normalised.push(value);
    }
    return new DeepConfig(duration, normalised);
  }

  public static defaultConfig(): DeepConfig {
    return DeepConfig.of(DURATION_DEFAULT, []);
  }

  public static seeded(): DeepConfig {
    return DeepConfig.of(DURATION_DEFAULT, [DEFAULT_ALLOWED_APP]);
  }

  public duration(): number {
    return this.durationValue;
  }

  public apps(): string[] {
    return this.appValues.slice();
  }

  public appCount(): number {
    return this.appValues.length;
  }

  public isEmpty(): boolean {
    return this.appValues.length === 0;
  }

  public isDefaultDuration(): boolean {
    return this.durationValue === DURATION_DEFAULT;
  }

  public minutes(): number {
    if (this.durationValue === DURATION_DEFAULT) {
      return 0;
    }
    return this.durationValue / 60000;
  }

  public seconds(): number {
    return this.minutes() * 60;
  }

  public totalChars(): number {
    let total: number = 0;
    for (let i = 0; i < this.appValues.length; i++) {
      total += this.appValues[i].length;
    }
    return total;
  }

  public contains(bundleName: string): boolean {
    return this.appValues.indexOf(bundleName) >= 0;
  }

  public durationValid(): boolean {
    return DURATIONS.indexOf(this.durationValue) >= 0;
  }

  public capacityValid(): boolean {
    return this.appValues.length <= MAX_ALLOWED_APPS;
  }

  public lengthValid(): boolean {
    return this.totalChars() <= MAX_CONFIG_CHARS;
  }

  public isValid(): boolean {
    return this.durationValid() && this.capacityValid() && this.lengthValid();
  }

  public violations(): string[] {
    const reasons: string[] = [];
    if (!this.durationValid()) {
      reasons.push('duration');
    }
    if (!this.capacityValid()) {
      reasons.push('capacity');
    }
    if (!this.lengthValid()) {
      reasons.push('length');
    }
    return reasons;
  }

  public equals(other: DeepConfig): boolean {
    if (this.durationValue !== other.duration()) {
      return false;
    }
    const mine: string[] = this.appValues;
    const theirs: string[] = other.apps();
    if (mine.length !== theirs.length) {
      return false;
    }
    for (let i = 0; i < mine.length; i++) {
      if (mine[i] !== theirs[i]) {
        return false;
      }
    }
    return true;
  }

  public signature(): string {
    return `${this.durationValue}|${this.appValues.join(',')}`;
  }

  public toJsonText(): string {
    return `{"duration":${this.durationValue},"allowedApps":[${DeepConfig.quoteAll(this.appValues)}]}`;
  }

  public describe(): string {
    return `DeepConfig{duration=${this.durationValue}, apps=${this.appValues.length}, ` +
      `chars=${this.totalChars()}}`;
  }

  public static quoteAll(values: string[]): string {
    const quoted: string[] = [];
    for (let i = 0; i < values.length; i++) {
      quoted.push(`"${values[i]}"`);
    }
    return quoted.join(',');
  }

  public static fromJsonText(text: string): DeepConfig | null {
    const durationMarker: string = '"duration":';
    const appsMarker: string = ',"allowedApps":';
    const durationIndex: number = text.indexOf(durationMarker);
    const appsIndex: number = text.indexOf(appsMarker);
    if (durationIndex < 0 || appsIndex < 0) {
      return null;
    }
    const durationText: string = text.substring(durationIndex + durationMarker.length, appsIndex);
    const duration: number = Number(durationText);
    if (Number.isNaN(duration)) {
      return null;
    }
    const appsStart: number = text.indexOf('[', appsIndex);
    const appsEnd: number = text.lastIndexOf(']');
    if (appsStart < 0 || appsEnd < 0 || appsEnd <= appsStart) {
      return null;
    }
    const body: string = text.substring(appsStart + 1, appsEnd);
    const apps: string[] = [];
    if (body.trim().length > 0) {
      const parts: string[] = body.split(',');
      for (let i = 0; i < parts.length; i++) {
        const trimmed: string = parts[i].trim();
        if (trimmed.length >= 2 && trimmed.startsWith('"') && trimmed.endsWith('"')) {
          apps.push(trimmed.substring(1, trimmed.length - 1));
        }
      }
    }
    return DeepConfig.of(duration, apps);
  }
}

/**
 * Immutable value object of the AssessmentError interface.
 *
 * The error carries the numeric code and the message that the callback reported. The model adds
 * a label, a severity and a recovery hint so the cases can assert the semantics of each code.
 */
class DeepError {
  private readonly codeValue: number;
  private readonly messageValue: string;

  constructor(code: number, message: string = '') {
    this.codeValue = code;
    this.messageValue = message;
  }

  public static ok(): DeepError {
    return new DeepError(CODE_OK, '');
  }

  public static userCancel(): DeepError {
    return new DeepError(CODE_USER_CANCEL, 'the user cancelled the assessment');
  }

  public static timeout(): DeepError {
    return new DeepError(CODE_TIMEOUT, 'the countdown expired');
  }

  public static systemError(): DeepError {
    return new DeepError(CODE_SYSTEM_ERROR, 'the service is unavailable');
  }

  public static envAnomaly(): DeepError {
    return new DeepError(CODE_ENV_ANOMALY, 'the environment changed');
  }

  public code(): number {
    return this.codeValue;
  }

  public message(): string {
    return this.messageValue;
  }

  public isSuccess(): boolean {
    return this.codeValue === CODE_OK;
  }

  public isFailure(): boolean {
    return !this.isSuccess();
  }

  public isKnown(): boolean {
    return this.codeValue >= CODE_OK && this.codeValue <= CODE_ENV_ANOMALY &&
      this.codeValue === Math.floor(this.codeValue);
  }

  public label(): string {
    if (this.codeValue === CODE_OK) {
      return 'OK';
    }
    if (this.codeValue === CODE_USER_CANCEL) {
      return 'USER_CANCEL';
    }
    if (this.codeValue === CODE_TIMEOUT) {
      return 'TIMEOUT';
    }
    if (this.codeValue === CODE_SYSTEM_ERROR) {
      return 'SYSTEM_ERROR';
    }
    if (this.codeValue === CODE_ENV_ANOMALY) {
      return 'ENV_ANOMALY';
    }
    return 'UNKNOWN';
  }

  public severity(): string {
    if (this.codeValue === CODE_OK) {
      return 'none';
    }
    if (this.codeValue === CODE_USER_CANCEL) {
      return 'info';
    }
    if (this.codeValue === CODE_TIMEOUT) {
      return 'warning';
    }
    return 'error';
  }

  public isTerminal(): boolean {
    return this.codeValue === CODE_USER_CANCEL || this.codeValue === CODE_TIMEOUT;
  }

  public isTransient(): boolean {
    return this.codeValue === CODE_SYSTEM_ERROR || this.codeValue === CODE_ENV_ANOMALY;
  }

  public messageIsEmpty(): boolean {
    return this.messageValue.length === 0;
  }

  public messageLength(): number {
    return this.messageValue.length;
  }

  public equals(other: DeepError): boolean {
    return this.codeValue === other.code() && this.messageValue === other.message();
  }

  public describe(): string {
    return `DeepError{code=${this.codeValue}, label=${this.label()}, message=${this.messageValue}}`;
  }
}

/**
 * Immutable value object of the AssessmentInterruptInfo interface.
 *
 * The interruption info carries the code and the message of the reason why the assessment was
 * interrupted. The model adds a boolean that answers whether the interruption is recoverable.
 */
class DeepInterruptInfo {
  private readonly codeValue: number;
  private readonly messageValue: string;

  constructor(code: number, message: string = '') {
    this.codeValue = code;
    this.messageValue = message;
  }

  public code(): number {
    return this.codeValue;
  }

  public message(): string {
    return this.messageValue;
  }

  public isKnown(): boolean {
    return this.codeValue >= CODE_OK && this.codeValue <= CODE_ENV_ANOMALY;
  }

  public isRecoverable(): boolean {
    return this.codeValue === CODE_SYSTEM_ERROR || this.codeValue === CODE_ENV_ANOMALY;
  }

  public isTerminal(): boolean {
    return this.codeValue === CODE_USER_CANCEL || this.codeValue === CODE_TIMEOUT;
  }

  public reasonKey(): string {
    if (this.codeValue === CODE_USER_CANCEL) {
      return 'reason_user_cancel';
    }
    if (this.codeValue === CODE_TIMEOUT) {
      return 'reason_timeout';
    }
    if (this.codeValue === CODE_SYSTEM_ERROR) {
      return 'reason_system_error';
    }
    if (this.codeValue === CODE_ENV_ANOMALY) {
      return 'reason_env_anomaly';
    }
    return 'reason_unknown';
  }

  public toError(): DeepError {
    return new DeepError(this.codeValue, this.messageValue);
  }

  public equals(other: DeepInterruptInfo): boolean {
    return this.codeValue === other.code() && this.messageValue === other.message();
  }

  public describe(): string {
    return `InterruptInfo{code=${this.codeValue}, reason=${this.reasonKey()}, ` +
      `recoverable=${this.isRecoverable()}}`;
  }
}

/**
 * The serialised form of a callback event.
 *
 * The controller writes the event type, the code and the message to AppStorage and appends a
 * line to the log. The class produces exactly that line and can parse it back, which is what the
 * serialisation cases assert.
 */
class EventRecord {
  private typeValue: string;
  private codeValue: number;
  private messageValue: string;

  constructor(type: string = '', code: number = CODE_OK, message: string = '') {
    this.typeValue = type;
    this.codeValue = code;
    this.messageValue = message;
  }

  public static fromError(eventType: string, error: DeepError): EventRecord {
    return new EventRecord(eventType, error.code(), error.message());
  }

  public static fromInterrupt(info: DeepInterruptInfo): EventRecord {
    return new EventRecord(EVENT_INTERRUPTED, info.code(), info.message());
  }

  public type(): string {
    return this.typeValue;
  }

  public code(): number {
    return this.codeValue;
  }

  public message(): string {
    return this.messageValue;
  }

  public toLogLine(): string {
    return `${this.typeValue} code=${this.codeValue} message=${this.messageValue}`;
  }

  public static parseLogLine(line: string): EventRecord | null {
    const typeEnd: number = line.indexOf(' code=');
    const messageStart: number = line.indexOf(' message=');
    if (typeEnd < 0 || messageStart < 0 || messageStart <= typeEnd) {
      return null;
    }
    const type: string = line.substring(0, typeEnd);
    const codeText: string = line.substring(typeEnd + 6, messageStart);
    const code: number = Number(codeText);
    if (Number.isNaN(code)) {
      return null;
    }
    const message: string = line.substring(messageStart + 9);
    return new EventRecord(type, code, message);
  }

  public equals(other: EventRecord): boolean {
    return this.typeValue === other.type() && this.codeValue === other.code() &&
      this.messageValue === other.message();
  }

  public describe(): string {
    return `EventRecord{type=${this.typeValue}, code=${this.codeValue}}`;
  }
}

/**
 * A bounded ring buffer of event records.
 *
 * The controller keeps the newest twenty log lines and drops the oldest ones. The buffer below
 * reproduces that behaviour and adds the ability to read the entries in insertion order.
 */
class EventRing {
  private entries: EventRecord[] = [];
  private capacity: number = MAX_EVENT_LOG;
  private dropped: number = 0;
  private appended: number = 0;

  public push(record: EventRecord): void {
    this.appended++;
    const next: EventRecord[] = this.entries.slice();
    next.unshift(record);
    while (next.length > this.capacity) {
      next.pop();
      this.dropped++;
    }
    this.entries = next;
  }

  public size(): number {
    return this.entries.length;
  }

  public isEmpty(): boolean {
    return this.entries.length === 0;
  }

  public newest(): EventRecord | null {
    return this.entries.length === 0 ? null : this.entries[0];
  }

  public oldest(): EventRecord | null {
    return this.entries.length === 0 ? null : this.entries[this.entries.length - 1];
  }

  public getAll(): EventRecord[] {
    return this.entries.slice();
  }

  public appendedCount(): number {
    return this.appended;
  }

  public droppedCount(): number {
    return this.dropped;
  }

  public countOf(type: string): number {
    let count: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].type() === type) {
        count++;
      }
    }
    return count;
  }

  public types(): string[] {
    return this.entries.map((entry: EventRecord) => entry.type());
  }

  public lines(): string[] {
    return this.entries.map((entry: EventRecord) => entry.toLogLine());
  }

  public clear(): void {
    this.entries = [];
  }

  public describe(): string {
    return `EventRing{size=${this.entries.length}, appended=${this.appended}, dropped=${this.dropped}}`;
  }
}

/**
 * The defaults of the assessment domain.
 *
 * The catalogue collects every default the sample declares so the cases can assert them in one
 * place instead of repeating the literals.
 */
class DefaultCatalogue {
  public static defaultDuration(): number {
    return DURATION_DEFAULT;
  }

  public static defaultAllowedApp(): string {
    return DEFAULT_ALLOWED_APP;
  }

  public static invalidDuration(): number {
    return INVALID_DURATION;
  }

  public static invalidAnswer(): number {
    return INVALID_ANSWER;
  }

  public static maxAllowedApps(): number {
    return MAX_ALLOWED_APPS;
  }

  public static maxConfigChars(): number {
    return MAX_CONFIG_CHARS;
  }

  public static maxEventJournal(): number {
    return MAX_EVENT_LOG;
  }

  public static durationCandidates(): number[] {
    return DURATIONS.slice();
  }

  public static eventTypes(): string[] {
    return [EVENT_BEGIN, EVENT_INTERRUPTED, EVENT_END, EVENT_API_ERROR];
  }

  public static errorCodes(): number[] {
    return [CODE_OK, CODE_USER_CANCEL, CODE_TIMEOUT, CODE_SYSTEM_ERROR, CODE_ENV_ANOMALY];
  }

  public static isSentinel(value: number): boolean {
    return value === INVALID_DURATION || value === INVALID_ANSWER;
  }

  public static describe(): string {
    return `Defaults{duration=${DURATION_DEFAULT}, app=${DEFAULT_ALLOWED_APP}, ` +
      `maxApps=${MAX_ALLOWED_APPS}, maxChars=${MAX_CONFIG_CHARS}}`;
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

export default function assessmentModelDeepTest() {
  describe('AssessmentModelDeep_Test', () => {
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
     * Scenario: the default configuration value object.
     * Expectation: it is empty, uses the default duration and is valid.
     */
    it('Assessment_ConfigDefault_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigDefault_001, begin');
      const config: DeepConfig = DeepConfig.defaultConfig();
      expect(config.duration()).assertEqual(DURATION_DEFAULT);
      expect(config.appCount()).assertEqual(0);
      expect(config.isEmpty()).assertTrue();
      expect(config.isDefaultDuration()).assertTrue();
      expect(config.minutes()).assertEqual(0);
      expect(config.seconds()).assertEqual(0);
      expect(config.isValid()).assertTrue();
      expect(config.violations().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', config.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigDefault_001, end');
    });

    /**
     * Scenario: the seeded configuration of the entry page.
     * Expectation: it carries exactly the default bundle name.
     */
    it('Assessment_ConfigSeeded_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigSeeded_002, begin');
      const config: DeepConfig = DeepConfig.seeded();
      expect(config.appCount()).assertEqual(1);
      expect(config.apps()[0]).assertEqual(DEFAULT_ALLOWED_APP);
      expect(config.contains(DEFAULT_ALLOWED_APP)).assertTrue();
      expect(config.isEmpty()).assertFalse();
      expect(config.totalChars()).assertEqual(DEFAULT_ALLOWED_APP.length);
      hilog.info(DOMAIN, TAG, '%{public}s', config.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigSeeded_002, end');
    });

    /**
     * Scenario: the duration accessors of the configuration.
     * Expectation: minutes and seconds are derived from the millisecond duration.
     */
    it('Assessment_ConfigDurationAccessors_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigDurationAccessors_003, begin');
      const expected: number[] = [0, 10, 30, 60];
      for (let i = 0; i < DURATIONS.length; i++) {
        const config: DeepConfig = DeepConfig.of(DURATIONS[i], []);
        expect(config.minutes()).assertEqual(expected[i]);
        expect(config.seconds()).assertEqual(expected[i] * 60);
        expect(config.durationValid()).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigDurationAccessors_003, end');
    });

    /**
     * Scenario: an undocumented duration in the value object.
     * Expectation: the value object reports the duration as invalid but keeps the value.
     */
    it('Assessment_ConfigInvalidDuration_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigInvalidDuration_004, begin');
      const config: DeepConfig = DeepConfig.of(1234, []);
      expect(config.duration()).assertEqual(1234);
      expect(config.durationValid()).assertFalse();
      expect(config.isValid()).assertFalse();
      expect(config.violations().indexOf('duration') >= 0).assertTrue();
      const negative: DeepConfig = DeepConfig.of(-600000, []);
      expect(negative.durationValid()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', config.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigInvalidDuration_004, end');
    });

    /**
     * Scenario: the normalisation of the whitelist at construction.
     * Expectation: empty and duplicated entries are dropped and the values are trimmed.
     */
    it('Assessment_ConfigNormalisation_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigNormalisation_005, begin');
      const config: DeepConfig = DeepConfig.of(DURATION_TEN,
        ['', '  ', TEST_BUNDLE_PRIMARY, TEST_BUNDLE_PRIMARY, ' ' + TEST_BUNDLE_SECONDARY + ' ']);
      expect(config.appCount()).assertEqual(2);
      expect(config.apps()[0]).assertEqual(TEST_BUNDLE_PRIMARY);
      expect(config.apps()[1]).assertEqual(TEST_BUNDLE_SECONDARY);
      expect(config.apps()[0]).assertEqual(config.apps()[0].trim());
      hilog.info(DOMAIN, TAG, '%{public}s', config.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigNormalisation_005, end');
    });

    /**
     * Scenario: the equality of two configuration value objects.
     * Expectation: duration and the ordered whitelist both participate.
     */
    it('Assessment_ConfigEquality_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigEquality_008, begin');
      const left: DeepConfig = DeepConfig.of(DURATION_TEN, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      const right: DeepConfig = DeepConfig.of(DURATION_TEN, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      expect(left.equals(right)).assertTrue();
      expect(right.equals(left)).assertTrue();
      const otherDuration: DeepConfig = DeepConfig.of(DURATION_THIRTY, left.apps());
      expect(left.equals(otherDuration)).assertFalse();
      const otherOrder: DeepConfig = DeepConfig.of(DURATION_TEN, [TEST_BUNDLE_SECONDARY, TEST_BUNDLE_PRIMARY]);
      expect(left.equals(otherOrder)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', left.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigEquality_008, end');
    });

    /**
     * Scenario: the signature of two order different configurations.
     * Expectation: the signature is order sensitive, which is what the sample logs.
     */
    it('Assessment_ConfigSignature_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigSignature_009, begin');
      const left: DeepConfig = DeepConfig.of(DURATION_TEN, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      const right: DeepConfig = DeepConfig.of(DURATION_TEN, [TEST_BUNDLE_SECONDARY, TEST_BUNDLE_PRIMARY]);
      expect(left.signature() === right.signature()).assertFalse();
      const same: DeepConfig = DeepConfig.of(DURATION_TEN, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      expect(left.signature()).assertEqual(same.signature());
      expect(left.signature()).assertContain(`${DURATION_TEN}`);
      expect(left.signature()).assertContain(TEST_BUNDLE_PRIMARY);
      hilog.info(DOMAIN, TAG, '%{public}s', left.signature());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigSignature_009, end');
    });

    /**
     * Scenario: the JSON serialisation of the configuration.
     * Expectation: it carries the numeric duration and a quoted array of bundle names.
     */
    it('Assessment_ConfigSerialisation_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigSerialisation_010, begin');
      const config: DeepConfig = DeepConfig.of(DURATION_TEN, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      const text: string = config.toJsonText();
      expect(text).assertContain('"duration":600000');
      expect(text).assertContain('"allowedApps"');
      expect(text).assertContain(`"${TEST_BUNDLE_PRIMARY}"`);
      expect(text).assertContain(`"${TEST_BUNDLE_SECONDARY}"`);
      expect(text.startsWith('{')).assertTrue();
      expect(text.endsWith('}')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigSerialisation_010, end');
    });

    /**
     * Scenario: a serialisation round trip.
     * Expectation: parsing the produced text yields an equal value object.
     */
    it('Assessment_ConfigRoundTrip_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigRoundTrip_011, begin');
      const config: DeepConfig = DeepConfig.of(DURATION_THIRTY,
        [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY, TEST_BUNDLE_TERTIARY]);
      const text: string = config.toJsonText();
      const parsed: DeepConfig | null = DeepConfig.fromJsonText(text);
      expect(parsed !== null).assertTrue();
      if (parsed !== null) {
        expect(parsed.equals(config)).assertTrue();
        expect(parsed.duration()).assertEqual(DURATION_THIRTY);
        expect(parsed.appCount()).assertEqual(3);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigRoundTrip_011, end');
    });

    /**
     * Scenario: a round trip of the empty configuration.
     * Expectation: the empty array is serialised and parsed back to an empty list.
     */
    it('Assessment_ConfigRoundTripEmpty_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigRoundTripEmpty_012, begin');
      const config: DeepConfig = DeepConfig.defaultConfig();
      const text: string = config.toJsonText();
      expect(text).assertContain('"allowedApps":[]');
      const parsed: DeepConfig | null = DeepConfig.fromJsonText(text);
      expect(parsed !== null).assertTrue();
      if (parsed !== null) {
        expect(parsed.isEmpty()).assertTrue();
        expect(parsed.equals(config)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigRoundTripEmpty_012, end');
    });

    /**
     * Scenario: parsing malformed configuration text.
     * Expectation: a missing field or a non numeric duration yields null instead of a value.
     */
    it('Assessment_ConfigParseMalformed_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigParseMalformed_013, begin');
      expect(DeepConfig.fromJsonText('')).assertNull();
      expect(DeepConfig.fromJsonText('{"duration":0}')).assertNull();
      expect(DeepConfig.fromJsonText('{"allowedApps":[]}')).assertNull();
      expect(DeepConfig.fromJsonText('{"duration":"x","allowedApps":[]}')).assertNull();
      expect(DeepConfig.fromJsonText('not json at all')).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigParseMalformed_013, end');
    });

    /**
     * Scenario: the defensive copy of the whitelist getter.
     * Expectation: mutating the returned array never changes the value object.
     */
    it('Assessment_ConfigDefensiveCopy_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigDefensiveCopy_014, begin');
      const config: DeepConfig = DeepConfig.seeded();
      const copy: string[] = config.apps();
      copy.push(TEST_BUNDLE_SECONDARY);
      expect(copy.length).assertEqual(2);
      expect(config.appCount()).assertEqual(1);
      expect(config.contains(TEST_BUNDLE_SECONDARY)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', config.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigDefensiveCopy_014, end');
    });

    /**
     * Scenario: the quote helper of the configuration model.
     * Expectation: every value is wrapped in double quotes and separated by commas.
     */
    it('Assessment_ConfigQuoting_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigQuoting_015, begin');
      expect(DeepConfig.quoteAll([])).assertEqual('');
      expect(DeepConfig.quoteAll(['a'])).assertEqual('"a"');
      expect(DeepConfig.quoteAll(['a', 'b'])).assertEqual('"a","b"');
      expect(DeepConfig.quoteAll([TEST_BUNDLE_PRIMARY])).assertContain('"');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigQuoting_015, end');
    });

    /**
     * Scenario: the success error value object.
     * Expectation: OK has no severity, no message and counts as a success.
     */
    it('Assessment_ErrorOk_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorOk_016, begin');
      const error: DeepError = DeepError.ok();
      expect(error.code()).assertEqual(CODE_OK);
      expect(error.isSuccess()).assertTrue();
      expect(error.isFailure()).assertFalse();
      expect(error.label()).assertEqual('OK');
      expect(error.severity()).assertEqual('none');
      expect(error.messageIsEmpty()).assertTrue();
      expect(error.isKnown()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', error.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorOk_016, end');
    });

    /**
     * Scenario: the user cancel error value object.
     * Expectation: it is terminal, informational and carries a message.
     */
    it('Assessment_ErrorUserCancel_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorUserCancel_017, begin');
      const error: DeepError = DeepError.userCancel();
      expect(error.code()).assertEqual(CODE_USER_CANCEL);
      expect(error.isFailure()).assertTrue();
      expect(error.label()).assertEqual('USER_CANCEL');
      expect(error.severity()).assertEqual('info');
      expect(error.isTerminal()).assertTrue();
      expect(error.isTransient()).assertFalse();
      expect(error.messageIsEmpty()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', error.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorUserCancel_017, end');
    });

    /**
     * Scenario: the timeout error value object.
     * Expectation: it is terminal and carries the warning severity.
     */
    it('Assessment_ErrorTimeout_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorTimeout_018, begin');
      const error: DeepError = DeepError.timeout();
      expect(error.code()).assertEqual(CODE_TIMEOUT);
      expect(error.label()).assertEqual('TIMEOUT');
      expect(error.severity()).assertEqual('warning');
      expect(error.isTerminal()).assertTrue();
      expect(error.isTransient()).assertFalse();
      expect(error.message()).assertContain('countdown');
      hilog.info(DOMAIN, TAG, '%{public}s', error.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorTimeout_018, end');
    });

    /**
     * Scenario: the system error value object.
     * Expectation: it is transient and carries the error severity.
     */
    it('Assessment_ErrorSystem_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorSystem_019, begin');
      const error: DeepError = DeepError.systemError();
      expect(error.code()).assertEqual(CODE_SYSTEM_ERROR);
      expect(error.label()).assertEqual('SYSTEM_ERROR');
      expect(error.severity()).assertEqual('error');
      expect(error.isTransient()).assertTrue();
      expect(error.isTerminal()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', error.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorSystem_019, end');
    });

    /**
     * Scenario: the environment anomaly value object.
     * Expectation: it is transient and carries the error severity.
     */
    it('Assessment_ErrorEnvAnomaly_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorEnvAnomaly_020, begin');
      const error: DeepError = DeepError.envAnomaly();
      expect(error.code()).assertEqual(CODE_ENV_ANOMALY);
      expect(error.label()).assertEqual('ENV_ANOMALY');
      expect(error.severity()).assertEqual('error');
      expect(error.isTransient()).assertTrue();
      expect(error.isKnown()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', error.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorEnvAnomaly_020, end');
    });

    /**
     * Scenario: an unknown error code.
     * Expectation: the label falls back to UNKNOWN and the code is not known.
     */
    it('Assessment_ErrorUnknown_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorUnknown_021, begin');
      const error: DeepError = new DeepError(42, 'something else');
      expect(error.label()).assertEqual('UNKNOWN');
      expect(error.isKnown()).assertFalse();
      expect(error.isFailure()).assertTrue();
      expect(error.severity()).assertEqual('error');
      const fractional: DeepError = new DeepError(1.5);
      expect(fractional.isKnown()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', error.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorUnknown_021, end');
    });

    /**
     * Scenario: the equality of two error value objects.
     * Expectation: both the code and the message participate in the comparison.
     */
    it('Assessment_ErrorEquality_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorEquality_022, begin');
      const left: DeepError = new DeepError(CODE_TIMEOUT, 'a');
      const right: DeepError = new DeepError(CODE_TIMEOUT, 'a');
      const otherMessage: DeepError = new DeepError(CODE_TIMEOUT, 'b');
      const otherCode: DeepError = new DeepError(CODE_SYSTEM_ERROR, 'a');
      expect(left.equals(right)).assertTrue();
      expect(left.equals(otherMessage)).assertFalse();
      expect(left.equals(otherCode)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', left.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorEquality_022, end');
    });

    /**
     * Scenario: the message length of an error.
     * Expectation: an empty message reports zero, a real one reports its length.
     */
    it('Assessment_ErrorMessageLength_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorMessageLength_023, begin');
      const empty: DeepError = new DeepError(CODE_SYSTEM_ERROR, '');
      expect(empty.messageLength()).assertEqual(0);
      expect(empty.messageIsEmpty()).assertTrue();
      const filled: DeepError = DeepError.systemError();
      expect(filled.messageLength() > 0).assertTrue();
      expect(filled.messageLength()).assertEqual(filled.message().length);
      hilog.info(DOMAIN, TAG, '%{public}s', filled.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorMessageLength_023, end');
    });

    /**
     * Scenario: the interrupt info of a timeout.
     * Expectation: it is terminal and maps to the timeout reason key.
     */
    it('Assessment_InterruptTimeout_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptTimeout_024, begin');
      const info: DeepInterruptInfo = new DeepInterruptInfo(CODE_TIMEOUT, 'the countdown expired');
      expect(info.code()).assertEqual(CODE_TIMEOUT);
      expect(info.isTerminal()).assertTrue();
      expect(info.isRecoverable()).assertFalse();
      expect(info.reasonKey()).assertEqual('reason_timeout');
      expect(info.isKnown()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', info.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptTimeout_024, end');
    });

    /**
     * Scenario: the interrupt info of a system error.
     * Expectation: it is recoverable and maps to the system error reason key.
     */
    it('Assessment_InterruptSystem_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptSystem_025, begin');
      const info: DeepInterruptInfo = new DeepInterruptInfo(CODE_SYSTEM_ERROR, 'the service is unavailable');
      expect(info.isRecoverable()).assertTrue();
      expect(info.reasonKey()).assertEqual('reason_system_error');
      expect(info.message()).assertContain('unavailable');
      hilog.info(DOMAIN, TAG, '%{public}s', info.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptSystem_025, end');
    });

    /**
     * Scenario: the interrupt info of an environment anomaly.
     * Expectation: it is recoverable and maps to the anomaly reason key.
     */
    it('Assessment_InterruptEnv_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptEnv_026, begin');
      const info: DeepInterruptInfo = new DeepInterruptInfo(CODE_ENV_ANOMALY, 'the environment changed');
      expect(info.isRecoverable()).assertTrue();
      expect(info.reasonKey()).assertEqual('reason_env_anomaly');
      expect(info.isKnown()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', info.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptEnv_026, end');
    });

    /**
     * Scenario: the interrupt info of a user cancel.
     * Expectation: it is terminal and maps to the cancel reason key.
     */
    it('Assessment_InterruptCancel_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptCancel_027, begin');
      const info: DeepInterruptInfo = new DeepInterruptInfo(CODE_USER_CANCEL, 'the user left');
      expect(info.isTerminal()).assertTrue();
      expect(info.isRecoverable()).assertFalse();
      expect(info.reasonKey()).assertEqual('reason_user_cancel');
      hilog.info(DOMAIN, TAG, '%{public}s', info.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptCancel_027, end');
    });

    /**
     * Scenario: the interrupt info of an unknown code.
     * Expectation: it maps to the unknown reason key and is neither terminal nor recoverable.
     */
    it('Assessment_InterruptUnknown_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptUnknown_028, begin');
      const info: DeepInterruptInfo = new DeepInterruptInfo(77, 'unexpected');
      expect(info.isKnown()).assertFalse();
      expect(info.reasonKey()).assertEqual('reason_unknown');
      expect(info.isTerminal()).assertFalse();
      expect(info.isRecoverable()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', info.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptUnknown_028, end');
    });

    /**
     * Scenario: the conversion of an interrupt info to an error.
     * Expectation: the code and the message are preserved.
     */
    it('Assessment_InterruptToError_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptToError_029, begin');
      const info: DeepInterruptInfo = new DeepInterruptInfo(CODE_TIMEOUT, 'expired');
      const error: DeepError = info.toError();
      expect(error.code()).assertEqual(info.code());
      expect(error.message()).assertEqual(info.message());
      expect(error.label()).assertEqual('TIMEOUT');
      expect(error.isTerminal()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', error.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptToError_029, end');
    });

    /**
     * Scenario: the equality of two interrupt infos.
     * Expectation: both the code and the message participate.
     */
    it('Assessment_InterruptEquality_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptEquality_030, begin');
      const left: DeepInterruptInfo = new DeepInterruptInfo(CODE_SYSTEM_ERROR, 'x');
      const right: DeepInterruptInfo = new DeepInterruptInfo(CODE_SYSTEM_ERROR, 'x');
      const different: DeepInterruptInfo = new DeepInterruptInfo(CODE_SYSTEM_ERROR, 'y');
      expect(left.equals(right)).assertTrue();
      expect(left.equals(different)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', left.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptEquality_030, end');
    });

    /**
     * Scenario: an event record built from an error.
     * Expectation: it copies the type, the code and the message.
     */
    it('Assessment_EventFromError_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventFromError_031, begin');
      const record: EventRecord = EventRecord.fromError(EVENT_BEGIN, DeepError.userCancel());
      expect(record.type()).assertEqual(EVENT_BEGIN);
      expect(record.code()).assertEqual(CODE_USER_CANCEL);
      expect(record.message()).assertContain('user cancelled');
      hilog.info(DOMAIN, TAG, '%{public}s', record.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventFromError_031, end');
    });

    /**
     * Scenario: an event record built from an interrupt info.
     * Expectation: the type is the interruption type.
     */
    it('Assessment_EventFromInterrupt_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventFromInterrupt_032, begin');
      const record: EventRecord = EventRecord.fromInterrupt(new DeepInterruptInfo(CODE_TIMEOUT, 'expired'));
      expect(record.type()).assertEqual(EVENT_INTERRUPTED);
      expect(record.code()).assertEqual(CODE_TIMEOUT);
      expect(record.message()).assertEqual('expired');
      hilog.info(DOMAIN, TAG, '%{public}s', record.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventFromInterrupt_032, end');
    });

    /**
     * Scenario: the log line of an event record.
     * Expectation: it matches the line format of the sample controller.
     */
    it('Assessment_EventJournalLine_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalLine_033, begin');
      const record: EventRecord = new EventRecord(EVENT_END, CODE_OK, '');
      expect(record.toLogLine()).assertEqual('onEnd code=0 message=');
      const apiError: EventRecord = new EventRecord(EVENT_API_ERROR, 401, 'denied');
      expect(apiError.toLogLine()).assertEqual('onApiError code=401 message=denied');
      hilog.info(DOMAIN, TAG, '%{public}s', apiError.toLogLine());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalLine_033, end');
    });

    /**
     * Scenario: parsing a log line back into an event record.
     * Expectation: the type, the code and the message survive the round trip.
     */
    it('Assessment_EventJournalParse_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalParse_034, begin');
      const original: EventRecord = new EventRecord(EVENT_BEGIN, CODE_ENV_ANOMALY, 'the environment changed');
      const parsed: EventRecord | null = EventRecord.parseLogLine(original.toLogLine());
      expect(parsed !== null).assertTrue();
      if (parsed !== null) {
        expect(parsed.equals(original)).assertTrue();
        expect(parsed.type()).assertEqual(EVENT_BEGIN);
        expect(parsed.code()).assertEqual(CODE_ENV_ANOMALY);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', original.toLogLine());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalParse_034, end');
    });

    /**
     * Scenario: parsing malformed log lines.
     * Expectation: every malformed line yields null.
     */
    it('Assessment_EventJournalParseMalformed_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalParseMalformed_035, begin');
      expect(EventRecord.parseLogLine('')).assertNull();
      expect(EventRecord.parseLogLine('onBegin')).assertNull();
      expect(EventRecord.parseLogLine('onBegin code=0')).assertNull();
      expect(EventRecord.parseLogLine('onBegin message=')).assertNull();
      expect(EventRecord.parseLogLine('onBegin code=abc message=x')).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalParseMalformed_035, end');
    });

    /**
     * Scenario: a message that contains the separator words.
     * Expectation: the parser keeps the trailing text intact.
     */
    it('Assessment_EventJournalParseTrickyMessage_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalParseTrickyMessage_036, begin');
      const record: EventRecord = new EventRecord(EVENT_API_ERROR, 401, 'code=999 was reported');
      const parsed: EventRecord | null = EventRecord.parseLogLine(record.toLogLine());
      expect(parsed !== null).assertTrue();
      if (parsed !== null) {
        expect(parsed.code()).assertEqual(401);
        expect(parsed.message()).assertContain('code=999');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', record.toLogLine());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalParseTrickyMessage_036, end');
    });

    /**
     * Scenario: an empty event ring.
     * Expectation: it has no newest and no oldest entry.
     */
    it('Assessment_RingEmpty_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingEmpty_037, begin');
      const ring: EventRing = new EventRing();
      expect(ring.size()).assertEqual(0);
      expect(ring.isEmpty()).assertTrue();
      expect(ring.newest()).assertNull();
      expect(ring.oldest()).assertNull();
      expect(ring.appendedCount()).assertEqual(0);
      expect(ring.droppedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', ring.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingEmpty_037, end');
    });

    /**
     * Scenario: pushing three events into the ring.
     * Expectation: the newest entry is the last pushed one and the oldest the first.
     */
    it('Assessment_RingOrdering_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingOrdering_038, begin');
      const ring: EventRing = new EventRing();
      ring.push(new EventRecord(EVENT_BEGIN, CODE_OK, ''));
      ring.push(new EventRecord(EVENT_INTERRUPTED, CODE_TIMEOUT, 'expired'));
      ring.push(new EventRecord(EVENT_END, CODE_OK, ''));
      expect(ring.size()).assertEqual(3);
      const newest: EventRecord | null = ring.newest();
      const oldest: EventRecord | null = ring.oldest();
      expect(newest !== null).assertTrue();
      expect(oldest !== null).assertTrue();
      if (newest !== null && oldest !== null) {
        expect(newest.type()).assertEqual(EVENT_END);
        expect(oldest.type()).assertEqual(EVENT_BEGIN);
      }
      expect(ring.types()[0]).assertEqual(EVENT_END);
      hilog.info(DOMAIN, TAG, '%{public}s', ring.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingOrdering_038, end');
    });

    /**
     * Scenario: counting the events by type.
     * Expectation: the count agrees with the number of pushes of that type.
     */
    it('Assessment_RingTypeCounts_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingTypeCounts_040, begin');
      const ring: EventRing = new EventRing();
      ring.push(new EventRecord(EVENT_BEGIN, CODE_OK, ''));
      ring.push(new EventRecord(EVENT_BEGIN, CODE_USER_CANCEL, ''));
      ring.push(new EventRecord(EVENT_END, CODE_OK, ''));
      expect(ring.countOf(EVENT_BEGIN)).assertEqual(2);
      expect(ring.countOf(EVENT_END)).assertEqual(1);
      expect(ring.countOf(EVENT_INTERRUPTED)).assertEqual(0);
      expect(ring.lines().length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', ring.lines().join(' | '));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingTypeCounts_040, end');
    });

    /**
     * Scenario: clearing the ring.
     * Expectation: the entries drop but the counters keep their history.
     */
    it('Assessment_RingClear_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingClear_041, begin');
      const ring: EventRing = new EventRing();
      ring.push(new EventRecord(EVENT_BEGIN, CODE_OK, ''));
      ring.push(new EventRecord(EVENT_END, CODE_OK, ''));
      ring.clear();
      expect(ring.size()).assertEqual(0);
      expect(ring.isEmpty()).assertTrue();
      expect(ring.appendedCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', ring.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingClear_041, end');
    });

    /**
     * Scenario: the ring hands out a defensive copy.
     * Expectation: mutating the returned array does not change the ring.
     */
    it('Assessment_RingDefensiveCopy_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingDefensiveCopy_042, begin');
      const ring: EventRing = new EventRing();
      ring.push(new EventRecord(EVENT_BEGIN, CODE_OK, ''));
      const copy: EventRecord[] = ring.getAll();
      copy.pop();
      expect(copy.length).assertEqual(0);
      expect(ring.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', ring.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingDefensiveCopy_042, end');
    });

    /**
     * Scenario: the default catalogue of the domain.
     * Expectation: every documented default is reachable through it.
     */
    it('Assessment_DefaultsCatalogue_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DefaultsCatalogue_043, begin');
      expect(DefaultCatalogue.defaultDuration()).assertEqual(0);
      expect(DefaultCatalogue.defaultAllowedApp()).assertEqual('com.samples.assessment');
      expect(DefaultCatalogue.invalidDuration()).assertEqual(-1);
      expect(DefaultCatalogue.invalidAnswer()).assertEqual(-1);
      expect(DefaultCatalogue.maxAllowedApps()).assertEqual(20);
      expect(DefaultCatalogue.maxConfigChars()).assertEqual(2048);
      expect(DefaultCatalogue.maxEventJournal()).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', DefaultCatalogue.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DefaultsCatalogue_043, end');
    });

    /**
     * Scenario: the sentinel values of the domain.
     * Expectation: the two negative sentinels are recognised and a valid value is not.
     */
    it('Assessment_DefaultsSentinels_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DefaultsSentinels_044, begin');
      expect(DefaultCatalogue.isSentinel(INVALID_DURATION)).assertTrue();
      expect(DefaultCatalogue.isSentinel(INVALID_ANSWER)).assertTrue();
      expect(DefaultCatalogue.isSentinel(0)).assertFalse();
      expect(DefaultCatalogue.isSentinel(DURATION_TEN)).assertFalse();
      expect(INVALID_DURATION).assertEqual(INVALID_ANSWER);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DefaultsSentinels_044, end');
    });

    /**
     * Scenario: the duration candidates of the catalogue.
     * Expectation: four candidates in ascending order, the default first.
     */
    it('Assessment_DefaultCandidates_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DefaultCandidates_045, begin');
      const candidates: number[] = DefaultCatalogue.durationCandidates();
      expect(candidates.length).assertEqual(4);
      expect(candidates[0]).assertEqual(DURATION_DEFAULT);
      expect(candidates[3]).assertEqual(DURATION_SIXTY);
      for (let i = 1; i < candidates.length; i++) {
        expect(candidates[i] > candidates[i - 1]).assertTrue();
      }
      const copy: number[] = DefaultCatalogue.durationCandidates();
      copy.pop();
      expect(DefaultCatalogue.durationCandidates().length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', candidates.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DefaultCandidates_045, end');
    });

    /**
     * Scenario: the event types and the error codes of the catalogue.
     * Expectation: four distinct event types and five consecutive error codes.
     */
    it('Assessment_DefaultEnumerations_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DefaultEnumerations_046, begin');
      const types: string[] = DefaultCatalogue.eventTypes();
      expect(types.length).assertEqual(4);
      expect(new Set<string>(types).size).assertEqual(4);
      expect(types.indexOf(EVENT_API_ERROR) >= 0).assertTrue();
      const codes: number[] = DefaultCatalogue.errorCodes();
      expect(codes.length).assertEqual(5);
      for (let i = 1; i < codes.length; i++) {
        expect(codes[i] - codes[i - 1]).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', types.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DefaultEnumerations_046, end');
    });

    /**
     * Scenario: a configuration for each duration candidate.
     * Expectation: every candidate produces a valid, distinct configuration.
     */
    it('Assessment_ConfigPerCandidate_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigPerCandidate_047, begin');
      const configs: DeepConfig[] = [];
      for (let i = 0; i < DURATIONS.length; i++) {
        const config: DeepConfig = DeepConfig.of(DURATIONS[i], [TEST_BUNDLE_PRIMARY]);
        expect(config.isValid()).assertTrue();
        configs.push(config);
      }
      expect(configs.length).assertEqual(4);
      for (let i = 1; i < configs.length; i++) {
        expect(configs[i].equals(configs[i - 1])).assertFalse();
        expect(configs[i].signature() === configs[i - 1].signature()).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigPerCandidate_047, end');
    });

    /**
     * Scenario: the full error family of the deep model.
     * Expectation: the five documented codes map to five distinct labels.
     */
    it('Assessment_ErrorFamily_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorFamily_048, begin');
      const errors: DeepError[] = [
        DeepError.ok(),
        DeepError.userCancel(),
        DeepError.timeout(),
        DeepError.systemError(),
        DeepError.envAnomaly()
      ];
      expect(errors.length).assertEqual(5);
      const labels: string[] = errors.map((error: DeepError) => error.label());
      expect(new Set<string>(labels).size).assertEqual(5);
      for (let i = 0; i < errors.length; i++) {
        expect(errors[i].isKnown()).assertTrue();
        expect(errors[i].code()).assertEqual(DefaultCatalogue.errorCodes()[i]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', labels.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorFamily_048, end');
    });

    /**
     * Scenario: the severity distribution of the error family.
     * Expectation: one none, one info, one warning and two errors.
     */
    it('Assessment_ErrorSeverityDistribution_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorSeverityDistribution_049, begin');
      const errors: DeepError[] = [
        DeepError.ok(), DeepError.userCancel(), DeepError.timeout(), DeepError.systemError(),
        DeepError.envAnomaly()
      ];
      let none: number = 0;
      let info: number = 0;
      let warning: number = 0;
      let error: number = 0;
      for (let i = 0; i < errors.length; i++) {
        const severity: string = errors[i].severity();
        if (severity === 'none') {
          none++;
        } else if (severity === 'info') {
          info++;
        } else if (severity === 'warning') {
          warning++;
        } else {
          error++;
        }
      }
      expect(none).assertEqual(1);
      expect(info).assertEqual(1);
      expect(warning).assertEqual(1);
      expect(error).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorSeverityDistribution_049, end');
    });

    /**
     * Scenario: the interrupt info family.
     * Expectation: the recoverable and the terminal subsets are disjoint and complete.
     */
    it('Assessment_InterruptFamily_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptFamily_050, begin');
      const infos: DeepInterruptInfo[] = [
        new DeepInterruptInfo(CODE_USER_CANCEL, ''),
        new DeepInterruptInfo(CODE_TIMEOUT, ''),
        new DeepInterruptInfo(CODE_SYSTEM_ERROR, ''),
        new DeepInterruptInfo(CODE_ENV_ANOMALY, '')
      ];
      let recoverable: number = 0;
      let terminal: number = 0;
      for (let i = 0; i < infos.length; i++) {
        if (infos[i].isRecoverable()) {
          recoverable++;
        }
        if (infos[i].isTerminal()) {
          terminal++;
        }
        expect(infos[i].isRecoverable() && infos[i].isTerminal()).assertFalse();
      }
      expect(recoverable).assertEqual(2);
      expect(terminal).assertEqual(2);
      const keys: string[] = infos.map((info: DeepInterruptInfo) => info.reasonKey());
      expect(new Set<string>(keys).size).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', keys.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptFamily_050, end');
    });

    /**
     * Scenario: the log line of every event type.
     * Expectation: each type produces a line that starts with the type name.
     */
    it('Assessment_EventLinePerType_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventLinePerType_051, begin');
      const types: string[] = DefaultCatalogue.eventTypes();
      for (let i = 0; i < types.length; i++) {
        const record: EventRecord = new EventRecord(types[i], CODE_OK, '');
        expect(record.toLogLine().startsWith(types[i])).assertTrue();
        expect(record.toLogLine()).assertContain(' code=0 ');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventLinePerType_051, end');
    });

    /**
     * Scenario: a round trip of every event type.
     * Expectation: parsing the produced line returns an equal record.
     */
    it('Assessment_EventRoundTripPerType_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventRoundTripPerType_052, begin');
      const types: string[] = DefaultCatalogue.eventTypes();
      for (let i = 0; i < types.length; i++) {
        const original: EventRecord = new EventRecord(types[i], i, `message ${i}`);
        const parsed: EventRecord | null = EventRecord.parseLogLine(original.toLogLine());
        expect(parsed !== null).assertTrue();
        if (parsed !== null) {
          expect(parsed.equals(original)).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventRoundTripPerType_052, end');
    });

    /**
     * Scenario: the ring of a full callback cycle.
     * Expectation: the ring records begin, interrupted and end in that order.
     */
    it('Assessment_RingCallbackCycle_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingCallbackCycle_053, begin');
      const ring: EventRing = new EventRing();
      ring.push(EventRecord.fromError(EVENT_BEGIN, DeepError.ok()));
      ring.push(EventRecord.fromInterrupt(new DeepInterruptInfo(CODE_TIMEOUT, 'expired')));
      ring.push(new EventRecord(EVENT_END, CODE_OK, ''));
      const types: string[] = ring.types();
      expect(types.length).assertEqual(3);
      expect(types[0]).assertEqual(EVENT_END);
      expect(types[1]).assertEqual(EVENT_INTERRUPTED);
      expect(types[2]).assertEqual(EVENT_BEGIN);
      const interrupted: EventRecord = ring.getAll()[1];
      expect(interrupted.code()).assertEqual(CODE_TIMEOUT);
      hilog.info(DOMAIN, TAG, '%{public}s', ring.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RingCallbackCycle_053, end');
    });

    /**
     * Scenario: the description of the config and the error together.
     * Expectation: both descriptions are non empty and carry their type name.
     */
    it('Assessment_Descriptions_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Descriptions_058, begin');
      const configText: string = DeepConfig.seeded().describe();
      const errorText: string = DeepError.timeout().describe();
      const infoText: string = new DeepInterruptInfo(CODE_ENV_ANOMALY, 'x').describe();
      expect(configText).assertContain('DeepConfig');
      expect(errorText).assertContain('DeepError');
      expect(infoText).assertContain('InterruptInfo');
      expect(configText.length > 10).assertTrue();
      expect(errorText.length > 10).assertTrue();
      expect(infoText.length > 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', configText);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Descriptions_058, end');
    });

    /**
     * Scenario: the equality relation is reflexive and symmetric.
     * Expectation: every value object equals itself and equality is symmetric.
     */
    it('Assessment_EqualityRelations_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EqualityRelations_059, begin');
      const config: DeepConfig = DeepConfig.of(DURATION_THIRTY, [TEST_BUNDLE_PRIMARY]);
      expect(config.equals(config)).assertTrue();
      const other: DeepConfig = DeepConfig.of(DURATION_THIRTY, [TEST_BUNDLE_PRIMARY]);
      expect(config.equals(other)).assertTrue();
      expect(other.equals(config)).assertTrue();
      const error: DeepError = DeepError.systemError();
      expect(error.equals(error)).assertTrue();
      const info: DeepInterruptInfo = new DeepInterruptInfo(CODE_SYSTEM_ERROR, 'x');
      expect(info.equals(info)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EqualityRelations_059, end');
    });

    /**
     * Scenario: the value objects are independent of each other.
     * Expectation: changing the source array after construction never changes the model.
     */
    it('Assessment_ValueObjectIndependence_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValueObjectIndependence_060, begin');
      const source: string[] = [TEST_BUNDLE_PRIMARY];
      const config: DeepConfig = DeepConfig.of(DURATION_TEN, source);
      source.push(TEST_BUNDLE_SECONDARY);
      expect(config.appCount()).assertEqual(1);
      expect(config.contains(TEST_BUNDLE_SECONDARY)).assertFalse();
      expect(source.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', config.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValueObjectIndependence_060, end');
    });
  });
}
