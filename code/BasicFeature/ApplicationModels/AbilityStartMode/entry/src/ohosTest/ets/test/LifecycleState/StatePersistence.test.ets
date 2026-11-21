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
  KEY_DOWN,
  KEY_UP,
  pressAndWait,
  serializedDelay,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  TOLERANCE_COMPONENT_COUNT,
  MODE_STANDARD,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  INDEX_STANDARD_GROUP,
  INDEX_SPECIFIED_GROUP,
  INDEX_SINGLETON_GROUP,
  FOOD_TOMATO,
  FOOD_WALNUT,
  FOOD_ICE_CREAM,
  TEXT_FOOD_DETAIL_TITLE,
  componentCount,
  waitForHomePageStable,
  waitForFoodDetailStable,
  resetToHome,
  isHomePageVisible,
  isFoodDetailVisible,
  countModeLabels,
  checkTextContent,
  clickModeEntry,
  clickFoodItem,
  foodNamesOfGroup,
  allModeLabels,
  logInfo
} from '../Shared/SharedDriver';

/**
 * Selection states of the start mode sample. A selection starts on the
 * home page, moves to the food detail page and is released when the
 * detail page is closed again.
 */
enum SelectionState {
  NONE = 'none',
  MODE_SELECTED = 'mode_selected',
  ITEM_SELECTED = 'item_selected',
  DETAIL_OPENED = 'detail_opened',
  DETAIL_CLOSED = 'detail_closed'
}

/** One persisted selection observation. */
interface SelectionRecord {
  state: SelectionState;
  modeName: string;
  foodName: string;
  timestamp: number;
  isPersisted: boolean;
}

/**
 * Singleton tracker that remembers which mode and which food item were
 * selected. The persisted flag mirrors the fact that the selection is
 * still carried by the launched ability while the detail page is shown.
 */
class SelectionPersistenceTracker {
  private static instance: SelectionPersistenceTracker;
  private records: SelectionRecord[] = [];
  private totalStates: number = 0;
  private persistedStates: number = 0;

  /** Returns the shared tracker instance, creating it on first access. */
  public static getInstance(): SelectionPersistenceTracker {
    if (!SelectionPersistenceTracker.instance) {
      SelectionPersistenceTracker.instance = new SelectionPersistenceTracker();
    }
    return SelectionPersistenceTracker.instance;
  }

  /** Appends one selection record to the persistence history. */
  public recordSelection(state: SelectionState, modeName: string, foodName: string,
    isPersisted: boolean): void {
    const record: SelectionRecord = {
      state: state,
      modeName: modeName,
      foodName: foodName,
      timestamp: Date.now(),
      isPersisted: isPersisted
    };
    this.records.push(record);
    this.totalStates++;
    if (isPersisted) {
      this.persistedStates++;
    }
  }

  public getHistory(): SelectionRecord[] {
    return [...this.records];
  }

  public getTotalStates(): number {
    return this.totalStates;
  }

  public getPersistedStates(): number {
    return this.persistedStates;
  }

  public resetTracker(): void {
    this.records = [];
    this.totalStates = 0;
    this.persistedStates = 0;
  }

  /** Returns the ratio of persisted records over all records. */
  public getPersistenceRate(): number {
    if (this.totalStates === 0) {
      return 0;
    }
    return this.persistedStates / this.totalStates;
  }

  public hasState(state: SelectionState): boolean {
    return this.records.some((record: SelectionRecord) => record.state === state);
  }

  /** Returns the last recorded selection state or undefined when empty. */
  public getLastState(): SelectionState | undefined {
    if (this.records.length === 0) {
      return undefined;
    }
    return this.records[this.records.length - 1].state;
  }

  /** Returns the mode name carried by the newest persisted record. */
  public getLastMode(): string {
    for (let i = this.records.length - 1; i >= 0; i--) {
      if (this.records[i].isPersisted) {
        return this.records[i].modeName;
      }
    }
    return '';
  }

  /** Returns the food name carried by the newest persisted record. */
  public getLastFood(): string {
    for (let i = this.records.length - 1; i >= 0; i--) {
      if (this.records[i].isPersisted) {
        return this.records[i].foodName;
      }
    }
    return '';
  }

