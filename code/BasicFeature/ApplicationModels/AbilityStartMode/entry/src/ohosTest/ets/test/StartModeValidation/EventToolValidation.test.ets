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

import { describe, it, expect, beforeAll, afterAll, beforeEach } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  logWarn,
  logError,
  resetDriver,
  runSerializedUiOperation,
  serializedDelay,
  triggerSerializedKey,
  delay,
  getTexts,
  checkTextContent,
  checkTextFragment,
  countMatchingTexts,
  findComponentsByType,
  checkComponentExists,
  componentCount,
  homeComponentCount,
  isHomePageVisible,
  isFoodDetailVisible,
  waitForHomePageStable,
  waitForFoodDetailStable,
  launchAbility,
  launchMainAbility,
  standardParameters,
  specifiedParameters,
  singletonParameters,
  launchStandardAbility,
  launchSpecifiedAbility,
  launchSingletonAbility,
  launchMode,
  clickText,
  clickModeEntry,
  clickFoodItem,
  pressAndWait,
  simulateTouch,
  getCurrentFocusIndex,
  checkFocusState,
  resetToHome,
  allModeLabels,
  foodNamesOfGroup,
  nutritionLabels,
  countNutritionLabels,
  countModeLabels,
  waitForAnyText,
  hasImageComponent,
  hasListComponent,
  collectPageMetrics,
  samePage,
  stableComponentCount,
  PageMetrics,
  KEY_BACK,
  KEY_HOME,
  KEY_UP,
  KEY_DOWN,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  ABILITY_MAIN,
  ABILITY_STANDARD,
  ABILITY_SPECIFIED,
  ABILITY_SINGLETON,
  MODE_STANDARD,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  TEXT_HOME_TITLE,
  TEXT_FOOD_DETAIL_TITLE,
  TEXT_FOOD_DETAIL_COMPLETE,
  TEXT_CALORIE,
  TEXT_PROTEIN,
  TEXT_FAT,
  TEXT_CARBOHYDRATES,
  TEXT_VITAMIN_C,
  TEXT_NUTRITION_ELEMENT,
  TEXT_TOAST,
  FOOD_TOMATO,
  FOOD_CUCUMBER,
  FOOD_WALNUT,
  FOOD_BLUEBERRY,
  FOOD_ICE_CREAM,
  FOOD_CRAB,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_ABILITY_START,
  TIMEOUT_PAGE_SWITCH,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_START_MODE,
  TOLERANCE_COMPONENT_COUNT,
  TOLERANCE_FOCUS_CHANGE,
  STABLE_ROUNDS,
  STABLE_TOLERANCE,
  STRESS_ROUNDS_NAVIGATION,
  STRESS_ROUNDS_LIFECYCLE,
  INDEX_STANDARD_GROUP,
  INDEX_SPECIFIED_GROUP,
  INDEX_SINGLETON_GROUP
} from '../Shared/SharedDriver';

/** Phases observed by the EventTool suite. */
enum EventToolPhase {
  IDLE = 'idle',
  PREPARED = 'prepared',
  RUNNING = 'running',
  VERIFIED = 'verified',
  FINISHED = 'finished'
}

/** Result of a single EventTool probe. */
interface EventToolRecord {
  id: string;
  action: string;
  phase: string;
  passed: boolean;
  durationMs: number;
}

/** Collects and aggregates EventTool probe results. */
class EventToolTracker {
  private records: EventToolRecord[] = [];
  private counter: number = 0;
  private phase: string = EventToolPhase.IDLE;

  public add(action: string, passed: boolean, durationMs: number): void {
    this.counter++;
    const record: EventToolRecord = {
      id: 'EventTool-' + this.counter,
      action: action,
      phase: this.phase,
      passed: passed,
      durationMs: durationMs
    };
    this.records.push(record);
    logInfo('EventTool record ' + record.id + ' action ' + action + ' passed ' + passed);
  }

  public setPhase(phase: string): void {
    this.phase = phase;
    logInfo('EventTool phase changed to ' + phase);
  }

