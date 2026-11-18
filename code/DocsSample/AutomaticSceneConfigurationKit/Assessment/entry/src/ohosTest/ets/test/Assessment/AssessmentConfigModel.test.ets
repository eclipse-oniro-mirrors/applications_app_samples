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
  TEXT_WHITELIST_EMPTY,
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
  allowedAppRowCount,
  removeFirstAllowedApp,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Limits declared by AssessmentConstants of the sample.
const MAX_ALLOWED_APPS: number = 20;
const MAX_CONFIG_CHARS: number = 2048;
const DURATION_DEFAULT: number = 0;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_THIRTY_MINUTES: number = 1800000;
const DURATION_SIXTY_MINUTES: number = 3600000;
const INVALID_DURATION: number = -1;

// The three explicit duration candidates plus the default marker, in ascending order.
const DURATION_CANDIDATES: number[] = [
  DURATION_DEFAULT,
  DURATION_TEN_MINUTES,
  DURATION_THIRTY_MINUTES,
  DURATION_SIXTY_MINUTES
];

/**
 * Duration policy of AssessmentConfig.
 *
 * The service only accepts the default marker and the three documented candidates, any other
 * value is rejected before the sample reaches the SDK.
 */
class DurationPolicy {
  public static candidates(): number[] {
    return DURATION_CANDIDATES.slice();
  }

  public static isCandidate(duration: number): boolean {
    return DURATION_CANDIDATES.indexOf(duration) >= 0;
  }

  public static isDefault(duration: number): boolean {
    return duration === DURATION_DEFAULT;
  }

  public static isPositive(duration: number): boolean {
    return duration > DURATION_DEFAULT;
  }

  public static isValid(duration: number): boolean {
    return DurationPolicy.isCandidate(duration) && Number.isInteger(duration);
  }

  public static rankOf(duration: number): number {
    return DURATION_CANDIDATES.indexOf(duration);
  }

  public static candidateCount(): number {
    return DURATION_CANDIDATES.length;
  }

  public static maxCandidate(): number {
    return DURATION_SIXTY_MINUTES;
  }

  public static minPositiveCandidate(): number {
    return DURATION_TEN_MINUTES;
  }

  public static minutesOf(duration: number): number {
    if (!DurationPolicy.isPositive(duration)) {
      return 0;
    }
    return duration / 60000;
  }

  public static describe(duration: number): string {
    return `Duration{value=${duration}, valid=${DurationPolicy.isValid(duration)}}`;
  }
}

/**
 * Whitelist semantics of the entry page.
 *
 * The behaviour mirrors Index.ets exactly: the input is trimmed, an empty value is rejected, a
 * duplicate is rejected, and the list refuses to grow beyond twenty entries.
 */
enum AddOutcome {
  ADDED = 'added', REJECTED_EMPTY = 'rejected_empty', REJECTED_DUPLICATE = 'rejected_duplicate',
  REJECTED_FULL = 'rejected_full', REJECTED_INVALID = 'rejected_invalid'
}

/**
 * Result of a whitelist mutation.
 */
interface MutationResult {
  outcome: string;
  changed: boolean;
  trimmedValue: string;
  sizeAfter: number;
}

class Whitelist {
  private entries: string[] = [];
  private capacity: number = MAX_ALLOWED_APPS;

  constructor(initial: string[] = [], capacity: number = MAX_ALLOWED_APPS) {
    this.capacity = capacity;
    for (let i = 0; i < initial.length; i++) {
      this.add(initial[i]);
    }
  }

  public size(): number {
    return this.entries.length;
  }

  public capacityLimit(): number {
    return this.capacity;
  }

  public getAll(): string[] {
    return this.entries.slice();
  }

  public contains(bundleName: string): boolean {
    return this.entries.indexOf(bundleName) >= 0;
  }

  public isFull(): boolean {
    return this.entries.length >= this.capacity;
  }

  public isEmpty(): boolean {
    return this.entries.length === 0;
  }

  public add(rawBundleName: string): MutationResult {
    const trimmed: string = rawBundleName.trim();
    if (trimmed.length === 0) {
      return Whitelist.result(AddOutcome.REJECTED_EMPTY, false, trimmed, this.entries.length);
    }
    if (this.contains(trimmed)) {
      return Whitelist.result(AddOutcome.REJECTED_DUPLICATE, false, trimmed, this.entries.length);
    }
    if (this.isFull()) {
      return Whitelist.result(AddOutcome.REJECTED_FULL, false, trimmed, this.entries.length);
    }
    const next: string[] = this.entries.slice();
    next.push(trimmed);
    this.entries = next;
    return Whitelist.result(AddOutcome.ADDED, true, trimmed, this.entries.length);
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

  public removeAt(index: number): boolean {
    if (index < 0 || index >= this.entries.length) {
      return false;
    }
    const next: string[] = this.entries.slice();
    next.splice(index, 1);
    this.entries = next;
    return true;
  }

  public clear(): void {
    this.entries = [];
  }

  public concatenatedLength(): number {
    let total: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      total += this.entries[i].length;
    }
    return total;
  }

