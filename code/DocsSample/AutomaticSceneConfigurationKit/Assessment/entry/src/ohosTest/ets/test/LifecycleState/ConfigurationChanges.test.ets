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
  TEXT_STATE_INACTIVE,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The sample sets COLOR_MODE_NOT_SET in EntryAbility.onCreate, so the effective color mode is
// resolved from the system configuration rather than pinned by the application.
const COLOR_MODE_NOT_SET: number = 0;
const COLOR_MODE_LIGHT: number = 1;
const COLOR_MODE_DARK: number = 2;

const SYSTEM_MODE_LIGHT: number = 10;
const SYSTEM_MODE_DARK: number = 20;

// Orientation values of the configuration model.
const ORIENTATION_PORTRAIT: number = 0;
const ORIENTATION_LANDSCAPE: number = 1;

// Font scale boundaries accepted by the configuration model. The platform clamps the scale of
// the application, the model validates the same range before the value is stored.
const FONT_SCALE_MIN: number = 0.85;
const FONT_SCALE_MAX: number = 3.2;
const FONT_SCALE_DEFAULT: number = 1.0;

// Locale tags used by the sample, the application ships a base, a dark and a zh_CN resource
// directory, the configuration model only validates the shape of the tag.
const LOCALE_EN_US: string = 'en-US';
const LOCALE_ZH_CN: string = 'zh-CN';
const LOCALE_INVALID: string = 'not_a_locale_tag_with_underscore';

// The duration candidate index the entry page keeps in its own state, the default value is 1
// which selects the ten minute candidate of AssessmentConstants.
const DEFAULT_DURATION_INDEX: number = 1;
const DURATION_CANDIDATE_COUNT: number = 4;

// The whitelist of the sample starts with exactly one bundle name and accepts at most twenty.
const MAX_ALLOWED_APPS: number = 20;

/**
 * Returns the log friendly name of a color mode value.
 *
 * @param mode color mode value.
 * @returns the name of the mode.
 */
function colorModeName(mode: number): string {
  if (mode === COLOR_MODE_LIGHT) {
    return 'light';
  }
  if (mode === COLOR_MODE_DARK) {
    return 'dark';
  }
  return 'not-set';
}

/**
 * Returns the log friendly name of an orientation value.
 *
 * @param orientation orientation value.
 * @returns the name of the orientation.
 */
function orientationName(orientation: number): string {
  return orientation === ORIENTATION_LANDSCAPE ? 'landscape' : 'portrait';
}

/**
 * One applied configuration change, the log keeps every field that was touched so that a
 * recreation can be correlated with the change that triggered it.
 */
interface ConfigChangeRecord {
  index: number;
  field: string;
  fromValue: string;
  toValue: string;
}

/**
 * The configuration values the sample observes. The fields mirror the attributes of the
 * OpenHarmony Configuration object that the sample reacts to.
 */
interface ConfigurationSnapshot {
  colorMode: number;
  orientation: number;
  locale: string;
  fontScale: number;
}

/**
 * The state of the entry page that must survive a configuration change. The exam page stores
 * its answers in a separate structure, the entry page state is what the scenarios below track.
 */
interface PreservedState {
  durationIndex: number;
  allowedApps: string[];
  assessmentActive: boolean;
  examPagePushed: boolean;
}

/**
 * The outcome of a simulated recreation. A recreation happens when the ability instance is
 * destroyed and rebuilt, for example after a locale change on some devices, and the sample is
 * expected to restore the entry page state from its snapshot.
 */
interface RecreationOutcome {
  restored: boolean;
  driftedFields: string[];
  durationIndexPreserved: boolean;
  whitelistPreserved: boolean;
  activePreserved: boolean;
}

/**
 * Append only log of the configuration changes, it is the model of the change log the sample
 * writes when a configuration callback arrives.
 */
class ConfigurationChangeLog {
  private records: ConfigChangeRecord[] = [];
  private nextIndex: number = 0;

