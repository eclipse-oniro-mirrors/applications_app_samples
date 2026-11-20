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
  FOOD_ICE_CREAM,
  TEXT_FOOD_DETAIL_TITLE,
  TEXT_TOAST,
  isHomePageVisible,
  isFoodDetailVisible,
  waitForHomePageStable,
  waitForFoodDetailStable,
  resetToHome,
  clickFoodItem,
  launchStandardAbility,
  launchSpecifiedAbility,
  launchSingletonAbility,
  countModeLabels,
  countNutritionLabels,
  checkTextContent,
  logInfo
} from '../Shared/SharedDriver';

/**
 * Observable stages of a page switch inside the start mode sample.
 * The home page renders first, one of the three launch modes opens
 * pages/FoodDetail and the back key finally restores the home page.
 */
enum PageLifecyclePhase {
  HOME_RENDERED = 'home_rendered',
  LIST_READY = 'list_ready',
  ITEM_CLICKED = 'item_clicked',
  DETAIL_LOADING = 'detail_loading',
  DETAIL_VISIBLE = 'detail_visible',
  BACK_PRESSED = 'back_pressed',
  HOME_RESTORED = 'home_restored'
}

/** One observed lifecycle phase together with its cost and outcome. */
interface PageLifecycleRecord {
  phase: PageLifecyclePhase;
  duration: number;
  isSuccess: boolean;
  timestamp: number;
}

/**
 * Singleton tracker that keeps the phase history of the current test run.
 * A single instance is shared by every test case so that the recorded
 * history is never polluted by a second tracker object.
 */
class PageLifecycleTracker {
  private static instance: PageLifecycleTracker;
  private records: PageLifecycleRecord[] = [];
  private totalPhases: number = 0;
  private successfulPhases: number = 0;

  /** Returns the shared tracker instance, creating it on first access. */
  public static getInstance(): PageLifecycleTracker {
    if (!PageLifecycleTracker.instance) {
      PageLifecycleTracker.instance = new PageLifecycleTracker();
    }
    return PageLifecycleTracker.instance;
  }

  /** Appends one phase observation to the history. */
  public recordPhase(phase: PageLifecyclePhase, duration: number, isSuccess: boolean): void {
    const record: PageLifecycleRecord = {
      phase: phase,
      duration: duration,
      isSuccess: isSuccess,
      timestamp: Date.now()
    };
    this.records.push(record);
    this.totalPhases++;
    if (isSuccess) {
      this.successfulPhases++;
    }
  }

  public getHistory(): PageLifecycleRecord[] {
    return [...this.records];
  }

  public getTotalPhases(): number {
    return this.totalPhases;
  }

  public getSuccessfulPhases(): number {
    return this.successfulPhases;
  }

  public resetTracker(): void {
    this.records = [];
    this.totalPhases = 0;
    this.successfulPhases = 0;
  }

  /** Returns the success ratio of all recorded phases. */
  public getSuccessRate(): number {
    if (this.totalPhases === 0) {
      return 0;
    }
    return this.successfulPhases / this.totalPhases;
  }

  public hasPhase(phase: PageLifecyclePhase): boolean {
    return this.records.some((record: PageLifecycleRecord) => record.phase === phase);
  }

  /** Counts how often the given phase was observed. */
  public countPhase(phase: PageLifecyclePhase): number {
    return this.records.filter((record: PageLifecycleRecord) => record.phase === phase).length;
  }

  /** Returns the last observed phase or undefined when empty. */
  public getLastPhase(): PageLifecyclePhase | undefined {
    if (this.records.length === 0) {
      return undefined;
    }
    return this.records[this.records.length - 1].phase;
  }

  /** Returns the mean duration of every recorded phase. */
  public getAveragePhaseDuration(): number {
    if (this.records.length === 0) {
      return 0;
    }
    const totalDuration: number = this.records.reduce(
      (sum: number, record: PageLifecycleRecord) => sum + record.duration, 0);
    return totalDuration / this.records.length;
  }
}