  /** Counts persisted records that belong to the given mode. */
  public countPersistedForMode(modeName: string): number {
    return this.records.filter(
      (record: SelectionRecord) => record.isPersisted && record.modeName === modeName).length;
  }

  /** Returns the distinct mode names seen in the history. */
  public getDistinctModes(): string[] {
    const modes: string[] = [];
    for (let i = 0; i < this.records.length; i++) {
      const modeName: string = this.records[i].modeName;
      if (modeName.length > 0 && modes.indexOf(modeName) < 0) {
        modes.push(modeName);
      }
    }
    return modes;
  }
}

export default function statePersistenceTest() {
  describe('StatePersistence_Test', () => {
    let driver: Driver;
    let tracker: SelectionPersistenceTracker;

    // Prepare the driver and the tracker, then wait for the home page.
    beforeAll(async () => {
      driver = getDriver();
      tracker = SelectionPersistenceTracker.getInstance();
      tracker.resetTracker();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // Return to the home page so the next suite does not inherit a detail page.
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await resetToHome(driver);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
    });

    // The selected mode label must survive on the home page.
    it('selection_should_persist_mode_selected_state', 0, async () => {
      tracker.resetTracker();
      const modeLabels: number = await countModeLabels(driver);

      expect(modeLabels).assertEqual(3);
      tracker.recordSelection(SelectionState.MODE_SELECTED, MODE_STANDARD, '', true);
      expect(tracker.hasState(SelectionState.MODE_SELECTED)).assertTrue();
      expect(tracker.getLastMode()).assertEqual(MODE_STANDARD);
    });

    // The selected food item must be carried by the persisted record.
    it('selection_should_persist_item_selected_state', 0, async () => {
      tracker.resetTracker();

      tracker.recordSelection(SelectionState.ITEM_SELECTED, MODE_STANDARD, FOOD_TOMATO, true);

      expect(tracker.hasState(SelectionState.ITEM_SELECTED)).assertTrue();
      expect(tracker.getLastFood()).assertEqual(FOOD_TOMATO);
      expect(tracker.getPersistenceRate()).assertEqual(1);
    });

    // Opening the detail page must persist the detail state of the selection.
    it('selection_should_persist_detail_opened_state', 0, async () => {
      tracker.resetTracker();
      await launchDetailByMode(MODE_STANDARD, 0);
      const detailVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);

      tracker.recordSelection(SelectionState.DETAIL_OPENED, MODE_STANDARD, FOOD_TOMATO, detailVisible);
      expect(detailVisible).assertTrue();
      expect(tracker.hasState(SelectionState.DETAIL_OPENED)).assertTrue();
    });

    // A closed detail page must be persisted with an empty food name.
    it('selection_should_persist_detail_closed_state', 0, async () => {
      tracker.resetTracker();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      tracker.recordSelection(SelectionState.DETAIL_CLOSED, MODE_STANDARD, '', homeVisible);
      expect(tracker.hasState(SelectionState.DETAIL_CLOSED)).assertTrue();
      expect(tracker.getLastState()).assertEqual(SelectionState.DETAIL_CLOSED);
    });

    // Timestamps of consecutive selection records must be non decreasing.
    it('selection_records_timestamps_should_be_chronological', 0, async () => {
      tracker.resetTracker();

      tracker.recordSelection(SelectionState.MODE_SELECTED, MODE_STANDARD, '', true);
      await serializedDelay(driver, 100);
      tracker.recordSelection(SelectionState.ITEM_SELECTED, MODE_STANDARD, FOOD_TOMATO, true);
      await serializedDelay(driver, 100);
      tracker.recordSelection(SelectionState.DETAIL_OPENED, MODE_STANDARD, FOOD_TOMATO, true);

      const history: SelectionRecord[] = tracker.getHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // Both getInstance calls must return the very same tracker object.
    it('selection_tracker_singleton_should_maintain_consistency', 0, async () => {
      const first: SelectionPersistenceTracker = SelectionPersistenceTracker.getInstance();
      const second: SelectionPersistenceTracker = SelectionPersistenceTracker.getInstance();

      expect(first === second).assertTrue();

      first.resetTracker();
      first.recordSelection(SelectionState.MODE_SELECTED, MODE_SPECIFIED, '', true);

      expect(second.getTotalStates()).assertEqual(1);
      expect(second.getPersistedStates()).assertEqual(1);
    });

    // All five selection states must be reachable in one history.
    it('selection_should_track_all_state_transitions', 0, async () => {
      tracker.resetTracker();
      const states: SelectionState[] = [
        SelectionState.NONE,
        SelectionState.MODE_SELECTED,
        SelectionState.ITEM_SELECTED,
        SelectionState.DETAIL_OPENED,
        SelectionState.DETAIL_CLOSED
      ];

      for (const state of states) {
        tracker.recordSelection(state, MODE_SINGLETON, FOOD_ICE_CREAM, true);
      }

      expect(tracker.getTotalStates()).assertEqual(5);
      expect(tracker.hasState(SelectionState.NONE)).assertTrue();
      expect(tracker.hasState(SelectionState.MODE_SELECTED)).assertTrue();
      expect(tracker.hasState(SelectionState.ITEM_SELECTED)).assertTrue();
      expect(tracker.hasState(SelectionState.DETAIL_OPENED)).assertTrue();
      expect(tracker.hasState(SelectionState.DETAIL_CLOSED)).assertTrue();
    });

    // Key navigation must not change the component count of the home page.
    it('selection_should_maintain_component_count_stability', 0, async () => {
      tracker.resetTracker();
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount: number = await componentCount(driver);

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_DOWN : KEY_UP, 1, DELAY_KEY_NAVIGATION);
        tracker.recordSelection(SelectionState.MODE_SELECTED, MODE_STANDARD, '', true);
        await serializedDelay(driver, 50);
      }

      const finalCount: number = await componentCount(driver);
      logInfo(`component count before ${initialCount} after ${finalCount}`);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });

    // Fifty rapid records must all be persisted without loss.
    it('selection_should_handle_rapid_state_changes', 0, async () => {
      tracker.resetTracker();

      for (let i = 0; i < 50; i++) {
        const state: SelectionState = i % 2 === 0 ?
          SelectionState.DETAIL_OPENED : SelectionState.DETAIL_CLOSED;
        tracker.recordSelection(state, MODE_STANDARD, FOOD_TOMATO, true);
        await serializedDelay(driver, 30);
      }

      expect(tracker.getTotalStates()).assertEqual(50);
      expect(tracker.getPersistenceRate()).assertEqual(1);
    });

    // The newest record must be returned by getLastState.
    it('selection_should_restore_last_state', 0, async () => {
      tracker.resetTracker();

      tracker.recordSelection(SelectionState.MODE_SELECTED, MODE_STANDARD, '', true);
      tracker.recordSelection(SelectionState.ITEM_SELECTED, MODE_STANDARD, FOOD_TOMATO, true);
      tracker.recordSelection(SelectionState.DETAIL_OPENED, MODE_STANDARD, FOOD_TOMATO, true);

      expect(tracker.getLastState()).assertEqual(SelectionState.DETAIL_OPENED);
      expect(tracker.getLastFood()).assertEqual(FOOD_TOMATO);
    });

    // Twenty repeated operations must persist every single record.
    it('selection_should_persist_state_across_operations', 0, async () => {
      tracker.resetTracker();

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
        tracker.recordSelection(SelectionState.MODE_SELECTED, MODE_SPECIFIED, '', true);
        await serializedDelay(driver, 50);
      }

      expect(tracker.getPersistedStates()).assertEqual(20);
      expect(tracker.countPersistedForMode(MODE_SPECIFIED)).assertEqual(20);
    });

    // Every mode label must be persisted together with its own mode name.
    it('selection_should_persist_all_three_mode_labels', 0, async () => {
      tracker.resetTracker();
      const labels: string[] = allModeLabels();

      for (let i = 0; i < labels.length; i++) {
        tracker.recordSelection(SelectionState.MODE_SELECTED, labels[i], '', true);
      }

      const distinct: string[] = tracker.getDistinctModes();
      expect(distinct.length).assertEqual(3);
      expect(distinct.indexOf(MODE_STANDARD) >= 0).assertTrue();
      expect(distinct.indexOf(MODE_SPECIFIED) >= 0).assertTrue();
      expect(distinct.indexOf(MODE_SINGLETON) >= 0).assertTrue();
    });

    // Every mode group must expose exactly two food names to persist.
    it('selection_should_persist_food_names_of_each_group', 0, async () => {
      tracker.resetTracker();
      const groups: number[] = [INDEX_STANDARD_GROUP, INDEX_SPECIFIED_GROUP, INDEX_SINGLETON_GROUP];

      for (let i = 0; i < groups.length; i++) {
        const foods: string[] = foodNamesOfGroup(groups[i]);
        expect(foods.length).assertEqual(2);
        tracker.recordSelection(SelectionState.ITEM_SELECTED, MODE_STANDARD, foods[0], true);
        tracker.recordSelection(SelectionState.ITEM_SELECTED, MODE_STANDARD, foods[1], true);
      }

      expect(tracker.getPersistedStates()).assertEqual(6);
    });

    // The persisted detail state must keep the detail page title visible.
    it('persisted_detail_state_should_expose_detail_title', 0, async () => {
      tracker.resetTracker();
      await launchDetailByMode(MODE_SPECIFIED, 0);
      const detailVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      const titleVisible: boolean = await checkTextContent(driver, TEXT_FOOD_DETAIL_TITLE);

      tracker.recordSelection(SelectionState.DETAIL_OPENED, MODE_SPECIFIED, FOOD_WALNUT, detailVisible);
      expect(detailVisible).assertTrue();
      expect(titleVisible).assertTrue();
      expect(tracker.getLastMode()).assertEqual(MODE_SPECIFIED);
    });

    // The persistence rate must stay at a full mark for a clean history.
    it('selection_persistence_rate_should_reach_full_mark', 0, async () => {
      tracker.resetTracker();

      tracker.recordSelection(SelectionState.MODE_SELECTED, MODE_SINGLETON, '', true);
      tracker.recordSelection(SelectionState.ITEM_SELECTED, MODE_SINGLETON, FOOD_ICE_CREAM, true);
      tracker.recordSelection(SelectionState.DETAIL_OPENED, MODE_SINGLETON, FOOD_ICE_CREAM, true);

      expect(tracker.getTotalStates()).assertEqual(3);
      expect(tracker.getPersistenceRate()).assertEqual(1);
      expect(tracker.countPersistedForMode(MODE_SINGLETON)).assertEqual(3);
    });

    // Full scenario: select a mode, tap a food, open the detail, go back.
    it('comprehensive_selection_persistence_scenario', 0, async () => {
      tracker.resetTracker();
      const scenarioStart: number = Date.now();
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      tracker.recordSelection(SelectionState.MODE_SELECTED, MODE_STANDARD, '', true);
      await clickModeEntry(driver, MODE_STANDARD);

      tracker.recordSelection(SelectionState.ITEM_SELECTED, MODE_STANDARD, FOOD_TOMATO, true);
      await clickFoodItem(driver, FOOD_TOMATO);
      const detailVisible: boolean = await isFoodDetailVisible(driver);

      tracker.recordSelection(SelectionState.DETAIL_OPENED, MODE_STANDARD, FOOD_TOMATO, detailVisible);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      tracker.recordSelection(SelectionState.DETAIL_CLOSED, MODE_STANDARD, '', homeVisible);

      const scenarioDuration: number = Date.now() - scenarioStart;
      expect(tracker.getTotalStates()).assertEqual(4);
      expect(tracker.getPersistenceRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(15000);
    });
  });
}

/** Opens the detail page of the given mode through the home page entry. */
async function launchDetailByMode(modeName: string, foodIndex: number): Promise<void> {
  const driver: Driver = getDriver();
  await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
  const foods: string[] = foodNamesOfGroup(
    modeName === MODE_SPECIFIED ? INDEX_SPECIFIED_GROUP :
      (modeName === MODE_SINGLETON ? INDEX_SINGLETON_GROUP : INDEX_STANDARD_GROUP));
  const foodName: string = foods[foodIndex % foods.length];
  await clickModeEntry(driver, modeName);
  await clickFoodItem(driver, foodName);
  await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);
  const homeVisible: boolean = await isHomePageVisible(driver);
  logInfo(`detail requested for ${modeName} / ${foodName}, home visible ${homeVisible}`);
}