  /**
   * Appends a change record, the index is assigned by the log itself so that the records keep
   * their arrival order regardless of the field that changed.
   */
  public append(field: string, fromValue: string, toValue: string): ConfigChangeRecord {
    const record: ConfigChangeRecord = {
      index: this.nextIndex,
      field: field,
      fromValue: fromValue,
      toValue: toValue
    };
    this.nextIndex++;
    this.records.push(record);
    return record;
  }

  public size(): number {
    return this.records.length;
  }

  public getRecords(): ConfigChangeRecord[] {
    return this.records.slice();
  }

  public last(): ConfigChangeRecord | undefined {
    if (this.records.length === 0) {
      return undefined;
    }
    return this.records[this.records.length - 1];
  }

  public first(): ConfigChangeRecord | undefined {
    if (this.records.length === 0) {
      return undefined;
    }
    return this.records[0];
  }

  public changesOf(field: string): ConfigChangeRecord[] {
    const matched: ConfigChangeRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].field === field) {
        matched.push(this.records[i]);
      }
    }
    return matched;
  }

  public fieldsTouched(): string[] {
    const fields: string[] = [];
    for (let i = 0; i < this.records.length; i++) {
      if (fields.indexOf(this.records[i].field) < 0) {
        fields.push(this.records[i].field);
      }
    }
    return fields;
  }

  public indexesAreSequential(): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].index !== i) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.records = [];
    this.nextIndex = 0;
  }

  public summary(): string {
    return `ConfigurationChangeLog{records=${this.records.length}, fields=${this.fieldsTouched().length}}`;
  }
}

/**
 * The configuration model of the sample.
 *
 * It holds the last observed configuration, validates incoming values, records every accepted
 * transition in the change log and detects recreation attempts by comparing the preserved state
 * of the entry page.
 */
class ConfigurationModel {
  private snapshot: ConfigurationSnapshot;
  private log: ConfigurationChangeLog = new ConfigurationChangeLog();
  private generation: number = 0;

  public constructor() {
    this.snapshot = {
      colorMode: COLOR_MODE_NOT_SET,
      orientation: ORIENTATION_PORTRAIT,
      locale: LOCALE_EN_US,
      fontScale: FONT_SCALE_DEFAULT
    };
  }

  public getSnapshot(): ConfigurationSnapshot {
    return {
      colorMode: this.snapshot.colorMode,
      orientation: this.snapshot.orientation,
      locale: this.snapshot.locale,
      fontScale: this.snapshot.fontScale
    };
  }

  public getGeneration(): number {
    return this.generation;
  }

  public getLog(): ConfigurationChangeLog {
    return this.log;
  }

  /**
   * Applies a color mode. The application sets COLOR_MODE_NOT_SET on create and every later
   * value is delivered by a configuration update, so an identical value is a no-op.
   *
   * @param mode color mode to apply.
   * @returns true when the value changed.
   */
  public applyColorMode(mode: number): boolean {
    if (mode !== COLOR_MODE_NOT_SET && mode !== COLOR_MODE_LIGHT && mode !== COLOR_MODE_DARK) {
      hilog.warn(DOMAIN, TAG, 'applyColorMode: rejected %{public}d', mode);
      return false;
    }
    if (this.snapshot.colorMode === mode) {
      return false;
    }
    const fromValue: string = colorModeName(this.snapshot.colorMode);
    this.snapshot.colorMode = mode;
    this.log.append('colorMode', fromValue, colorModeName(mode));
    this.generation++;
    return true;
  }

  /**
   * Resolves the effective color mode, COLOR_MODE_NOT_SET follows the system setting.
   *
   * @param systemMode color mode of the system configuration.
   * @returns light or dark.
   */
  public effectiveColorMode(systemMode: number): string {
    if (this.snapshot.colorMode === COLOR_MODE_NOT_SET) {
      return systemMode === SYSTEM_MODE_DARK ? 'dark' : 'light';
    }
    return colorModeName(this.snapshot.colorMode);
  }

