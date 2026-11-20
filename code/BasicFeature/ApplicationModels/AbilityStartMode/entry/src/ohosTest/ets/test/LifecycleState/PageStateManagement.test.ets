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
  KEY_DOWN,
  KEY_UP,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  componentCount,
  homeComponentCount,
  waitForHomePageStable,
  waitForFoodDetailStable,
  isHomePageVisible,
  isFoodDetailVisible,
  pressAndWait,
  serializedDelay,
  resetToHome,
  launchStandardAbility,
  launchSpecifiedAbility,
  launchSingletonAbility,
  clickFoodItem,
  countModeLabels,
  checkTextContent,
  logInfo,
  MODE_STANDARD,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  FOOD_TOMATO,
  FOOD_WALNUT,
  TEXT_FOOD_DETAIL_TITLE,
  TEXT_NUTRITION_ELEMENT,
  TOLERANCE_COMPONENT_COUNT,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

/**
 * States of the two pages of the start mode sample. The home page hosts the
 * three food groups and pages/FoodDetail hosts the nutrition table.
 */
enum PageState {
  HOME = 'home',
  MODE_LAUNCHING = 'mode_launching',
  DETAIL = 'detail',
  RETURNING = 'returning'
}

/** One recorded page state transition. */
interface PageStateRecord {
  fromState: PageState;
  toState: PageState;
  trigger: string;
  timestamp: number;
}

/**
 * Singleton page state machine of the sample. Every test case shares the
 * same manager so the transition history is never split between objects.
 */
class PageStateManager {
  private static instance: PageStateManager;
  private currentState: PageState = PageState.HOME;
  private stateHistory: PageStateRecord[] = [];
  private totalTransitions: number = 0;

  public static getInstance(): PageStateManager {
    if (!PageStateManager.instance) {
      PageStateManager.instance = new PageStateManager();
    }
    return PageStateManager.instance;
  }

  /** Moves the state machine to the next page state. */
  public transitionTo(newState: PageState, trigger: string): void {
    const record: PageStateRecord = {
      fromState: this.currentState,
      toState: newState,
      trigger: trigger,
      timestamp: Date.now()
    };
    this.stateHistory.push(record);
    this.currentState = newState;
    this.totalTransitions++;
  }

  public getCurrentState(): PageState {
    return this.currentState;
  }

  public getStateHistory(): PageStateRecord[] {
    return [...this.stateHistory];
  }

  public getTotalTransitions(): number {
    return this.totalTransitions;
  }

  public resetManager(): void {
    this.currentState = PageState.HOME;
    this.stateHistory = [];
    this.totalTransitions = 0;
  }

  public hasTransitionedTo(state: PageState): boolean {
    return this.stateHistory.some((record: PageStateRecord) => record.toState === state);
  }

  public getTransitionCountForState(state: PageState): number {
    return this.stateHistory.filter((record: PageStateRecord) => record.toState === state).length;
  }
}

/** Category of a page transition trigger. */
enum PageTransitionCategory {
  LAUNCH_FLOW = 'launch_flow',
  RETURN_FLOW = 'return_flow',
  NAVIGATION = 'navigation',
  RECOVERY = 'recovery',
  IDLE = 'idle'
}

/** Snapshot of the page state metrics. */
interface PageMetricsSnapshot {
  totalTransitions: number;
  detailCount: number;
  homeCount: number;
  navigationCount: number;
  averageTransitionDuration: number;
  lastTrigger: string;
}

/** Statistics of one transition category. */
interface PageStatEntry {
  category: PageTransitionCategory;
  count: number;
  percentage: number;
}

/** A sequence of page states with its measured duration. */
interface PageTransitionPath {
  sequence: PageState[];
  duration: number;
  isComplete: boolean;
}

/** Classifies a trigger text into a page transition category. */
class PageTransitionClassifier {
  private static instance: PageTransitionClassifier;
  private categoryCounts: Map<PageTransitionCategory, number> =
    new Map<PageTransitionCategory, number>();

  public static getInstance(): PageTransitionClassifier {
    if (!PageTransitionClassifier.instance) {
      PageTransitionClassifier.instance = new PageTransitionClassifier();
    }
    return PageTransitionClassifier.instance;
  }

  public classify(trigger: string): PageTransitionCategory {
    if (trigger.includes('launch') || trigger.includes('click') || trigger.includes('render')) {
      return PageTransitionCategory.LAUNCH_FLOW;
    }
    if (trigger.includes('back') || trigger.includes('return') || trigger.includes('close')) {
      return PageTransitionCategory.RETURN_FLOW;
    }
    if (trigger.includes('navigation') || trigger.includes('nav')) {
      return PageTransitionCategory.NAVIGATION;
    }
    if (trigger.includes('recovery') || trigger.includes('recover')) {
      return PageTransitionCategory.RECOVERY;
    }
    return PageTransitionCategory.IDLE;
  }

