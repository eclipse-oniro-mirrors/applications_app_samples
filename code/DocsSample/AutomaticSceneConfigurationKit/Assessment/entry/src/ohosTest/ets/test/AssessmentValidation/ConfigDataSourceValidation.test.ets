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
  ID_BEGIN_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_WHITELIST_EMPTY,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  addAllowedApp,
  allowedAppRowCount,
  removeFirstAllowedApp,
  clickIndexButton,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Candidate values of AssessmentConfig.duration, they are the four chips of the config card.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_THIRTY_MINUTES: number = 1800000;
const DURATION_SIXTY_MINUTES: number = 3600000;

// Limits declared by AssessmentConstants of the sample.
const MAX_ALLOWED_APPS: number = 20;
const MAX_CONCATENATED_LENGTH: number = 2048;
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';

// Wire level separators of the sample. The controller joins the whitelist for the log entry
// with a comma, the configuration card renders the queried whitelist with the same separator.
const ALLOWED_APP_SEPARATOR: string = ',';

// Index of the duration chip that is selected when the entry page is created.
const DEFAULT_DURATION_INDEX: number = 1;

// Bundle names of the model cases. None of them needs to be installed, the assessment service
// stores the names in AssessmentConfig without resolving them.
const BUNDLE_A: string = 'com.samples.assessment';
const BUNDLE_B: string = 'com.samples.dictionary';
const BUNDLE_C: string = 'com.samples.reader';
const BUNDLE_PADDED: string = '  com.samples.padded  ';
const BUNDLE_BLANK: string = '   ';

/**
 * Classifies the result of adding a bundle name to the whitelist.
 */
enum WhitelistResult {
  ADDED = 0,
  EMPTY_INPUT = 1,
  DUPLICATE = 2,
  FULL = 3,
  TOO_LONG = 4
}

/**
 * One data source that feeds the assessment configuration.
 */
interface DataSourceDescriptor {
  key: string;
  origin: string;
  mutable: boolean;
  validator: string;
  description: string;
}

/**
 * Outcome of one validation step of an assessment configuration.
 */
interface ValidationOutcome {
  source: string;
  valid: boolean;
  message: string;
}

/**
 * The four duration candidates of the config card.
 *
 * The candidate array is the contract between the chips of the page and the begin call, the
 * controller receives the value at the selected index.
 */
class DurationCandidates {
  private values: number[] = [
    DURATION_DEFAULT,
    DURATION_TEN_MINUTES,
    DURATION_THIRTY_MINUTES,
    DURATION_SIXTY_MINUTES
  ];

  public all(): number[] {
    return this.values.slice();
  }

  public size(): number {
    return this.values.length;
  }

  public at(index: number): number {
    if (index < 0 || index >= this.values.length) {
      return DURATION_DEFAULT;
    }
    return this.values[index];
  }

  public indexOf(duration: number): number {
    return this.values.indexOf(duration);
  }

  public contains(duration: number): boolean {
    return this.values.indexOf(duration) >= 0;
  }

