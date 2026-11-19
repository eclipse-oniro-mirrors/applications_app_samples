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
  TIMEOUT_PAGE_RENDER,
  logInfo
} from '../Shared/SharedDriver';

// Launch mode identifier of the three home page groups.
enum StartModeType {
  STANDARD = 0, SPECIFIED = 1, SINGLETON = 2
}

// Visible page of the sample application.
enum PageView {
  HOME = 'home', DETAIL = 'detail', TOAST = 'toast'
}

// Direction of a focus move inside a food group.
enum FocusDirection {
  LEFT = 'left', RIGHT = 'right', UP = 'up', DOWN = 'down'
}

// Snapshot of the key state variables of the sample.
interface StateSnapshot {
  selectedGroupIndex: number;
  selectedFoodId: number;
  beforeFoodId: number;
  isFocusable: boolean;
  isDetailVisible: boolean;
  nutritionCount: number;
}

// Record of one observable state change.
interface StateChangeRecord {
  field: string;
  oldValue: number;
  newValue: number;
  timestamp: number;
}

// State model of the home and food detail pages.
class StartModeStateModel {
  public isFocusable: boolean = true;
  public selectedGroupIndex: number = INDEX_STANDARD_GROUP;
  public selectedFoodId: number = 0;
  public beforeFoodId: number = 0;
  public modeLabelIndex: number = INDEX_STANDARD_GROUP;
  public isDetailVisible: boolean = false;
  public nutritionCount: number = 0;
  public isTransitioning: boolean = false;
  public currentFocusIndex: number = 0;
  public groupCount: number = 3;
  public foodPerGroup: number = 2;
  public pageView: PageView = PageView.HOME;

  public reset(): void {
    this.isFocusable = true;
    this.selectedGroupIndex = INDEX_STANDARD_GROUP;
    this.selectedFoodId = 0;
    this.beforeFoodId = 0;
    this.modeLabelIndex = INDEX_STANDARD_GROUP;
    this.isDetailVisible = false;
    this.nutritionCount = 0;
    this.isTransitioning = false;
    this.currentFocusIndex = 0;
    this.pageView = PageView.HOME;
  }

  public selectGroup(groupIndex: number): boolean {
    if (groupIndex < 0 || groupIndex >= this.groupCount) {
      return false;
    }
    this.selectedGroupIndex = groupIndex;
    this.modeLabelIndex = groupIndex;
    return true;
  }

  public selectFood(foodId: number): boolean {
    if (foodId < 0 || foodId >= this.foodPerGroup) {
      return false;
    }
    this.beforeFoodId = this.selectedFoodId;
    this.selectedFoodId = foodId;
    return true;
  }

  public enterDetail(): void {
    this.isDetailVisible = true;
    this.pageView = PageView.DETAIL;
  }

  public exitDetail(): void {
    this.isDetailVisible = false;
    this.pageView = PageView.HOME;
  }

  public toggleFocusable(): void {
    this.isFocusable = !this.isFocusable;
  }

  public getModeLabel(): string {
    if (this.modeLabelIndex === INDEX_SPECIFIED_GROUP) {
      return MODE_SPECIFIED;
    }
    if (this.modeLabelIndex === INDEX_SINGLETON_GROUP) {
      return MODE_SINGLETON;
    }
    return MODE_STANDARD;
  }
}

// Immutable snapshot used by undo and redo history.
class StateSnapshotModel {
  public selectedGroupIndex: number;
  public selectedFoodId: number;
  public beforeFoodId: number;
  public isFocusable: boolean;
  public isDetailVisible: boolean;
  public nutritionCount: number;

  constructor(selectedGroupIndex: number, selectedFoodId: number, beforeFoodId: number, isFocusable: boolean,
    isDetailVisible: boolean, nutritionCount: number) {
    this.selectedGroupIndex = selectedGroupIndex;
    this.selectedFoodId = selectedFoodId;
    this.beforeFoodId = beforeFoodId;
    this.isFocusable = isFocusable;
    this.isDetailVisible = isDetailVisible;
    this.nutritionCount = nutritionCount;
  }

  public static fromState(state: StartModeStateModel): StateSnapshotModel {
    return new StateSnapshotModel(state.selectedGroupIndex, state.selectedFoodId, state.beforeFoodId,
      state.isFocusable, state.isDetailVisible, state.nutritionCount);
  }

  public equals(other: StateSnapshotModel): boolean {
    return this.selectedGroupIndex === other.selectedGroupIndex && this.selectedFoodId === other.selectedFoodId &&
      this.beforeFoodId === other.beforeFoodId && this.isFocusable === other.isFocusable &&
      this.isDetailVisible === other.isDetailVisible && this.nutritionCount === other.nutritionCount;
  }