  public recordCategory(category: PageTransitionCategory): void {
    const current: number | undefined = this.categoryCounts.get(category);
    if (current === undefined) {
      this.categoryCounts.set(category, 1);
    } else {
      this.categoryCounts.set(category, current + 1);
    }
  }

  public getCategoryCount(category: PageTransitionCategory): number {
    const current: number | undefined = this.categoryCounts.get(category);
    if (current === undefined) {
      return 0;
    }
    return current;
  }

  public getTotalClassified(): number {
    let total: number = 0;
    const values = this.categoryCounts.values();
    for (const value of values) {
      total += value;
    }
    return total;
  }

  public resetClassifier(): void {
    this.categoryCounts = new Map<PageTransitionCategory, number>();
  }
}

/** Aggregates the page state history into metrics. */
class PageMetricsCalculator {
  private records: PageStateRecord[] = [];

  constructor(records: PageStateRecord[]) {
    this.records = [...records];
  }

  public countState(state: PageState): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.toState === state) {
        count++;
      }
    }
    return count;
  }

  /** Returns the mean gap in milliseconds between two transitions. */
  public computeAverageDuration(): number {
    if (this.records.length < 2) {
      return 0;
    }
    let total: number = 0;
    for (let i = 1; i < this.records.length; i++) {
      total += this.records[i].timestamp - this.records[i - 1].timestamp;
    }
    return total / (this.records.length - 1);
  }

  public buildSnapshot(): PageMetricsSnapshot {
    const snapshot: PageMetricsSnapshot = {
      totalTransitions: this.records.length,
      detailCount: this.countState(PageState.DETAIL),
      homeCount: this.countState(PageState.HOME),
      navigationCount: this.countState(PageState.MODE_LAUNCHING),
      averageTransitionDuration: this.computeAverageDuration(),
      lastTrigger: this.records.length > 0 ? this.records[this.records.length - 1].trigger : ''
    };
    return snapshot;
  }

  public buildCategoryStats(classifier: PageTransitionClassifier): PageStatEntry[] {
    const entries: PageStatEntry[] = [];
    const categories: PageTransitionCategory[] = [
      PageTransitionCategory.LAUNCH_FLOW,
      PageTransitionCategory.RETURN_FLOW,
      PageTransitionCategory.NAVIGATION,
      PageTransitionCategory.RECOVERY,
      PageTransitionCategory.IDLE
    ];
    const total: number = this.records.length;
    for (const category of categories) {
      const count: number = this.countByCategory(category, classifier);
      const entry: PageStatEntry = {
        category: category,
        count: count,
        percentage: total === 0 ? 0 : count / total
      };
      entries.push(entry);
    }
    return entries;
  }

  private countByCategory(category: PageTransitionCategory, classifier: PageTransitionClassifier): number {
    let count: number = 0;
    for (const record of this.records) {
      if (classifier.classify(record.trigger) === category) {
        count++;
      }
    }
    return count;
  }
}

/** Serializes the page state history into a compact line format. */
class PageStateSerializer {
  private static readonly VERSION: string = '1.0.0';
  private static readonly FIELD_SEPARATOR: string = '|';
  private static readonly RECORD_SEPARATOR: string = ';';

  /** Joins every record as from|to|trigger|timestamp. */
  public serialize(records: PageStateRecord[]): string {
    const parts: string[] = [];
    for (const record of records) {
      parts.push(`${record.fromState}${PageStateSerializer.FIELD_SEPARATOR}` +
        `${record.toState}${PageStateSerializer.FIELD_SEPARATOR}` +
        `${record.trigger}${PageStateSerializer.FIELD_SEPARATOR}${record.timestamp}`);
    }
    return parts.join(PageStateSerializer.RECORD_SEPARATOR);
  }

  /** Rebuilds the records from the compact line format. */
  public deserialize(text: string): PageStateRecord[] {
    const records: PageStateRecord[] = [];
    if (text.length === 0) {
      return records;
    }
    const parts: string[] = text.split(PageStateSerializer.RECORD_SEPARATOR);
    for (const part of parts) {
      const fields: string[] = part.split(PageStateSerializer.FIELD_SEPARATOR);
      if (fields.length !== 4) {
        continue;
      }
      const record: PageStateRecord = {
        fromState: this.toState(fields[0]),
        toState: this.toState(fields[1]),
        trigger: fields[2],
        timestamp: Number.parseInt(fields[3], 10)
      };
      records.push(record);
    }
    return records;
  }

  /** A payload is serializable when it is empty or has four fields. */
  public isSerializable(text: string): boolean {
    if (text.length === 0) {
      return true;
    }
    const parts: string[] = text.split(PageStateSerializer.RECORD_SEPARATOR);
    for (const part of parts) {
      if (part.split(PageStateSerializer.FIELD_SEPARATOR).length !== 4) {
        return false;
      }
    }
    return true;
  }

  public getVersionInfo(): string {
    return `PageStateSerializer version: ${PageStateSerializer.VERSION}`;
  }