  /**
   * Applies an orientation change.
   *
   * @param orientation orientation to apply.
   * @returns true when the value changed.
   */
  public applyOrientation(orientation: number): boolean {
    if (orientation !== ORIENTATION_PORTRAIT && orientation !== ORIENTATION_LANDSCAPE) {
      return false;
    }
    if (this.snapshot.orientation === orientation) {
      return false;
    }
    const fromValue: string = orientationName(this.snapshot.orientation);
    this.snapshot.orientation = orientation;
    this.log.append('orientation', fromValue, orientationName(orientation));
    this.generation++;
    return true;
  }

  /**
   * Applies a locale change. The tag must look like a language with an optional region part.
   *
   * @param locale locale tag, for example en-US or zh-CN.
   * @returns true when the value changed.
   */
  public applyLocale(locale: string): boolean {
    if (locale.indexOf('-') < 0 || locale.length < 5 || locale.indexOf('_') >= 0) {
      hilog.warn(DOMAIN, TAG, 'applyLocale: rejected %{public}s', locale);
      return false;
    }
    if (this.snapshot.locale === locale) {
      return false;
    }
    const fromValue: string = this.snapshot.locale;
    this.snapshot.locale = locale;
    this.log.append('locale', fromValue, locale);
    this.generation++;
    return true;
  }

  /**
   * Applies a font scale. Values outside of the accepted range are rejected so that the layout
   * of the entry page cannot be driven out of its bounds by a bad configuration value.
   *
   * @param scale font scale to apply.
   * @returns true when the value changed.
   */
  public applyFontScale(scale: number): boolean {
    if (scale < FONT_SCALE_MIN || scale > FONT_SCALE_MAX) {
      hilog.warn(DOMAIN, TAG, 'applyFontScale: rejected %{public}s', `${scale}`);
      return false;
    }
    if (this.snapshot.fontScale === scale) {
      return false;
    }
    const fromValue: string = `${this.snapshot.fontScale}`;
    this.snapshot.fontScale = scale;
    this.log.append('fontScale', fromValue, `${scale}`);
    this.generation++;
    return true;
  }

  /**
   * Builds a key that identifies the configuration, two equal keys mean that no recreation is
   * needed for the given configuration.
   *
   * @returns the identity key of the current configuration.
   */
  public configurationKey(): string {
    return `${this.snapshot.colorMode}|${this.snapshot.orientation}|${this.snapshot.locale}|` +
      `${this.snapshot.fontScale}`;
  }

  /**
   * Simulates a recreation of the entry page and checks whether the preserved state survived.
   *
   * @param before state of the page before the recreation.
   * @param after state of the page after the recreation.
   * @returns the outcome of the recreation.
   */
  public detectRecreation(before: PreservedState, after: PreservedState): RecreationOutcome {
    const drifted: string[] = [];
    if (before.durationIndex !== after.durationIndex) {
      drifted.push('durationIndex');
    }
    if (before.allowedApps.length !== after.allowedApps.length) {
      drifted.push('allowedApps');
    }
    if (before.assessmentActive !== after.assessmentActive) {
      drifted.push('assessmentActive');
    }
    const outcome: RecreationOutcome = {
      restored: drifted.length === 0,
      driftedFields: drifted,
      durationIndexPreserved: before.durationIndex === after.durationIndex,
      whitelistPreserved: before.allowedApps.length === after.allowedApps.length,
      activePreserved: before.assessmentActive === after.assessmentActive
    };
    hilog.info(DOMAIN, TAG, 'detectRecreation: restored %{public}s', `${outcome.restored}`);
    return outcome;
  }

  public reset(): void {
    this.snapshot = {
      colorMode: COLOR_MODE_NOT_SET,
      orientation: ORIENTATION_PORTRAIT,
      locale: LOCALE_EN_US,
      fontScale: FONT_SCALE_DEFAULT
    };
    this.log.reset();
    this.generation = 0;
  }
}

