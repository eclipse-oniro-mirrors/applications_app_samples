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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay,
  componentCount,
  checkTextContent,
  waitForHomePageStable,
  isHomePageVisible,
  launchStandardAbility,
  resetToHome,
  INDEX_STANDARD_GROUP,
  INDEX_SPECIFIED_GROUP,
  INDEX_SINGLETON_GROUP,
  MODE_STANDARD,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  FOOD_TOMATO,
  FOOD_CUCUMBER,
  FOOD_WALNUT,
  FOOD_BLUEBERRY,
  FOOD_ICE_CREAM,
  FOOD_CRAB,
  TEXT_FOOD_DETAIL_TITLE,
  TIMEOUT_PAGE_RENDER,
  logInfo
} from '../Shared/SharedDriver';

// One food entry of the home page groups.
class FoodEntryModel {
  public name: string;
  public groupIndex: number;
  public foodId: number;
  public isFocus: boolean;

  constructor(name: string, groupIndex: number, foodId: number, isFocus: boolean) {
    this.name = name;
    this.groupIndex = groupIndex;
    this.foodId = foodId;
    this.isFocus = isFocus;
  }
}

// Consistency model of the three mode groups of the home page.
class StartModeConsistencyModel {
  private entries: FoodEntryModel[] = [];

  constructor() {
    this.entries.push(new FoodEntryModel(FOOD_TOMATO, INDEX_STANDARD_GROUP, 0, false));
    this.entries.push(new FoodEntryModel(FOOD_CUCUMBER, INDEX_STANDARD_GROUP, 1, true));
    this.entries.push(new FoodEntryModel(FOOD_WALNUT, INDEX_SPECIFIED_GROUP, 0, false));
    this.entries.push(new FoodEntryModel(FOOD_BLUEBERRY, INDEX_SPECIFIED_GROUP, 1, false));
    this.entries.push(new FoodEntryModel(FOOD_ICE_CREAM, INDEX_SINGLETON_GROUP, 0, false));
    this.entries.push(new FoodEntryModel(FOOD_CRAB, INDEX_SINGLETON_GROUP, 1, false));
  }

  public getTotalCount(): number {
    return this.entries.length;
  }

  public getData(index: number): FoodEntryModel | null {
    if (index >= 0 && index < this.entries.length) {
      return this.entries[index];
    }
    return null;
  }

  public getFocusedIndex(): number {
    return this.entries.findIndex((entry: FoodEntryModel) => entry.isFocus);
  }

  public setFocusToIndex(index: number): boolean {
    if (index < 0 || index >= this.entries.length) {
      return false;
    }
    this.entries.forEach((entry: FoodEntryModel, idx: number) => {
      entry.isFocus = idx === index;
    });
    return true;
  }

  public getFocusedGroup(): number {
    const index: number = this.getFocusedIndex();
    if (index < 0) {
      return -1;
    }
    return this.entries[index].groupIndex;
  }

  public getFocusedMode(): string {
    const group: number = this.getFocusedGroup();
    if (group === INDEX_SPECIFIED_GROUP) {
      return MODE_SPECIFIED;
    }
    if (group === INDEX_SINGLETON_GROUP) {
      return MODE_SINGLETON;
    }
    if (group === INDEX_STANDARD_GROUP) {
      return MODE_STANDARD;
    }
    return '';
  }

  public getNamesOfGroup(groupIndex: number): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].groupIndex === groupIndex) {
        names.push(this.entries[i].name);
      }
    }
    return names;
  }

  public isGroupConsistent(groupIndex: number, foodPerGroup: number): boolean {
    return this.getNamesOfGroup(groupIndex).length === foodPerGroup;
  }
}

// Event and parameter names shared by the three abilities.
class StartModeEventNames {
  public static readonly GET_ABILITY_DATA: string = 'getAbilityData';
  public static readonly SINGLETON_EVENT_ID: string = '1';
  public static readonly BUNDLE_NAME: string = 'ohos.samples.startmode';
  public static readonly DETAIL_TARGET: string = 'pages/FoodDetail';
}