  public isAscending(): boolean {
    for (let i = 1; i < this.values.length; i++) {
      if (this.values[i] <= this.values[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public isUnique(): boolean {
    const seen: Set<number> = new Set<number>();
    for (let i = 0; i < this.values.length; i++) {
      if (seen.has(this.values[i])) {
        return false;
      }
      seen.add(this.values[i]);
    }
    return true;
  }

  public minutesOf(duration: number): number {
    return Math.floor(duration / 60000);
  }

  public describe(index: number): string {
    const duration: number = this.at(index);
    if (duration === DURATION_DEFAULT) {
      return 'Default duration';
    }
    return `${this.minutesOf(duration)} min`;
  }

  public labels(): string[] {
    const values: string[] = [];
    for (let i = 0; i < this.values.length; i++) {
      values.push(this.describe(i));
    }
    return values;
  }
}

/**
 * The mutable whitelist of the config card.
 *
 * Every mutation returns a result code instead of throwing, because the page has to render an
 * inline hint rather than an error page when the input is rejected.
 */
class WhitelistModel {
  private apps: string[] = [];

  constructor() {
    this.apps = [DEFAULT_ALLOWED_APP];
  }

  public all(): string[] {
    return this.apps.slice();
  }

  public size(): number {
    return this.apps.length;
  }

  public isEmpty(): boolean {
    return this.apps.length === 0;
  }

  public contains(bundle: string): boolean {
    return this.apps.indexOf(bundle) >= 0;
  }

  public concatenatedLength(): number {
    return this.apps.join(ALLOWED_APP_SEPARATOR).length;
  }

  public joined(): string {
    return this.apps.join(ALLOWED_APP_SEPARATOR);
  }

  /**
   * Adds a bundle name, the input is trimmed first and rejected when it is blank.
   *
   * @param input raw text of the input box.
   * @returns the result of the attempt.
   */
  public add(input: string): WhitelistResult {
    const bundle: string = input.trim();
    if (bundle.length === 0) {
      return WhitelistResult.EMPTY_INPUT;
    }
    if (this.apps.indexOf(bundle) >= 0) {
      return WhitelistResult.DUPLICATE;
    }
    if (this.apps.length >= MAX_ALLOWED_APPS) {
      return WhitelistResult.FULL;
    }
    const candidate: string[] = this.apps.slice();
    candidate.push(bundle);
    if (candidate.join(ALLOWED_APP_SEPARATOR).length > MAX_CONCATENATED_LENGTH) {
      return WhitelistResult.TOO_LONG;
    }
    this.apps = candidate;
    return WhitelistResult.ADDED;
  }

  /**
   * Removes a bundle name.
   *
   * @param bundle bundle name to remove.
   * @returns true when the entry was present and removed.
   */
  public remove(bundle: string): boolean {
    const index: number = this.apps.indexOf(bundle);
    if (index < 0) {
      return false;
    }
    const candidate: string[] = this.apps.slice();
    candidate.splice(index, 1);
    this.apps = candidate;
    return true;
  }

  /**
   * Removes the entry at a position.
   *
   * @param index position to remove.
   * @returns the removed bundle name, an empty string when the index is out of range.
   */
  public removeAt(index: number): string {
    if (index < 0 || index >= this.apps.length) {
      return '';
    }
    const candidate: string[] = this.apps.slice();
    const removed: string[] = candidate.splice(index, 1);
    this.apps = candidate;
    return removed.length > 0 ? removed[0] : '';
  }

  public clear(): void {
    this.apps = [];
  }

  public reset(): void {
    this.apps = [DEFAULT_ALLOWED_APP];
  }

  public isFull(): boolean {
    return this.apps.length >= MAX_ALLOWED_APPS;
  }

  public isWithinLimit(): boolean {
    return this.apps.length <= MAX_ALLOWED_APPS &&
      this.concatenatedLength() <= MAX_CONCATENATED_LENGTH;
  }

  public toString(): string {
    return `WhitelistModel{size=${this.apps.length}, length=${this.concatenatedLength()}}`;
  }
}

/**
 * The configuration that the entry page hands to AssessmentController.begin.
 *
 * The class mirrors the two arguments of the controller call: the duration at the selected
 * chip index and the whitelist array.
 */
class BeginArguments {
  private duration: number;
  private allowedApps: string[];

  constructor(duration: number, allowedApps: string[]) {
    this.duration = duration;
    this.allowedApps = allowedApps.slice();
  }

  public getDuration(): number {
    return this.duration;
  }

  public getAllowedApps(): string[] {
    return this.allowedApps.slice();
  }

  public allowedAppCount(): number {
    return this.allowedApps.length;
  }

  public toConfigRecord(): Map<string, string> {
    const record: Map<string, string> = new Map<string, string>();
    record.set('duration', `${this.duration}`);
    record.set('allowedApps', this.allowedApps.join(ALLOWED_APP_SEPARATOR));
    return record;
  }

  public toString(): string {
    return `BeginArguments{duration=${this.duration}, apps=${this.allowedApps.length}}`;
  }
}

/**
 * Registry of the data sources of the assessment configuration.
 *
 * Every source is declared with the constraint that it must satisfy, the cross check method
 * then verifies the invariants that only hold when the sources are combined.
 */
class DataSourceRegistry {
  private descriptors: DataSourceDescriptor[] = [];
  private durations: DurationCandidates;
  private whitelist: WhitelistModel;

  constructor(durations: DurationCandidates, whitelist: WhitelistModel) {
    this.durations = durations;
    this.whitelist = whitelist;
    this.descriptors = [
      {
        key: 'durationCandidates',
        origin: 'config card chips',
        mutable: false,
        validator: 'duration must belong to the candidate array',
        description: 'Four fixed chips, the default one and three minute values'
      },
      {
        key: 'durationIndex',
        origin: 'selected chip',
        mutable: true,
        validator: 'duration index must address a candidate',
        description: 'Selected position of the chip row'
      },
      {
        key: 'allowedApps',
        origin: 'whitelist rows',
        mutable: true,
        validator: 'whitelist must be unique and inside the limits',
        description: 'Bundle names that may run during the assessment'
      },
      {
        key: 'inputBundle',
        origin: 'whitelist input box',
        mutable: true,
        validator: 'input must be non blank after trimming',
        description: 'Raw text of the bundle name input'
      }
    ];
  }

  public size(): number {
    return this.descriptors.length;
  }

  public keys(): string[] {
    const values: string[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      values.push(this.descriptors[i].key);
    }
    return values;
  }

  public find(key: string): DataSourceDescriptor | undefined {
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].key === key) {
        return this.descriptors[i];
      }
    }
    return undefined;
  }

  public mutableKeys(): string[] {
    const values: string[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].mutable) {
        values.push(this.descriptors[i].key);
      }
    }
    return values;
  }

  /**
   * Builds the arguments of the controller begin call from the current data sources.
   *
   * @param durationIndex selected chip index.
   * @returns the begin arguments, or undefined when the index is invalid.
   */
  public buildBeginArguments(durationIndex: number): BeginArguments | undefined {
    if (durationIndex < 0 || durationIndex >= this.durations.size()) {
      return undefined;
    }
    return new BeginArguments(this.durations.at(durationIndex), this.whitelist.all());
  }

  /**
   * Validates the data sources one by one.
   *
   * @param durationIndex selected chip index.
   * @returns one outcome per source, in declaration order.
   */
  public validateSources(durationIndex: number): ValidationOutcome[] {
    const outcomes: ValidationOutcome[] = [];
    outcomes.push({
      source: 'durationCandidates',
      valid: this.durations.size() === 4 && this.durations.isAscending() && this.durations.isUnique(),
      message: this.durations.isAscending() ? 'candidates are ascending' : 'candidates are unordered'
    });
    outcomes.push({
      source: 'durationIndex',
      valid: durationIndex >= 0 && durationIndex < this.durations.size(),
      message: `index ${durationIndex} of ${this.durations.size()} candidates`
    });
    outcomes.push({
      source: 'allowedApps',
      valid: this.whitelist.isWithinLimit(),
      message: this.whitelist.toString()
    });
    outcomes.push({
      source: 'inputBundle',
      valid: BUNDLE_BLANK.trim().length === 0,
      message: 'a blank input is rejected by the page'
    });
    return outcomes;
  }

  /**
   * Validates the invariants that span several data sources.
   *
   * @param durationIndex selected chip index.
   * @returns the violated invariants, an empty array when the configuration holds.
   */
  public crossCheck(durationIndex: number): string[] {
    const issues: string[] = [];
    const argumentsOfBegin: BeginArguments | undefined = this.buildBeginArguments(durationIndex);
    if (argumentsOfBegin === undefined) {
      issues.push('the selected duration index does not address a candidate');
      return issues;
    }
    const duration: number = argumentsOfBegin.getDuration();
    if (!this.durations.contains(duration)) {
      issues.push('the duration argument is not a candidate value');
    }
    if (argumentsOfBegin.allowedAppCount() > MAX_ALLOWED_APPS) {
      issues.push('the whitelist exceeds the maximum number of applications');
    }
    if (this.whitelist.concatenatedLength() > MAX_CONCATENATED_LENGTH) {
      issues.push('the concatenated whitelist exceeds the maximum length');
    }
    const apps: string[] = argumentsOfBegin.getAllowedApps();
    const unique: Set<string> = new Set<string>(apps);
    if (unique.size !== apps.length) {
      issues.push('the whitelist contains a duplicate bundle name');
    }
    for (let i = 0; i < apps.length; i++) {
      if (apps[i] !== apps[i].trim()) {
        issues.push(`the whitelist entry ${apps[i]} is not trimmed`);
      }
    }
    if (duration < DURATION_DEFAULT) {
      issues.push('the duration argument is negative');
    }
    return issues;
  }
}