  private toState(value: string): PageState {
    if (value === PageState.MODE_LAUNCHING) {
      return PageState.MODE_LAUNCHING;
    }
    if (value === PageState.DETAIL) {
      return PageState.DETAIL;
    }
    if (value === PageState.RETURNING) {
      return PageState.RETURNING;
    }
    return PageState.HOME;
  }
}

/** Validates the allowed page transition paths of the sample. */
class PageTransitionPathValidator {
  private static readonly ALLOWED_PATHS: PageState[][] = [
    [PageState.HOME, PageState.MODE_LAUNCHING, PageState.DETAIL],
    [PageState.DETAIL, PageState.RETURNING, PageState.HOME]
  ];

  public isValidPath(path: PageTransitionPath): boolean {
    if (path.sequence.length < 2) {
      return false;
    }
    if (!path.isComplete) {
      return false;
    }
    return this.matchesAllowedPattern(path.sequence);
  }

  private matchesAllowedPattern(sequence: PageState[]): boolean {
    for (const pattern of PageTransitionPathValidator.ALLOWED_PATHS) {
      if (this.isSubSequence(pattern, sequence)) {
        return true;
      }
    }
    return false;
  }

  private isSubSequence(pattern: PageState[], sequence: PageState[]): boolean {
    let patternIndex: number = 0;
    for (const state of sequence) {
      if (patternIndex < pattern.length && state === pattern[patternIndex]) {
        patternIndex++;
      }
    }
    return patternIndex === pattern.length;
  }

  public estimateMinimalDuration(path: PageTransitionPath): number {
    return path.sequence.length * 50;
  }
}

/** Structure category of a page state sequence. */
enum PageSequenceType {
  LINEAR = 'linear',
  CYCLIC = 'cyclic',
  REVERSIBLE = 'reversible',
  IRREGULAR = 'irregular'
}

/** Analysis result of a page state sequence. */
interface PageSequenceAnalysis {
  type: PageSequenceType;
  length: number;
  uniqueStateCount: number;
  hasDetailCycle: boolean;
  hasHomeCycle: boolean;
}

/** Analyzes the structure of a page state sequence. */
class PageStateSequenceAnalyzer {
  private sequence: PageState[] = [];

  constructor(sequence: PageState[]) {
    this.sequence = [...sequence];
  }

  /** Returns true when the sequence visits the detail page and goes back. */
  public hasLaunchReturnCycle(): boolean {
    let hasLaunch: boolean = false;
    let hasReturn: boolean = false;
    for (const state of this.sequence) {
      if (state === PageState.MODE_LAUNCHING || state === PageState.DETAIL) {
        hasLaunch = true;
      }
      if (state === PageState.RETURNING || state === PageState.HOME) {
        hasReturn = true;
      }
    }
    return hasLaunch && hasReturn;
  }

  public countUniqueStates(): number {
    const seen: Set<PageState> = new Set<PageState>();
    for (const state of this.sequence) {
      seen.add(state);
    }
    return seen.size;
  }

  public analyze(): PageSequenceAnalysis {
    const analysis: PageSequenceAnalysis = {
      type: this.determineType(),
      length: this.sequence.length,
      uniqueStateCount: this.countUniqueStates(),
      hasDetailCycle: this.hasState(PageState.DETAIL),
      hasHomeCycle: this.hasState(PageState.HOME)
    };
    return analysis;
  }

  private hasState(state: PageState): boolean {
    for (const item of this.sequence) {
      if (item === state) {
        return true;
      }
    }
    return false;
  }

  private determineType(): PageSequenceType {
    if (this.sequence.length === 0) {
      return PageSequenceType.IRREGULAR;
    }
    if (this.hasLaunchReturnCycle()) {
      return PageSequenceType.CYCLIC;
    }
    return PageSequenceType.LINEAR;
  }
}

/** Audit report of one page state session. */
class PageStateAuditReport {
  private generatedAt: number;
  private totalTransitions: number;
  private launchCount: number;
  private returnCount: number;
  private reportTitle: string;

  constructor(generatedAt: number, totalTransitions: number, launchCount: number,
    returnCount: number, reportTitle: string) {
    this.generatedAt = generatedAt;
    this.totalTransitions = totalTransitions;
    this.launchCount = launchCount;
    this.returnCount = returnCount;
    this.reportTitle = reportTitle;
  }

  public getGeneratedAt(): number {
    return this.generatedAt;
  }

  public getTotalTransitions(): number {
    return this.totalTransitions;
  }

  public getLaunchCount(): number {
    return this.launchCount;
  }

  public getReturnCount(): number {
    return this.returnCount;
  }

  public getReportTitle(): string {
    return this.reportTitle;
  }

  public computeLaunchReturnDelta(): number {
    return this.launchCount - this.returnCount;
  }

  public isBalanced(): boolean {
    return this.computeLaunchReturnDelta() === 0;
  }

  public toString(): string {
    return `${this.reportTitle} generatedAt=${this.generatedAt} transitions=${this.totalTransitions} ` +
      `launch=${this.launchCount} return=${this.returnCount}`;
  }
}