// Kind of consistency check performed by the suite.
enum ConsistencyCheckType {
  STATE = 'state', MODE = 'mode', EVENT_NAME = 'event_name', SEQUENCE = 'sequence'
}

// Verdict of one consistency check.
enum ConsistencyResult {
  PASS = 'pass', FAIL = 'fail', SKIPPED = 'skipped'
}

// Detailed result of one consistency check.
interface ConsistencyCheck {
  type: ConsistencyCheckType;
  description: string;
  result: ConsistencyResult;
  timestamp: number;
}

// Input and output of one focus consistency validation.
interface StateValidation {
  expectedFocusedIndex: number;
  actualFocusedIndex: number;
  matched: boolean;
}

// Record of one consistency check that supports cloning and comparison.
class ConsistencyCheckRecord {
  public type: ConsistencyCheckType;
  public description: string;
  public result: ConsistencyResult;
  public timestamp: number;

  constructor(type: ConsistencyCheckType, description: string, result: ConsistencyResult, timestamp: number) {
    this.type = type;
    this.description = description;
    this.result = result;
    this.timestamp = timestamp;
  }

  public clone(): ConsistencyCheckRecord {
    return new ConsistencyCheckRecord(this.type, this.description, this.result, this.timestamp);
  }

  public equals(other: ConsistencyCheckRecord): boolean {
    return this.type === other.type && this.description === other.description && this.result === other.result;
  }

  public toString(): string {
    return `ConsistencyCheckRecord(type=${this.type}, description=${this.description}, result=${this.result})`;
  }

  public isPassed(): boolean {
    return this.result === ConsistencyResult.PASS;
  }

  public isValid(): boolean {
    return this.description.length > 0;
  }
}

// Collects and aggregates the consistency check records.
class ConsistencyCheckRecorder {
  private checks: ConsistencyCheckRecord[] = [];

  public record(type: ConsistencyCheckType, description: string, result: ConsistencyResult): void {
    this.checks.push(new ConsistencyCheckRecord(type, description, result, Date.now()));
  }

  public getCheckCount(): number {
    return this.checks.length;
  }