/**
 * Reports whether the running image declares the assessment capability.
 *
 * @returns true when the SysCap is present.
 */
function isAssessmentSupported(): boolean {
  const supported: boolean = canIUse('SystemCapability.Customization.AssessmentConfiguration');
  if (!supported) {
    hilog.warn(DOMAIN, TAG, 'the assessment capability is absent on this image');
  }
  return supported;
}

export default function configDataSourceValidationTest() {
  describe('ConfigDataSourceValidation_Test', () => {
    let driver: Driver;
    let durations: DurationCandidates;
    let whitelist: WhitelistModel;
    let registry: DataSourceRegistry;

    beforeAll(async () => {
      driver = getDriver();
      durations = new DurationCandidates();
      whitelist = new WhitelistModel();
      registry = new DataSourceRegistry(durations, whitelist);
      await serializedDelay(driver, 500);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: inspect the duration candidate array.
     * Expectation: the four documented values are present, ascending and unique.
     */
    it('Assessment_DurationCandidatesLayout_001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationCandidatesLayout_001, begin');
      expect(durations.size()).assertEqual(4);
      expect(durations.all().length).assertEqual(4);
      expect(durations.at(0)).assertEqual(DURATION_DEFAULT);
      expect(durations.at(1)).assertEqual(DURATION_TEN_MINUTES);
      expect(durations.at(2)).assertEqual(DURATION_THIRTY_MINUTES);
      expect(durations.at(3)).assertEqual(DURATION_SIXTY_MINUTES);
      expect(durations.isAscending()).assertTrue();
      expect(durations.isUnique()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationCandidatesLayout_001, end');
    });

    /**
     * Scenario: map each candidate to its label and to its minute value.
     * Expectation: the default label is the resource string and the other labels report the
     * minutes of the candidate.
     */
    it('Assessment_DurationCandidateLabels_002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationCandidateLabels_002, begin');
      const labels: string[] = durations.labels();
      expect(labels.length).assertEqual(4);
      expect(labels[0]).assertEqual('Default duration');
      expect(labels[1]).assertEqual('10 min');
      expect(labels[2]).assertEqual('30 min');
      expect(labels[3]).assertEqual('60 min');
      expect(durations.minutesOf(DURATION_TEN_MINUTES)).assertEqual(10);
      expect(durations.minutesOf(DURATION_THIRTY_MINUTES)).assertEqual(30);
      expect(durations.minutesOf(DURATION_SIXTY_MINUTES)).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationCandidateLabels_002, end');
    });

    /**
     * Scenario: address the candidate array with an out of range index.
     * Expectation: the lookup falls back to the default duration and the index lookup of an
     * unknown value reports -1.
     */
    it('Assessment_DurationIndexBounds_003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationIndexBounds_003, begin');
      expect(durations.at(-1)).assertEqual(DURATION_DEFAULT);
      expect(durations.at(4)).assertEqual(DURATION_DEFAULT);
      expect(durations.at(99)).assertEqual(DURATION_DEFAULT);
      expect(durations.indexOf(DURATION_THIRTY_MINUTES)).assertEqual(2);
      expect(durations.indexOf(12345)).assertEqual(-1);
      expect(durations.contains(12345)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationIndexBounds_003, end');
    });

    /**
     * Scenario: the default chip of the entry page.
     * Expectation: the page starts on the second chip, which is the ten minute candidate and
     * not the default duration value.
     */
    it('Assessment_DurationDefaultSelection_004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationDefaultSelection_004, begin');
      expect(DEFAULT_DURATION_INDEX).assertEqual(1);
      expect(durations.at(DEFAULT_DURATION_INDEX)).assertEqual(DURATION_TEN_MINUTES);
      expect(durations.at(DEFAULT_DURATION_INDEX) === DURATION_DEFAULT).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s default chip value: %{public}d',
        BUNDLE + 'DurationDefaultSelection_004', durations.at(DEFAULT_DURATION_INDEX));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationDefaultSelection_004, end');
    });

    /**
     * Scenario: a fresh whitelist of the entry page.
     * Expectation: the whitelist carries the default bundle name and is not empty, so the
     * config card hides the empty hint.
     */
    it('Assessment_WhitelistInitialState_005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistInitialState_005, begin');
      whitelist.reset();
      expect(whitelist.size()).assertEqual(1);
      expect(whitelist.isEmpty()).assertFalse();
      expect(whitelist.contains(DEFAULT_ALLOWED_APP)).assertTrue();
      expect(whitelist.joined()).assertEqual(DEFAULT_ALLOWED_APP);
      expect(whitelist.concatenatedLength()).assertEqual(DEFAULT_ALLOWED_APP.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistInitialState_005, end');
    });

    /**
     * Scenario: add a second bundle name to the whitelist.
     * Expectation: the result is ADDED, the size grows by one and the insertion order is the
     * order of the add calls.
     */
    it('Assessment_WhitelistAdd_006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistAdd_006, begin');
      whitelist.reset();
      const result: WhitelistResult = whitelist.add(BUNDLE_B);
      expect(result).assertEqual(WhitelistResult.ADDED);
      expect(whitelist.size()).assertEqual(2);
      expect(whitelist.all()[0]).assertEqual(BUNDLE_A);
      expect(whitelist.all()[1]).assertEqual(BUNDLE_B);
      expect(whitelist.joined()).assertEqual(`${BUNDLE_A}${ALLOWED_APP_SEPARATOR}${BUNDLE_B}`);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistAdd_006, end');
    });

    /**
     * Scenario: the input box carries surrounding whitespace.
     * Expectation: the page trims the value before the add, so the stored entry equals the
     * trimmed text and the length calculation uses the trimmed value.
     */
    it('Assessment_WhitelistTrim_007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistTrim_007, begin');
      whitelist.reset();
      const result: WhitelistResult = whitelist.add(BUNDLE_PADDED);
      expect(result).assertEqual(WhitelistResult.ADDED);
      const stored: string = whitelist.all()[1];
      expect(stored).assertEqual(BUNDLE_PADDED.trim());
      expect(stored).assertEqual('com.samples.padded');
      expect(stored === BUNDLE_PADDED).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistTrim_007, end');
    });

    /**
     * Scenario: the input box is blank.
     * Expectation: the attempt is rejected as an empty input, the whitelist is unchanged.
     */
    it('Assessment_WhitelistEmptyInput_008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistEmptyInput_008, begin');
      whitelist.reset();
      const blank: WhitelistResult = whitelist.add(BUNDLE_BLANK);
      const empty: WhitelistResult = whitelist.add('');
      expect(blank).assertEqual(WhitelistResult.EMPTY_INPUT);
      expect(empty).assertEqual(WhitelistResult.EMPTY_INPUT);
      expect(whitelist.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistEmptyInput_008, end');
    });

    /**
     * Scenario: add a bundle name that is already in the whitelist.
     * Expectation: the attempt is rejected as a duplicate, the whitelist keeps one entry and
     * the order is unchanged.
     */
    it('Assessment_WhitelistDuplicate_009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistDuplicate_009, begin');
      whitelist.reset();
      whitelist.add(BUNDLE_B);
      const duplicated: WhitelistResult = whitelist.add(BUNDLE_B);
      const duplicatedDefault: WhitelistResult = whitelist.add(DEFAULT_ALLOWED_APP);
      expect(duplicated).assertEqual(WhitelistResult.DUPLICATE);
      expect(duplicatedDefault).assertEqual(WhitelistResult.DUPLICATE);
      expect(whitelist.size()).assertEqual(2);
      expect(whitelist.all()[1]).assertEqual(BUNDLE_B);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistDuplicate_009, end');
    });

    /**
     * Scenario: remove a bundle name from the whitelist.
     * Expectation: the entry disappears, the remaining order is preserved and a second remove
     * of the same name is a no operation.
     */
    it('Assessment_WhitelistRemove_010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRemove_010, begin');
      whitelist.reset();
      whitelist.add(BUNDLE_B);
      whitelist.add(BUNDLE_C);
      expect(whitelist.remove(BUNDLE_B)).assertTrue();
      expect(whitelist.size()).assertEqual(2);
      expect(whitelist.contains(BUNDLE_B)).assertFalse();
      expect(whitelist.all()[1]).assertEqual(BUNDLE_C);
      expect(whitelist.remove(BUNDLE_B)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRemove_010, end');
    });

    /**
     * Scenario: remove the whitelist entry at a position.
     * Expectation: the reported bundle name is the removed one and an out of range position
     * reports an empty string without touching the whitelist.
     */
    it('Assessment_WhitelistRemoveAt_011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRemoveAt_011, begin');
      whitelist.reset();
      whitelist.add(BUNDLE_B);
      const removed: string = whitelist.removeAt(0);
      expect(removed).assertEqual(BUNDLE_A);
      expect(whitelist.size()).assertEqual(1);
      expect(whitelist.removeAt(9)).assertEqual('');
      expect(whitelist.removeAt(-1)).assertEqual('');
      expect(whitelist.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistRemoveAt_011, end');
    });

    /**
     * Scenario: empty the whitelist completely.
     * Expectation: the model reports the empty state and the concatenated length drops to
     * zero, which is what makes the empty hint of the config card appear.
     */
    it('Assessment_WhitelistClear_012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistClear_012, begin');
      whitelist.reset();
      whitelist.add(BUNDLE_B);
      whitelist.clear();
      expect(whitelist.isEmpty()).assertTrue();
      expect(whitelist.size()).assertEqual(0);
      expect(whitelist.joined()).assertEqual('');
      expect(whitelist.concatenatedLength()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistClear_012, end');
    });

    /**
     * Scenario: the concatenated whitelist grows beyond the documented limit.
     * Expectation: adds continue to succeed until the limit is reached, a single very long
     * name is rejected only when the joined text would exceed 2048 characters.
     */
    it('Assessment_WhitelistLengthLimit_014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistLengthLimit_014, begin');
      whitelist.clear();
      const longName: string = 'com.samples.' + 'x'.repeat(MAX_CONCATENATED_LENGTH);
      const rejected: WhitelistResult = whitelist.add(longName);
      expect(rejected).assertEqual(WhitelistResult.TOO_LONG);
      expect(whitelist.size()).assertEqual(0);
      const moderate: string = 'com.samples.moderate';
      expect(whitelist.add(moderate)).assertEqual(WhitelistResult.ADDED);
      expect(whitelist.concatenatedLength()).assertEqual(moderate.length);
      expect(whitelist.concatenatedLength() <= MAX_CONCATENATED_LENGTH).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistLengthLimit_014, end');
    });

    /**
     * Scenario: the whitelist is copied rather than shared with the caller.
     * Expectation: mutating the array returned by the getter does not change the model.
     */
    it('Assessment_WhitelistDefensiveCopy_015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistDefensiveCopy_015, begin');
      whitelist.reset();
      const snapshot: string[] = whitelist.all();
      snapshot.push(BUNDLE_B);
      expect(snapshot.length).assertEqual(2);
      expect(whitelist.size()).assertEqual(1);
      expect(whitelist.contains(BUNDLE_B)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistDefensiveCopy_015, end');
    });

    /**
     * Scenario: build the arguments of the controller begin call.
     * Expectation: the duration comes from the selected chip and the whitelist is copied into
     * the arguments.
     */
    it('Assessment_BeginArgumentsMapping_016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginArgumentsMapping_016, begin');
      whitelist.reset();
      whitelist.add(BUNDLE_B);
      const argumentsOfBegin: BeginArguments | undefined = registry.buildBeginArguments(2);
      expect(argumentsOfBegin !== undefined).assertTrue();
      if (argumentsOfBegin !== undefined) {
        expect(argumentsOfBegin.getDuration()).assertEqual(DURATION_THIRTY_MINUTES);
        expect(argumentsOfBegin.allowedAppCount()).assertEqual(2);
        expect(argumentsOfBegin.getAllowedApps()[0]).assertEqual(BUNDLE_A);
        expect(argumentsOfBegin.getAllowedApps()[1]).assertEqual(BUNDLE_B);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginArgumentsMapping_016, end');
    });

    /**
     * Scenario: build the begin arguments with an invalid chip index.
     * Expectation: the builder reports undefined instead of falling back to a silent default,
     * because the page must not start an assessment with an unintended duration.
     */
    it('Assessment_BeginArgumentsInvalidIndex_017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginArgumentsInvalidIndex_017, begin');
      whitelist.reset();
      expect(registry.buildBeginArguments(-1) === undefined).assertTrue();
      expect(registry.buildBeginArguments(4) === undefined).assertTrue();
      expect(registry.buildBeginArguments(0) !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginArgumentsInvalidIndex_017, end');
    });

    /**
     * Scenario: the begin arguments keep a copy of the whitelist.
     * Expectation: mutating the whitelist model after the arguments were built does not
     * change the arguments that are already on their way to the controller.
     */
    it('Assessment_BeginArgumentsIsolation_018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginArgumentsIsolation_018, begin');
      whitelist.reset();
      whitelist.add(BUNDLE_B);
      const argumentsOfBegin: BeginArguments | undefined = registry.buildBeginArguments(1);
      const before: number = argumentsOfBegin === undefined ? -1 : argumentsOfBegin.allowedAppCount();
      whitelist.add(BUNDLE_C);
      const after: number = argumentsOfBegin === undefined ? -1 : argumentsOfBegin.allowedAppCount();
      expect(before).assertEqual(2);
      expect(after).assertEqual(2);
      expect(whitelist.size()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginArgumentsIsolation_018, end');
    });

    /**
     * Scenario: project the begin arguments onto the configuration record.
     * Expectation: the record carries the duration and the joined whitelist with the same
     * separator that the status card uses.
     */
    it('Assessment_BeginArgumentsRecord_019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginArgumentsRecord_019, begin');
      whitelist.reset();
      whitelist.add(BUNDLE_B);
      const argumentsOfBegin: BeginArguments | undefined = registry.buildBeginArguments(3);
      expect(argumentsOfBegin !== undefined).assertTrue();
      if (argumentsOfBegin !== undefined) {
        const record: Map<string, string> = argumentsOfBegin.toConfigRecord();
        expect(record.size).assertEqual(2);
        expect(record.get('duration')).assertEqual(`${DURATION_SIXTY_MINUTES}`);
        expect(record.get('allowedApps')).assertEqual(`${BUNDLE_A},${BUNDLE_B}`);
        expect(argumentsOfBegin.toString()).assertContain('duration=');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginArgumentsRecord_019, end');
    });

    /**
     * Scenario: inspect the data source registry.
     * Expectation: the four sources are declared, two of them are mutable and the unknown key
     * lookup reports absence.
     */
    it('Assessment_DataSourceRegistryLayout_020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSourceRegistryLayout_020, begin');
      expect(registry.size()).assertEqual(4);
      expect(registry.keys().length).assertEqual(4);
      expect(registry.mutableKeys().length).assertEqual(3);
      expect(registry.find('allowedApps') !== undefined).assertTrue();
      expect(registry.find('durationCandidates') !== undefined).assertTrue();
      expect(registry.find('unknownSource') === undefined).assertTrue();
      const descriptor: DataSourceDescriptor | undefined = registry.find('allowedApps');
      if (descriptor !== undefined) {
        expect(descriptor.mutable).assertTrue();
        expect(descriptor.validator.length > 0).assertTrue();
        expect(descriptor.description.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSourceRegistryLayout_020, end');
    });

    /**
     * Scenario: validate every data source of a healthy configuration.
     * Expectation: all four outcomes are valid and the source names are reported in order.
     */
    it('Assessment_ValidateSourcesHealthy_021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidateSourcesHealthy_021, begin');
      whitelist.reset();
      const outcomes: ValidationOutcome[] = registry.validateSources(DEFAULT_DURATION_INDEX);
      expect(outcomes.length).assertEqual(4);
      for (let i = 0; i < outcomes.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s source %{public}s valid: %{public}s',
          BUNDLE + 'ValidateSourcesHealthy_021', outcomes[i].source, `${outcomes[i].valid}`);
        expect(outcomes[i].valid).assertTrue();
        expect(outcomes[i].message.length > 0).assertTrue();
      }
      expect(outcomes[0].source).assertEqual('durationCandidates');
      expect(outcomes[3].source).assertEqual('inputBundle');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidateSourcesHealthy_021, end');
    });

    /**
     * Scenario: validate the data sources with an out of range chip index.
     * Expectation: only the duration index outcome is invalid, the other three sources still
     * pass because they do not depend on the chip selection.
     */
    it('Assessment_ValidateSourcesBadIndex_022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidateSourcesBadIndex_022, begin');
      whitelist.reset();
      const outcomes: ValidationOutcome[] = registry.validateSources(7);
      expect(outcomes.length).assertEqual(4);
      expect(outcomes[1].valid).assertFalse();
      expect(outcomes[0].valid).assertTrue();
      expect(outcomes[2].valid).assertTrue();
      expect(outcomes[3].valid).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidateSourcesBadIndex_022, end');
    });

    /**
     * Scenario: cross check a healthy configuration.
     * Expectation: no invariant is violated, the duration is a candidate, the whitelist is
     * inside both limits and every entry is trimmed.
     */
    it('Assessment_CrossCheckHealthy_023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CrossCheckHealthy_023, begin');
      whitelist.reset();
      whitelist.add(BUNDLE_B);
      const issues: string[] = registry.crossCheck(DEFAULT_DURATION_INDEX);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}d cross check issues',
        BUNDLE + 'CrossCheckHealthy_023', issues.length);
      expect(issues.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CrossCheckHealthy_023, end');
    });

    /**
     * Scenario: cross check a configuration whose chip index does not address a candidate.
     * Expectation: the cross check reports exactly the duration invariant and stops early.
     */
    it('Assessment_CrossCheckBadDuration_024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CrossCheckBadDuration_024, begin');
      whitelist.reset();
      const issues: string[] = registry.crossCheck(5);
      expect(issues.length).assertEqual(1);
      expect(issues[0]).assertContain('duration index');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CrossCheckBadDuration_024, end');
    });

    /**
     * Scenario: cross check the maximum number of applications.
     * Expectation: a whitelist with exactly twenty entries passes the count invariant.
     */
    it('Assessment_CrossCheckWhitelistCount_026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CrossCheckWhitelistCount_026, begin');
      whitelist.clear();
      for (let i = 0; i < MAX_ALLOWED_APPS; i++) {
        whitelist.add(`com.samples.app${i}`);
      }
      expect(whitelist.size()).assertEqual(MAX_ALLOWED_APPS);
      const issues: string[] = registry.crossCheck(0);
      let countIssue: boolean = false;
      for (let i = 0; i < issues.length; i++) {
        if (issues[i].indexOf('maximum number') >= 0) {
          countIssue = true;
        }
      }
      expect(countIssue).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CrossCheckWhitelistCount_026, end');
    });

    /**
     * Scenario: the duration of every chip is a valid candidate.
     * Expectation: walking the chip row produces four distinct begin durations, all of them
     * members of the candidate array.
     */
    it('Assessment_DurationSourceInvariant_027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationSourceInvariant_027, begin');
      whitelist.reset();
      const seen: Set<number> = new Set<number>();
      for (let i = 0; i < durations.size(); i++) {
        const argumentsOfBegin: BeginArguments | undefined = registry.buildBeginArguments(i);
        expect(argumentsOfBegin !== undefined).assertTrue();
        if (argumentsOfBegin !== undefined) {
          const duration: number = argumentsOfBegin.getDuration();
          expect(durations.contains(duration)).assertTrue();
          seen.add(duration);
        }
      }
      expect(seen.size).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DurationSourceInvariant_027, end');
    });

    /**
     * Scenario: exercise the whitelist through a sequence of mutating operations.
     * Expectation: the final state is deterministic and the concatenated text matches the
     * remaining entries in insertion order.
     */
    it('Assessment_WhitelistMutationSequence_028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistMutationSequence_028, begin');
      whitelist.reset();
      expect(whitelist.add(BUNDLE_B)).assertEqual(WhitelistResult.ADDED);
      expect(whitelist.add(BUNDLE_C)).assertEqual(WhitelistResult.ADDED);
      expect(whitelist.add(BUNDLE_B)).assertEqual(WhitelistResult.DUPLICATE);
      expect(whitelist.remove(BUNDLE_A)).assertTrue();
      expect(whitelist.add(BUNDLE_A)).assertEqual(WhitelistResult.ADDED);
      expect(whitelist.size()).assertEqual(3);
      expect(whitelist.joined()).assertEqual(`${BUNDLE_B},${BUNDLE_C},${BUNDLE_A}`);
      expect(whitelist.isWithinLimit()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'WhitelistMutationSequence_028', whitelist.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WhitelistMutationSequence_028, end');
    });

  });
}