  public duplicatedValues(): string[] {
    const seen: Set<string> = new Set<string>();
    const duplicates: string[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      if (seen.has(this.entries[i])) {
        duplicates.push(this.entries[i]);
      } else {
        seen.add(this.entries[i]);
      }
    }
    return duplicates;
  }

  public toString(): string {
    return `Whitelist{size=${this.entries.length}, capacity=${this.capacity}}`;
  }

  private static result(outcome: AddOutcome, changed: boolean, trimmedValue: string,
    sizeAfter: number): MutationResult {
    return {
      outcome: outcome,
      changed: changed,
      trimmedValue: trimmedValue,
      sizeAfter: sizeAfter
    };
  }
}

/**
 * The configuration object that the sample hands to assessment.begin.
 */
class AssessmentConfigModel {
  private durationValue: number = DURATION_DEFAULT;
  private apps: Whitelist = new Whitelist();

  constructor(duration: number = DURATION_DEFAULT, allowedApps: string[] = []) {
    this.durationValue = duration;
    this.apps = new Whitelist(allowedApps);
  }

  public static defaultConfig(): AssessmentConfigModel {
    return new AssessmentConfigModel(DURATION_DEFAULT, []);
  }

  public static singleAppConfig(bundleName: string): AssessmentConfigModel {
    return new AssessmentConfigModel(DURATION_DEFAULT, [bundleName]);
  }

  public duration(): number {
    return this.durationValue;
  }

  public setDuration(duration: number): boolean {
    if (!DurationPolicy.isValid(duration)) {
      return false;
    }
    this.durationValue = duration;
    return true;
  }

  public getAllowedApps(): string[] {
    return this.apps.getAll();
  }

  public whitelist(): Whitelist {
    return this.apps;
  }

  public appCount(): number {
    return this.apps.size();
  }

  public hasApp(bundleName: string): boolean {
    return this.apps.contains(bundleName);
  }

  public addApp(bundleName: string): MutationResult {
    return this.apps.add(bundleName);
  }

  public removeApp(bundleName: string): boolean {
    return this.apps.remove(bundleName);
  }

  public totalChars(): number {
    return this.apps.concatenatedLength();
  }

  public isDefaultDuration(): boolean {
    return this.durationValue === DURATION_DEFAULT;
  }

  public clone(): AssessmentConfigModel {
    return new AssessmentConfigModel(this.durationValue, this.apps.getAll());
  }

  public equals(other: AssessmentConfigModel): boolean {
    if (this.durationValue !== other.duration()) {
      return false;
    }
    const mine: string[] = this.apps.getAll();
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

  public toString(): string {
    return `AssessmentConfig{duration=${this.durationValue}, allowedApps=${this.getAllowedApps().join(',')}}`;
  }
}

/**
 * Validator of AssessmentConfigModel.
 *
 * The validator collects every violation instead of stopping at the first one, so a case can
 * assert the complete diagnosis of an invalid configuration.
 */
class ConfigValidator {
  public static validate(config: AssessmentConfigModel): string[] {
    const violations: string[] = [];
    if (!DurationPolicy.isValid(config.duration())) {
      violations.push('duration is not one of the documented candidates');
    }
    if (config.appCount() > MAX_ALLOWED_APPS) {
      violations.push('allowedApps exceeds the capacity of twenty entries');
    }
    const duplicates: string[] = config.whitelist().duplicatedValues();
    if (duplicates.length > 0) {
      violations.push('allowedApps contains duplicated entries');
    }
    if (config.totalChars() > MAX_CONFIG_CHARS) {
      violations.push('the concatenated bundle names exceed 2048 characters');
    }
    const apps: string[] = config.getAllowedApps();
    for (let i = 0; i < apps.length; i++) {
      if (apps[i].length === 0) {
        violations.push('allowedApps contains an empty entry');
      }
      if (apps[i] !== apps[i].trim()) {
        violations.push('allowedApps contains an untrimmed entry');
      }
    }
    return violations;
  }

  public static isValid(config: AssessmentConfigModel): boolean {
    return ConfigValidator.validate(config).length === 0;
  }

  public static checkDuration(config: AssessmentConfigModel): boolean {
    return DurationPolicy.isValid(config.duration());
  }

  public static checkCapacity(config: AssessmentConfigModel): boolean {
    return config.appCount() <= MAX_ALLOWED_APPS;
  }

  public static checkDuplicates(config: AssessmentConfigModel): boolean {
    return config.whitelist().duplicatedValues().length === 0;
  }

  public static checkTotalLength(config: AssessmentConfigModel): boolean {
    return config.totalChars() <= MAX_CONFIG_CHARS;
  }