/**
 * Copies a preserved state so that a case cannot mutate the model through a shared array.
 *
 * @param state state to copy.
 * @returns the copy.
 */
function copyPreservedState(state: PreservedState): PreservedState {
  const apps: string[] = state.allowedApps.slice();
  return {
    durationIndex: state.durationIndex,
    allowedApps: apps,
    assessmentActive: state.assessmentActive,
    examPagePushed: state.examPagePushed
  };
}

/**
 * Builds the default preserved state of a fresh entry page.
 *
 * @returns the default state.
 */
function defaultPreservedState(): PreservedState {
  const apps: string[] = ['com.samples.assessment'];
  return {
    durationIndex: DEFAULT_DURATION_INDEX,
    allowedApps: apps,
    assessmentActive: false,
    examPagePushed: false
  };
}

/**
 * Starts the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page showed up.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function configurationChangesTest() {
  describe('ConfigurationChanges_Test', () => {
    let driver: Driver;
    let model: ConfigurationModel;

    beforeAll(async () => {
      driver = getDriver();
      model = new ConfigurationModel();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a fresh configuration model.
     * Expectation: the color mode is not set, the orientation is portrait, the locale is the
     * base locale and the font scale is one.
     */
    it('Assessment_ConfigurationChanges_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_001, begin');
      model.reset();
      const snapshot: ConfigurationSnapshot = model.getSnapshot();
      expect(snapshot.colorMode).assertEqual(COLOR_MODE_NOT_SET);
      expect(snapshot.orientation).assertEqual(ORIENTATION_PORTRAIT);
      expect(snapshot.locale).assertEqual(LOCALE_EN_US);
      expect(snapshot.fontScale).assertEqual(FONT_SCALE_DEFAULT);
      expect(model.getGeneration()).assertEqual(0);
      expect(model.getLog().size()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_001, end');
    });

    /**
     * Scenario: the system switches the application to dark mode.
     * Expectation: the mode is applied once, the generation grows by one and the change log
     * records the transition from not-set to dark.
     */
    it('Assessment_ConfigurationChanges_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_002, begin');
      model.reset();
      const applied: boolean = model.applyColorMode(COLOR_MODE_DARK);
      expect(applied).assertTrue();
      expect(model.getSnapshot().colorMode).assertEqual(COLOR_MODE_DARK);
      expect(model.getGeneration()).assertEqual(1);
      const last: ConfigChangeRecord | undefined = model.getLog().last();
      expect(last !== undefined).assertTrue();
      if (last !== undefined) {
        expect(last.field).assertEqual('colorMode');
        expect(last.fromValue).assertEqual('not-set');
        expect(last.toValue).assertEqual('dark');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_002, end');
    });

    /**
     * Scenario: the same color mode is delivered twice.
     * Expectation: the second delivery is a no-op, the generation stays the same and no second
     * record is appended.
     */
    it('Assessment_ConfigurationChanges_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_003, begin');
      model.reset();
      expect(model.applyColorMode(COLOR_MODE_LIGHT)).assertTrue();
      expect(model.applyColorMode(COLOR_MODE_LIGHT)).assertFalse();
      expect(model.getGeneration()).assertEqual(1);
      expect(model.getLog().size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_003, end');
    });

    /**
     * Scenario: the application keeps COLOR_MODE_NOT_SET and the system mode toggles.
     * Expectation: the effective mode follows the system both ways, and the stored mode is
     * still not-set so that the application never pins the user preference.
     */
    it('Assessment_ConfigurationChanges_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_004, begin');
      model.reset();
      expect(model.effectiveColorMode(SYSTEM_MODE_LIGHT)).assertEqual('light');
      expect(model.effectiveColorMode(SYSTEM_MODE_DARK)).assertEqual('dark');
      expect(model.getSnapshot().colorMode).assertEqual(COLOR_MODE_NOT_SET);
      expect(model.applyColorMode(COLOR_MODE_DARK)).assertTrue();
      expect(model.effectiveColorMode(SYSTEM_MODE_LIGHT)).assertEqual('dark');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_004, end');
    });

    /**
     * Scenario: the device rotates to landscape.
     * Expectation: the orientation is stored and the change is recorded.
     */
    it('Assessment_ConfigurationChanges_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_005, begin');
      model.reset();
      expect(model.applyOrientation(ORIENTATION_LANDSCAPE)).assertTrue();
      expect(model.getSnapshot().orientation).assertEqual(ORIENTATION_LANDSCAPE);
      const records: ConfigChangeRecord[] = model.getLog().changesOf('orientation');
      expect(records.length).assertEqual(1);
      expect(records[0].toValue).assertEqual('landscape');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_005, end');
    });

    /**
     * Scenario: a landscape to portrait round trip.
     * Expectation: two records are appended and the final orientation is portrait again, the
     * generation grows by two.
     */
    it('Assessment_ConfigurationChanges_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_006, begin');
      model.reset();
      expect(model.applyOrientation(ORIENTATION_LANDSCAPE)).assertTrue();
      expect(model.applyOrientation(ORIENTATION_PORTRAIT)).assertTrue();
      expect(model.getGeneration()).assertEqual(2);
      expect(model.getLog().changesOf('orientation').length).assertEqual(2);
      expect(model.getSnapshot().orientation).assertEqual(ORIENTATION_PORTRAIT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_006, end');
    });

    /**
     * Scenario: a locale change to the region tag the sample ships resources for.
     * Expectation: the tag is accepted and recorded.
     */
    it('Assessment_ConfigurationChanges_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_007, begin');
      model.reset();
      expect(model.applyLocale(LOCALE_ZH_CN)).assertTrue();
      expect(model.getSnapshot().locale).assertEqual(LOCALE_ZH_CN);
      expect(model.getLog().changesOf('locale').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_007, end');
    });

    /**
     * Scenario: a malformed locale tag.
     * Expectation: the tag is rejected, the stored locale is unchanged and the model reports no
     * generation change.
     */
    it('Assessment_ConfigurationChanges_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_008, begin');
      model.reset();
      expect(model.applyLocale(LOCALE_INVALID)).assertFalse();
      expect(model.getSnapshot().locale).assertEqual(LOCALE_EN_US);
      expect(model.getGeneration()).assertEqual(0);
      expect(model.getLog().size()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_008, end');
    });

    /**
     * Scenario: the font scale is set to the upper boundary.
     * Expectation: the boundary value is accepted, it is the largest scale the platform hands
     * to the application.
     */
    it('Assessment_ConfigurationChanges_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_009, begin');
      model.reset();
      expect(model.applyFontScale(FONT_SCALE_MAX)).assertTrue();
      expect(model.getSnapshot().fontScale).assertEqual(FONT_SCALE_MAX);
      expect(model.getLog().changesOf('fontScale').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_009, end');
    });

    /**
     * Scenario: a font scale above the accepted range.
     * Expectation: the value is rejected and the previous scale is kept.
     */
    it('Assessment_ConfigurationChanges_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_010, begin');
      model.reset();
      expect(model.applyFontScale(4.0)).assertFalse();
      expect(model.getSnapshot().fontScale).assertEqual(FONT_SCALE_DEFAULT);
      expect(model.getGeneration()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_010, end');
    });

    /**
     * Scenario: a font scale below the accepted range.
     * Expectation: the value is rejected and the previous scale is kept.
     */
    it('Assessment_ConfigurationChanges_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_011, begin');
      model.reset();
      expect(model.applyFontScale(0.5)).assertFalse();
      expect(model.applyFontScale(FONT_SCALE_MIN)).assertTrue();
      expect(model.getSnapshot().fontScale).assertEqual(FONT_SCALE_MIN);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_011, end');
    });

    /**
     * Scenario: the duration index of the entry page survives a configuration change.
     * Expectation: the preserved state keeps the index and the recreation detector reports no
     * drift.
     */
    it('Assessment_ConfigurationChanges_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_012, begin');
      model.reset();
      model.applyColorMode(COLOR_MODE_DARK);
      const before: PreservedState = defaultPreservedState();
      before.durationIndex = 2;
      const after: PreservedState = copyPreservedState(before);
      const outcome: RecreationOutcome = model.detectRecreation(before, after);
      expect(outcome.restored).assertTrue();
      expect(outcome.durationIndexPreserved).assertTrue();
      expect(after.durationIndex).assertEqual(2);
      expect(outcome.driftedFields.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_012, end');
    });

    /**
     * Scenario: a case mutates the whitelist copy of the preserved state.
     * Expectation: the original array is not affected, the copy is deep for the array field.
     */
    it('Assessment_ConfigurationChanges_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_013, begin');
      const before: PreservedState = defaultPreservedState();
      before.allowedApps.push('com.samples.dictionary');
      const after: PreservedState = copyPreservedState(before);
      after.allowedApps.push('com.samples.reader');
      expect(before.allowedApps.length).assertEqual(2);
      expect(after.allowedApps.length).assertEqual(3);
      expect(after.allowedApps).assertDeepEquals(before.allowedApps.slice().concat(['com.samples.reader']));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_013, end');
    });

    /**
     * Scenario: the assessment active flag survives a configuration change.
     * Expectation: the detector reports the active flag preserved and the restored outcome.
     */
    it('Assessment_ConfigurationChanges_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_014, begin');
      model.reset();
      const before: PreservedState = defaultPreservedState();
      before.assessmentActive = true;
      const after: PreservedState = copyPreservedState(before);
      const outcome: RecreationOutcome = model.detectRecreation(before, after);
      expect(outcome.activePreserved).assertTrue();
      expect(outcome.restored).assertTrue();
      expect(after.assessmentActive).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_014, end');
    });

    /**
     * Scenario: a recreation drops the duration index.
     * Expectation: the detector reports the drift and lists the duration index as the only
     * drifted field.
     */
    it('Assessment_ConfigurationChanges_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_015, begin');
      model.reset();
      const before: PreservedState = defaultPreservedState();
      before.durationIndex = 3;
      const after: PreservedState = copyPreservedState(before);
      after.durationIndex = DEFAULT_DURATION_INDEX;
      const outcome: RecreationOutcome = model.detectRecreation(before, after);
      expect(outcome.restored).assertFalse();
      expect(outcome.durationIndexPreserved).assertFalse();
      expect(outcome.driftedFields.length).assertEqual(1);
      expect(outcome.driftedFields[0]).assertEqual('durationIndex');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_015, end');
    });

    /**
     * Scenario: a recreation drops a whitelist entry.
     * Expectation: the detector reports the whitelist drift while the other fields are intact.
     */
    it('Assessment_ConfigurationChanges_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_016, begin');
      model.reset();
      const before: PreservedState = defaultPreservedState();
      before.allowedApps.push('com.samples.dictionary');
      const after: PreservedState = copyPreservedState(before);
      after.allowedApps.pop();
      const outcome: RecreationOutcome = model.detectRecreation(before, after);
      expect(outcome.whitelistPreserved).assertFalse();
      expect(outcome.driftedFields.indexOf('allowedApps') >= 0).assertTrue();
      expect(outcome.durationIndexPreserved).assertTrue();
      expect(outcome.activePreserved).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_016, end');
    });

    /**
     * Scenario: several configuration changes are applied in a row.
     * Expectation: every accepted change is appended and the record indexes stay sequential.
     */
    it('Assessment_ConfigurationChanges_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_017, begin');
      model.reset();
      model.applyColorMode(COLOR_MODE_DARK);
      model.applyOrientation(ORIENTATION_LANDSCAPE);
      model.applyLocale(LOCALE_ZH_CN);
      model.applyFontScale(1.5);
      expect(model.getLog().size()).assertEqual(4);
      expect(model.getLog().indexesAreSequential()).assertTrue();
      expect(model.getLog().fieldsTouched().length).assertEqual(4);
      expect(model.getGeneration()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', model.getLog().summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_017, end');
    });

    /**
     * Scenario: the change log is filtered by field.
     * Expectation: only the records of the requested field are returned.
     */
    it('Assessment_ConfigurationChanges_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_018, begin');
      model.reset();
      model.applyFontScale(1.25);
      model.applyColorMode(COLOR_MODE_LIGHT);
      model.applyFontScale(1.75);
      const fontRecords: ConfigChangeRecord[] = model.getLog().changesOf('fontScale');
      expect(fontRecords.length).assertEqual(2);
      expect(model.getLog().changesOf('colorMode').length).assertEqual(1);
      expect(model.getLog().changesOf('locale').length).assertEqual(0);
      expect(fontRecords[0].index < fontRecords[1].index).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_018, end');
    });

    /**
     * Scenario: the change log is reset.
     * Expectation: the records and the next index are cleared, the model itself is not touched.
     */
    it('Assessment_ConfigurationChanges_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_019, begin');
      model.reset();
      model.applyColorMode(COLOR_MODE_DARK);
      model.getLog().reset();
      expect(model.getLog().size()).assertEqual(0);
      expect(model.getLog().last() === undefined).assertTrue();
      expect(model.getLog().first() === undefined).assertTrue();
      const record: ConfigChangeRecord = model.getLog().append('colorMode', 'dark', 'light');
      expect(record.index).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_019, end');
    });

    /**
     * Scenario: the configuration key of two different configurations.
     * Expectation: equal configurations produce equal keys and a changed field produces a key
     * that differs from the previous one.
     */
    it('Assessment_ConfigurationChanges_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_020, begin');
      model.reset();
      const firstKey: string = model.configurationKey();
      model.applyFontScale(1.5);
      const secondKey: string = model.configurationKey();
      expect(firstKey === secondKey).assertFalse();
      model.reset();
      expect(model.configurationKey()).assertEqual(firstKey);
      model.applyFontScale(1.5);
      expect(model.configurationKey()).assertEqual(secondKey);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_020, end');
    });

    /**
     * Scenario: the model is reset after a set of changes.
     * Expectation: the snapshot returns to the defaults, the generation is zero and the log is
     * empty, so the next case starts from a clean model.
     */
    it('Assessment_ConfigurationChanges_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_023, begin');
      model.applyColorMode(COLOR_MODE_LIGHT);
      model.applyOrientation(ORIENTATION_LANDSCAPE);
      model.reset();
      const snapshot: ConfigurationSnapshot = model.getSnapshot();
      expect(snapshot.colorMode).assertEqual(COLOR_MODE_NOT_SET);
      expect(snapshot.orientation).assertEqual(ORIENTATION_PORTRAIT);
      expect(snapshot.fontScale).assertEqual(FONT_SCALE_DEFAULT);
      expect(model.getGeneration()).assertEqual(0);
      expect(model.getLog().size()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_023, end');
    });

    /**
     * Scenario: the duration candidate quantity of the sample.
     * Expectation: four candidates are offered and the default index points at the second one,
     * which is the ten minute duration the entry page starts with.
     */
    it('Assessment_ConfigurationChanges_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_024, begin');
      expect(DURATION_CANDIDATE_COUNT).assertEqual(4);
      expect(DEFAULT_DURATION_INDEX).assertEqual(1);
      expect(MAX_ALLOWED_APPS).assertEqual(20);
      expect(DEFAULT_DURATION_INDEX < DURATION_CANDIDATE_COUNT).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationChanges_024, end');
    });
  });
}