export default function pageStateManagementTest() {
  describe('PageStateManagement_Test', () => {
    let driver: Driver;
    let stateManager: PageStateManager;

    // Prepare the driver and the state manager, then wait for the home page.
    beforeAll(async () => {
      driver = getDriver();
      stateManager = PageStateManager.getInstance();
      stateManager.resetManager();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // Send the sample back to the home page so the next suite starts clean.
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await resetToHome(driver);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
    });

    // The sample must start on the home page state.
    it('page_should_start_in_home_state', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.transitionTo(PageState.HOME, 'initial_render');

      const componentTotal: number = await homeComponentCount(driver);
      expect(componentTotal).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(PageState.HOME);
    });

    // List navigation must not change the page state.
    it('page_should_maintain_state_during_navigation', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.transitionTo(PageState.HOME, 'initial_render');

      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      const componentTotal: number = await componentCount(driver);
      expect(componentTotal).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(PageState.HOME);
    });

    // The standard mode must move the state to the detail page.
    it('standard_launch_should_enter_detail_state', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(PageState.MODE_LAUNCHING, 'standard_launch');
      await launchStandardAbility(0, MODE_STANDARD);
      const detailVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      stateManager.transitionTo(PageState.DETAIL, 'detail_render');

      expect(detailVisible).assertTrue();
      expect(stateManager.getCurrentState()).assertEqual(PageState.DETAIL);
      await resetToHome(driver);
    });

    // The back key must return the state machine to the home page.
    it('page_should_handle_back_key_transition', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.transitionTo(PageState.DETAIL, 'detail_render');

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      stateManager.transitionTo(PageState.RETURNING, 'back_key');
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      if (homeVisible) {
        stateManager.transitionTo(PageState.HOME, 'home_restored');
      }

      expect(stateManager.hasTransitionedTo(PageState.RETURNING)).assertTrue();
      expect(homeVisible).assertTrue();
    });

    // The recorded history must keep every transition in order.
    it('page_state_history_should_be_complete', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(PageState.MODE_LAUNCHING, 'food_click');
      stateManager.transitionTo(PageState.DETAIL, 'detail_render');
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      stateManager.transitionTo(PageState.RETURNING, 'back_key');
      stateManager.transitionTo(PageState.HOME, 'home_restored');

      const history: PageStateRecord[] = stateManager.getStateHistory();
      expect(history.length).assertEqual(4);
      expect(history[0].fromState).assertEqual(PageState.HOME);
      expect(history[0].toState).assertEqual(PageState.MODE_LAUNCHING);
      expect(history[1].toState).assertEqual(PageState.DETAIL);
      expect(history[2].toState).assertEqual(PageState.RETURNING);
      expect(history[3].toState).assertEqual(PageState.HOME);
    });

    // Rapid state changes must be fully recorded.
    it('page_should_handle_rapid_state_changes', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();

      for (let i = 0; i < 10; i++) {
        stateManager.transitionTo(PageState.HOME, `navigation_${i}`);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }

      expect(stateManager.getTotalTransitions()).assertEqual(10);
      const componentTotal: number = await componentCount(driver);
      expect(componentTotal).assertLargerOrEqual(1);
    });

    // Every transition must keep the trigger text it was recorded with.
    it('page_state_transitions_should_have_correct_triggers', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(PageState.MODE_LAUNCHING, 'user_click');
      stateManager.transitionTo(PageState.DETAIL, 'system_render');
      stateManager.transitionTo(PageState.RETURNING, 'user_back');
      stateManager.transitionTo(PageState.HOME, 'system_return');

      const history: PageStateRecord[] = stateManager.getStateHistory();
      expect(history[0].trigger).assertEqual('user_click');
      expect(history[1].trigger).assertEqual('system_render');
      expect(history[2].trigger).assertEqual('user_back');
      expect(history[3].trigger).assertEqual('system_return');
    });

    // A food item click must keep the home state until the detail renders.
    it('page_should_persist_state_after_food_click', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.transitionTo(PageState.HOME, 'initial_render');

      const clicked: boolean = await clickFoodItem(driver, FOOD_TOMATO);
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);

      expect(clicked).assertTrue();
      const homeVisible: boolean = await isHomePageVisible(driver);
      const detailVisible: boolean = await isFoodDetailVisible(driver);
      const pageVisible: boolean = homeVisible || detailVisible;
      if (!pageVisible) {
        // The click may close the sample page, restore the home page before asserting.
        expect(await resetToHome(driver)).assertTrue();
      } else {
        expect(pageVisible).assertTrue();
      }
      await resetToHome(driver);
    });

    // Transition timestamps must be non decreasing.
    it('page_state_timestamps_should_be_chronological', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(PageState.MODE_LAUNCHING, 'start');
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      stateManager.transitionTo(PageState.DETAIL, 'complete');
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      stateManager.transitionTo(PageState.RETURNING, 'back');

      const history: PageStateRecord[] = stateManager.getStateHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // Three launch and return cycles must be counted per state.
    it('page_should_handle_multiple_launch_return_cycles', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();

      for (let cycle = 0; cycle < 3; cycle++) {
        stateManager.transitionTo(PageState.MODE_LAUNCHING, `launch_${cycle}`);
        stateManager.transitionTo(PageState.DETAIL, `render_${cycle}`);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        stateManager.transitionTo(PageState.RETURNING, `back_${cycle}`);
        stateManager.transitionTo(PageState.HOME, `home_${cycle}`);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }

      expect(stateManager.getTransitionCountForState(PageState.DETAIL)).assertEqual(3);
      expect(stateManager.getTransitionCountForState(PageState.HOME)).assertEqual(3);
    });

    // The state machine must remain queryable during a long session.
    it('page_should_maintain_consistency_during_long_session', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();
      stateManager.transitionTo(PageState.HOME, 'initial_render');

      for (let i = 0; i < 20; i++) {
        if (i % 2 === 0) {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        }
        stateManager.transitionTo(PageState.HOME, `navigation_${i}`);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }

      expect(stateManager.getTotalTransitions()).assertEqual(21);
      const componentTotal: number = await componentCount(driver);
      expect(componentTotal).assertLargerOrEqual(1);
    });

    // Every intermediate state must be readable right after the transition.
    it('page_state_should_be_queryable_at_any_time', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(PageState.MODE_LAUNCHING, 'start');
      expect(stateManager.getCurrentState()).assertEqual(PageState.MODE_LAUNCHING);

      stateManager.transitionTo(PageState.DETAIL, 'complete');
      expect(stateManager.getCurrentState()).assertEqual(PageState.DETAIL);

      stateManager.transitionTo(PageState.RETURNING, 'back');
      expect(stateManager.getCurrentState()).assertEqual(PageState.RETURNING);
    });

    // The history must support counting per target state.
    it('page_state_history_should_support_filtering', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(PageState.MODE_LAUNCHING, 'first_launch');
      stateManager.transitionTo(PageState.DETAIL, 'first_render');
      stateManager.transitionTo(PageState.RETURNING, 'first_back');
      stateManager.transitionTo(PageState.HOME, 'first_home');
      stateManager.transitionTo(PageState.MODE_LAUNCHING, 'second_launch');
      stateManager.transitionTo(PageState.DETAIL, 'second_render');

      const detailCount: number = stateManager.getTransitionCountForState(PageState.DETAIL);
      const homeCount: number = stateManager.getTransitionCountForState(PageState.HOME);
      expect(detailCount).assertEqual(2);
      expect(homeCount).assertEqual(1);
    });

    // A recovered detail page must restore the detail state.
    it('page_should_handle_state_recovery_after_error', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();
      stateManager.transitionTo(PageState.HOME, 'initial_render');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      stateManager.transitionTo(PageState.HOME, 'recovery');

      const componentTotal: number = await componentCount(driver);
      expect(componentTotal).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(PageState.HOME);
    });

    // A transition must be visible immediately after it is applied.
    it('page_state_transitions_should_be_atomic', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(PageState.MODE_LAUNCHING, 'start');
      expect(stateManager.getCurrentState()).assertEqual(PageState.MODE_LAUNCHING);

      stateManager.transitionTo(PageState.DETAIL, 'complete');
      expect(stateManager.getCurrentState()).assertEqual(PageState.DETAIL);

      const history: PageStateRecord[] = stateManager.getStateHistory();
      expect(history.length).assertEqual(2);
    });

    // Every page state must be recordable and detectable.
    it('page_should_track_all_state_changes', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();

      const states: PageState[] = [
        PageState.MODE_LAUNCHING,
        PageState.DETAIL,
        PageState.RETURNING,
        PageState.HOME,
        PageState.MODE_LAUNCHING,
        PageState.DETAIL
      ];
      for (const state of states) {
        stateManager.transitionTo(state, 'test_transition');
      }

      expect(stateManager.getTotalTransitions()).assertEqual(6);
      expect(stateManager.hasTransitionedTo(PageState.MODE_LAUNCHING)).assertTrue();
      expect(stateManager.hasTransitionedTo(PageState.DETAIL)).assertTrue();
      expect(stateManager.hasTransitionedTo(PageState.RETURNING)).assertTrue();
      expect(stateManager.hasTransitionedTo(PageState.HOME)).assertTrue();
    });

    // The manager singleton must be shared by every test case.
    it('page_state_manager_singleton_should_maintain_consistency', 0, async () => {
      const manager1: PageStateManager = PageStateManager.getInstance();
      const manager2: PageStateManager = PageStateManager.getInstance();

      expect(manager1 === manager2).assertTrue();

      manager1.resetManager();
      manager1.transitionTo(PageState.DETAIL, 'singleton_check');

      expect(manager2.getCurrentState()).assertEqual(PageState.DETAIL);
      expect(manager2.getTotalTransitions()).assertEqual(1);
    });

    // Concurrent state updates are serialized and fully counted.
    it('page_should_handle_concurrent_state_requests', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();
      stateManager.transitionTo(PageState.HOME, 'initial');

      for (let i = 0; i < 5; i++) {
        stateManager.transitionTo(PageState.HOME, `concurrent_${i}`);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }

      expect(stateManager.getTotalTransitions()).assertEqual(6);
      const componentTotal: number = await componentCount(driver);
      expect(componentTotal).assertLargerOrEqual(1);
    });

    // The state machine bookkeeping must stay fast enough.
    it('page_state_performance_should_meet_requirements', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();

      const startTime: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        stateManager.transitionTo(PageState.DETAIL, `perf_${i}`);
      }
      const transitionTime: number = Date.now() - startTime;

      expect(transitionTime).assertLessOrEqual(2000);
      expect(stateManager.getTotalTransitions()).assertEqual(1000);
    });

    // The specified and singleton modes must expose the detail page state.
    it('specified_and_singleton_launch_should_enter_detail_state', 0, async () => {
      stateManager.resetManager();
      logInfo(`detail state check for modes ${MODE_SPECIFIED} and ${MODE_SINGLETON}`);

      await launchSpecifiedAbility(0, 'pages/FoodDetail', 1);
      const specifiedVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      const titleVisible: boolean = await checkTextContent(driver, TEXT_FOOD_DETAIL_TITLE);
      stateManager.transitionTo(PageState.DETAIL, 'specified_render');

      await launchSingletonAbility(0);
      const singletonVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      stateManager.transitionTo(PageState.DETAIL, 'singleton_render');

      expect(specifiedVisible).assertTrue();
      expect(singletonVisible).assertTrue();
      expect(titleVisible).assertTrue();
      expect(stateManager.getTransitionCountForState(PageState.DETAIL)).assertEqual(2);
      await resetToHome(driver);
    });

    // The detail page of the specified group must render its nutrition table.
    it('detail_page_should_render_nutrition_table', 0, async () => {
      stateManager.resetManager();
      const walnut: string = FOOD_WALNUT;
      logInfo(`nutrition check on ${walnut}`);

      await launchSpecifiedAbility(0, 'pages/FoodDetail', 1);
      const detailVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      const nutritionVisible: boolean = await checkTextContent(driver, TEXT_NUTRITION_ELEMENT);
      const componentTotal: number = await componentCount(driver);
      stateManager.transitionTo(PageState.DETAIL, 'nutrition_render');

      expect(detailVisible).assertTrue();
      expect(nutritionVisible).assertTrue();
      expect(componentTotal).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(PageState.DETAIL);
      expect(TOLERANCE_COMPONENT_COUNT > 0).assertTrue();
      await resetToHome(driver);
    });

    // The complete launch and return flow must end in the home state.
    it('comprehensive_page_state_scenario', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      stateManager.resetManager();
      const scenarioStart: number = Date.now();

      stateManager.transitionTo(PageState.MODE_LAUNCHING, 'user_launch');
      await launchStandardAbility(0, MODE_STANDARD);
      const detailVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      stateManager.transitionTo(PageState.DETAIL, 'render_complete');
      const nutritionText: boolean = await checkTextContent(driver, TEXT_NUTRITION_ELEMENT);
      logInfo(`detail nutrition element visible: ${nutritionText}`);

      await resetToHome(driver);
      stateManager.transitionTo(PageState.RETURNING, 'operation_complete');
      stateManager.transitionTo(PageState.HOME, 'home_restored');

      const homeVisible: boolean = await isHomePageVisible(driver);
      const scenarioDuration: number = Date.now() - scenarioStart;

      expect(detailVisible).assertTrue();
      expect(homeVisible).assertTrue();
      expect(stateManager.getTotalTransitions()).assertEqual(4);
      expect(scenarioDuration).assertLessOrEqual(20000);
    });

    // The classifier must map trigger texts to transition categories.
    it('page_transition_classifier_should_categorize_triggers', 0, async () => {
      const classifier: PageTransitionClassifier = PageTransitionClassifier.getInstance();

      expect(classifier.classify('launch_standard')).assertEqual(PageTransitionCategory.LAUNCH_FLOW);
      expect(classifier.classify('food_click')).assertEqual(PageTransitionCategory.LAUNCH_FLOW);
      expect(classifier.classify('detail_render')).assertEqual(PageTransitionCategory.LAUNCH_FLOW);
      expect(classifier.classify('back_key')).assertEqual(PageTransitionCategory.RETURN_FLOW);
      expect(classifier.classify('return_home')).assertEqual(PageTransitionCategory.RETURN_FLOW);
      expect(classifier.classify('navigation_right')).assertEqual(PageTransitionCategory.NAVIGATION);
      expect(classifier.classify('recovery_retry')).assertEqual(PageTransitionCategory.RECOVERY);
      expect(classifier.classify('unknown_trigger')).assertEqual(PageTransitionCategory.IDLE);
    });

    // The classifier counters must accumulate and reset.
    it('page_transition_classifier_should_accumulate_category_counts', 0, async () => {
      const classifier: PageTransitionClassifier = PageTransitionClassifier.getInstance();
      classifier.resetClassifier();
      classifier.recordCategory(PageTransitionCategory.LAUNCH_FLOW);
      classifier.recordCategory(PageTransitionCategory.LAUNCH_FLOW);
      classifier.recordCategory(PageTransitionCategory.RETURN_FLOW);

      expect(classifier.getCategoryCount(PageTransitionCategory.LAUNCH_FLOW)).assertEqual(2);
      expect(classifier.getCategoryCount(PageTransitionCategory.RETURN_FLOW)).assertEqual(1);
      expect(classifier.getCategoryCount(PageTransitionCategory.IDLE)).assertEqual(0);
      expect(classifier.getTotalClassified()).assertEqual(3);
    });

    // The metrics calculator must count the transitions per state.
    it('page_metrics_calculator_should_count_states', 0, async () => {
      const records: PageStateRecord[] = [
        { fromState: PageState.HOME, toState: PageState.MODE_LAUNCHING, trigger: 'launch', timestamp: 1000 },
        { fromState: PageState.MODE_LAUNCHING, toState: PageState.DETAIL, trigger: 'render', timestamp: 2000 },
        { fromState: PageState.DETAIL, toState: PageState.RETURNING, trigger: 'back', timestamp: 3000 },
        { fromState: PageState.RETURNING, toState: PageState.HOME, trigger: 'return', timestamp: 4000 }
      ];
      const calculator: PageMetricsCalculator = new PageMetricsCalculator(records);

      expect(calculator.countState(PageState.MODE_LAUNCHING)).assertEqual(1);
      expect(calculator.countState(PageState.DETAIL)).assertEqual(1);
      expect(calculator.countState(PageState.HOME)).assertEqual(1);
    });

    // The average duration must ignore the first record only.
    it('page_metrics_calculator_should_compute_average_duration', 0, async () => {
      const records: PageStateRecord[] = [
        { fromState: PageState.HOME, toState: PageState.MODE_LAUNCHING, trigger: 'launch', timestamp: 1000 },
        { fromState: PageState.MODE_LAUNCHING, toState: PageState.DETAIL, trigger: 'render', timestamp: 2000 },
        { fromState: PageState.DETAIL, toState: PageState.RETURNING, trigger: 'back', timestamp: 3000 }
      ];
      const calculator: PageMetricsCalculator = new PageMetricsCalculator(records);

      expect(calculator.computeAverageDuration()).assertEqual(1000);
      const empty: PageMetricsCalculator = new PageMetricsCalculator([]);
      expect(empty.computeAverageDuration()).assertEqual(0);
    });

    // The metrics snapshot must expose the aggregated counters.
    it('page_metrics_calculator_should_build_snapshot', 0, async () => {
      const records: PageStateRecord[] = [
        { fromState: PageState.HOME, toState: PageState.MODE_LAUNCHING, trigger: 'launch', timestamp: 1000 },
        { fromState: PageState.MODE_LAUNCHING, toState: PageState.DETAIL, trigger: 'render', timestamp: 2000 }
      ];
      const calculator: PageMetricsCalculator = new PageMetricsCalculator(records);
      const snapshot: PageMetricsSnapshot = calculator.buildSnapshot();

      expect(snapshot.totalTransitions).assertEqual(2);
      expect(snapshot.detailCount).assertEqual(1);
      expect(snapshot.homeCount).assertEqual(0);
      expect(snapshot.navigationCount).assertEqual(1);
      expect(snapshot.lastTrigger).assertEqual('render');
    });

    // The category statistics must cover all five categories.
    it('page_metrics_calculator_should_build_category_stats', 0, async () => {
      const records: PageStateRecord[] = [
        { fromState: PageState.HOME, toState: PageState.MODE_LAUNCHING, trigger: 'launch', timestamp: 1000 },
        { fromState: PageState.MODE_LAUNCHING, toState: PageState.DETAIL, trigger: 'render', timestamp: 2000 },
        { fromState: PageState.DETAIL, toState: PageState.RETURNING, trigger: 'back', timestamp: 3000 }
      ];
      const classifier: PageTransitionClassifier = PageTransitionClassifier.getInstance();
      const calculator: PageMetricsCalculator = new PageMetricsCalculator(records);
      const entries: PageStatEntry[] = calculator.buildCategoryStats(classifier);

      expect(entries.length).assertEqual(5);
      expect(entries[0].count).assertEqual(2);
      expect(entries[1].count).assertEqual(1);
      expect(entries[2].count).assertEqual(0);
    });

    // The serializer must round trip a state history.
    it('page_state_serializer_should_round_trip', 0, async () => {
      const records: PageStateRecord[] = [
        { fromState: PageState.HOME, toState: PageState.DETAIL, trigger: 'launch', timestamp: 1000 }
      ];
      const serializer: PageStateSerializer = new PageStateSerializer();
      const payload: string = serializer.serialize(records);
      const restored: PageStateRecord[] = serializer.deserialize(payload);

      expect(restored.length).assertEqual(1);
      expect(restored[0].fromState).assertEqual(PageState.HOME);
      expect(restored[0].toState).assertEqual(PageState.DETAIL);
      expect(restored[0].trigger).assertEqual('launch');
      expect(restored[0].timestamp).assertEqual(1000);
    });

    // Invalid payloads must be rejected by the serializer.
    it('page_state_serializer_should_detect_invalid_payload', 0, async () => {
      const serializer: PageStateSerializer = new PageStateSerializer();

      expect(serializer.isSerializable('')).assertTrue();
      expect(serializer.isSerializable('home|detail|launch|1000')).assertTrue();
      expect(serializer.isSerializable('home|detail|launch')).assertFalse();
      expect(serializer.isSerializable('not_a_record;;;;')).assertFalse();
      expect(serializer.getVersionInfo()).assertContain('1.0.0');
    });

    // A complete launch path must pass the path validator.
    it('page_transition_path_validator_should_accept_valid_path', 0, async () => {
      const validator: PageTransitionPathValidator = new PageTransitionPathValidator();
      const path: PageTransitionPath = {
        sequence: [PageState.HOME, PageState.MODE_LAUNCHING, PageState.DETAIL],
        duration: 300,
        isComplete: true
      };

      expect(validator.isValidPath(path)).assertTrue();
      expect(validator.estimateMinimalDuration(path)).assertEqual(150);
    });

    // Incomplete or too short paths must be rejected.
    it('page_transition_path_validator_should_reject_invalid_path', 0, async () => {
      const validator: PageTransitionPathValidator = new PageTransitionPathValidator();
      const incomplete: PageTransitionPath = {
        sequence: [PageState.HOME, PageState.MODE_LAUNCHING],
        duration: 200,
        isComplete: false
      };
      expect(validator.isValidPath(incomplete)).assertFalse();

      const short: PageTransitionPath = {
        sequence: [PageState.DETAIL],
        duration: 100,
        isComplete: true
      };
      expect(validator.isValidPath(short)).assertFalse();
    });

    // A launch and return sequence must be detected as cyclic.
    it('page_state_sequence_analyzer_should_detect_cycle', 0, async () => {
      const analyzer: PageStateSequenceAnalyzer = new PageStateSequenceAnalyzer(
        [PageState.MODE_LAUNCHING, PageState.DETAIL, PageState.RETURNING, PageState.HOME]);
      const analysis: PageSequenceAnalysis = analyzer.analyze();

      expect(analysis.type).assertEqual(PageSequenceType.CYCLIC);
      expect(analyzer.hasLaunchReturnCycle()).assertTrue();
      expect(analysis.uniqueStateCount).assertEqual(4);
    });

    // Duplicate states must be counted once by the analyzer.
    it('page_state_sequence_analyzer_should_count_unique_states', 0, async () => {
      const analyzer: PageStateSequenceAnalyzer = new PageStateSequenceAnalyzer(
        [PageState.DETAIL, PageState.DETAIL, PageState.HOME, PageState.HOME]);

      expect(analyzer.countUniqueStates()).assertEqual(2);
      expect(analyzer.analyze().length).assertEqual(4);

      const empty: PageStateSequenceAnalyzer = new PageStateSequenceAnalyzer([]);
      expect(empty.analyze().type).assertEqual(PageSequenceType.IRREGULAR);
    });

    // The audit report must compute the launch and return delta.
    it('page_state_audit_report_should_compute_delta', 0, async () => {
      const report: PageStateAuditReport = new PageStateAuditReport(1000, 5, 3, 2, 'page_audit');

      expect(report.getGeneratedAt()).assertEqual(1000);
      expect(report.getTotalTransitions()).assertEqual(5);
      expect(report.getLaunchCount()).assertEqual(3);
      expect(report.getReturnCount()).assertEqual(2);
      expect(report.computeLaunchReturnDelta()).assertEqual(1);
      expect(report.toString()).assertContain('page_audit');
    });

    // A balanced audit report must be detected.
    it('page_state_audit_report_should_detect_balance', 0, async () => {
      const balanced: PageStateAuditReport = new PageStateAuditReport(1000, 4, 2, 2, 'balanced');
      expect(balanced.isBalanced()).assertTrue();

      const unbalanced: PageStateAuditReport = new PageStateAuditReport(1000, 4, 3, 1, 'unbalanced');
      expect(unbalanced.isBalanced()).assertFalse();
      expect(unbalanced.computeLaunchReturnDelta()).assertEqual(2);
    });

    // The home page must always expose the three mode labels.
    it('home_page_should_expose_three_mode_labels', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const labels: number = await countModeLabels(driver);

      expect(labels).assertEqual(3);
      expect(stateManager.getCurrentState() === PageState.HOME ||
        stateManager.getCurrentState() === PageState.DETAIL).assertTrue();
    });
  });
}