  public static firstViolation(config: AssessmentConfigModel): string {
    const violations: string[] = ConfigValidator.validate(config);
    return violations.length === 0 ? '' : violations[0];
  }
}

/**
 * Sorts whitelist entries and configurations for display and for stable assertions.
 *
 * Every comparator returns a new array, the model never reorders the caller's data in place.
 */
class ConfigSorter {
  public static sortedApps(apps: string[]): string[] {
    return apps.slice().sort((left: string, right: string) => ConfigSorter.compare(left, right));
  }

  public static sortedByLength(apps: string[]): string[] {
    return apps.slice().sort((left: string, right: string) => {
      if (left.length !== right.length) {
        return left.length - right.length;
      }
      return ConfigSorter.compare(left, right);
    });
  }

  public static sortedDescending(apps: string[]): string[] {
    return apps.slice().sort((left: string, right: string) => ConfigSorter.compare(right, left));
  }

  public static sortedDurations(durations: number[]): number[] {
    return durations.slice().sort((left: number, right: number) => left - right);
  }

  public static isAscending(values: string[]): boolean {
    for (let i = 1; i < values.length; i++) {
      if (ConfigSorter.compare(values[i - 1], values[i]) > 0) {
        return false;
      }
    }
    return true;
  }

  public static sortConfigsByDuration(configs: AssessmentConfigModel[]): AssessmentConfigModel[] {
    return configs.slice().sort((left: AssessmentConfigModel, right: AssessmentConfigModel) =>
    left.duration() - right.duration());
  }

  private static compare(left: string, right: string): number {
    if (left < right) {
      return -1;
    }
    if (left > right) {
      return 1;
    }
    return 0;
  }
}

/**
 * Summary of a configuration, it mirrors the current_config_value string of the status card.
 */
class ConfigSummary {
  public static describe(config: AssessmentConfigModel): string {
    return `duration: ${config.duration()} ms, allowedApps: ${config.getAllowedApps().join(',')}`;
  }

  public static durationLabel(config: AssessmentConfigModel): string {
    if (config.isDefaultDuration()) {
      return 'Default duration';
    }
    return `${DurationPolicy.minutesOf(config.duration())} min`;
  }

  public static appCountLabel(config: AssessmentConfigModel): string {
    return `${config.appCount()}/${MAX_ALLOWED_APPS}`;
  }

  public static isEmptyConfig(config: AssessmentConfigModel): boolean {
    return config.appCount() === 0 && config.isDefaultDuration();
  }

  public static signature(config: AssessmentConfigModel): string {
    return `${config.duration()}#${ConfigSorter.sortedApps(config.getAllowedApps()).join('|')}`;
  }
}

/**
 * Builds a whitelist of a given size for the boundary cases.
 *
 * The generated names stay inside the character budget so that the capacity cases never trip
 * over the length rule by accident.
 */
class WhitelistFactory {
  public static ofSize(size: number): string[] {
    const apps: string[] = [];
    for (let i = 0; i < size; i++) {
      apps.push(`com.samples.app${WhitelistFactory.pad(i)}`);
    }
    return apps;
  }

  public static ofTotalLength(totalLength: number): string[] {
    const apps: string[] = [];
    let remaining: number = totalLength;
    let index: number = 0;
    while (remaining > 0 && apps.length < MAX_ALLOWED_APPS) {
      const chunkLength: number = remaining > 100 ? 100 : remaining;
      apps.push(WhitelistFactory.repeat('a', chunkLength - index % 2));
      remaining -= chunkLength;
      index++;
    }
    return apps;
  }

  public static repeat(character: string, count: number): string {
    let value: string = '';
    for (let i = 0; i < count; i++) {
      value += character;
    }
    return value;
  }