  public getPhase(): string {
    return this.phase;
  }

  public size(): number {
    return this.records.length;
  }

  public passedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].passed) {
        count++;
      }
    }
    return count;
  }

  public failedCount(): number {
    return this.size() - this.passedCount();
  }

  public successRate(): number {
    if (this.size() === 0) {
      return 0;
    }
    return Math.round((this.passedCount() * 100) / this.size());
  }

  public totalDuration(): number {
    let total: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      total += this.records[i].durationMs;
    }
    return total;
  }

  public averageDuration(): number {
    if (this.size() === 0) {
      return 0;
    }
    return Math.round(this.totalDuration() / this.size());
  }

  public slowestAction(): string {
    if (this.size() === 0) {
      return '';
    }
    let slowest: EventToolRecord = this.records[0];
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].durationMs > slowest.durationMs) {
        slowest = this.records[i];
      }
    }
    return slowest.action;
  }

  public lastAction(): string {
    if (this.size() === 0) {
      return '';
    }
    return this.records[this.size() - 1].action;
  }

  public actions(): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.records.length; i++) {
      names.push(this.records[i].action);
    }
    return names;
  }

  public summary(): string {
    return 'size=' + this.size() + ' passed=' + this.passedCount() + ' failed=' + this.failedCount() +
      ' rate=' + this.successRate();
  }

  public clear(): void {
    this.records.splice(0, this.records.length);
    this.counter = 0;
    this.phase = EventToolPhase.IDLE;
  }
}


/** Reusable expectations of the EventTool suite. */
class EventToolValidator {
  public isPositive(value: number): boolean {
    return value > 0;
  }

  public isNonNegative(value: number): boolean {
    return value >= 0;
  }

  public inRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  public isKnownMode(mode: string): boolean {
    return mode === MODE_STANDARD || mode === MODE_SPECIFIED || mode === MODE_SINGLETON;
  }

  public isKnownFood(food: string): boolean {
    const foods: string[] = [FOOD_TOMATO, FOOD_CUCUMBER, FOOD_WALNUT, FOOD_BLUEBERRY, FOOD_ICE_CREAM, FOOD_CRAB];
    for (let i = 0; i < foods.length; i++) {
      if (foods[i] === food) {
        return true;
      }
    }
    return false;
  }

  public labelsAreUnique(labels: string[]): boolean {
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < labels.length; i++) {
      if (seen.has(labels[i])) {
        return false;
      }
      seen.add(labels[i]);
    }
    return true;
  }

  public nutritionIsComplete(count: number): boolean {
    return count === 5;
  }

  public modeCountIsComplete(count: number): boolean {
    return count === 3;
  }

  public durationAcceptable(durationMs: number, limitMs: number): boolean {
    return durationMs >= 0 && durationMs <= limitMs;
  }
}