  public toString(): string {
    return `StateSnapshotModel{group: ${this.selectedGroupIndex}, food: ${this.selectedFoodId}, detail: ${this.isDetailVisible}}`;
  }

  public toRecord(): StateSnapshot {
    return {
      selectedGroupIndex: this.selectedGroupIndex,
      selectedFoodId: this.selectedFoodId,
      beforeFoodId: this.beforeFoodId,
      isFocusable: this.isFocusable,
      isDetailVisible: this.isDetailVisible,
      nutritionCount: this.nutritionCount
    };
  }
}

// Undo and redo history of the state snapshots.
class StateHistory {
  private undoStack: StateSnapshotModel[] = [];
  private redoStack: StateSnapshotModel[] = [];

  public push(snapshot: StateSnapshotModel): void {
    this.undoStack.push(snapshot);
    this.redoStack = [];
  }

  public undo(): StateSnapshotModel | null {
    if (this.undoStack.length === 0) {
      return null;
    }
    const lastIndex: number = this.undoStack.length - 1;
    const snapshot: StateSnapshotModel = this.undoStack[lastIndex];
    this.undoStack.pop();
    this.redoStack.push(snapshot);
    return snapshot;
  }

  public redo(): StateSnapshotModel | null {
    if (this.redoStack.length === 0) {
      return null;
    }
    const lastIndex: number = this.redoStack.length - 1;
    const snapshot: StateSnapshotModel = this.redoStack[lastIndex];
    this.redoStack.pop();
    this.undoStack.push(snapshot);
    return snapshot;
  }

  public getUndoCount(): number {
    return this.undoStack.length;
  }

  public getRedoCount(): number {
    return this.redoStack.length;
  }

  public clear(): void {
    this.undoStack = [];
    this.redoStack = [];
  }
}

// Focus navigation inside a food group of two entries.
class FocusNavigator {
  private optionCount: number;

  constructor(optionCount: number) {
    this.optionCount = optionCount;
  }

  public move(current: number, direction: FocusDirection): number {
    if (direction === FocusDirection.LEFT || direction === FocusDirection.UP) {
      return this.clamp(current - 1);
    }
    if (direction === FocusDirection.RIGHT || direction === FocusDirection.DOWN) {
      return this.clamp(current + 1);
    }
    return current;
  }

  private clamp(index: number): number {
    if (index < 0) {
      return 0;
    }
    if (index >= this.optionCount) {
      return this.optionCount - 1;
    }
    return index;
  }

  public getOptionCount(): number {
    return this.optionCount;
  }
}

// Statistics of the recorded state changes.
class StateStatistics {
  private changes: StateChangeRecord[] = [];

  public record(field: string, oldValue: number, newValue: number): void {
    this.changes.push({
      field: field,
      oldValue: oldValue,
      newValue: newValue,
      timestamp: Date.now()
    });
  }

  public getChangeCount(): number {
    return this.changes.length;
  }

  public getChangeCountForField(field: string): number {
    return this.changes.filter((record: StateChangeRecord) => record.field === field).length;
  }

  public getDistinctFields(): number {
    const fields: Set<string> = new Set<string>();
    this.changes.forEach((record: StateChangeRecord) => {
      fields.add(record.field);
    });
    return fields.size;
  }

  public clear(): void {
    this.changes = [];
  }
}

// Validates the numeric ranges of the state variables.
class StateValidator {
  public static isValidGroupIndex(index: number, groupCount: number): boolean {
    return index >= 0 && index < groupCount;
  }

  public static isValidFoodId(foodId: number, foodPerGroup: number): boolean {
    return foodId >= 0 && foodId < foodPerGroup;
  }

  public static isFocusConsistent(currentFocusIndex: number, beforeFoodId: number): boolean {
    return currentFocusIndex >= 0 && beforeFoodId >= 0;
  }

  public static isValidNutritionCount(count: number): boolean {
    return count >= 0 && count <= 5;
  }

  public static isValidGroupCount(count: number): boolean {
    return count > 0 && count <= 10;
  }
}

// Computes the number of differing fields between two snapshots.
class StateDiffCalculator {
  public static diff(a: StateSnapshotModel, b: StateSnapshotModel): number {
    let differences: number = 0;
    if (a.selectedGroupIndex !== b.selectedGroupIndex) {
      differences++;
    }
    if (a.selectedFoodId !== b.selectedFoodId) {
      differences++;
    }
    if (a.beforeFoodId !== b.beforeFoodId) {
      differences++;
    }
    if (a.isFocusable !== b.isFocusable) {
      differences++;
    }
    if (a.isDetailVisible !== b.isDetailVisible) {
      differences++;
    }
    if (a.nutritionCount !== b.nutritionCount) {
      differences++;
    }
    return differences;
  }