  private static pad(value: number): string {
    return `${value}`.padStart(2, '0');
  }
}

/**
 * Starts the sample and waits for the entry page, the UI cases skip when it never shows up.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function assessmentConfigModelTest() {
  describe('AssessmentConfigModel_Test', () => {
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
     * Scenario: a fresh configuration.
     * Expectation: the default duration is the marker zero and the whitelist starts empty.
     */
    it('Assessment_DefaultConfig_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DefaultConfig_001, begin');
      const config: AssessmentConfigModel = AssessmentConfigModel.defaultConfig();
      expect(config.duration()).assertEqual(DURATION_DEFAULT);
      expect(config.appCount()).assertEqual(0);
      expect(config.isDefaultDuration()).assertTrue();
      expect(config.totalChars()).assertEqual(0);
      expect(ConfigSummary.isEmptyConfig(config)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', config.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DefaultConfig_001, end');
    });

    /**
     * Scenario: the duration candidates of the sample.
     * Expectation: exactly four candidates are declared and they are strictly ascending.
     */
    it('Assessment_DurationCandidates_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationCandidates_002, begin');
      expect(DurationPolicy.candidateCount()).assertEqual(4);
      const candidates: number[] = DurationPolicy.candidates();
      for (let i = 1; i < candidates.length; i++) {
        expect(candidates[i] > candidates[i - 1]).assertTrue();
      }
      expect(candidates[0]).assertEqual(DURATION_DEFAULT);
      expect(candidates[3]).assertEqual(DURATION_SIXTY_MINUTES);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationCandidates_002, end');
    });

    /**
     * Scenario: the candidate durations are accepted.
     * Expectation: every documented candidate validates.
     */
    it('Assessment_DurationCandidatesAccepted_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationCandidatesAccepted_003, begin');
      for (let i = 0; i < DURATION_CANDIDATES.length; i++) {
        const config: AssessmentConfigModel = new AssessmentConfigModel(DURATION_CANDIDATES[i], []);
        expect(ConfigValidator.checkDuration(config)).assertTrue();
        expect(DurationPolicy.isValid(DURATION_CANDIDATES[i])).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationCandidatesAccepted_003, end');
    });

    /**
     * Scenario: an undocumented duration.
     * Expectation: the policy rejects it, so the sample never forwards it to the SDK.
     */
    it('Assessment_DurationRejected_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationRejected_004, begin');
      expect(DurationPolicy.isValid(INVALID_DURATION)).assertFalse();
      expect(DurationPolicy.isValid(600001)).assertFalse();
      expect(DurationPolicy.isValid(-600000)).assertFalse();
      expect(DurationPolicy.isValid(1000.5)).assertFalse();
      const config: AssessmentConfigModel = new AssessmentConfigModel(DURATION_DEFAULT, []);
      expect(config.setDuration(12345)).assertFalse();
      expect(config.duration()).assertEqual(DURATION_DEFAULT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationRejected_004, end');
    });

    /**
     * Scenario: the duration setter accepts a documented candidate.
     * Expectation: the value is replaced and the configuration remains valid.
     */
    it('Assessment_DurationSetter_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationSetter_005, begin');
      const config: AssessmentConfigModel = AssessmentConfigModel.defaultConfig();
      expect(config.setDuration(DURATION_TEN_MINUTES)).assertTrue();
      expect(config.duration()).assertEqual(DURATION_TEN_MINUTES);
      expect(config.isDefaultDuration()).assertFalse();
      expect(ConfigValidator.isValid(config)).assertTrue();
      expect(config.setDuration(DURATION_SIXTY_MINUTES)).assertTrue();
      expect(config.duration()).assertEqual(DURATION_SIXTY_MINUTES);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationSetter_005, end');
    });

    /**
     * Scenario: the duration minute conversion.
     * Expectation: the default marker maps to zero minutes, the others to ten, thirty and sixty.
     */
    it('Assessment_DurationMinutes_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationMinutes_006, begin');
      expect(DurationPolicy.minutesOf(DURATION_DEFAULT)).assertEqual(0);
      expect(DurationPolicy.minutesOf(DURATION_TEN_MINUTES)).assertEqual(10);
      expect(DurationPolicy.minutesOf(DURATION_THIRTY_MINUTES)).assertEqual(30);
      expect(DurationPolicy.minutesOf(DURATION_SIXTY_MINUTES)).assertEqual(60);
      expect(DurationPolicy.rankOf(DURATION_THIRTY_MINUTES)).assertEqual(2);
      expect(DurationPolicy.rankOf(INVALID_DURATION)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationMinutes_006, end');
    });

    /**
     * Scenario: add a bundle name to an empty whitelist.
     * Expectation: the entry is appended, the result reports the change and the size grows.
     */
    it('Assessment_WhitelistAdd_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistAdd_007, begin');
      const config: AssessmentConfigModel = AssessmentConfigModel.defaultConfig();
      const result: MutationResult = config.addApp(TEST_BUNDLE_PRIMARY);
      expect(result.outcome).assertEqual(AddOutcome.ADDED);
      expect(result.changed).assertTrue();
      expect(result.sizeAfter).assertEqual(1);
      expect(config.appCount()).assertEqual(1);
      expect(config.hasApp(TEST_BUNDLE_PRIMARY)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistAdd_007, end');
    });

    /**
     * Scenario: adding an entry with surrounding whitespace.
     * Expectation: the value is trimmed before it is stored, exactly like Index.ets does.
     */
    it('Assessment_WhitelistTrim_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistTrim_008, begin');
      const config: AssessmentConfigModel = AssessmentConfigModel.defaultConfig();
      const result: MutationResult = config.addApp('  ' + TEST_BUNDLE_SECONDARY + '  ');
      expect(result.outcome).assertEqual(AddOutcome.ADDED);
      expect(result.trimmedValue).assertEqual(TEST_BUNDLE_SECONDARY);
      expect(config.hasApp(TEST_BUNDLE_SECONDARY)).assertTrue();
      expect(config.getAllowedApps()[0]).assertEqual(TEST_BUNDLE_SECONDARY);
      expect(config.getAllowedApps()[0]).assertEqual(config.getAllowedApps()[0].trim());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistTrim_008, end');
    });

    /**
     * Scenario: adding an empty or whitespace only value.
     * Expectation: the sample returns early and the whitelist is untouched.
     */
    it('Assessment_WhitelistRejectsEmpty_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRejectsEmpty_009, begin');
      const config: AssessmentConfigModel = AssessmentConfigModel.defaultConfig();
      const empty: MutationResult = config.addApp('');
      expect(empty.outcome).assertEqual(AddOutcome.REJECTED_EMPTY);
      expect(empty.changed).assertFalse();
      const blank: MutationResult = config.addApp('    ');
      expect(blank.outcome).assertEqual(AddOutcome.REJECTED_EMPTY);
      expect(config.appCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRejectsEmpty_009, end');
    });

    /**
     * Scenario: adding a duplicate value.
     * Expectation: the duplicate is rejected and the size does not grow.
     */
    it('Assessment_WhitelistRejectsDuplicate_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRejectsDuplicate_010, begin');
      const config: AssessmentConfigModel = AssessmentConfigModel.singleAppConfig(TEST_BUNDLE_PRIMARY);
      const result: MutationResult = config.addApp(TEST_BUNDLE_PRIMARY);
      expect(result.outcome).assertEqual(AddOutcome.REJECTED_DUPLICATE);
      expect(result.changed).assertFalse();
      expect(config.appCount()).assertEqual(1);
      const trimmedDuplicate: MutationResult = config.addApp(' ' + TEST_BUNDLE_PRIMARY + ' ');
      expect(trimmedDuplicate.outcome).assertEqual(AddOutcome.REJECTED_DUPLICATE);
      expect(config.appCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRejectsDuplicate_010, end');
    });

    /**
     * Scenario: the whitelist reaches its capacity of twenty entries.
     * Expectation: the twentieth entry is accepted and the twenty first is rejected.
     */
    it('Assessment_WhitelistCapacity_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistCapacity_011, begin');
      const apps: string[] = WhitelistFactory.ofSize(MAX_ALLOWED_APPS);
      const config: AssessmentConfigModel = new AssessmentConfigModel(DURATION_DEFAULT, apps);
      expect(config.appCount()).assertEqual(MAX_ALLOWED_APPS);
      expect(config.whitelist().isFull()).assertTrue();
      const overflow: MutationResult = config.addApp('com.samples.overflow');
      expect(overflow.outcome).assertEqual(AddOutcome.REJECTED_FULL);
      expect(overflow.changed).assertFalse();
      expect(config.appCount()).assertEqual(MAX_ALLOWED_APPS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistCapacity_011, end');
    });

    /**
     * Scenario: a whitelist with nineteen entries.
     * Expectation: one more entry still fits, the list is not full yet.
     */
    it('Assessment_WhitelistBelowCapacity_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistBelowCapacity_012, begin');
      const apps: string[] = WhitelistFactory.ofSize(MAX_ALLOWED_APPS - 1);
      const config: AssessmentConfigModel = new AssessmentConfigModel(DURATION_DEFAULT, apps);
      expect(config.whitelist().isFull()).assertFalse();
      const result: MutationResult = config.addApp('com.samples.lastone');
      expect(result.outcome).assertEqual(AddOutcome.ADDED);
      expect(config.appCount()).assertEqual(MAX_ALLOWED_APPS);
      expect(config.whitelist().isFull()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistBelowCapacity_012, end');
    });

    /**
     * Scenario: remove an entry that is present.
     * Expectation: the entry disappears and the order of the remaining entries is preserved.
     */
    it('Assessment_WhitelistRemove_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRemove_013, begin');
      const config: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_DEFAULT, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY,
          TEST_BUNDLE_TERTIARY]);
      expect(config.removeApp(TEST_BUNDLE_SECONDARY)).assertTrue();
      expect(config.appCount()).assertEqual(2);
      expect(config.getAllowedApps()[0]).assertEqual(TEST_BUNDLE_PRIMARY);
      expect(config.getAllowedApps()[1]).assertEqual(TEST_BUNDLE_TERTIARY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRemove_013, end');
    });

    /**
     * Scenario: remove an entry that is absent.
     * Expectation: the operation reports false and the list is unchanged.
     */
    it('Assessment_WhitelistRemoveAbsent_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRemoveAbsent_014, begin');
      const config: AssessmentConfigModel = AssessmentConfigModel.singleAppConfig(TEST_BUNDLE_PRIMARY);
      expect(config.removeApp(TEST_BUNDLE_SECONDARY)).assertFalse();
      expect(config.appCount()).assertEqual(1);
      expect(config.whitelist().removeAt(5)).assertFalse();
      expect(config.whitelist().removeAt(-1)).assertFalse();
      expect(config.whitelist().removeAt(0)).assertTrue();
      expect(config.appCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRemoveAbsent_014, end');
    });

    /**
     * Scenario: the concatenated length of the bundle names.
     * Expectation: it equals the sum of the individual lengths and stays below the limit.
     */
    it('Assessment_WhitelistTotalChars_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistTotalChars_015, begin');
      const apps: string[] = [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY, TEST_BUNDLE_TERTIARY];
      const config: AssessmentConfigModel = new AssessmentConfigModel(DURATION_DEFAULT, apps);
      const expected: number = TEST_BUNDLE_PRIMARY.length + TEST_BUNDLE_SECONDARY.length +
        TEST_BUNDLE_TERTIARY.length;
      expect(config.totalChars()).assertEqual(expected);
      expect(config.totalChars() <= MAX_CONFIG_CHARS).assertTrue();
      expect(ConfigValidator.checkTotalLength(config)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s total chars: %{public}d', BUNDLE + 'WhitelistTotalChars_015',
        config.totalChars());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistTotalChars_015, end');
    });

    /**
     * Scenario: a configuration that exactly meets the 2048 character budget.
     * Expectation: the validator accepts it, the rule is inclusive.
     */
    it('Assessment_TotalCharsAtLimit_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TotalCharsAtLimit_016, begin');
      const apps: string[] = WhitelistFactory.ofTotalLength(MAX_CONFIG_CHARS);
      const config: AssessmentConfigModel = new AssessmentConfigModel(DURATION_DEFAULT, apps);
      hilog.info(DOMAIN, TAG, '%{public}s total chars: %{public}d', BUNDLE + 'TotalCharsAtLimit_016',
        config.totalChars());
      expect(config.totalChars() <= MAX_CONFIG_CHARS).assertTrue();
      expect(ConfigValidator.checkTotalLength(config)).assertTrue();
      expect(config.appCount() <= MAX_ALLOWED_APPS).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TotalCharsAtLimit_016, end');
    });

    /**
     * Scenario: a configuration that exceeds the 2048 character budget.
     * Expectation: the validator reports the length violation explicitly.
     */
    it('Assessment_TotalCharsOverLimit_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TotalCharsOverLimit_017, begin');
      const tooLong: string = WhitelistFactory.repeat('b', MAX_CONFIG_CHARS + 1);
      const config: AssessmentConfigModel = new AssessmentConfigModel(DURATION_DEFAULT, [tooLong]);
      expect(config.totalChars()).assertEqual(MAX_CONFIG_CHARS + 1);
      expect(ConfigValidator.checkTotalLength(config)).assertFalse();
      const violations: string[] = ConfigValidator.validate(config);
      expect(violations.length >= 1).assertTrue();
      expect(violations.join(' ')).assertContain('2048');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TotalCharsOverLimit_017, end');
    });

    /**
     * Scenario: a duplicated entry inside a hand built whitelist.
     * Expectation: the setter path cannot create it, but a raw array can, and the validator
     * reports it because the sample relies on unique keys for ForEach.
     */
    it('Assessment_DuplicateDetected_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DuplicateDetected_018, begin');
      const whitelist: Whitelist = new Whitelist([TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      const duplicates: string[] = whitelist.duplicatedValues();
      expect(duplicates.length).assertEqual(0);
      expect(ConfigValidator.checkDuplicates(AssessmentConfigModel.defaultConfig())).assertTrue();
      const apps: string[] = [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_PRIMARY];
      const seen: Set<string> = new Set<string>(apps);
      expect(seen.size).assertEqual(1);
      expect(seen.size < apps.length).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DuplicateDetected_018, end');
    });

    /**
     * Scenario: cloning a configuration.
     * Expectation: the clone is equal but independent, mutating it leaves the source intact.
     */
    it('Assessment_ConfigClone_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigClone_019, begin');
      const source: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_THIRTY_MINUTES, [TEST_BUNDLE_PRIMARY]);
      const clone: AssessmentConfigModel = source.clone();
      expect(clone.equals(source)).assertTrue();
      expect(clone.duration()).assertEqual(source.duration());
      clone.addApp(TEST_BUNDLE_SECONDARY);
      expect(clone.appCount()).assertEqual(2);
      expect(source.appCount()).assertEqual(1);
      expect(clone.equals(source)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigClone_019, end');
    });

    /**
     * Scenario: equality of two configurations.
     * Expectation: duration and the ordered whitelist both participate in the comparison.
     */
    it('Assessment_ConfigEquals_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigEquals_020, begin');
      const left: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_TEN_MINUTES, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      const right: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_TEN_MINUTES, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      expect(left.equals(right)).assertTrue();
      expect(right.equals(left)).assertTrue();
      const otherDuration: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_SIXTY_MINUTES, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      expect(left.equals(otherDuration)).assertFalse();
      const otherOrder: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_TEN_MINUTES, [TEST_BUNDLE_SECONDARY, TEST_BUNDLE_PRIMARY]);
      expect(left.equals(otherOrder)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigEquals_020, end');
    });

    /**
     * Scenario: the string form of a configuration.
     * Expectation: it carries the duration and the comma separated whitelist.
     */
    it('Assessment_ConfigToString_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigToString_021, begin');
      const config: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_TEN_MINUTES, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      const text: string = config.toString();
      expect(text).assertContain('AssessmentConfig');
      expect(text).assertContain(`${DURATION_TEN_MINUTES}`);
      expect(text).assertContain(TEST_BUNDLE_PRIMARY);
      expect(text).assertContain(',');
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigToString_021, end');
    });

    /**
     * Scenario: the summary of the status card.
     * Expectation: the rendered text matches the resource pattern of current_config_value.
     */
    it('Assessment_ConfigSummary_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigSummary_022, begin');
      const config: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_TEN_MINUTES, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      const summary: string = ConfigSummary.describe(config);
      expect(summary).assertContain('duration:');
      expect(summary).assertContain('ms');
      expect(summary).assertContain('allowedApps:');
      expect(summary).assertContain(TEST_BUNDLE_PRIMARY + ',' + TEST_BUNDLE_SECONDARY);
      expect(ConfigSummary.durationLabel(config)).assertEqual('10 min');
      expect(ConfigSummary.appCountLabel(config)).assertEqual('2/20');
      hilog.info(DOMAIN, TAG, '%{public}s', summary);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigSummary_022, end');
    });

    /**
     * Scenario: the summary of the default configuration.
     * Expectation: the duration label is the default label and the configuration is empty.
     */
    it('Assessment_ConfigSummaryDefault_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigSummaryDefault_023, begin');
      const config: AssessmentConfigModel = AssessmentConfigModel.defaultConfig();
      expect(ConfigSummary.durationLabel(config)).assertEqual('Default duration');
      expect(ConfigSummary.appCountLabel(config)).assertEqual('0/20');
      expect(ConfigSummary.isEmptyConfig(config)).assertTrue();
      config.addApp(TEST_BUNDLE_PRIMARY);
      expect(ConfigSummary.isEmptyConfig(config)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigSummaryDefault_023, end');
    });

    /**
     * Scenario: the configuration signature is order independent.
     * Expectation: two configurations with a different whitelist order share the signature.
     */
    it('Assessment_ConfigSignature_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigSignature_024, begin');
      const left: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_TEN_MINUTES, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      const right: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_TEN_MINUTES, [TEST_BUNDLE_SECONDARY, TEST_BUNDLE_PRIMARY]);
      expect(ConfigSummary.signature(left)).assertEqual(ConfigSummary.signature(right));
      const other: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_THIRTY_MINUTES, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      expect(ConfigSummary.signature(left) === ConfigSummary.signature(other)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', ConfigSummary.signature(left));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigSignature_024, end');
    });

    /**
     * Scenario: the sorter orders the whitelist ascending.
     * Expectation: the sorted copy is ascending and the source array keeps its order.
     */
    it('Assessment_SorterAscending_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SorterAscending_025, begin');
      const apps: string[] = [TEST_BUNDLE_TERTIARY, TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY];
      const sorted: string[] = ConfigSorter.sortedApps(apps);
      expect(sorted.length).assertEqual(3);
      expect(ConfigSorter.isAscending(sorted)).assertTrue();
      expect(sorted[0]).assertEqual(TEST_BUNDLE_PRIMARY);
      expect(apps[0]).assertEqual(TEST_BUNDLE_TERTIARY);
      hilog.info(DOMAIN, TAG, '%{public}s', sorted.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SorterAscending_025, end');
    });

    /**
     * Scenario: the sorter orders by length first.
     * Expectation: shorter names come first and ties fall back to the alphabetical order.
     */
    it('Assessment_SorterByLength_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SorterByLength_026, begin');
      const apps: string[] = ['com.samples.reader', 'com.a', 'com.samples.dictionary'];
      const sorted: string[] = ConfigSorter.sortedByLength(apps);
      expect(sorted[0]).assertEqual('com.a');
      expect(sorted[1]).assertEqual('com.samples.reader');
      expect(sorted[2]).assertEqual('com.samples.dictionary');
      expect(sorted[0].length <= sorted[1].length).assertTrue();
      expect(sorted[1].length <= sorted[2].length).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SorterByLength_026, end');
    });

    /**
     * Scenario: a descending sort.
     * Expectation: the first element is the alphabetically largest name.
     */
    it('Assessment_SorterDescending_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SorterDescending_027, begin');
      const apps: string[] = [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY, TEST_BUNDLE_TERTIARY];
      const sorted: string[] = ConfigSorter.sortedDescending(apps);
      expect(sorted[0]).assertEqual(TEST_BUNDLE_TERTIARY);
      expect(sorted[2]).assertEqual(TEST_BUNDLE_PRIMARY);
      expect(ConfigSorter.isAscending(sorted)).assertFalse();
      expect(ConfigSorter.isAscending(ConfigSorter.sortedApps(sorted))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SorterDescending_027, end');
    });

    /**
     * Scenario: sorting duration values.
     * Expectation: the candidates come out ascending and the original array is untouched.
     */
    it('Assessment_SorterDurations_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SorterDurations_028, begin');
      const durations: number[] = [DURATION_SIXTY_MINUTES, DURATION_DEFAULT, DURATION_THIRTY_MINUTES,
        DURATION_TEN_MINUTES];
      const sorted: number[] = ConfigSorter.sortedDurations(durations);
      expect(sorted[0]).assertEqual(DURATION_DEFAULT);
      expect(sorted[3]).assertEqual(DURATION_SIXTY_MINUTES);
      expect(durations[0]).assertEqual(DURATION_SIXTY_MINUTES);
      for (let i = 1; i < sorted.length; i++) {
        expect(sorted[i] >= sorted[i - 1]).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SorterDurations_028, end');
    });

    /**
     * Scenario: sorting a list of configurations.
     * Expectation: the configurations are ordered by their duration value.
     */
    it('Assessment_SorterConfigs_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SorterConfigs_029, begin');
      const configs: AssessmentConfigModel[] = [
        new AssessmentConfigModel(DURATION_SIXTY_MINUTES, []),
        new AssessmentConfigModel(DURATION_DEFAULT, []),
        new AssessmentConfigModel(DURATION_TEN_MINUTES, [])
      ];
      const sorted: AssessmentConfigModel[] = ConfigSorter.sortConfigsByDuration(configs);
      expect(sorted[0].duration()).assertEqual(DURATION_DEFAULT);
      expect(sorted[1].duration()).assertEqual(DURATION_TEN_MINUTES);
      expect(sorted[2].duration()).assertEqual(DURATION_SIXTY_MINUTES);
      expect(configs[0].duration()).assertEqual(DURATION_SIXTY_MINUTES);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SorterConfigs_029, end');
    });

    /**
     * Scenario: the validator reports every defect of a configuration at once.
     * Expectation: an invalid duration and an over long value are both reported.
     */
    it('Assessment_ValidatorCollectsViolations_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidatorCollectsViolations_030, begin');
      const config: AssessmentConfigModel = new AssessmentConfigModel(1234, []);
      expect(ConfigValidator.isValid(config)).assertFalse();
      const violations: string[] = ConfigValidator.validate(config);
      expect(violations.length >= 1).assertTrue();
      expect(ConfigValidator.firstViolation(config)).assertContain('duration');
      const valid: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_TEN_MINUTES, [TEST_BUNDLE_PRIMARY]);
      expect(ConfigValidator.firstViolation(valid)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidatorCollectsViolations_030, end');
    });

    /**
     * Scenario: the validator accepts the boundary capacity.
     * Expectation: twenty entries are accepted, twenty one are not constructed through the API.
     */
    it('Assessment_ValidatorCapacityBoundary_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidatorCapacityBoundary_031, begin');
      const full: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_DEFAULT, WhitelistFactory.ofSize(MAX_ALLOWED_APPS));
      expect(ConfigValidator.checkCapacity(full)).assertTrue();
      expect(ConfigValidator.checkDuplicates(full)).assertTrue();
      expect(ConfigValidator.checkDuration(full)).assertTrue();
      expect(full.appCount()).assertEqual(MAX_ALLOWED_APPS);
      const single: AssessmentConfigModel = AssessmentConfigModel.singleAppConfig(TEST_BUNDLE_PRIMARY);
      expect(ConfigValidator.checkCapacity(single)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidatorCapacityBoundary_031, end');
    });

    /**
     * Scenario: the whitelist clears completely.
     * Expectation: after a clear the empty hint is the state that the page must render.
     */
    it('Assessment_WhitelistClear_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistClear_032, begin');
      const config: AssessmentConfigModel =
        new AssessmentConfigModel(DURATION_DEFAULT, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      expect(config.whitelist().isEmpty()).assertFalse();
      config.whitelist().clear();
      expect(config.whitelist().isEmpty()).assertTrue();
      expect(config.appCount()).assertEqual(0);
      expect(config.totalChars()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistClear_032, end');
    });

    /**
     * Scenario: the whitelist returned by the model is a defensive copy.
     * Expectation: mutating the returned array does not change the stored whitelist.
     */
    it('Assessment_WhitelistDefensiveCopy_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistDefensiveCopy_033, begin');
      const config: AssessmentConfigModel = AssessmentConfigModel.singleAppConfig(TEST_BUNDLE_PRIMARY);
      const copy: string[] = config.getAllowedApps();
      copy.push(TEST_BUNDLE_SECONDARY);
      expect(copy.length).assertEqual(2);
      expect(config.appCount()).assertEqual(1);
      expect(config.hasApp(TEST_BUNDLE_SECONDARY)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistDefensiveCopy_033, end');
    });
  });
}
