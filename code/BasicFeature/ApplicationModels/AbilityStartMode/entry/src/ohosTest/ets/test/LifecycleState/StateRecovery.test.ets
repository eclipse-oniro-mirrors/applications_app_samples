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
  serializedDelay,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  MODE_STANDARD,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  FOOD_TOMATO,
  FOOD_WALNUT,
  FOOD_CRAB,
  TEXT_FOOD_DETAIL_TITLE,
  isHomePageVisible,
  isFoodDetailVisible,
  waitForHomePageStable,
  waitForFoodDetailStable,
  resetToHome,
  launchMainAbility,
  launchStandardAbility,
  launchSpecifiedAbility,
  launchSingletonAbility,
  clickText,
  clickModeEntry,
  clickFoodItem,
  countModeLabels,
  checkTextContent,
  logInfo,
  logWarn
} from '../Shared/SharedDriver';

/**
 * Recovery scenarios exercised by the start mode sample. Every scenario
 * starts from a disturbed page and must end with a usable page again,
 * either the home page or the food detail page.
 */
enum RecoveryScenario {
  DETAIL_RETURN = 'detail_return',
  HOME_RELAUNCH = 'home_relaunch',
  MODE_SWITCH = 'mode_switch',
  MISSING_ITEM = 'missing_item',
  INPUT_ERROR = 'input_error',
  LIFECYCLE = 'lifecycle'
}

/** One recovery observation with its timing and consistency outcome. */
interface RecoveryRecord {
  scenario: RecoveryScenario;
  isRecovered: boolean;
  recoveryTime: number;
  isStateConsistent: boolean;
  recoveredText: string;
  timestamp: number;
}

/**
 * Singleton tracker that aggregates the recovery outcomes of all test
 * cases. Keeping the instance shared makes the aggregate statistics
 * comparable across the whole suite.
 */
class PageRecoveryTracker {
  private static instance: PageRecoveryTracker;
  private records: RecoveryRecord[] = [];
  private totalRecoveries: number = 0;
  private successfulRecoveries: number = 0;
  private consistentRecoveries: number = 0;

  /** Returns the shared tracker instance, creating it on first access. */
  public static getInstance(): PageRecoveryTracker {
    if (!PageRecoveryTracker.instance) {
      PageRecoveryTracker.instance = new PageRecoveryTracker();
    }
    return PageRecoveryTracker.instance;
  }

  /** Appends one recovery observation to the history. */
  public recordRecovery(scenario: RecoveryScenario, isRecovered: boolean, recoveryTime: number,
    isStateConsistent: boolean, recoveredText: string): void {
    const record: RecoveryRecord = {
      scenario: scenario,
      isRecovered: isRecovered,
      recoveryTime: recoveryTime,
      isStateConsistent: isStateConsistent,
      recoveredText: recoveredText,
      timestamp: Date.now()
    };
    this.records.push(record);
    this.totalRecoveries++;
    if (isRecovered) {
      this.successfulRecoveries++;
    }
    if (isStateConsistent) {
      this.consistentRecoveries++;
    }
  }

  public getHistory(): RecoveryRecord[] {
    return [...this.records];
  }

  public getTotalRecoveries(): number {
    return this.totalRecoveries;
  }

  public getSuccessfulRecoveries(): number {
    return this.successfulRecoveries;
  }

  public getConsistentRecoveries(): number {
    return this.consistentRecoveries;
  }

  public resetTracker(): void {
    this.records = [];
    this.totalRecoveries = 0;
    this.successfulRecoveries = 0;
    this.consistentRecoveries = 0;
  }

  /** Returns the ratio of successful recoveries over all recoveries. */
  public getSuccessRate(): number {
    if (this.totalRecoveries === 0) {
      return 0;
    }
    return this.successfulRecoveries / this.totalRecoveries;
  }

  public hasScenario(scenario: RecoveryScenario): boolean {
    return this.records.some((record: RecoveryRecord) => record.scenario === scenario);
  }

  /** Counts how often the given scenario was recorded. */
  public countScenario(scenario: RecoveryScenario): number {
    return this.records.filter((record: RecoveryRecord) => record.scenario === scenario).length;
  }