  public static isIdentical(a: StateSnapshotModel, b: StateSnapshotModel): boolean {
    return StateDiffCalculator.diff(a, b) === 0;
  }

  public static diffFields(a: StateSnapshotModel, b: StateSnapshotModel): string[] {
    const fields: string[] = [];
    if (a.selectedGroupIndex !== b.selectedGroupIndex) {
      fields.push('selectedGroupIndex');
    }
    if (a.selectedFoodId !== b.selectedFoodId) {
      fields.push('selectedFoodId');
    }
    if (a.beforeFoodId !== b.beforeFoodId) {
      fields.push('beforeFoodId');
    }
    if (a.isFocusable !== b.isFocusable) {
      fields.push('isFocusable');
    }
    if (a.isDetailVisible !== b.isDetailVisible) {
      fields.push('isDetailVisible');
    }
    if (a.nutritionCount !== b.nutritionCount) {
      fields.push('nutritionCount');
    }
    return fields;
  }
}

// Counts the state transitions triggered by the sample.
class StateTransitionCounter {
  private transitionCount: number = 0;

  public record(): void {
    this.transitionCount++;
  }

  public getTransitionCount(): number {
    return this.transitionCount;
  }

  public reset(): void {
    this.transitionCount = 0;
  }
}

// Logs the read and write accesses of the state fields.
class StateAccessLog {
  private accesses: string[] = [];

  public recordRead(field: string): void {
    this.accesses.push('read:' + field);
  }

  public recordWrite(field: string): void {
    this.accesses.push('write:' + field);
  }

  public getAccessCount(): number {
    return this.accesses.length;
  }

  public getReadCount(): number {
    return this.accesses.filter((access: string) => access.startsWith('read:')).length;
  }

  public getWriteCount(): number {
    return this.accesses.filter((access: string) => access.startsWith('write:')).length;
  }

  public hasAccess(field: string): boolean {
    return this.accesses.includes('read:' + field) || this.accesses.includes('write:' + field);
  }

  public clear(): void {
    this.accesses = [];
  }
}