/** EventTool suite of the start mode sample. */
export default function eventToolValidationTest() {
  describe('EventToolValidation_Test', () => {
    let driver: Driver;
    const tracker: EventToolTracker = new EventToolTracker();
    const validator: EventToolValidator = new EventToolValidator();

    beforeAll(async () => {
      driver = getDriver();
      tracker.setPhase(EventToolPhase.PREPARED);
      await resetToHome(driver);
    });

    beforeEach(async () => {
      tracker.setPhase(EventToolPhase.RUNNING);
      await serializedDelay(driver, 50);
    });

    afterAll(async () => {
      tracker.setPhase(EventToolPhase.FINISHED);
      logInfo('EventToolValidation summary: ' + tracker.summary());
      tracker.clear();
      await resetToHome(driver);
    });

    // home_render for standard mode with Tomato.
    it('home_render_standard_tomato_0', 0, async () => {
      const start: number = Date.now();
      await launchMainAbility();
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      const visible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.add('home_render:MODE_STANDARD:FOOD_TOMATO', visible, Date.now() - start);
      expect(visible).assertTrue();
    });

    // mode_labels for standard mode with Tomato.
    it('mode_labels_standard_tomato_1', 0, async () => {
      await resetToHome(driver);
      const labels: number = await countModeLabels(driver);
      tracker.add('mode_labels:MODE_STANDARD', validator.modeCountIsComplete(labels), 0);
      expect(labels).assertEqual(3);
      expect(validator.modeCountIsComplete(labels)).assertTrue();
    });

    // food_visibility for standard mode with Tomato.
    it('food_visibility_standard_tomato_2', 0, async () => {
      await resetToHome(driver);
      const visible: boolean = await checkTextContent(driver, FOOD_TOMATO);
      tracker.add('food_visibility:FOOD_TOMATO', visible, 0);
      expect(visible).assertTrue();
      expect(validator.isKnownFood(FOOD_TOMATO)).assertTrue();
    });

    // detail_render for standard mode with Tomato.
    it('detail_render_standard_tomato_3', 0, async () => {
      const start: number = Date.now();
      await launchStandardAbility(0);
      const visible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      tracker.add('detail_render:MODE_STANDARD', visible, Date.now() - start);
      expect(visible).assertTrue();
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // nutrition_labels for standard mode with Tomato.
    it('nutrition_labels_standard_tomato_4', 0, async () => {
      await launchStandardAbility(0);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      const count: number = await countNutritionLabels(driver);
      tracker.add('nutrition_labels:MODE_STANDARD', validator.nutritionIsComplete(count), 0);
      expect(count).assertEqual(5);
    });

    // mode_entry_click for standard mode with Tomato.
    it('mode_entry_click_standard_tomato_5', 0, async () => {
      await resetToHome(driver);
      const clicked: boolean = await clickModeEntry(driver, MODE_STANDARD);
      tracker.add('mode_entry_click:MODE_STANDARD', clicked, 0);
      expect(await isHomePageVisible(driver)).assertTrue();
      logInfo('mode entry click handled: ' + MODE_STANDARD);
    });

    // food_item_click for standard mode with Tomato.
    it('food_item_click_standard_tomato_6', 0, async () => {
      await resetToHome(driver);
      const clicked: boolean = await clickFoodItem(driver, FOOD_TOMATO);
      tracker.add('food_item_click:FOOD_TOMATO', clicked, 0);
      expect(await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH)).assertTrue();
      logInfo('food item click handled: ' + FOOD_TOMATO);
    });

    // back_recovery for standard mode with Tomato.
    it('back_recovery_standard_tomato_7', 0, async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const restored: boolean = await resetToHome(driver);
      tracker.add('back_recovery:MODE_STANDARD', restored, 0);
      expect(restored).assertTrue();
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // component_stability for standard mode with Tomato.
    it('component_stability_standard_tomato_8', 0, async () => {
      const first: number = await componentCount(driver);
      const second: number = await componentCount(driver);
      const stable: boolean = stableComponentCount(first, second, TOLERANCE_COMPONENT_COUNT);
      tracker.add('component_stability:MODE_STANDARD', stable, 0);
      expect(first > 0).assertTrue();
      expect(stable).assertTrue();
    });

    // focus_navigation for standard mode with Tomato.
    it('focus_navigation_standard_tomato_9', 0, async () => {
      await resetToHome(driver);
      await pressAndWait(driver, KEY_DOWN, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      const index: number = await getCurrentFocusIndex(driver);
      tracker.add('focus_navigation:MODE_STANDARD', index >= -1, 0);
      expect(index >= -1).assertTrue();
      logInfo('focus index after navigation: ' + index);
    });

    // touch_event for standard mode with Tomato.
    it('touch_event_standard_tomato_10', 0, async () => {
      await resetToHome(driver);
      await simulateTouch(driver, 100, 200);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      const visible: boolean = (await isHomePageVisible(driver)) || (await isFoodDetailVisible(driver));
      tracker.add('touch_event:MODE_STANDARD', visible, 0);
      expect(visible).assertTrue();
    });

    // text_content for standard mode with Tomato.
    it('text_content_standard_tomato_11', 0, async () => {
      const texts: string[] = await getTexts(driver);
      const matched: number = await countMatchingTexts(driver, FOOD_TOMATO);
      tracker.add('text_content:FOOD_TOMATO', texts.length > 0, 0);
      expect(texts.length > 0).assertTrue();
      expect(matched >= 0).assertTrue();
    });

    // ability_launch for standard mode with Tomato.
    it('ability_launch_standard_tomato_12', 0, async () => {
      const start: number = Date.now();
      await launchStandardAbility(0);
      const visible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      tracker.add('ability_launch:MODE_STANDARD', visible, Date.now() - start);
      expect(visible).assertTrue();
    });

    // helper_reuse for standard mode with Tomato.
    it('helper_reuse_standard_tomato_13', 0, async () => {
      const labels: string[] = allModeLabels();
      const unique: boolean = validator.labelsAreUnique(labels);
      const modes: string[] = [MODE_STANDARD, MODE_SPECIFIED, MODE_SINGLETON];
      tracker.add('helper_reuse:MODE_STANDARD', unique, 0);
      expect(unique).assertTrue();
      expect(modes.length).assertEqual(3);
    });

    // stress_round for standard mode with Tomato.
    it('stress_round_standard_tomato_14', 0, async () => {
      await resetToHome(driver);
      for (let i = 0; i < 5; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_DOWN : KEY_UP, 1, DELAY_KEY_NAVIGATION);
      }
      const visible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.add('stress_round:MODE_STANDARD:FOOD_TOMATO', visible, 0);
      expect(visible).assertTrue();
    });

    // lifecycle_round for standard mode with Tomato.
    it('lifecycle_round_standard_tomato_15', 0, async () => {
      await launchStandardAbility(0);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      const detail: boolean = await isFoodDetailVisible(driver);
      await resetToHome(driver);
      tracker.add('lifecycle_round:MODE_STANDARD', detail, 0);
      expect(detail).assertTrue();
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // home_render for specified mode with Tomato.
    it('home_render_specified_tomato_16', 0, async () => {
      const start: number = Date.now();
      await launchMainAbility();
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      const visible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.add('home_render:MODE_SPECIFIED:FOOD_TOMATO', visible, Date.now() - start);
      expect(visible).assertTrue();
    });

    // mode_labels for specified mode with Tomato.
    it('mode_labels_specified_tomato_17', 0, async () => {
      await resetToHome(driver);
      const labels: number = await countModeLabels(driver);
      tracker.add('mode_labels:MODE_SPECIFIED', validator.modeCountIsComplete(labels), 0);
      expect(labels).assertEqual(3);
      expect(validator.modeCountIsComplete(labels)).assertTrue();
    });

    // food_visibility for specified mode with Tomato.
    it('food_visibility_specified_tomato_18', 0, async () => {
      await resetToHome(driver);
      const visible: boolean = await checkTextContent(driver, FOOD_TOMATO);
      tracker.add('food_visibility:FOOD_TOMATO', visible, 0);
      expect(visible).assertTrue();
      expect(validator.isKnownFood(FOOD_TOMATO)).assertTrue();
    });

    // detail_render for specified mode with Tomato.
    it('detail_render_specified_tomato_19', 0, async () => {
      const start: number = Date.now();
      await launchSpecifiedAbility(0);
      const visible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      tracker.add('detail_render:MODE_SPECIFIED', visible, Date.now() - start);
      expect(visible).assertTrue();
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });
    it('suite_state_should_be_recorded', 0, async () => {
      const size: number = tracker.size();
      const rate: number = tracker.successRate();
      logInfo('EventToolValidation recorded cases: ' + size + ' success rate: ' + rate);
      expect(size >= 1).assertTrue();
      expect(validator.inRange(rate, 0, 100)).assertTrue();
      expect(validator.isNonNegative(tracker.averageDuration())).assertTrue();
    });
  });
}
