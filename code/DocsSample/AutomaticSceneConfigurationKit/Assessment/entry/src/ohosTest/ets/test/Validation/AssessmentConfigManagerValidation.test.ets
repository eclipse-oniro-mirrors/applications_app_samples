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
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Candidate durations of AssessmentConfig.duration, they mirror AssessmentConstants of the
// sample under test.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_THIRTY_MINUTES: number = 1800000;
const DURATION_SIXTY_MINUTES: number = 3600000;
const MILLIS_PER_MINUTE: number = 60000;

// Capacity limits enforced by the assessment service.
const MAX_ALLOWED_APPS: number = 20;
const MAX_WHITELIST_CHARS: number = 2048;

// Bundle name grammar bounds.
const MIN_BUNDLE_SEGMENTS: number = 2;
const MIN_SEGMENT_LENGTH: number = 1;
const MAX_SEGMENT_LENGTH: number = 64;
const MAX_BUNDLE_LENGTH: number = 255;

// Sentinels used by the sample.
const INVALID_DURATION: number = -1;
const INVALID_INDEX: number = -1;
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';

/**
 * Field selector of a configuration change.
 */
enum ConfigField {
  DURATION = 'duration',
  ALLOWED_APPS = 'allowedApps',
  NONE = 'none'
}

/**
 * Validation outcome of a normalized configuration.
 */
enum ValidationIssue {
  NONE = 'none',
  DURATION_NEGATIVE = 'duration_negative',
  DURATION_NOT_CANDIDATE = 'duration_not_candidate',
  TOO_MANY_APPS = 'too_many_apps',
  APP_NAME_INVALID = 'app_name_invalid',
  APP_NAME_DUPLICATED = 'app_name_duplicated',
  WHITELIST_TOO_LONG = 'whitelist_too_long'
}

/**
 * Outcome of one whitelist insertion.
 */
enum AddOutcome {
  ACCEPTED = 'accepted',
  EMPTY = 'empty',
  DUPLICATED = 'duplicated',
  INVALID_NAME = 'invalid_name',
  CAPACITY = 'capacity',
  TOO_LONG = 'too_long'
}

/**
 * Immutable view of an assessment configuration.
 */
interface AssessmentConfigSnapshot {
  duration: number;
  allowedApps: string[];
}

/**
 * Result of a configuration validation pass.
 */
interface ConfigValidationResult {
  valid: boolean;
  issue: ValidationIssue;
  detail: string;
}

/**
 * Result of a whitelist insertion.
 */
interface WhitelistAddResult {
  outcome: AddOutcome;
  accepted: boolean;
  size: number;
}

/**
 * One applied configuration change.
 */
interface ConfigChangeRecord {
  field: ConfigField;
  from: string;
  to: string;
  timestamp: number;
}

/**
 * Difference between two configurations.
 */
interface ConfigDrift {
  durationChanged: boolean;
  appsAdded: number;
  appsRemoved: number;
}

/**
 * Duration policy of the configuration card.
 *
 * The policy holds the four candidate durations that the sample publishes and answers the
 * questions the entry page asks when it renders the selector.
 */
class DurationPolicy {
  private candidates: number[] = [
    DURATION_DEFAULT,
    DURATION_TEN_MINUTES,
    DURATION_THIRTY_MINUTES,
    DURATION_SIXTY_MINUTES
  ];

  public getCandidates(): number[] {
    return this.candidates.slice();
  }

  public count(): number {
    return this.candidates.length;
  }

  public contains(duration: number): boolean {
    return this.candidates.indexOf(duration) >= 0;
  }

  public indexOf(duration: number): number {
    return this.candidates.indexOf(duration);
  }

  public candidateAt(index: number): number {
    if (index < 0 || index >= this.candidates.length) {
      return INVALID_DURATION;
    }
    return this.candidates[index];
  }

  public clampIndex(index: number): number {
    if (index < 0) {
      return 0;
    }
    if (index >= this.candidates.length) {
      return this.candidates.length - 1;
    }
    return index;
  }

  // A negative duration is never a candidate, the selection falls back to the default.
  public isValid(duration: number): boolean {
    if (duration < 0) {
      return false;
    }
    return this.contains(duration);
  }

  // Picks the candidate that is closest to the supplied duration, ties resolve to the
  // earlier candidate so that the result is deterministic.
  public nearest(duration: number): number {
    if (duration <= DURATION_DEFAULT) {
      return DURATION_DEFAULT;
    }
    let bestIndex: number = 0;
    let bestDistance: number = Math.abs(duration - this.candidates[0]);
    for (let i = 1; i < this.candidates.length; i++) {
      const distance: number = Math.abs(duration - this.candidates[i]);
      if (distance < bestDistance) {
        bestDistance = distance;
        bestIndex = i;
      }
    }
    return this.candidates[bestIndex];
  }

  public labelOf(duration: number): string {
    if (duration < 0) {
      return 'Invalid duration';
    }
    if (duration === DURATION_DEFAULT) {
      return 'Default duration';
    }
    return `${duration / MILLIS_PER_MINUTE} min`;
  }