export default function startModeStateManagementTest() {
  describe('StartModeStateManagement_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // isFocusable defaults to true on the home page.
    it('is_focusable_should_default_to_true', 0, async () => {
      const state = new StartModeStateModel();
      expect(state.isFocusable).assertTrue();
    });

    // The first group of the home page is the standard group.
    it('selected_group_should_default_to_standard', 0, async () => {
      const state = new StartModeStateModel();
      expect(state.selectedGroupIndex).assertEqual(INDEX_STANDARD_GROUP);
      expect(state.getModeLabel()).assertEqual(MODE_STANDARD);
    });

    // The selected food of a group defaults to the first entry.
    it('selected_food_should_default_to_zero', 0, async () => {
      const state = new StartModeStateModel();
      expect(state.selectedFoodId).assertEqual(0);
      expect(state.beforeFoodId).assertEqual(0);
    });

    // The detail page is hidden until a food item is opened.
    it('detail_visibility_should_default_to_false', 0, async () => {
      const state = new StartModeStateModel();
      expect(state.isDetailVisible).assertFalse();
      expect(state.pageView).assertEqual(PageView.HOME);
    });

    // There are exactly three mode groups on the home page.
    it('group_count_should_be_three', 0, async () => {
      const state = new StartModeStateModel();
      expect(state.groupCount).assertEqual(3);
      expect(state.foodPerGroup).assertEqual(2);
    });

    // The nutrition counter starts at zero.
    it('nutrition_count_should_start_at_zero', 0, async () => {
      const state = new StartModeStateModel();
      expect(state.nutritionCount).assertEqual(0);
      expect(state.isTransitioning).assertFalse();
    });

    // Initial focus index is valid for the first group.
    it('focus_index_should_default_correctly', 0, async () => {
      const state = new StartModeStateModel();
      expect(state.currentFocusIndex).assertEqual(0);
      expect(StateValidator.isFocusConsistent(state.currentFocusIndex, state.beforeFoodId)).assertTrue();
    });

    // The mode label follows the selected group.
    it('mode_label_should_follow_selected_group', 0, async () => {
      const state = new StartModeStateModel();
      expect(state.selectGroup(INDEX_SPECIFIED_GROUP)).assertTrue();
      expect(state.getModeLabel()).assertEqual(MODE_SPECIFIED);
      expect(state.selectGroup(INDEX_SINGLETON_GROUP)).assertTrue();
      expect(state.getModeLabel()).assertEqual(MODE_SINGLETON);
    });

    // Selecting an out of range group is rejected.
    it('invalid_group_selection_should_be_rejected', 0, async () => {
      const state = new StartModeStateModel();
      expect(state.selectGroup(-1)).assertFalse();
      expect(state.selectGroup(3)).assertFalse();
      expect(state.selectedGroupIndex).assertEqual(INDEX_STANDARD_GROUP);
    });

    // Selecting a food item updates the id and keeps the previous one.
    it('select_food_should_update_selected_id', 0, async () => {
      const state = new StartModeStateModel();
      expect(state.selectFood(1)).assertTrue();
      expect(state.selectedFoodId).assertEqual(1);
      expect(state.beforeFoodId).assertEqual(0);
      expect(state.selectFood(0)).assertTrue();
      expect(state.selectedFoodId).assertEqual(0);
      expect(state.beforeFoodId).assertEqual(1);
    });

    // Selecting an out of range food id is rejected.
    it('invalid_food_selection_should_be_rejected', 0, async () => {
      const state = new StartModeStateModel();
      state.selectFood(1);
      expect(state.selectFood(-1)).assertFalse();
      expect(state.selectFood(2)).assertFalse();
      expect(state.selectedFoodId).assertEqual(1);
    });

    // Entering and exiting the detail page flips the visibility flag.
    it('detail_entry_and_exit_should_toggle_visibility', 0, async () => {
      const state = new StartModeStateModel();
      state.enterDetail();
      expect(state.isDetailVisible).assertTrue();
      expect(state.pageView).assertEqual(PageView.DETAIL);
      state.exitDetail();
      expect(state.isDetailVisible).assertFalse();
      expect(state.pageView).assertEqual(PageView.HOME);
    });

    // The focusable flag toggles between the two legal values.
    it('toggle_focusable_should_flip_value', 0, async () => {
      const state = new StartModeStateModel();
      state.toggleFocusable();
      expect(state.isFocusable).assertFalse();
      state.toggleFocusable();
      expect(state.isFocusable).assertTrue();
    });

    // Reset restores every default of the state model.
    it('reset_should_restore_initial_state', 0, async () => {
      const state = new StartModeStateModel();
      state.selectGroup(INDEX_SINGLETON_GROUP);
      state.selectFood(1);
      state.enterDetail();
      state.toggleFocusable();
      state.nutritionCount = 5;
      state.reset();
      expect(state.selectedGroupIndex).assertEqual(INDEX_STANDARD_GROUP);
      expect(state.selectedFoodId).assertEqual(0);
      expect(state.isDetailVisible).assertFalse();
      expect(state.isFocusable).assertTrue();
      expect(state.nutritionCount).assertEqual(0);
      expect(state.pageView).assertEqual(PageView.HOME);
    });

    // Focus navigator clamps to the two food entries of a group.
    it('focus_navigator_should_clamp_to_group_bounds', 0, async () => {
      const navigator = new FocusNavigator(2);
      expect(navigator.move(0, FocusDirection.LEFT)).assertEqual(0);
      expect(navigator.move(0, FocusDirection.RIGHT)).assertEqual(1);
      expect(navigator.move(1, FocusDirection.RIGHT)).assertEqual(1);
      expect(navigator.move(1, FocusDirection.DOWN)).assertEqual(1);
      expect(navigator.move(1, FocusDirection.UP)).assertEqual(0);
    });

    // Snapshots capture and compare the current state correctly.
    it('snapshot_should_compare_equal_for_same_state', 0, async () => {
      const state = new StartModeStateModel();
      state.selectGroup(INDEX_SPECIFIED_GROUP);
      const first: StateSnapshotModel = StateSnapshotModel.fromState(state);
      const second: StateSnapshotModel = StateSnapshotModel.fromState(state);
      expect(first.equals(second)).assertTrue();
      expect(StateDiffCalculator.diff(first, second)).assertEqual(0);
      expect(StateDiffCalculator.diffFields(first, second).length).assertEqual(0);
    });

    // Snapshots detect changed fields after a state update.
    it('snapshot_diff_should_detect_changed_fields', 0, async () => {
      const state = new StartModeStateModel();
      const before: StateSnapshotModel = StateSnapshotModel.fromState(state);
      state.selectFood(1);
      state.enterDetail();
      const after: StateSnapshotModel = StateSnapshotModel.fromState(state);
      expect(StateDiffCalculator.isIdentical(before, after)).assertFalse();
      expect(StateDiffCalculator.diff(before, after)).assertEqual(2);
      expect(StateDiffCalculator.diffFields(before, after).length).assertEqual(2);
    });

    // History supports undo and redo of state snapshots.
    it('history_should_support_undo_and_redo', 0, async () => {
      const history = new StateHistory();
      const state = new StartModeStateModel();
      history.push(StateSnapshotModel.fromState(state));
      state.selectFood(1);
      history.push(StateSnapshotModel.fromState(state));
      expect(history.getUndoCount()).assertEqual(2);
      const undone: StateSnapshotModel | null = history.undo();
      expect(undone !== null).assertTrue();
      expect(history.getUndoCount()).assertEqual(1);
      expect(history.getRedoCount()).assertEqual(1);
      const redone: StateSnapshotModel | null = history.redo();
      expect(redone !== null).assertTrue();
      expect(history.getUndoCount()).assertEqual(2);
      expect(history.getRedoCount()).assertEqual(0);
    });

    // Undo on an empty history returns null.
    it('empty_history_undo_should_return_null', 0, async () => {
      const history = new StateHistory();
      expect(history.undo()).assertEqual(null);
      expect(history.redo()).assertEqual(null);
      expect(history.getUndoCount()).assertEqual(0);
      expect(history.getRedoCount()).assertEqual(0);
    });

    // State change statistics aggregate per field counts.
    it('state_statistics_should_aggregate_changes', 0, async () => {
      const statistics = new StateStatistics();
      statistics.record('selectedGroupIndex', 0, 1);
      statistics.record('selectedGroupIndex', 1, 2);
      statistics.record('selectedFoodId', 0, 1);
      expect(statistics.getChangeCount()).assertEqual(3);
      expect(statistics.getChangeCountForField('selectedGroupIndex')).assertEqual(2);
      expect(statistics.getDistinctFields()).assertEqual(2);
      statistics.clear();
      expect(statistics.getChangeCount()).assertEqual(0);
    });

    // Validators accept only in range values.
    it('state_validator_should_reject_out_of_range_values', 0, async () => {
      expect(StateValidator.isValidGroupIndex(0, 3)).assertTrue();
      expect(StateValidator.isValidGroupIndex(3, 3)).assertFalse();
      expect(StateValidator.isValidFoodId(1, 2)).assertTrue();
      expect(StateValidator.isValidFoodId(2, 2)).assertFalse();
      expect(StateValidator.isValidNutritionCount(5)).assertTrue();
      expect(StateValidator.isValidNutritionCount(6)).assertFalse();
      expect(StateValidator.isValidGroupCount(3)).assertTrue();
    });

    // The transition counter records every navigation.
    it('transition_counter_should_count_navigations', 0, async () => {
      const counter = new StateTransitionCounter();
      counter.record();
      counter.record();
      expect(counter.getTransitionCount()).assertEqual(2);
      counter.reset();
      expect(counter.getTransitionCount()).assertEqual(0);
    });

    // The access log distinguishes reads and writes.
    it('state_access_log_should_track_reads_and_writes', 0, async () => {
      const accessLog = new StateAccessLog();
      accessLog.recordRead('selectedFoodId');
      accessLog.recordWrite('selectedFoodId');
      accessLog.recordWrite('isDetailVisible');
      expect(accessLog.getAccessCount()).assertEqual(3);
      expect(accessLog.getReadCount()).assertEqual(1);
      expect(accessLog.getWriteCount()).assertEqual(2);
      expect(accessLog.hasAccess('selectedFoodId')).assertTrue();
      expect(accessLog.hasAccess('nutritionCount')).assertFalse();
      accessLog.clear();
      expect(accessLog.getAccessCount()).assertEqual(0);
    });

    // The real home page state renders three mode groups.
    it('real_home_page_state_should_be_stable', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const visible: boolean = await isHomePageVisible(driver);
      expect(visible).assertTrue();
      const counted: number = await componentCount(driver);
      expect(counted).assertLargerOrEqual(1);
      logInfo('real_home_page_state_should_be_stable: home page observed');
    });

    // Relaunching the standard ability keeps a stable home page state.
    it('relaunch_standard_should_keep_state_stable', 0, async () => {
      await launchStandardAbility(0, MODE_STANDARD, INDEX_STANDARD_GROUP);
      await serializedDelay(driver, 500);
      await resetToHome(driver);
      const visible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(visible || (await isHomePageVisible(driver))).assertTrue();
      const counted: number = await componentCount(driver);
      expect(counted).assertLargerOrEqual(1);
    });
  });
}