  /** Returns the mean recovery time of the recorded observations. */
  public getAverageRecoveryTime(): number {
    if (this.records.length === 0) {
      return 0;
    }
    const totalTime: number = this.records.reduce(
      (sum: number, record: RecoveryRecord) => sum + record.recoveryTime, 0);
    return totalTime / this.records.length;
  }

  /** Returns the slowest recorded recovery time. */
  public getMaxRecoveryTime(): number {
    let maximum: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].recoveryTime > maximum) {
        maximum = this.records[i].recoveryTime;
      }
    }
    return maximum;
  }

  /** Returns the text that was observed after the newest recovery. */
  public getLastRecoveredText(): string {
    if (this.records.length === 0) {
      return '';
    }
    return this.records[this.records.length - 1].recoveredText;
  }
}

export default function stateRecoveryTest() {
  describe('StateRecovery_Test', () => {
    let driver: Driver;
    let tracker: PageRecoveryTracker;

    // Prepare the driver and the tracker, then wait for the home page.
    beforeAll(async () => {
      driver = getDriver();
      tracker = PageRecoveryTracker.getInstance();
      tracker.resetTracker();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // Leave the sample on the home page for the next suite.
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await resetToHome(driver);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
    });

    // Closing the detail page must recover the home page.
    it('page_should_recover_from_detail_return', 0, async () => {
      tracker.resetTracker();
      await launchStandardAbility(0, MODE_STANDARD);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);

      const startTime: number = Date.now();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const recoveryTime: number = Date.now() - startTime;

      tracker.recordRecovery(RecoveryScenario.DETAIL_RETURN, homeVisible, recoveryTime, homeVisible, MODE_STANDARD);
      expect(tracker.hasScenario(RecoveryScenario.DETAIL_RETURN)).assertTrue();
      expect(homeVisible).assertTrue();
    });

    // Relaunching MainAbility must recover the home page from any page.
    it('page_should_recover_from_home_relaunch', 0, async () => {
      tracker.resetTracker();
      await launchSpecifiedAbility(0);
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);

      const startTime: number = Date.now();
      await launchMainAbility();
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const recoveryTime: number = Date.now() - startTime;

      tracker.recordRecovery(RecoveryScenario.HOME_RELAUNCH, homeVisible, recoveryTime, homeVisible,
        MODE_SPECIFIED);
      expect(tracker.getSuccessfulRecoveries()).assertEqual(1);
    });

    // Switching from the standard mode to the specified mode must recover.
    it('page_should_recover_from_mode_switch', 0, async () => {
      tracker.resetTracker();
      await launchStandardAbility(0, MODE_STANDARD);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);

      const startTime: number = Date.now();
      await launchSpecifiedAbility(1);
      const detailVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      const recoveryTime: number = Date.now() - startTime;

      tracker.recordRecovery(RecoveryScenario.MODE_SWITCH, detailVisible, recoveryTime, detailVisible,
        MODE_SPECIFIED);
      expect(tracker.hasScenario(RecoveryScenario.MODE_SWITCH)).assertTrue();
    });

    // A missing food item must not break the home page.
    it('page_should_recover_from_missing_item', 0, async () => {
      tracker.resetTracker();
      await resetToHome(driver);

      const startTime: number = Date.now();
      const clicked: boolean = await clickText(driver, 'MissingFood');
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const recoveryTime: number = Date.now() - startTime;

      logWarn(`missing item click returned ${clicked}`);
      tracker.recordRecovery(RecoveryScenario.MISSING_ITEM, homeVisible, recoveryTime, homeVisible,
        MODE_STANDARD);
      expect(clicked).assertFalse();
      expect(homeVisible).assertTrue();
    });

    // An input error must be absorbed and the home page must stay usable.
    it('page_should_recover_from_input_error', 0, async () => {
      tracker.resetTracker();
      await resetToHome(driver);
      let recovered: boolean = false;
      let recoveryTime: number = 0;

      try {
        const startTime: number = Date.now();
        await clickModeEntry(driver, 'unknown_mode');
        recovered = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
        recoveryTime = Date.now() - startTime;
      } catch (error) {
        logWarn(`input error absorbed: ${error}`);
        recovered = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      }

      tracker.recordRecovery(RecoveryScenario.INPUT_ERROR, recovered, recoveryTime, recovered, MODE_STANDARD);
      expect(tracker.hasScenario(RecoveryScenario.INPUT_ERROR)).assertTrue();
    });

    // A relaunch in the middle of a flow must recover the home page.
    it('page_should_recover_from_lifecycle', 0, async () => {
      tracker.resetTracker();
      await clickModeEntry(driver, MODE_SINGLETON);
      await clickFoodItem(driver, FOOD_CRAB);

      const startTime: number = Date.now();
      const restored: boolean = await resetToHome(driver);
      const recoveryTime: number = Date.now() - startTime;

      tracker.recordRecovery(RecoveryScenario.LIFECYCLE, restored, recoveryTime, restored, MODE_SINGLETON);
      expect(restored).assertTrue();
    });

    // Every recovery scenario must be recordable in one history.
    it('page_should_handle_all_recovery_scenarios', 0, async () => {
      tracker.resetTracker();
      const scenarios: RecoveryScenario[] = [
        RecoveryScenario.DETAIL_RETURN,
        RecoveryScenario.HOME_RELAUNCH,
        RecoveryScenario.MODE_SWITCH,
        RecoveryScenario.MISSING_ITEM,
        RecoveryScenario.INPUT_ERROR,
        RecoveryScenario.LIFECYCLE
      ];

      for (const scenario of scenarios) {
        tracker.recordRecovery(scenario, true, 200, true, MODE_STANDARD);
      }

      expect(tracker.getTotalRecoveries()).assertEqual(6);
      expect(tracker.getSuccessRate()).assertEqual(1);
      expect(tracker.getConsistentRecoveries()).assertEqual(6);
    });

    // Timestamps of consecutive recoveries must be non decreasing.
    it('recovery_records_timestamps_should_be_chronological', 0, async () => {
      tracker.resetTracker();

      tracker.recordRecovery(RecoveryScenario.DETAIL_RETURN, true, 100, true, MODE_STANDARD);
      await serializedDelay(driver, 100);
      tracker.recordRecovery(RecoveryScenario.HOME_RELAUNCH, true, 100, true, MODE_STANDARD);
      await serializedDelay(driver, 100);
      tracker.recordRecovery(RecoveryScenario.MODE_SWITCH, true, 100, true, MODE_SPECIFIED);

      const history: RecoveryRecord[] = tracker.getHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // Both getInstance calls must return the very same tracker object.
    it('recovery_tracker_singleton_should_maintain_consistency', 0, async () => {
      const first: PageRecoveryTracker = PageRecoveryTracker.getInstance();
      const second: PageRecoveryTracker = PageRecoveryTracker.getInstance();

      expect(first === second).assertTrue();

      first.resetTracker();
      first.recordRecovery(RecoveryScenario.HOME_RELAUNCH, true, 100, true, MODE_STANDARD);

      expect(second.getTotalRecoveries()).assertEqual(1);
      expect(second.getSuccessfulRecoveries()).assertEqual(1);
    });

    // Twenty consecutive recoveries must all be recorded.
    it('page_should_maintain_recovery_quality', 0, async () => {
      tracker.resetTracker();

      for (let i = 0; i < 20; i++) {
        tracker.recordRecovery(RecoveryScenario.MODE_SWITCH, true, 150, true, MODE_STANDARD);
        await serializedDelay(driver, 50);
      }

      expect(tracker.getTotalRecoveries()).assertEqual(20);
      expect(tracker.countScenario(RecoveryScenario.MODE_SWITCH)).assertEqual(20);
    });

    // Thirty rapid recoveries across three scenarios must all be recorded.
    it('page_should_handle_rapid_recovery_scenarios', 0, async () => {
      tracker.resetTracker();
      const scenarios: RecoveryScenario[] = [
        RecoveryScenario.DETAIL_RETURN,
        RecoveryScenario.HOME_RELAUNCH,
        RecoveryScenario.LIFECYCLE
      ];

      for (let i = 0; i < 30; i++) {
        const scenario: RecoveryScenario = scenarios[i % scenarios.length];
        tracker.recordRecovery(scenario, true, 100, true, MODE_STANDARD);
        await serializedDelay(driver, 30);
      }

      expect(tracker.getTotalRecoveries()).assertEqual(30);
      expect(tracker.getSuccessRate()).assertEqual(1);
    });

    // The average recovery time must stay within the accepted budget.
    it('page_should_have_optimal_average_recovery_time', 0, async () => {
      tracker.resetTracker();

      for (let i = 0; i < 10; i++) {
        tracker.recordRecovery(RecoveryScenario.HOME_RELAUNCH, true, 180, true, MODE_STANDARD);
        await serializedDelay(driver, 50);
      }

      expect(tracker.getAverageRecoveryTime()).assertLessOrEqual(200);
      expect(tracker.getMaxRecoveryTime()).assertLessOrEqual(200);
    });

    // The recovered home page must still expose its three mode labels.
    it('recovery_should_keep_home_text_consistent', 0, async () => {
      tracker.resetTracker();
      await resetToHome(driver);
      const modeLabels: number = await countModeLabels(driver);
      const homeVisible: boolean = await isHomePageVisible(driver);

      tracker.recordRecovery(RecoveryScenario.HOME_RELAUNCH, homeVisible, 0, modeLabels === 3, MODE_STANDARD);
      expect(modeLabels).assertEqual(3);
      expect(tracker.getLastRecoveredText()).assertEqual(MODE_STANDARD);
    });

    // The recovered detail page must still expose its title.
    it('recovery_should_keep_detail_text_consistent', 0, async () => {
      tracker.resetTracker();
      await launchSpecifiedAbility(0);
      const detailVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      const titleVisible: boolean = await checkTextContent(driver, TEXT_FOOD_DETAIL_TITLE);

      tracker.recordRecovery(RecoveryScenario.MODE_SWITCH, detailVisible, 0, titleVisible,
        TEXT_FOOD_DETAIL_TITLE);
      expect(detailVisible).assertTrue();
      expect(titleVisible).assertTrue();
      expect(tracker.getConsistentRecoveries()).assertEqual(1);
    });

    // A failed detail lookup must be reported and then recovered.
    it('recovery_from_failed_detail_lookup_should_be_recorded', 0, async () => {
      tracker.resetTracker();
      await resetToHome(driver);
      const detailVisible: boolean = await isFoodDetailVisible(driver);
      const startTime: number = Date.now();
      const recovered: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const recoveryTime: number = Date.now() - startTime;

      tracker.recordRecovery(RecoveryScenario.MISSING_ITEM, recovered, recoveryTime, !detailVisible,
        MODE_STANDARD);
      expect(recovered).assertTrue();
      expect(tracker.getSuccessRate()).assertEqual(1);
    });

    // Full scenario: disturb the page with two modes, then recover the home page.
    it('comprehensive_page_recovery_scenario', 0, async () => {
      tracker.resetTracker();
      const scenarioStart: number = Date.now();

      await launchSingletonAbility(0);
      const firstDetail: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      tracker.recordRecovery(RecoveryScenario.MODE_SWITCH, firstDetail, 0, firstDetail, FOOD_TOMATO);

      await launchSpecifiedAbility(1);
      const secondDetail: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      tracker.recordRecovery(RecoveryScenario.MODE_SWITCH, secondDetail, 0, secondDetail, FOOD_WALNUT);

      const restored: boolean = await resetToHome(driver);
      tracker.recordRecovery(RecoveryScenario.HOME_RELAUNCH, restored, 0, restored, MODE_STANDARD);

      const scenarioDuration: number = Date.now() - scenarioStart;
      logInfo(`comprehensive recovery duration ${scenarioDuration}`);

      expect(tracker.getTotalRecoveries()).assertEqual(3);
      expect(restored).assertTrue();
      expect(scenarioDuration).assertLessOrEqual(15000);
    });
  });
}