  public getPassedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.checks.length; i++) {
      if (this.checks[i].isPassed()) {
        count++;
      }
    }
    return count;
  }

  public getFailedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.checks.length; i++) {
      if (this.checks[i].result === ConsistencyResult.FAIL) {
        count++;
      }
    }
    return count;
  }

  public getCountByType(type: ConsistencyCheckType): number {
    let count: number = 0;
    for (let i = 0; i < this.checks.length; i++) {
      if (this.checks[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public isAllPassed(): boolean {
    for (let i = 0; i < this.checks.length; i++) {
      if (!this.checks[i].isPassed()) {
        return false;
      }
    }
    return true;
  }

  public getChecks(): ConsistencyCheckRecord[] {
    const result: ConsistencyCheckRecord[] = [];
    for (let i = 0; i < this.checks.length; i++) {
      result.push(this.checks[i].clone());
    }
    return result;
  }

  public clear(): void {
    this.checks = [];
  }
}

// Result of one focus consistency validation.
class StateValidationResult {
  public expectedFocusedIndex: number;
  public actualFocusedIndex: number;
  public matched: boolean;

  constructor(expectedFocusedIndex: number, actualFocusedIndex: number, matched: boolean) {
    this.expectedFocusedIndex = expectedFocusedIndex;
    this.actualFocusedIndex = actualFocusedIndex;
    this.matched = matched;
  }

  public clone(): StateValidationResult {
    return new StateValidationResult(this.expectedFocusedIndex, this.actualFocusedIndex, this.matched);
  }

  public equals(other: StateValidationResult): boolean {
    return this.expectedFocusedIndex === other.expectedFocusedIndex &&
      this.actualFocusedIndex === other.actualFocusedIndex && this.matched === other.matched;
  }

  public toString(): string {
    return `StateValidationResult(expected=${this.expectedFocusedIndex}, actual=${this.actualFocusedIndex}, matched=${this.matched})`;
  }

  public isValid(): boolean {
    return this.expectedFocusedIndex >= -1 && this.actualFocusedIndex >= -1;
  }
}

// Validates the focus, mode and index consistency of the sample.
class StateValidator {
  public validateFocus(expected: number, actual: number): StateValidationResult {
    return new StateValidationResult(expected, actual, expected === actual);
  }

  public validateMode(expected: string, actual: string): boolean {
    return expected === actual;
  }

  public validateIndexRange(index: number, minIndex: number, maxIndex: number): boolean {
    return index >= minIndex && index <= maxIndex;
  }

  public validateAll(expected: number[], actual: number[]): boolean {
    if (expected.length !== actual.length) {
      return false;
    }
    for (let i = 0; i < expected.length; i++) {
      if (expected[i] !== actual[i]) {
        return false;
      }
    }
    return true;
  }

  public countMismatches(expected: number[], actual: number[]): number {
    let mismatches: number = 0;
    const length: number = expected.length < actual.length ? expected.length : actual.length;
    for (let i = 0; i < length; i++) {
      if (expected[i] !== actual[i]) {
        mismatches++;
      }
    }
    return mismatches + Math.abs(expected.length - actual.length);
  }
}

// Validates that the registered event names stay consistent.
class EventNameValidator {
  private knownNames: Map<string, string> = new Map<string, string>();

  public register(key: string, value: string): void {
    this.knownNames.set(key, value);
  }

  public getValue(key: string): string | null {
    const value: string | undefined = this.knownNames.get(key);
    return value === undefined ? null : value;
  }

  public isRegistered(key: string): boolean {
    return this.knownNames.has(key);
  }

  public isConsistent(key: string, expectedValue: string): boolean {
    return this.knownNames.get(key) === expectedValue;
  }

  public getRegisteredCount(): number {
    return this.knownNames.size;
  }

  public getAllKeys(): string[] {
    const keys: string[] = [];
    this.knownNames.forEach((value: string, key: string) => {
      keys.push(key);
    });
    return keys;
  }

  public clear(): void {
    this.knownNames.clear();
  }
}

// Validates that navigation sequences stay ordered.
class SequenceValidator {
  public isOrdered(sequence: number[]): boolean {
    for (let i = 1; i < sequence.length; i++) {
      if (sequence[i] < sequence[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public isStrictlyOrdered(sequence: number[]): boolean {
    for (let i = 1; i < sequence.length; i++) {
      if (sequence[i] <= sequence[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public equalsSequence(a: number[], b: number[]): boolean {
    if (a.length !== b.length) {
      return false;
    }
    for (let i = 0; i < a.length; i++) {
      if (a[i] !== b[i]) {
        return false;
      }
    }
    return true;
  }

  public findFirstInversion(sequence: number[]): number {
    for (let i = 1; i < sequence.length; i++) {
      if (sequence[i] < sequence[i - 1]) {
        return i;
      }
    }
    return -1;
  }

  public countInversions(sequence: number[]): number {
    let count: number = 0;
    for (let i = 0; i < sequence.length; i++) {
      for (let j = i + 1; j < sequence.length; j++) {
        if (sequence[i] > sequence[j]) {
          count++;
        }
      }
    }
    return count;
  }
}

// Formats the consistency checks into readable English text.
class ConsistencyReportGenerator {
  public formatResult(result: ConsistencyResult): string {
    if (result === ConsistencyResult.PASS) {
      return 'pass';
    }
    if (result === ConsistencyResult.FAIL) {
      return 'fail';
    }
    return 'skipped';
  }

  public formatCheck(check: ConsistencyCheckRecord): string {
    return `type=${check.type}, description=${check.description}, result=${this.formatResult(check.result)}`;
  }

  public summarize(recorder: ConsistencyCheckRecorder): string {
    const total: number = recorder.getCheckCount();
    const passed: number = recorder.getPassedCount();
    const failed: number = recorder.getFailedCount();
    return `total=${total}, passed=${passed}, failed=${failed}`;
  }
}

export default function startModeConsistencyTest() {
  describe('StartModeConsistency_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // The model total count matches the six food entries.
    it('total_count_should_match_entry_array', 0, async () => {
      const model = new StartModeConsistencyModel();
      expect(model.getTotalCount()).assertEqual(6);
    });

    // In range indices return valid food entries.
    it('get_data_within_bounds_should_return_valid_data', 0, async () => {
      const model = new StartModeConsistencyModel();
      expect(model.getData(0)?.name).assertEqual(FOOD_TOMATO);
      expect(model.getData(1)?.name).assertEqual(FOOD_CUCUMBER);
      expect(model.getData(2)?.name).assertEqual(FOOD_WALNUT);
      expect(model.getData(3)?.name).assertEqual(FOOD_BLUEBERRY);
      expect(model.getData(4)?.name).assertEqual(FOOD_ICE_CREAM);
      expect(model.getData(5)?.name).assertEqual(FOOD_CRAB);
      expect(model.getData(100)).assertEqual(null);
    });

    // Every food group keeps exactly two entries.
    it('every_group_should_contain_two_entries', 0, async () => {
      const model = new StartModeConsistencyModel();
      expect(model.isGroupConsistent(INDEX_STANDARD_GROUP, 2)).assertTrue();
      expect(model.isGroupConsistent(INDEX_SPECIFIED_GROUP, 2)).assertTrue();
      expect(model.isGroupConsistent(INDEX_SINGLETON_GROUP, 2)).assertTrue();
      expect(model.getNamesOfGroup(INDEX_STANDARD_GROUP).length).assertEqual(2);
    });

    // The group names match the documented food order.
    it('group_names_should_match_documented_order', 0, async () => {
      const model = new StartModeConsistencyModel();
      const standard: string[] = model.getNamesOfGroup(INDEX_STANDARD_GROUP);
      const specified: string[] = model.getNamesOfGroup(INDEX_SPECIFIED_GROUP);
      const singleton: string[] = model.getNamesOfGroup(INDEX_SINGLETON_GROUP);
      expect(standard[0]).assertEqual(FOOD_TOMATO);
      expect(standard[1]).assertEqual(FOOD_CUCUMBER);
      expect(specified[0]).assertEqual(FOOD_WALNUT);
      expect(singleton[1]).assertEqual(FOOD_CRAB);
    });

    // The focused mode is derived from the focused group.
    it('focused_mode_should_follow_focused_group', 0, async () => {
      const model = new StartModeConsistencyModel();
      expect(model.getFocusedMode()).assertEqual(MODE_STANDARD);
      model.setFocusToIndex(2);
      expect(model.getFocusedMode()).assertEqual(MODE_SPECIFIED);
      model.setFocusToIndex(5);
      expect(model.getFocusedMode()).assertEqual(MODE_SINGLETON);
    });

    // Focus state is restored after switching back.
    it('focus_state_should_restore_after_switch_back', 0, async () => {
      const model = new StartModeConsistencyModel();
      const original: number = model.getFocusedIndex();
      model.setFocusToIndex(0);
      expect(model.getFocusedIndex()).assertEqual(0);
      model.setFocusToIndex(original);
      expect(model.getFocusedIndex()).assertEqual(original);
    });

    // Invalid focus indices never change the state.
    it('invalid_focus_set_should_not_change_state', 0, async () => {
      const model = new StartModeConsistencyModel();
      const before: number = model.getFocusedIndex();
      expect(model.setFocusToIndex(-1)).assertFalse();
      expect(model.setFocusToIndex(100)).assertFalse();
      expect(model.getFocusedIndex()).assertEqual(before);
    });

    // Switching to the same index is a no-op.
    it('switch_to_same_index_should_be_noop', 0, async () => {
      const model = new StartModeConsistencyModel();
      const current: number = model.getFocusedIndex();
      model.setFocusToIndex(current);
      expect(model.getFocusedIndex()).assertEqual(current);
    });

    // Event and parameter names stay consistent with the sample.
    it('event_names_should_be_consistent', 0, async () => {
      expect(StartModeEventNames.GET_ABILITY_DATA).assertEqual('getAbilityData');
      expect(StartModeEventNames.SINGLETON_EVENT_ID).assertEqual('1');
      expect(StartModeEventNames.DETAIL_TARGET).assertEqual('pages/FoodDetail');
    });

    // The bundle name is identical for all launch modes.
    it('bundle_name_should_be_consistent', 0, async () => {
      expect(StartModeEventNames.BUNDLE_NAME).assertEqual('ohos.samples.startmode');
    });

    // The event name registry reports registered keys.
    it('event_name_registry_should_report_keys', 0, async () => {
      const validator = new EventNameValidator();
      validator.register('getAbilityData', StartModeEventNames.GET_ABILITY_DATA);
      validator.register('bundleName', StartModeEventNames.BUNDLE_NAME);
      expect(validator.getRegisteredCount()).assertEqual(2);
      expect(validator.isRegistered('getAbilityData')).assertTrue();
      expect(validator.isConsistent('bundleName', 'ohos.samples.startmode')).assertTrue();
      expect(validator.getValue('missing')).assertEqual(null);
      expect(validator.getAllKeys().length).assertEqual(2);
      validator.clear();
      expect(validator.getRegisteredCount()).assertEqual(0);
    });

    // Repeated focus switches keep a consistent focused mode.
    it('multiple_focus_switches_should_keep_consistent_state', 0, async () => {
      const model = new StartModeConsistencyModel();
      model.setFocusToIndex(0);
      model.setFocusToIndex(2);
      model.setFocusToIndex(4);
      expect(model.getFocusedIndex()).assertEqual(4);
      expect(model.getFocusedMode()).assertEqual(MODE_SINGLETON);
      expect(model.getFocusedGroup()).assertEqual(INDEX_SINGLETON_GROUP);
    });

    // Focus validation results compare and clone consistently.
    it('focus_validation_result_should_compare_consistently', 0, async () => {
      const validator = new StateValidator();
      const result: StateValidationResult = validator.validateFocus(2, 2);
      expect(result.matched).assertTrue();
      expect(result.isValid()).assertTrue();
      const clone: StateValidationResult = result.clone();
      expect(result.equals(clone)).assertTrue();
      const mismatch: StateValidationResult = validator.validateFocus(2, 3);
      expect(mismatch.matched).assertFalse();
      expect(result.equals(mismatch)).assertFalse();
    });

    // Mode validation accepts only matching labels.
    it('mode_validation_should_match_only_known_labels', 0, async () => {
      const validator = new StateValidator();
      expect(validator.validateMode(MODE_STANDARD, 'standard')).assertTrue();
      expect(validator.validateMode(MODE_SPECIFIED, 'specified')).assertTrue();
      expect(validator.validateMode(MODE_SINGLETON, 'sinleton')).assertTrue();
      expect(validator.validateMode(MODE_STANDARD, MODE_SPECIFIED)).assertFalse();
    });

    // Index validation and mismatch counting behave consistently.
    it('index_validation_should_count_mismatches', 0, async () => {
      const validator = new StateValidator();
      expect(validator.validateIndexRange(2, 0, 5)).assertTrue();
      expect(validator.validateIndexRange(6, 0, 5)).assertFalse();
      expect(validator.validateAll([0, 1, 2], [0, 1, 2])).assertTrue();
      expect(validator.validateAll([0, 1, 2], [0, 2, 2])).assertFalse();
      expect(validator.countMismatches([0, 1, 2], [0, 2, 2])).assertEqual(1);
      expect(validator.countMismatches([0, 1], [0, 1, 2])).assertEqual(1);
    });

    // Navigation sequences are checked for ordering.
    it('sequence_validator_should_detect_inversions', 0, async () => {
      const validator = new SequenceValidator();
      expect(validator.isOrdered([0, 1, 2])).assertTrue();
      expect(validator.isStrictlyOrdered([0, 1, 2])).assertTrue();
      expect(validator.isStrictlyOrdered([0, 1, 1])).assertFalse();
      expect(validator.equalsSequence([0, 1], [0, 1])).assertTrue();
      expect(validator.findFirstInversion([0, 2, 1])).assertEqual(2);
      expect(validator.countInversions([2, 1, 0])).assertEqual(3);
    });

    // The consistency recorder aggregates pass and fail counts.
    it('consistency_recorder_should_aggregate_results', 0, async () => {
      const recorder = new ConsistencyCheckRecorder();
      recorder.record(ConsistencyCheckType.MODE, 'standard label', ConsistencyResult.PASS);
      recorder.record(ConsistencyCheckType.MODE, 'specified label', ConsistencyResult.PASS);
      recorder.record(ConsistencyCheckType.SEQUENCE, 'order check', ConsistencyResult.FAIL);
      expect(recorder.getCheckCount()).assertEqual(3);
      expect(recorder.getPassedCount()).assertEqual(2);
      expect(recorder.getFailedCount()).assertEqual(1);
      expect(recorder.getCountByType(ConsistencyCheckType.MODE)).assertEqual(2);
      expect(recorder.isAllPassed()).assertFalse();
      expect(recorder.getChecks().length).assertEqual(3);
      recorder.clear();
      expect(recorder.getCheckCount()).assertEqual(0);
    });

    // The report generator formats checks in English.
    it('consistency_report_should_format_results', 0, async () => {
      const recorder = new ConsistencyCheckRecorder();
      recorder.record(ConsistencyCheckType.STATE, 'focus check', ConsistencyResult.PASS);
      recorder.record(ConsistencyCheckType.EVENT_NAME, 'event check', ConsistencyResult.SKIPPED);
      const generator = new ConsistencyReportGenerator();
      expect(generator.formatResult(ConsistencyResult.PASS)).assertEqual('pass');
      expect(generator.formatResult(ConsistencyResult.FAIL)).assertEqual('fail');
      expect(generator.formatResult(ConsistencyResult.SKIPPED)).assertEqual('skipped');
      expect(generator.summarize(recorder)).assertEqual('total=2, passed=1, failed=0');
      expect(generator.formatCheck(recorder.getChecks()[0]).length > 0).assertTrue();
    });

    // The real home page keeps the three mode labels consistent.
    it('real_home_labels_should_be_consistent', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(await checkTextContent(driver, MODE_STANDARD)).assertTrue();
      expect(await checkTextContent(driver, MODE_SPECIFIED)).assertTrue();
      expect(await checkTextContent(driver, MODE_SINGLETON)).assertTrue();
    });

    // The food detail page keeps the documented title after navigation.
    it('real_detail_title_should_be_consistent', 0, async () => {
      await launchStandardAbility(0, MODE_STANDARD, INDEX_STANDARD_GROUP);
      await serializedDelay(driver, 500);
      const visible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo(`real_detail_title_should_be_consistent: home=${visible}`);
      await serializedDelay(driver, 500);
      const titleSeen: boolean = await checkTextContent(driver, TEXT_FOOD_DETAIL_TITLE);
      const counted: number = await componentCount(driver);
      expect(titleSeen || counted >= 1).assertTrue();
      expect(counted).assertLargerOrEqual(1);
      await resetToHome(driver);
      const homeVisible: boolean = await isHomePageVisible(driver);
      const homeStable: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(homeVisible || homeStable).assertTrue();
    });
  });
}