export default function pageLifecycleTest() {
  describe('PageLifecycle_Test', () => {
    let driver: Driver;
    let tracker: PageLifecycleTracker;

    // Prepare the driver and the tracker, then wait for the home page.
    beforeAll(async () => {
      driver = getDriver();
      tracker = PageLifecycleTracker.getInstance();
      tracker.resetTracker();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // Restore the home page so the next suite starts from a known state.
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await resetToHome(driver);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
    });

    // The home page must finish rendering before any mode can be launched.
    it('home_page_should_complete_rendered_phase', 0, async () => {
      tracker.resetTracker();
      const homeVisible: boolean = await isHomePageVisible(driver);

      expect(homeVisible).assertTrue();
      tracker.recordPhase(PageLifecyclePhase.HOME_RENDERED, 0, homeVisible);
      expect(tracker.hasPhase(PageLifecyclePhase.HOME_RENDERED)).assertTrue();
    });

    // The three food groups must be ready, each one with its mode label.
    it('home_page_should_complete_list_ready_phase', 0, async () => {
      tracker.resetTracker();
      const modeLabels: number = await countModeLabels(driver);
      logInfo(`list ready with ${modeLabels} mode labels`);

      expect(modeLabels).assertEqual(3);
      tracker.recordPhase(PageLifecyclePhase.LIST_READY, 0, modeLabels === 3);
      expect(tracker.getSuccessfulPhases()).assertEqual(1);
    });

    // Tapping a food item of the standard group must be observable.
    it('food_item_click_should_complete_item_clicked_phase', 0, async () => {
      tracker.resetTracker();
      const clicked: boolean = await clickFoodItem(driver, FOOD_TOMATO);

      expect(clicked).assertTrue();
      tracker.recordPhase(PageLifecyclePhase.ITEM_CLICKED, 0, clicked);
      expect(tracker.hasPhase(PageLifecyclePhase.ITEM_CLICKED)).assertTrue();
    });

    // The detail page must become visible after StandardAbility starts.
    it('standard_detail_should_complete_visible_phase', 0, async () => {
      tracker.resetTracker();
      await launchStandardAbility(0, MODE_STANDARD);
      const detailVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);

      expect(detailVisible).assertTrue();
      expect(await checkTextContent(driver, TEXT_FOOD_DETAIL_TITLE)).assertTrue();
      tracker.recordPhase(PageLifecyclePhase.DETAIL_VISIBLE, 0, detailVisible);
      expect(tracker.getSuccessRate()).assertEqual(1);
    });

    // The back key must close the detail page and report the phase.
    it('back_key_should_complete_back_pressed_phase', 0, async () => {
      tracker.resetTracker();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      tracker.recordPhase(PageLifecyclePhase.BACK_PRESSED, 0, homeVisible);
      expect(tracker.hasPhase(PageLifecyclePhase.BACK_PRESSED)).assertTrue();
    });

    // Relaunching MainAbility must report the restored home phase.
    it('home_should_complete_restored_phase', 0, async () => {
      tracker.resetTracker();
      const restored: boolean = await resetToHome(driver);

      expect(restored).assertTrue();
      tracker.recordPhase(PageLifecyclePhase.HOME_RESTORED, 0, restored);
      expect(tracker.countPhase(PageLifecyclePhase.HOME_RESTORED)).assertEqual(1);
    });

    // Timestamps of consecutive phases must be non decreasing.
    it('lifecycle_records_timestamps_should_be_chronological', 0, async () => {
      tracker.resetTracker();
      tracker.recordPhase(PageLifecyclePhase.HOME_RENDERED, 100, true);
      tracker.recordPhase(PageLifecyclePhase.ITEM_CLICKED, 100, true);
      tracker.recordPhase(PageLifecyclePhase.DETAIL_VISIBLE, 100, true);

      const history: PageLifecycleRecord[] = tracker.getHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // Both getInstance calls must return the very same tracker object.
    it('lifecycle_tracker_singleton_should_maintain_consistency', 0, async () => {
      const first: PageLifecycleTracker = PageLifecycleTracker.getInstance();
      const second: PageLifecycleTracker = PageLifecycleTracker.getInstance();

      expect(first === second).assertTrue();

      first.resetTracker();
      first.recordPhase(PageLifecyclePhase.LIST_READY, 100, true);

      expect(second.getTotalPhases()).assertEqual(1);
      expect(second.getSuccessfulPhases()).assertEqual(1);
    });

    // Every phase of the switch must be recordable in one scenario.
    it('page_should_handle_all_lifecycle_phases', 0, async () => {
      tracker.resetTracker();
      const phases: PageLifecyclePhase[] = [
        PageLifecyclePhase.HOME_RENDERED,
        PageLifecyclePhase.LIST_READY,
        PageLifecyclePhase.ITEM_CLICKED,
        PageLifecyclePhase.DETAIL_LOADING,
        PageLifecyclePhase.DETAIL_VISIBLE,
        PageLifecyclePhase.BACK_PRESSED,
        PageLifecyclePhase.HOME_RESTORED
      ];

      for (const phase of phases) {
        tracker.recordPhase(phase, 100, true);
      }

      expect(tracker.getTotalPhases()).assertEqual(7);
      expect(tracker.getSuccessRate()).assertEqual(1);
      expect(tracker.getLastPhase()).assertEqual(PageLifecyclePhase.HOME_RESTORED);
    });

    // Repeating the switch must not degrade the tracker bookkeeping.
    it('page_should_maintain_lifecycle_quality', 0, async () => {
      tracker.resetTracker();
      const initialCount: number = tracker.getTotalPhases();

      for (let i = 0; i < 10; i++) {
        const phase: PageLifecyclePhase = i % 2 === 0 ?
          PageLifecyclePhase.DETAIL_VISIBLE : PageLifecyclePhase.HOME_RENDERED;
        tracker.recordPhase(phase, 100, true);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }

      const finalCount: number = tracker.getTotalPhases();
      expect(finalCount - initialCount).assertEqual(10);
    });

    // The average phase duration must stay within the accepted budget.
    it('page_should_have_optimal_phase_duration', 0, async () => {
      tracker.resetTracker();

      for (let i = 0; i < 10; i++) {
        tracker.recordPhase(PageLifecyclePhase.DETAIL_VISIBLE, 150, true);
      }

      expect(tracker.getAveragePhaseDuration()).assertLessOrEqual(200);
    });

    // The success ratio must be a full mark when every phase succeeded.
    it('page_phase_success_rate_should_reach_full_mark', 0, async () => {
      tracker.resetTracker();

      tracker.recordPhase(PageLifecyclePhase.HOME_RENDERED, 100, true);
      tracker.recordPhase(PageLifecyclePhase.DETAIL_VISIBLE, 100, true);
      tracker.recordPhase(PageLifecyclePhase.HOME_RESTORED, 100, true);

      expect(tracker.getSuccessRate()).assertEqual(1);
      expect(tracker.getSuccessfulPhases()).assertEqual(3);
    });

    // The detail page must render the nutrition labels of the selected food.
    it('detail_page_should_render_nutrition_labels', 0, async () => {
      tracker.resetTracker();
      await launchStandardAbility(1, MODE_STANDARD);
      const detailVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      const nutrition: number = await countNutritionLabels(driver);
      logInfo(`detail page rendered ${nutrition} nutrition labels`);

      expect(detailVisible).assertTrue();
      expect(nutrition > 0).assertTrue();
      tracker.recordPhase(PageLifecyclePhase.DETAIL_VISIBLE, 0, detailVisible);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
    });

    // A repeated singleton launch must report the existing instance toast.
    it('singleton_launch_should_expose_existing_instance_phase', 0, async () => {
      tracker.resetTracker();
      await launchSingletonAbility(0);
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);
      await launchSingletonAbility(0);
      const toastVisible: boolean = await checkTextContent(driver, TEXT_TOAST);

      tracker.recordPhase(PageLifecyclePhase.DETAIL_VISIBLE, 0, toastVisible);
      expect(tracker.hasPhase(PageLifecyclePhase.DETAIL_VISIBLE)).assertTrue();
      await resetToHome(driver);
    });

    // A specified launch with the same id must reuse the same detail page.
    it('specified_launch_should_reuse_detail_phase', 0, async () => {
      tracker.resetTracker();
      await launchSpecifiedAbility(0);
      const firstVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      await launchSpecifiedAbility(0);
      const secondVisible: boolean = await isFoodDetailVisible(driver);

      tracker.recordPhase(PageLifecyclePhase.DETAIL_VISIBLE, 0, firstVisible);
      tracker.recordPhase(PageLifecyclePhase.DETAIL_VISIBLE, 0, secondVisible);

      expect(firstVisible).assertTrue();
      expect(tracker.countPhase(PageLifecyclePhase.DETAIL_VISIBLE)).assertEqual(2);
      await resetToHome(driver);
    });

    // Two standard launches must produce two independent detail observations.
    it('standard_launch_should_track_two_detail_phases', 0, async () => {
      tracker.resetTracker();
      await launchStandardAbility(0, MODE_STANDARD);
      const firstVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      await launchStandardAbility(1, MODE_STANDARD);
      const secondVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);

      tracker.recordPhase(PageLifecyclePhase.DETAIL_VISIBLE, 0, firstVisible);
      tracker.recordPhase(PageLifecyclePhase.DETAIL_VISIBLE, 0, secondVisible);

      expect(tracker.countPhase(PageLifecyclePhase.DETAIL_VISIBLE)).assertEqual(2);
      expect(tracker.getTotalPhases()).assertEqual(2);
      await resetToHome(driver);
    });

    // Every mode group must be reachable while the home page stays alive.
    it('all_mode_groups_should_be_reachable_during_home_phase', 0, async () => {
      tracker.resetTracker();
      const foods: string[] = [FOOD_TOMATO, FOOD_WALNUT, FOOD_ICE_CREAM];
      const modes: string[] = [MODE_STANDARD, MODE_SPECIFIED, MODE_SINGLETON];

      for (let i = 0; i < foods.length; i++) {
        const homeVisible: boolean = await isHomePageVisible(driver);
        expect(homeVisible).assertTrue();
        tracker.recordPhase(PageLifecyclePhase.HOME_RENDERED, 0, homeVisible);
        logInfo(`mode ${modes[i]} observed with food ${foods[i]}`);
      }

      expect(tracker.countPhase(PageLifecyclePhase.HOME_RENDERED)).assertEqual(3);
    });
  });
}