  public isStrictlyIncreasing(): boolean {
    for (let i = 1; i < this.candidates.length; i++) {
      if (this.candidates[i] <= this.candidates[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public isZero(duration: number): boolean {
    return duration === DURATION_DEFAULT;
  }

  public isMaximum(duration: number): boolean {
    return duration === DURATION_SIXTY_MINUTES;
  }
}

/**
 * Grammar rules of a bundle name.
 *
 * A bundle name is a dot separated list of at least two segments, every segment only holds
 * lowercase letters, digits and underscores.
 */
class BundleNameRules {
  public isSegmentValid(segment: string): boolean {
    if (segment.length < MIN_SEGMENT_LENGTH || segment.length > MAX_SEGMENT_LENGTH) {
      return false;
    }
    for (let i = 0; i < segment.length; i++) {
      if (!this.isSegmentChar(segment.charCodeAt(i))) {
        return false;
      }
    }
    return true;
  }

  private isSegmentChar(code: number): boolean {
    if (code >= 97 && code <= 122) {
      return true;
    }
    if (code >= 48 && code <= 57) {
      return true;
    }
    return code === 95;
  }

  public countSegments(name: string): number {
    if (name.length === 0) {
      return 0;
    }
    const parts: string[] = name.split('.');
    return parts.length;
  }

  public isWellFormed(name: string): boolean {
    if (name.length === 0 || name.length > MAX_BUNDLE_LENGTH) {
      return false;
    }
    if (name.startsWith('.') || name.endsWith('.')) {
      return false;
    }
    if (name.indexOf('..') >= 0) {
      return false;
    }
    const parts: string[] = name.split('.');
    if (parts.length < MIN_BUNDLE_SEGMENTS) {
      return false;
    }
    for (let i = 0; i < parts.length; i++) {
      if (!this.isSegmentValid(parts[i])) {
        return false;
      }
    }
    return true;
  }

  public normalize(name: string): string {
    return name.trim();
  }

  public firstSegment(name: string): string {
    const index: number = name.indexOf('.');
    if (index < 0) {
      return name;
    }
    return name.substring(0, index);
  }

  public lastSegment(name: string): string {
    const index: number = name.lastIndexOf('.');
    if (index < 0) {
      return name;
    }
    return name.substring(index + 1);
  }

  public isSameVendor(left: string, right: string): boolean {
    return this.firstSegment(left) === this.firstSegment(right);
  }
}

/**
 * Whitelist of allowed bundle names.
 *
 * Insertions follow the order the entry page uses: empty input, grammar, duplication,
 * capacity and the concatenated length bound.
 */
class AllowedAppsWhitelist {
  private entries: string[] = [];
  private rules: BundleNameRules = new BundleNameRules();

  public add(name: string): WhitelistAddResult {
    const normalized: string = this.rules.normalize(name);
    if (normalized.length === 0) {
      return this.result(AddOutcome.EMPTY, false);
    }
    if (!this.rules.isWellFormed(normalized)) {
      return this.result(AddOutcome.INVALID_NAME, false);
    }
    if (this.entries.indexOf(normalized) >= 0) {
      return this.result(AddOutcome.DUPLICATED, false);
    }
    if (this.entries.length >= MAX_ALLOWED_APPS) {
      return this.result(AddOutcome.CAPACITY, false);
    }
    if (this.totalCharsWith(normalized) > MAX_WHITELIST_CHARS) {
      return this.result(AddOutcome.TOO_LONG, false);
    }
    this.entries.push(normalized);
    return this.result(AddOutcome.ACCEPTED, true);
  }

  private result(outcome: AddOutcome, accepted: boolean): WhitelistAddResult {
    const result: WhitelistAddResult = {
      outcome: outcome,
      accepted: accepted,
      size: this.entries.length
    };
    return result;
  }

  public removeAt(index: number): boolean {
    if (index < 0 || index >= this.entries.length) {
      return false;
    }
    this.entries.splice(index, 1);
    return true;
  }

  public remove(name: string): boolean {
    const index: number = this.entries.indexOf(name);
    if (index < 0) {
      return false;
    }
    this.entries.splice(index, 1);
    return true;
  }

  public contains(name: string): boolean {
    return this.entries.indexOf(name) >= 0;
  }

  public indexOf(name: string): number {
    return this.entries.indexOf(name);
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

  public copy(): string[] {
    return this.entries.slice();
  }

  public at(index: number): string {
    if (index < 0 || index >= this.entries.length) {
      return '';
    }
    return this.entries[index];
  }

  public totalChars(): number {
    if (this.entries.length === 0) {
      return 0;
    }
    let total: number = this.entries.length - 1;
    for (let i = 0; i < this.entries.length; i++) {
      total += this.entries[i].length;
    }
    return total;
  }

  private totalCharsWith(candidate: string): number {
    let total: number = candidate.length;
    for (let i = 0; i < this.entries.length; i++) {
      total += this.entries[i].length + 1;
    }
    return total;
  }

  public clear(): void {
    this.entries = [];
  }

  public seed(names: string[]): void {
    for (let i = 0; i < names.length; i++) {
      this.add(names[i]);
    }
  }
}

/**
 * Assessment configuration model with normalization and equality.
 *
 * The model reproduces the two fields of assessment.AssessmentConfig. The constructor keeps
 * the raw values so that the cases can observe the normalization step.
 */
class AssessmentConfigModel {
  private durationValue: number;
  private allowedAppValues: string[];
  private rules: BundleNameRules = new BundleNameRules();
  private policy: DurationPolicy = new DurationPolicy();

  public constructor(duration: number, allowedApps: string[]) {
    this.durationValue = duration;
    this.allowedAppValues = allowedApps.slice();
  }

  public getDuration(): number {
    return this.durationValue;
  }

  public getAllowedApps(): string[] {
    return this.allowedAppValues.slice();
  }

  public countAllowedApps(): number {
    return this.allowedAppValues.length;
  }

  public setDuration(duration: number): void {
    this.durationValue = duration;
  }

  public setAllowedApps(apps: string[]): void {
    this.allowedAppValues = apps.slice();
  }

  // Removes duplicated, malformed and blank entries while keeping the original order.
  public normalize(): AssessmentConfigModel {
    const unique: string[] = [];
    for (let i = 0; i < this.allowedAppValues.length; i++) {
      const name: string = this.rules.normalize(this.allowedAppValues[i]);
      if (name.length === 0) {
        continue;
      }
      if (!this.rules.isWellFormed(name)) {
        continue;
      }
      if (unique.indexOf(name) >= 0) {
        continue;
      }
      if (unique.length >= MAX_ALLOWED_APPS) {
        continue;
      }
      unique.push(name);
    }
    return new AssessmentConfigModel(this.durationValue, unique);
  }

  public validate(): ConfigValidationResult {
    if (this.durationValue < 0) {
      const negative: ConfigValidationResult = {
        valid: false,
        issue: ValidationIssue.DURATION_NEGATIVE,
        detail: 'the duration is negative'
      };
      return negative;
    }
    if (!this.policy.isValid(this.durationValue)) {
      const notCandidate: ConfigValidationResult = {
        valid: false,
        issue: ValidationIssue.DURATION_NOT_CANDIDATE,
        detail: 'the duration is not a candidate'
      };
      return notCandidate;
    }
    if (this.allowedAppValues.length > MAX_ALLOWED_APPS) {
      const capacity: ConfigValidationResult = {
        valid: false,
        issue: ValidationIssue.TOO_MANY_APPS,
        detail: 'the whitelist exceeds the capacity'
      };
      return capacity;
    }
    const seen: string[] = [];
    for (let i = 0; i < this.allowedAppValues.length; i++) {
      const name: string = this.allowedAppValues[i];
      if (!this.rules.isWellFormed(name)) {
        const invalid: ConfigValidationResult = {
          valid: false,
          issue: ValidationIssue.APP_NAME_INVALID,
          detail: `the bundle name ${name} is malformed`
        };
        return invalid;
      }
      if (seen.indexOf(name) >= 0) {
        const duplicated: ConfigValidationResult = {
          valid: false,
          issue: ValidationIssue.APP_NAME_DUPLICATED,
          detail: `the bundle name ${name} is duplicated`
        };
        return duplicated;
      }
      seen.push(name);
    }
    const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
    whitelist.seed(this.allowedAppValues);
    if (whitelist.totalChars() > MAX_WHITELIST_CHARS) {
      const tooLong: ConfigValidationResult = {
        valid: false,
        issue: ValidationIssue.WHITELIST_TOO_LONG,
        detail: 'the whitelist is too long'
      };
      return tooLong;
    }
    const valid: ConfigValidationResult = {
      valid: true,
      issue: ValidationIssue.NONE,
      detail: 'ok'
    };
    return valid;
  }

  public equals(other: AssessmentConfigModel): boolean {
    if (this.durationValue !== other.getDuration()) {
      return false;
    }
    const mine: string[] = this.allowedAppValues;
    const theirs: string[] = other.getAllowedApps();
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

  public snapshot(): AssessmentConfigSnapshot {
    const snapshot: AssessmentConfigSnapshot = {
      duration: this.durationValue,
      allowedApps: this.allowedAppValues.slice()
    };
    return snapshot;
  }

  public describe(): string {
    return `duration=${this.durationValue}, allowedApps=${this.allowedAppValues.join(',')}`;
  }

  public withDuration(duration: number): AssessmentConfigModel {
    return new AssessmentConfigModel(duration, this.allowedAppValues);
  }

  public withAllowedApps(apps: string[]): AssessmentConfigModel {
    return new AssessmentConfigModel(this.durationValue, apps);
  }
}

/**
 * Text serializer of an assessment configuration.
 *
 * The wire form is a single line with two colon separated fields so that the cases do not
 * depend on a JSON parser.
 */
class ConfigSerializer {
  private static readonly FIELD_SEPARATOR: string = '|';
  private static readonly DURATION_PREFIX: string = 'duration:';
  private static readonly APPS_PREFIX: string = 'apps:';
  private static readonly LIST_SEPARATOR: string = ',';

  public serialize(config: AssessmentConfigModel): string {
    const durationPart: string = `${ConfigSerializer.DURATION_PREFIX}${config.getDuration()}`;
    const appsPart: string = `${ConfigSerializer.APPS_PREFIX}${config.getAllowedApps().join(ConfigSerializer.LIST_SEPARATOR)}`;
    return `${durationPart}${ConfigSerializer.FIELD_SEPARATOR}${appsPart}`;
  }

  public deserialize(text: string): AssessmentConfigModel | null {
    if (text.length === 0) {
      return null;
    }
    const parts: string[] = text.split(ConfigSerializer.FIELD_SEPARATOR);
    if (parts.length !== 2) {
      return null;
    }
    if (!parts[0].startsWith(ConfigSerializer.DURATION_PREFIX)) {
      return null;
    }
    if (!parts[1].startsWith(ConfigSerializer.APPS_PREFIX)) {
      return null;
    }
    const durationText: string = parts[0].substring(ConfigSerializer.DURATION_PREFIX.length);
    const duration: number = this.parseDuration(durationText);
    if (duration === INVALID_DURATION) {
      return null;
    }
    const appsText: string = parts[1].substring(ConfigSerializer.APPS_PREFIX.length);
    const apps: string[] = this.parseApps(appsText);
    return new AssessmentConfigModel(duration, apps);
  }

  private parseDuration(text: string): number {
    if (text.length === 0) {
      return INVALID_DURATION;
    }
    for (let i = 0; i < text.length; i++) {
      const code: number = text.charCodeAt(i);
      if (code < 48 || code > 57) {
        return INVALID_DURATION;
      }
    }
    return Number(text);
  }

  private parseApps(text: string): string[] {
    if (text.length === 0) {
      return [];
    }
    return text.split(ConfigSerializer.LIST_SEPARATOR);
  }
}

/**
 * Manager of the configuration that the entry page is about to submit.
 *
 * Every applied configuration is recorded so that the cases can verify the change journal.
 */
class AssessmentConfigManager {
  private current: AssessmentConfigModel;
  private defaultConfig: AssessmentConfigModel;
  private changes: ConfigChangeRecord[] = [];
  private policy: DurationPolicy = new DurationPolicy();

  public constructor() {
    this.defaultConfig = new AssessmentConfigModel(DURATION_DEFAULT, [DEFAULT_ALLOWED_APP]);
    this.current = this.defaultConfig;
  }

  public getCurrent(): AssessmentConfigModel {
    return this.current;
  }

  public getDefault(): AssessmentConfigModel {
    return this.defaultConfig;
  }

  public isAtDefaults(): boolean {
    return this.current.equals(this.defaultConfig);
  }

  public apply(next: AssessmentConfigModel): AssessmentConfigModel {
    const normalized: AssessmentConfigModel = next.normalize();
    this.recordFieldChange(ConfigField.DURATION, `${this.current.getDuration()}`, `${normalized.getDuration()}`);
    if (this.current.getAllowedApps().join(',') !== normalized.getAllowedApps().join(',')) {
      this.recordFieldChange(ConfigField.ALLOWED_APPS, this.current.getAllowedApps().join(','),
        normalized.getAllowedApps().join(','));
    }
    this.current = normalized;
    return this.current;
  }

  public applyDuration(duration: number): AssessmentConfigModel {
    return this.apply(this.current.withDuration(duration));
  }

  public applyAllowedApps(apps: string[]): AssessmentConfigModel {
    return this.apply(this.current.withAllowedApps(apps));
  }

  public reset(): void {
    this.current = this.defaultConfig;
    this.changes = [];
  }

  private recordFieldChange(field: ConfigField, from: string, to: string): void {
    if (from === to) {
      return;
    }
    const record: ConfigChangeRecord = {
      field: field,
      from: from,
      to: to,
      timestamp: Date.now()
    };
    this.changes.push(record);
  }

  public changeCount(): number {
    return this.changes.length;
  }

  public getChanges(): ConfigChangeRecord[] {
    return this.changes.slice();
  }

  public lastChange(): ConfigChangeRecord | null {
    if (this.changes.length === 0) {
      return null;
    }
    return this.changes[this.changes.length - 1];
  }

  public countChangesOf(field: ConfigField): number {
    let count: number = 0;
    for (let i = 0; i < this.changes.length; i++) {
      if (this.changes[i].field === field) {
        count++;
      }
    }
    return count;
  }

  public diff(other: AssessmentConfigModel): ConfigDrift {
    let added: number = 0;
    let removed: number = 0;
    const mine: string[] = this.current.getAllowedApps();
    const theirs: string[] = other.getAllowedApps();
    for (let i = 0; i < theirs.length; i++) {
      if (mine.indexOf(theirs[i]) < 0) {
        added++;
      }
    }
    for (let i = 0; i < mine.length; i++) {
      if (theirs.indexOf(mine[i]) < 0) {
        removed++;
      }
    }
    const drift: ConfigDrift = {
      durationChanged: this.current.getDuration() !== other.getDuration(),
      appsAdded: added,
      appsRemoved: removed
    };
    return drift;
  }

  // The selection index that the entry page keeps must stay inside the candidate list.
  public selectionIndexOfDefault(): number {
    return this.policy.indexOf(this.current.getDuration());
  }
}

/**
 * Invariant checker of an assessment configuration.
 */
class ConfigAuditor {
  private rules: BundleNameRules = new BundleNameRules();
  private policy: DurationPolicy = new DurationPolicy();

  public durationIsCandidate(snapshot: AssessmentConfigSnapshot): boolean {
    return this.policy.isValid(snapshot.duration);
  }

  public whitelistWithinCapacity(snapshot: AssessmentConfigSnapshot): boolean {
    return snapshot.allowedApps.length <= MAX_ALLOWED_APPS;
  }

  public namesWellFormed(snapshot: AssessmentConfigSnapshot): boolean {
    for (let i = 0; i < snapshot.allowedApps.length; i++) {
      if (!this.rules.isWellFormed(snapshot.allowedApps[i])) {
        return false;
      }
    }
    return true;
  }

  public totalCharsBounded(snapshot: AssessmentConfigSnapshot): boolean {
    const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
    whitelist.seed(snapshot.allowedApps);
    return whitelist.totalChars() <= MAX_WHITELIST_CHARS;
  }

  public hasNoDuplicates(snapshot: AssessmentConfigSnapshot): boolean {
    const seen: string[] = [];
    for (let i = 0; i < snapshot.allowedApps.length; i++) {
      if (seen.indexOf(snapshot.allowedApps[i]) >= 0) {
        return false;
      }
      seen.push(snapshot.allowedApps[i]);
    }
    return true;
  }

  public allHold(snapshot: AssessmentConfigSnapshot): boolean {
    return this.durationIsCandidate(snapshot) && this.whitelistWithinCapacity(snapshot) &&
      this.namesWellFormed(snapshot) && this.totalCharsBounded(snapshot) && this.hasNoDuplicates(snapshot);
  }
}

export default function assessmentConfigManagerValidationTest() {
  describe('AssessmentConfigManagerValidation_Test', () => {
    let driver: Driver;
    let policy: DurationPolicy;
    let rules: BundleNameRules;
    let auditor: ConfigAuditor;
    let serializer: ConfigSerializer;

    beforeAll(async () => {
      driver = getDriver();
      policy = new DurationPolicy();
      rules = new BundleNameRules();
      auditor = new ConfigAuditor();
      serializer = new ConfigSerializer();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the duration policy exposes the four documented candidates.
     * Expectation: the values are default, ten, thirty and sixty minutes in ascending order.
     */
    it('Assessment_AssessmentConfigDurationPolicy_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicy_001, begin');
      const candidates: number[] = policy.getCandidates();
      expect(policy.count()).assertEqual(4);
      expect(candidates[0]).assertEqual(DURATION_DEFAULT);
      expect(candidates[1]).assertEqual(DURATION_TEN_MINUTES);
      expect(candidates[2]).assertEqual(DURATION_THIRTY_MINUTES);
      expect(candidates[3]).assertEqual(DURATION_SIXTY_MINUTES);
      expect(policy.isStrictlyIncreasing()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicy_001, end');
    });

    /**
     * Scenario: membership of a duration value in the candidate list.
     * Expectation: documented values are accepted and arbitrary values are rejected.
     */
    it('Assessment_AssessmentConfigDurationPolicyMembership_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicyMembership_002, begin');
      expect(policy.contains(DURATION_DEFAULT)).assertTrue();
      expect(policy.contains(DURATION_TEN_MINUTES)).assertTrue();
      expect(policy.contains(DURATION_THIRTY_MINUTES)).assertTrue();
      expect(policy.contains(DURATION_SIXTY_MINUTES)).assertTrue();
      expect(policy.contains(12345)).assertFalse();
      expect(policy.contains(INVALID_DURATION)).assertFalse();
      expect(policy.isValid(DURATION_DEFAULT)).assertTrue();
      expect(policy.isValid(INVALID_DURATION)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicyMembership_002, end');
    });

    /**
     * Scenario: index based access of the candidate list.
     * Expectation: indices map to the documented values and out of range answers the sentinel.
     */
    it('Assessment_AssessmentConfigDurationPolicyIndex_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicyIndex_003, begin');
      expect(policy.candidateAt(0)).assertEqual(DURATION_DEFAULT);
      expect(policy.candidateAt(3)).assertEqual(DURATION_SIXTY_MINUTES);
      expect(policy.candidateAt(4)).assertEqual(INVALID_DURATION);
      expect(policy.candidateAt(-2)).assertEqual(INVALID_DURATION);
      expect(policy.indexOf(DURATION_THIRTY_MINUTES)).assertEqual(2);
      expect(policy.indexOf(999)).assertEqual(INVALID_INDEX);
      expect(policy.clampIndex(-5)).assertEqual(0);
      expect(policy.clampIndex(9)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicyIndex_003, end');
    });

    /**
     * Scenario: nearest candidate lookup for durations that are off the grid.
     * Expectation: the closest candidate is selected and ties resolve to the earlier one.
     */
    it('Assessment_AssessmentConfigDurationPolicyNearest_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicyNearest_004, begin');
      expect(policy.nearest(1)).assertEqual(DURATION_DEFAULT);
      expect(policy.nearest(400000)).assertEqual(DURATION_TEN_MINUTES);
      expect(policy.nearest(1200000)).assertEqual(DURATION_TEN_MINUTES);
      expect(policy.nearest(1500000)).assertEqual(DURATION_THIRTY_MINUTES);
      expect(policy.nearest(5000000)).assertEqual(DURATION_SIXTY_MINUTES);
      expect(policy.nearest(0)).assertEqual(DURATION_DEFAULT);
      expect(policy.nearest(-100)).assertEqual(DURATION_DEFAULT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicyNearest_004, end');
    });

    /**
     * Scenario: the display label of every candidate.
     * Expectation: the zero value shows the default label and minutes are rendered plainly.
     */
    it('Assessment_AssessmentConfigDurationPolicyLabels_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicyLabels_005, begin');
      expect(policy.labelOf(DURATION_DEFAULT)).assertEqual('Default duration');
      expect(policy.labelOf(DURATION_TEN_MINUTES)).assertEqual('10 min');
      expect(policy.labelOf(DURATION_THIRTY_MINUTES)).assertEqual('30 min');
      expect(policy.labelOf(DURATION_SIXTY_MINUTES)).assertEqual('60 min');
      expect(policy.labelOf(INVALID_DURATION)).assertEqual('Invalid duration');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicyLabels_005, end');
    });

    /**
     * Scenario: the boundary helpers of the policy.
     * Expectation: zero is the default and sixty minutes is the maximum candidate.
     */
    it('Assessment_AssessmentConfigDurationPolicyBoundaries_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicyBoundaries_006, begin');
      expect(policy.isZero(DURATION_DEFAULT)).assertTrue();
      expect(policy.isZero(DURATION_TEN_MINUTES)).assertFalse();
      expect(policy.isMaximum(DURATION_SIXTY_MINUTES)).assertTrue();
      expect(policy.isMaximum(DURATION_THIRTY_MINUTES)).assertFalse();
      expect(DURATION_SIXTY_MINUTES / MILLIS_PER_MINUTE).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicyBoundaries_006, end');
    });

    /**
     * Scenario: the candidate getter returns a defensive copy.
     * Expectation: mutating the copy leaves the policy untouched.
     */
    it('Assessment_AssessmentConfigDurationPolicyCopy_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicyCopy_007, begin');
      const copy: number[] = policy.getCandidates();
      copy.push(123456);
      copy[0] = 99;
      expect(policy.count()).assertEqual(4);
      expect(policy.candidateAt(0)).assertEqual(DURATION_DEFAULT);
      expect(policy.getCandidates().length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigDurationPolicyCopy_007, end');
    });

    /**
     * Scenario: grammar check of a well formed bundle name.
     * Expectation: the default sample bundle and other three segment names are accepted.
     */
    it('Assessment_AssessmentBundleRulesWellFormed_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesWellFormed_008, begin');
      expect(rules.isWellFormed(DEFAULT_ALLOWED_APP)).assertTrue();
      expect(rules.isWellFormed('com.samples.dictionary')).assertTrue();
      expect(rules.isWellFormed('com.samples.app1')).assertTrue();
      expect(rules.isWellFormed('a.b')).assertTrue();
      expect(rules.isWellFormed('ohos.app.hap')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesWellFormed_008, end');
    });

    /**
     * Scenario: segment counting of the grammar checker.
     * Expectation: a name without a dot counts one segment, the sample bundle counts three.
     */
    it('Assessment_AssessmentBundleRulesSegments_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesSegments_009, begin');
      expect(rules.countSegments('')).assertEqual(0);
      expect(rules.countSegments('com')).assertEqual(1);
      expect(rules.countSegments('com.samples')).assertEqual(2);
      expect(rules.countSegments(DEFAULT_ALLOWED_APP)).assertEqual(3);
      expect(rules.firstSegment(DEFAULT_ALLOWED_APP)).assertEqual('com');
      expect(rules.lastSegment(DEFAULT_ALLOWED_APP)).assertEqual('assessment');
      expect(rules.isSameVendor(DEFAULT_ALLOWED_APP, 'com.samples.dictionary')).assertTrue();
      expect(rules.isSameVendor(DEFAULT_ALLOWED_APP, 'org.samples.reader')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesSegments_009, end');
    });

    /**
     * Scenario: malformed bundle names are rejected by the grammar.
     * Expectation: single segment, stray dots and consecutive dots all fail.
     */
    it('Assessment_AssessmentBundleRulesMalformed_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesMalformed_010, begin');
      expect(rules.isWellFormed('com')).assertFalse();
      expect(rules.isWellFormed('')).assertFalse();
      expect(rules.isWellFormed('.com.samples')).assertFalse();
      expect(rules.isWellFormed('com.samples.')).assertFalse();
      expect(rules.isWellFormed('com..samples')).assertFalse();
      expect(rules.isWellFormed('com.samples..app')).assertFalse();
      expect(rules.isWellFormed('..')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesMalformed_010, end');
    });

    /**
     * Scenario: uppercase and punctuation are rejected by the grammar.
     * Expectation: only lowercase letters, digits and underscores form a valid segment.
     */
    it('Assessment_AssessmentBundleRulesCharacters_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesCharacters_011, begin');
      expect(rules.isWellFormed('com.Samples.app')).assertFalse();
      expect(rules.isWellFormed('not-a-bundle-name')).assertFalse();
      expect(rules.isWellFormed('com.samples.app one')).assertFalse();
      expect(rules.isWellFormed('com.samples.app/one')).assertFalse();
      expect(rules.isWellFormed('com.samples.app:one')).assertFalse();
      expect(rules.isSegmentValid('_app')).assertTrue();
      expect(rules.isSegmentValid('app_1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesCharacters_011, end');
    });

    /**
     * Scenario: digits and underscores inside a segment.
     * Expectation: both are accepted as long as the segment is not empty.
     */
    it('Assessment_AssessmentBundleRulesDigitsUnderscore_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesDigitsUnderscore_012, begin');
      expect(rules.isSegmentValid('1')).assertTrue();
      expect(rules.isSegmentValid('app1')).assertTrue();
      expect(rules.isSegmentValid('_')).assertTrue();
      expect(rules.isSegmentValid('a_b_c')).assertTrue();
      expect(rules.isSegmentValid('')).assertFalse();
      expect(rules.isWellFormed('com.123.456')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesDigitsUnderscore_012, end');
    });

    /**
     * Scenario: the segment length bounds of the grammar.
     * Expectation: one character is enough and sixty five characters overflow the bound.
     */
    it('Assessment_AssessmentBundleRulesLengthBounds_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesLengthBounds_013, begin');
      const shortSegment: string = 'a';
      const atLimit: string = 'a'.repeat(MAX_SEGMENT_LENGTH);
      const overLimit: string = 'a'.repeat(MAX_SEGMENT_LENGTH + 1);
      expect(rules.isSegmentValid(shortSegment)).assertTrue();
      expect(rules.isSegmentValid(atLimit)).assertTrue();
      expect(rules.isSegmentValid(overLimit)).assertFalse();
      expect(rules.isWellFormed(`${atLimit}.${atLimit}`)).assertTrue();
      expect(rules.isWellFormed(`${overLimit}.app`)).assertFalse();
      expect(MIN_SEGMENT_LENGTH).assertEqual(1);
      expect(MIN_BUNDLE_SEGMENTS).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesLengthBounds_013, end');
    });

    /**
     * Scenario: normalization of user input.
     * Expectation: surrounding whitespace is removed and the content is preserved.
     */
    it('Assessment_AssessmentBundleRulesNormalize_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesNormalize_014, begin');
      expect(rules.normalize('  com.samples.app  ')).assertEqual('com.samples.app');
      expect(rules.normalize('\tcom.samples.app\n')).assertEqual('com.samples.app');
      expect(rules.normalize('')).assertEqual('');
      expect(rules.normalize('   ')).assertEqual('');
      expect(rules.isWellFormed(rules.normalize('  com.samples.app '))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesNormalize_014, end');
    });

    /**
     * Scenario: the total bundle name length bound.
     * Expectation: a name above the documented limit is rejected even when segments are short.
     */
    it('Assessment_AssessmentBundleRulesTotalLength_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesTotalLength_015, begin');
      const longName: string = `${'a'.repeat(64)}.${'b'.repeat(64)}.${'c'.repeat(64)}.${'d'.repeat(61)}`;
      expect(longName.length > MAX_BUNDLE_LENGTH).assertTrue();
      expect(rules.isWellFormed(longName)).assertFalse();
      expect(rules.isWellFormed(`${'a'.repeat(64)}.${'b'.repeat(64)}`)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentBundleRulesTotalLength_015, end');
    });

    /**
     * Scenario: a whitelist is created empty.
     * Expectation: the size is zero and the capacity guard reports a free slot.
     */
    it('Assessment_AssessmentWhitelistInitial_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistInitial_016, begin');
      const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
      expect(whitelist.size()).assertEqual(0);
      expect(whitelist.isEmpty()).assertTrue();
      expect(whitelist.isFull()).assertFalse();
      expect(whitelist.totalChars()).assertEqual(0);
      expect(whitelist.copy().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistInitial_016, end');
    });

    /**
     * Scenario: a valid bundle name is inserted.
     * Expectation: the insertion is accepted and the entry becomes observable.
     */
    it('Assessment_AssessmentWhitelistAdd_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistAdd_017, begin');
      const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
      const result: WhitelistAddResult = whitelist.add(DEFAULT_ALLOWED_APP);
      expect(result.accepted).assertTrue();
      expect(result.outcome).assertEqual(AddOutcome.ACCEPTED);
      expect(result.size).assertEqual(1);
      expect(whitelist.size()).assertEqual(1);
      expect(whitelist.contains(DEFAULT_ALLOWED_APP)).assertTrue();
      expect(whitelist.at(0)).assertEqual(DEFAULT_ALLOWED_APP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistAdd_017, end');
    });

    /**
     * Scenario: a bundle name is inserted twice.
     * Expectation: the second insertion is rejected as duplicated and the size is unchanged.
     */
    it('Assessment_AssessmentWhitelistDuplicate_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistDuplicate_018, begin');
      const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
      whitelist.add(DEFAULT_ALLOWED_APP);
      const second: WhitelistAddResult = whitelist.add(DEFAULT_ALLOWED_APP);
      expect(second.accepted).assertFalse();
      expect(second.outcome).assertEqual(AddOutcome.DUPLICATED);
      expect(whitelist.size()).assertEqual(1);
      expect(whitelist.indexOf(DEFAULT_ALLOWED_APP)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistDuplicate_018, end');
    });

    /**
     * Scenario: blank input is inserted.
     * Expectation: the insertion is rejected before the grammar runs.
     */
    it('Assessment_AssessmentWhitelistEmpty_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistEmpty_019, begin');
      const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
      expect(whitelist.add('').outcome).assertEqual(AddOutcome.EMPTY);
      expect(whitelist.add('   ').outcome).assertEqual(AddOutcome.EMPTY);
      expect(whitelist.add('\t\n').outcome).assertEqual(AddOutcome.EMPTY);
      expect(whitelist.size()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistEmpty_019, end');
    });

    /**
     * Scenario: a malformed bundle name is inserted.
     * Expectation: the insertion is rejected by the grammar and the whitelist stays empty.
     */
    it('Assessment_AssessmentWhitelistInvalidName_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistInvalidName_020, begin');
      const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
      expect(whitelist.add('not-a-bundle-name').outcome).assertEqual(AddOutcome.INVALID_NAME);
      expect(whitelist.add('com').outcome).assertEqual(AddOutcome.INVALID_NAME);
      expect(whitelist.add('com..samples').outcome).assertEqual(AddOutcome.INVALID_NAME);
      expect(whitelist.size()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistInvalidName_020, end');
    });

    /**
     * Scenario: the capacity of the whitelist is reached.
     * Expectation: twenty entries are accepted and the twenty first is rejected.
     */
    it('Assessment_AssessmentWhitelistCapacity_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistCapacity_021, begin');
      const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
      let accepted: number = 0;
      for (let i = 0; i < MAX_ALLOWED_APPS; i++) {
        const name: string = `com.app${`${i}`.padStart(2, '0')}`;
        if (whitelist.add(name).accepted) {
          accepted++;
        }
      }
      expect(accepted).assertEqual(MAX_ALLOWED_APPS);
      expect(whitelist.size()).assertEqual(MAX_ALLOWED_APPS);
      expect(whitelist.isFull()).assertTrue();
      const overflow: WhitelistAddResult = whitelist.add('com.app99');
      expect(overflow.accepted).assertFalse();
      expect(overflow.outcome).assertEqual(AddOutcome.CAPACITY);
      expect(whitelist.size()).assertEqual(MAX_ALLOWED_APPS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistCapacity_021, end');
    });

    /**
     * Scenario: removal by index.
     * Expectation: the entry disappears and an out of range index is a no operation.
     */
    it('Assessment_AssessmentWhitelistRemoveAt_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistRemoveAt_022, begin');
      const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
      whitelist.add(DEFAULT_ALLOWED_APP);
      whitelist.add('com.samples.dictionary');
      whitelist.add('com.samples.reader');
      expect(whitelist.removeAt(1)).assertTrue();
      expect(whitelist.size()).assertEqual(2);
      expect(whitelist.contains('com.samples.dictionary')).assertFalse();
      expect(whitelist.at(1)).assertEqual('com.samples.reader');
      expect(whitelist.removeAt(5)).assertFalse();
      expect(whitelist.removeAt(-1)).assertFalse();
      expect(whitelist.size()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistRemoveAt_022, end');
    });

    /**
     * Scenario: removal by name.
     * Expectation: the named entry is removed, an unknown name is a no operation.
     */
    it('Assessment_AssessmentWhitelistRemoveByName_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistRemoveByName_023, begin');
      const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
      whitelist.add(DEFAULT_ALLOWED_APP);
      whitelist.add('com.samples.dictionary');
      expect(whitelist.remove(DEFAULT_ALLOWED_APP)).assertTrue();
      expect(whitelist.size()).assertEqual(1);
      expect(whitelist.remove(DEFAULT_ALLOWED_APP)).assertFalse();
      expect(whitelist.remove('com.unknown.app')).assertFalse();
      expect(whitelist.at(0)).assertEqual('com.samples.dictionary');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistRemoveByName_023, end');
    });

    /**
     * Scenario: the copy getter of the whitelist.
     * Expectation: the returned array is independent from the internal storage.
     */
    it('Assessment_AssessmentWhitelistCopy_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistCopy_024, begin');
      const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
      whitelist.add(DEFAULT_ALLOWED_APP);
      const copy: string[] = whitelist.copy();
      copy.push('com.injected.app');
      expect(whitelist.size()).assertEqual(1);
      expect(whitelist.contains('com.injected.app')).assertFalse();
      expect(whitelist.copy().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistCopy_024, end');
    });

    /**
     * Scenario: the concatenated length accounting of the whitelist.
     * Expectation: entries plus separators are counted and an empty list reports zero.
     */
    it('Assessment_AssessmentWhitelistTotalChars_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistTotalChars_025, begin');
      const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
      whitelist.add('com.a');
      whitelist.add('com.b');
      const expected: number = 'com.a'.length + 'com.b'.length + 1;
      expect(whitelist.totalChars()).assertEqual(expected);
      whitelist.clear();
      expect(whitelist.totalChars()).assertEqual(0);
      expect(whitelist.size()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistTotalChars_025, end');
    });

    /**
     * Scenario: the concatenated length bound rejects a long insertion.
     * Expectation: the sixteenth long entry crosses the bound and is rejected with the reason.
     */
    it('Assessment_AssessmentWhitelistTooLong_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistTooLong_026, begin');
      const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
      let lastOutcome: AddOutcome = AddOutcome.ACCEPTED;
      for (let i = 0; i < 15; i++) {
        const name: string = `${'a'.repeat(60)}${`${i}`.padStart(3, '0')}.${'b'.repeat(64)}`;
        lastOutcome = whitelist.add(name).outcome;
      }
      expect(lastOutcome).assertEqual(AddOutcome.ACCEPTED);
      expect(whitelist.size()).assertEqual(15);
      const extra: string = `${'c'.repeat(62)}00.${'b'.repeat(64)}`;
      expect(whitelist.add(extra).outcome).assertEqual(AddOutcome.TOO_LONG);
      expect(whitelist.size()).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistTooLong_026, end');
    });

    /**
     * Scenario: clearing the whitelist.
     * Expectation: every entry is dropped and the whitelist becomes empty again.
     */
    it('Assessment_AssessmentWhitelistClear_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistClear_027, begin');
      const whitelist: AllowedAppsWhitelist = new AllowedAppsWhitelist();
      whitelist.seed([DEFAULT_ALLOWED_APP, 'com.samples.dictionary']);
      expect(whitelist.size()).assertEqual(2);
      whitelist.clear();
      expect(whitelist.size()).assertEqual(0);
      expect(whitelist.isEmpty()).assertTrue();
      expect(whitelist.isFull()).assertFalse();
      expect(whitelist.add(DEFAULT_ALLOWED_APP).accepted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentWhitelistClear_027, end');
    });

    /**
     * Scenario: the default configuration of the entry page.
     * Expectation: duration zero and one whitelist entry equal to the sample bundle.
     */
    it('Assessment_AssessmentConfigModelDefaults_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelDefaults_028, begin');
      const config: AssessmentConfigModel = new AssessmentConfigModel(DURATION_DEFAULT, [DEFAULT_ALLOWED_APP]);
      expect(config.getDuration()).assertEqual(DURATION_DEFAULT);
      expect(config.countAllowedApps()).assertEqual(1);
      expect(config.getAllowedApps()[0]).assertEqual(DEFAULT_ALLOWED_APP);
      expect(config.describe()).assertEqual('duration=0, allowedApps=com.samples.assessment');
      expect(config.validate().valid).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelDefaults_028, end');
    });

    /**
     * Scenario: normalization of a configuration with messy entries.
     * Expectation: blanks, malformed names and duplicates are dropped while order is kept.
     */
    it('Assessment_AssessmentConfigModelNormalize_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelNormalize_029, begin');
      const raw: AssessmentConfigModel = new AssessmentConfigModel(DURATION_TEN_MINUTES,
        [' com.samples.app ', '', 'not-a-bundle', 'com.samples.app', 'com.samples.reader']);
      const clean: AssessmentConfigModel = raw.normalize();
      expect(clean.countAllowedApps()).assertEqual(2);
      expect(clean.getAllowedApps()[0]).assertEqual('com.samples.app');
      expect(clean.getAllowedApps()[1]).assertEqual('com.samples.reader');
      expect(clean.getDuration()).assertEqual(DURATION_TEN_MINUTES);
      expect(raw.countAllowedApps()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelNormalize_029, end');
    });

    /**
     * Scenario: validation of a negative duration.
     * Expectation: the negative value is reported with the dedicated issue code.
     */
    it('Assessment_AssessmentConfigModelValidation_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelValidation_030, begin');
      const negative: AssessmentConfigModel = new AssessmentConfigModel(INVALID_DURATION, []);
      const negativeResult: ConfigValidationResult = negative.validate();
      expect(negativeResult.valid).assertFalse();
      expect(negativeResult.issue).assertEqual(ValidationIssue.DURATION_NEGATIVE);
      const offGrid: AssessmentConfigModel = new AssessmentConfigModel(12345, []);
      const offGridResult: ConfigValidationResult = offGrid.validate();
      expect(offGridResult.valid).assertFalse();
      expect(offGridResult.issue).assertEqual(ValidationIssue.DURATION_NOT_CANDIDATE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelValidation_030, end');
    });

    /**
     * Scenario: validation of an overfull whitelist.
     * Expectation: the capacity issue is reported before the grammar is checked.
     */
    it('Assessment_AssessmentConfigModelValidationCapacity_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelValidationCapacity_031, begin');
      const apps: string[] = [];
      for (let i = 0; i < MAX_ALLOWED_APPS + 1; i++) {
        apps.push(`com.app${`${i}`.padStart(2, '0')}`);
      }
      const config: AssessmentConfigModel = new AssessmentConfigModel(DURATION_TEN_MINUTES, apps);
      const result: ConfigValidationResult = config.validate();
      expect(result.valid).assertFalse();
      expect(result.issue).assertEqual(ValidationIssue.TOO_MANY_APPS);
      expect(result.detail.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelValidationCapacity_031, end');
    });

    /**
     * Scenario: validation of malformed and duplicated whitelist entries.
     * Expectation: the offending entry is named in the detail text.
     */
    it('Assessment_AssessmentConfigModelValidationNames_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelValidationNames_032, begin');
      const malformed: AssessmentConfigModel = new AssessmentConfigModel(DURATION_TEN_MINUTES,
        [DEFAULT_ALLOWED_APP, 'bad-name']);
      expect(malformed.validate().issue).assertEqual(ValidationIssue.APP_NAME_INVALID);
      const duplicated: AssessmentConfigModel = new AssessmentConfigModel(DURATION_TEN_MINUTES,
        [DEFAULT_ALLOWED_APP, DEFAULT_ALLOWED_APP]);
      const result: ConfigValidationResult = duplicated.validate();
      expect(result.issue).assertEqual(ValidationIssue.APP_NAME_DUPLICATED);
      expect(result.detail.includes(DEFAULT_ALLOWED_APP)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelValidationNames_032, end');
    });

    /**
     * Scenario: equality of two configurations.
     * Expectation: the comparison is order sensitive for the whitelist and value based elsewhere.
     */
    it('Assessment_AssessmentConfigModelEquals_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelEquals_033, begin');
      const left: AssessmentConfigModel = new AssessmentConfigModel(DURATION_TEN_MINUTES,
        ['com.samples.app', 'com.samples.reader']);
      const same: AssessmentConfigModel = new AssessmentConfigModel(DURATION_TEN_MINUTES,
        ['com.samples.app', 'com.samples.reader']);
      const reordered: AssessmentConfigModel = new AssessmentConfigModel(DURATION_TEN_MINUTES,
        ['com.samples.reader', 'com.samples.app']);
      const otherDuration: AssessmentConfigModel = new AssessmentConfigModel(DURATION_THIRTY_MINUTES,
        ['com.samples.app', 'com.samples.reader']);
      expect(left.equals(same)).assertTrue();
      expect(left.equals(otherDuration)).assertFalse();
      expect(left.equals(reordered)).assertFalse();
      expect(left.equals(new AssessmentConfigModel(DURATION_TEN_MINUTES, ['com.samples.app']))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelEquals_033, end');
    });

    /**
     * Scenario: the derived builders of the model.
     * Expectation: the builders return new instances and leave the receiver untouched.
     */
    it('Assessment_AssessmentConfigModelBuilders_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelBuilders_034, begin');
      const base: AssessmentConfigModel = new AssessmentConfigModel(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      const longer: AssessmentConfigModel = base.withDuration(DURATION_SIXTY_MINUTES);
      const broader: AssessmentConfigModel = base.withAllowedApps(['com.samples.reader']);
      expect(longer.getDuration()).assertEqual(DURATION_SIXTY_MINUTES);
      expect(base.getDuration()).assertEqual(DURATION_TEN_MINUTES);
      expect(broader.countAllowedApps()).assertEqual(1);
      expect(broader.getAllowedApps()[0]).assertEqual('com.samples.reader');
      expect(base.getAllowedApps()[0]).assertEqual(DEFAULT_ALLOWED_APP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelBuilders_034, end');
    });

    /**
     * Scenario: the snapshot of a configuration.
     * Expectation: the snapshot carries both fields and owns its whitelist copy.
     */
    it('Assessment_AssessmentConfigModelSnapshot_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelSnapshot_035, begin');
      const config: AssessmentConfigModel = new AssessmentConfigModel(DURATION_THIRTY_MINUTES,
        [DEFAULT_ALLOWED_APP]);
      const snapshot: AssessmentConfigSnapshot = config.snapshot();
      expect(snapshot.duration).assertEqual(DURATION_THIRTY_MINUTES);
      expect(snapshot.allowedApps.length).assertEqual(1);
      snapshot.allowedApps.push('com.injected.app');
      expect(config.countAllowedApps()).assertEqual(1);
      expect(auditor.allHold(config.snapshot())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigModelSnapshot_035, end');
    });

    /**
     * Scenario: serialization and deserialization of a configuration.
     * Expectation: the round trip restores both fields exactly.
     */
    it('Assessment_AssessmentConfigSerializerRoundTrip_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigSerializerRoundTrip_036, begin');
      const original: AssessmentConfigModel = new AssessmentConfigModel(DURATION_THIRTY_MINUTES,
        [DEFAULT_ALLOWED_APP, 'com.samples.reader']);
      const text: string = serializer.serialize(original);
      expect(text).assertEqual('duration:1800000|apps:com.samples.assessment,com.samples.reader');
      const restored: AssessmentConfigModel | null = serializer.deserialize(text);
      expect(restored !== null).assertTrue();
      if (restored !== null) {
        expect(restored.equals(original)).assertTrue();
        expect(restored.getDuration()).assertEqual(DURATION_THIRTY_MINUTES);
        expect(restored.countAllowedApps()).assertEqual(2);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigSerializerRoundTrip_036, end');
    });

    /**
     * Scenario: serialization of a configuration with an empty whitelist.
     * Expectation: the apps field is empty and the round trip restores an empty list.
     */
    it('Assessment_AssessmentConfigSerializerEmptyApps_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigSerializerEmptyApps_037, begin');
      const original: AssessmentConfigModel = new AssessmentConfigModel(DURATION_DEFAULT, []);
      const text: string = serializer.serialize(original);
      expect(text).assertEqual('duration:0|apps:');
      const restored: AssessmentConfigModel | null = serializer.deserialize(text);
      expect(restored !== null).assertTrue();
      if (restored !== null) {
        expect(restored.getDuration()).assertEqual(DURATION_DEFAULT);
        expect(restored.countAllowedApps()).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigSerializerEmptyApps_037, end');
    });

    /**
     * Scenario: malformed wire text.
     * Expectation: the deserializer answers null instead of throwing.
     */
    it('Assessment_AssessmentConfigSerializerMalformed_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigSerializerMalformed_038, begin');
      expect(serializer.deserialize('') !== null).assertFalse();
      expect(serializer.deserialize('duration:0') !== null).assertFalse();
      expect(serializer.deserialize('duration:0|apps:a|extra') !== null).assertFalse();
      expect(serializer.deserialize('apps:com.a|duration:0') !== null).assertFalse();
      expect(serializer.deserialize('duration:abc|apps:com.a') !== null).assertFalse();
      expect(serializer.deserialize('duration:-5|apps:com.a') !== null).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigSerializerMalformed_038, end');
    });

    /**
     * Scenario: the serializer of a whitelist with a single entry.
     * Expectation: no list separator appears and the value is restored unchanged.
     */
    it('Assessment_AssessmentConfigSerializerSingleApp_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigSerializerSingleApp_039, begin');
      const original: AssessmentConfigModel = new AssessmentConfigModel(DURATION_SIXTY_MINUTES,
        [DEFAULT_ALLOWED_APP]);
      const text: string = serializer.serialize(original);
      expect(text.indexOf(',')).assertEqual(-1);
      const restored: AssessmentConfigModel | null = serializer.deserialize(text);
      expect(restored !== null).assertTrue();
      if (restored !== null) {
        expect(restored.getAllowedApps()[0]).assertEqual(DEFAULT_ALLOWED_APP);
        expect(restored.getDuration()).assertEqual(DURATION_SIXTY_MINUTES);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigSerializerSingleApp_039, end');
    });

    /**
     * Scenario: a freshly created manager.
     * Expectation: the current configuration equals the default one and the journal is empty.
     */
    it('Assessment_AssessmentManagerInitial_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerInitial_040, begin');
      const manager: AssessmentConfigManager = new AssessmentConfigManager();
      expect(manager.isAtDefaults()).assertTrue();
      expect(manager.getCurrent().getDuration()).assertEqual(DURATION_DEFAULT);
      expect(manager.getCurrent().countAllowedApps()).assertEqual(1);
      expect(manager.changeCount()).assertEqual(0);
      expect(manager.lastChange() === null).assertTrue();
      expect(manager.selectionIndexOfDefault()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerInitial_040, end');
    });

    /**
     * Scenario: applying a new configuration to the manager.
     * Expectation: the current value follows the applied configuration and the journal grows.
     */
    it('Assessment_AssessmentManagerApply_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerApply_041, begin');
      const manager: AssessmentConfigManager = new AssessmentConfigManager();
      const applied: AssessmentConfigModel =
        manager.apply(new AssessmentConfigModel(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP, 'com.samples.reader']));
      expect(applied.getDuration()).assertEqual(DURATION_TEN_MINUTES);
      expect(manager.getCurrent().countAllowedApps()).assertEqual(2);
      expect(manager.isAtDefaults()).assertFalse();
      expect(manager.changeCount()).assertEqual(2);
      expect(manager.countChangesOf(ConfigField.DURATION)).assertEqual(1);
      expect(manager.countChangesOf(ConfigField.ALLOWED_APPS)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerApply_041, end');
    });

    /**
     * Scenario: applying the same configuration twice.
     * Expectation: the second application records no change because nothing differs.
     */
    it('Assessment_AssessmentManagerApplyIdempotent_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerApplyIdempotent_042, begin');
      const manager: AssessmentConfigManager = new AssessmentConfigManager();
      const config: AssessmentConfigModel = new AssessmentConfigModel(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      manager.apply(config);
      const afterFirst: number = manager.changeCount();
      manager.apply(config);
      expect(manager.changeCount()).assertEqual(afterFirst);
      expect(manager.getCurrent().getDuration()).assertEqual(DURATION_TEN_MINUTES);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerApplyIdempotent_042, end');
    });

    /**
     * Scenario: applying a duration only change.
     * Expectation: only the duration field is journaled.
     */
    it('Assessment_AssessmentManagerApplyDuration_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerApplyDuration_043, begin');
      const manager: AssessmentConfigManager = new AssessmentConfigManager();
      manager.applyDuration(DURATION_SIXTY_MINUTES);
      expect(manager.getCurrent().getDuration()).assertEqual(DURATION_SIXTY_MINUTES);
      expect(manager.countChangesOf(ConfigField.DURATION)).assertEqual(1);
      expect(manager.countChangesOf(ConfigField.ALLOWED_APPS)).assertEqual(0);
      const last: ConfigChangeRecord | null = manager.lastChange();
      expect(last !== null).assertTrue();
      if (last !== null) {
        expect(last.field).assertEqual(ConfigField.DURATION);
        expect(last.to).assertEqual('3600000');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerApplyDuration_043, end');
    });

    /**
     * Scenario: applying a whitelist only change through the manager.
     * Expectation: the whitelist is normalized before it becomes current.
     */
    it('Assessment_AssessmentManagerApplyAllowedApps_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerApplyAllowedApps_044, begin');
      const manager: AssessmentConfigManager = new AssessmentConfigManager();
      manager.applyAllowedApps([DEFAULT_ALLOWED_APP, '', 'bad-name', DEFAULT_ALLOWED_APP]);
      expect(manager.getCurrent().countAllowedApps()).assertEqual(1);
      expect(manager.getCurrent().getAllowedApps()[0]).assertEqual(DEFAULT_ALLOWED_APP);
      expect(manager.countChangesOf(ConfigField.ALLOWED_APPS)).assertEqual(0);
      expect(manager.isAtDefaults()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerApplyAllowedApps_044, end');
    });

    /**
     * Scenario: resetting the manager.
     * Expectation: the current configuration returns to the default and the journal is cleared.
     */
    it('Assessment_AssessmentManagerReset_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerReset_045, begin');
      const manager: AssessmentConfigManager = new AssessmentConfigManager();
      manager.applyDuration(DURATION_THIRTY_MINUTES);
      manager.applyAllowedApps([DEFAULT_ALLOWED_APP, 'com.samples.reader']);
      expect(manager.isAtDefaults()).assertFalse();
      manager.reset();
      expect(manager.isAtDefaults()).assertTrue();
      expect(manager.changeCount()).assertEqual(0);
      expect(manager.getCurrent().getDuration()).assertEqual(DURATION_DEFAULT);
      expect(manager.getCurrent().countAllowedApps()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerReset_045, end');
    });

    /**
     * Scenario: the drift between the current configuration and a candidate.
     * Expectation: added and removed whitelist entries are counted separately.
     */
    it('Assessment_AssessmentManagerDiff_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerDiff_046, begin');
      const manager: AssessmentConfigManager = new AssessmentConfigManager();
      manager.apply(new AssessmentConfigModel(DURATION_TEN_MINUTES,
        [DEFAULT_ALLOWED_APP, 'com.samples.reader']));
      const candidate: AssessmentConfigModel = new AssessmentConfigModel(DURATION_THIRTY_MINUTES,
        [DEFAULT_ALLOWED_APP, 'com.samples.dictionary']);
      const drift: ConfigDrift = manager.diff(candidate);
      expect(drift.durationChanged).assertTrue();
      expect(drift.appsAdded).assertEqual(1);
      expect(drift.appsRemoved).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerDiff_046, end');
    });

    /**
     * Scenario: the drift of two identical configurations.
     * Expectation: no field differs and no entry is added or removed.
     */
    it('Assessment_AssessmentManagerDiffIdentical_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerDiffIdentical_047, begin');
      const manager: AssessmentConfigManager = new AssessmentConfigManager();
      const same: AssessmentConfigModel = new AssessmentConfigModel(DURATION_DEFAULT, [DEFAULT_ALLOWED_APP]);
      const drift: ConfigDrift = manager.diff(same);
      expect(drift.durationChanged).assertFalse();
      expect(drift.appsAdded).assertEqual(0);
      expect(drift.appsRemoved).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentManagerDiffIdentical_047, end');
    });

    /**
     * Scenario: the auditor accepts a valid configuration.
     * Expectation: every invariant holds for the default configuration.
     */
    it('Assessment_AssessmentAuditorHolds_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentAuditorHolds_048, begin');
      const snapshot: AssessmentConfigSnapshot = {
        duration: DURATION_TEN_MINUTES,
        allowedApps: [DEFAULT_ALLOWED_APP, 'com.samples.reader']
      };
      expect(auditor.durationIsCandidate(snapshot)).assertTrue();
      expect(auditor.whitelistWithinCapacity(snapshot)).assertTrue();
      expect(auditor.namesWellFormed(snapshot)).assertTrue();
      expect(auditor.totalCharsBounded(snapshot)).assertTrue();
      expect(auditor.hasNoDuplicates(snapshot)).assertTrue();
      expect(auditor.allHold(snapshot)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentAuditorHolds_048, end');
    });

    /**
     * Scenario: the auditor rejects an off grid duration.
     * Expectation: the duration invariant fails and the whole check fails with it.
     */
    it('Assessment_AssessmentAuditorRejectsDuration_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentAuditorRejectsDuration_049, begin');
      const snapshot: AssessmentConfigSnapshot = {
        duration: 12345,
        allowedApps: [DEFAULT_ALLOWED_APP]
      };
      expect(auditor.durationIsCandidate(snapshot)).assertFalse();
      expect(auditor.namesWellFormed(snapshot)).assertTrue();
      expect(auditor.allHold(snapshot)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentAuditorRejectsDuration_049, end');
    });

    /**
     * Scenario: the auditor rejects an invalid bundle name.
     * Expectation: the grammar invariant fails while the capacity invariant still holds.
     */
    it('Assessment_AssessmentAuditorRejectsName_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentAuditorRejectsName_050, begin');
      const snapshot: AssessmentConfigSnapshot = {
        duration: DURATION_THIRTY_MINUTES,
        allowedApps: [DEFAULT_ALLOWED_APP, 'not-a-bundle-name']
      };
      expect(auditor.namesWellFormed(snapshot)).assertFalse();
      expect(auditor.whitelistWithinCapacity(snapshot)).assertTrue();
      expect(auditor.allHold(snapshot)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentAuditorRejectsName_050, end');
    });

    /**
     * Scenario: the auditor rejects duplicated whitelist entries.
     * Expectation: the duplicate invariant fails even when the names are well formed.
     */
    it('Assessment_AssessmentAuditorRejectsDuplicate_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentAuditorRejectsDuplicate_051, begin');
      const snapshot: AssessmentConfigSnapshot = {
        duration: DURATION_SIXTY_MINUTES,
        allowedApps: [DEFAULT_ALLOWED_APP, DEFAULT_ALLOWED_APP]
      };
      expect(auditor.namesWellFormed(snapshot)).assertTrue();
      expect(auditor.hasNoDuplicates(snapshot)).assertFalse();
      expect(auditor.allHold(snapshot)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentAuditorRejectsDuplicate_051, end');
    });

    /**
     * Scenario: an end to end configuration scenario through the manager.
     * Expectation: build, apply, journal, serialize and diff all agree with each other.
     */
    it('Assessment_AssessmentConfigComprehensive_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigComprehensive_053, begin');
      const manager: AssessmentConfigManager = new AssessmentConfigManager();
      manager.applyDuration(DURATION_THIRTY_MINUTES);
      manager.applyAllowedApps([DEFAULT_ALLOWED_APP, ' com.samples.reader ', 'com.samples.reader']);
      expect(manager.getCurrent().getDuration()).assertEqual(DURATION_THIRTY_MINUTES);
      expect(manager.getCurrent().countAllowedApps()).assertEqual(2);
      expect(manager.changeCount()).assertEqual(2);
      const wire: string = serializer.serialize(manager.getCurrent());
      const restored: AssessmentConfigModel | null = serializer.deserialize(wire);
      expect(restored !== null).assertTrue();
      if (restored !== null) {
        expect(restored.equals(manager.getCurrent())).assertTrue();
        expect(auditor.allHold(restored.snapshot())).assertTrue();
      }
      const drift: ConfigDrift = manager.diff(new AssessmentConfigModel(DURATION_SIXTY_MINUTES,
        [DEFAULT_ALLOWED_APP]));
      expect(drift.durationChanged).assertTrue();
      expect(drift.appsRemoved).assertEqual(1);
      expect(manager.getCurrent().validate().valid).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AssessmentConfigComprehensive_053, end');
    });
  });
}
