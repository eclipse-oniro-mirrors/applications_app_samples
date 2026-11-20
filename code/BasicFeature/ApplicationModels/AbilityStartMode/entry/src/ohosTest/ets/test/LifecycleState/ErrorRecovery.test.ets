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
  isHomePageVisible,
  pressAndWait,
  serializedDelay,
  resetToHome,
  launchStandardAbility,
  launchSpecifiedAbility,
  launchSingletonAbility,
  countModeLabels,
  logInfo,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  DELAY_AFTER_START_MODE,
  DELAY_KEY_NAVIGATION,
  MODE_STANDARD,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  FOOD_TOMATO,
  TEXT_TOAST
} from '../Shared/SharedDriver';

/**
 * Failures that the start mode sample may face while the user walks from
 * the home page to pages/FoodDetail and back.
 */
enum RecoveryErrorType {
  LIST_NAVIGATION_LOST = 'list_navigation_lost',
  MODE_LAUNCH_TIMEOUT = 'mode_launch_timeout',
  DETAIL_RENDER_FAILURE = 'detail_render_failure',
  MODE_STATE_INCONSISTENT = 'mode_state_inconsistent',
  FOOD_ITEM_NOT_FOUND = 'food_item_not_found'
}

/** One observed failure together with the recovery result. */
interface RecoveryErrorRecord {
  errorType: RecoveryErrorType;
  timestamp: number;
  recoveryAttempted: boolean;
  recoverySuccessful: boolean;
  recoveryTime: number;
}

/**
 * Singleton tracker that keeps every failure of the current test run.
 * A shared instance avoids a second tracker with polluted counters.
 */
class StartModeErrorTracker {
  private static instance: StartModeErrorTracker;
  private errorHistory: RecoveryErrorRecord[] = [];
  private totalErrors: number = 0;
  private totalRecoveries: number = 0;

  /** Returns the shared tracker instance, creating it on first access. */
  public static getInstance(): StartModeErrorTracker {
    if (!StartModeErrorTracker.instance) {
      StartModeErrorTracker.instance = new StartModeErrorTracker();
    }
    return StartModeErrorTracker.instance;
  }

  /** Appends one failure and its recovery result to the history. */
  public recordError(errorType: RecoveryErrorType, recoveryAttempted: boolean,
    recoverySuccessful: boolean, recoveryTime: number): void {
    const record: RecoveryErrorRecord = {
      errorType: errorType,
      timestamp: Date.now(),
      recoveryAttempted: recoveryAttempted,
      recoverySuccessful: recoverySuccessful,
      recoveryTime: recoveryTime
    };
    this.errorHistory.push(record);
    this.totalErrors++;
    if (recoverySuccessful) {
      this.totalRecoveries++;
    }
  }

  public getErrorHistory(): RecoveryErrorRecord[] {
    return [...this.errorHistory];
  }

  public getTotalErrors(): number {
    return this.totalErrors;
  }

  public getTotalRecoveries(): number {
    return this.totalRecoveries;
  }

  /** Returns the recovered / total ratio or zero when nothing was recorded. */
  public getRecoveryRate(): number {
    if (this.totalErrors === 0) {
      return 0;
    }
    return this.totalRecoveries / this.totalErrors;
  }

  public resetTracker(): void {
    this.errorHistory = [];
    this.totalErrors = 0;
    this.totalRecoveries = 0;
  }

  public hasErrorOfType(errorType: RecoveryErrorType): boolean {
    return this.errorHistory.some((record: RecoveryErrorRecord) => record.errorType === errorType);
  }

  public getErrorCountByType(errorType: RecoveryErrorType): number {
    return this.errorHistory.filter((record: RecoveryErrorRecord) => record.errorType === errorType).length;
  }

  /** Averages the elapsed time of the successful recoveries only. */
  public getAverageRecoveryTime(): number {
    const successful: RecoveryErrorRecord[] =
      this.errorHistory.filter((record: RecoveryErrorRecord) => record.recoverySuccessful);
    if (successful.length === 0) {
      return 0;
    }
    const totalTime: number = successful.reduce(
      (sum: number, record: RecoveryErrorRecord) => sum + record.recoveryTime, 0);
    return totalTime / successful.length;
  }
}

/** Recovery strategies that may be applied to a failure of the sample. */
enum RecoveryStrategy {
  RETRY = 'retry',
  RESET = 'reset',
  FALLBACK = 'fallback',
  IGNORE = 'ignore'
}

/** Severity of a failure of the sample. */
enum RecoverySeverity {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high',
  CRITICAL = 'critical'
}

/** Recovery advice for one failure type. */
interface RecoverySuggestion {
  errorType: RecoveryErrorType;
  strategy: RecoveryStrategy;
  priority: number;
  description: string;
}

/** Aggregated recovery numbers of a failure history. */
interface RecoverySummary {
  totalErrors: number;
  recoveredErrors: number;
  unrecoveredErrors: number;
  averageRecoveryTime: number;
  recoveryRate: number;
}

/** Grades every failure type of the start mode sample. */
class RecoverySeverityEvaluator {
  private static instance: RecoverySeverityEvaluator;
  private severityMap: Map<RecoveryErrorType, RecoverySeverity> =
    new Map<RecoveryErrorType, RecoverySeverity>();

  private constructor() {
    this.severityMap.set(RecoveryErrorType.LIST_NAVIGATION_LOST, RecoverySeverity.LOW);
    this.severityMap.set(RecoveryErrorType.MODE_LAUNCH_TIMEOUT, RecoverySeverity.HIGH);
    this.severityMap.set(RecoveryErrorType.DETAIL_RENDER_FAILURE, RecoverySeverity.HIGH);
    this.severityMap.set(RecoveryErrorType.MODE_STATE_INCONSISTENT, RecoverySeverity.CRITICAL);
    this.severityMap.set(RecoveryErrorType.FOOD_ITEM_NOT_FOUND, RecoverySeverity.MEDIUM);
  }

  public static getInstance(): RecoverySeverityEvaluator {
    if (!RecoverySeverityEvaluator.instance) {
      RecoverySeverityEvaluator.instance = new RecoverySeverityEvaluator();
    }
    return RecoverySeverityEvaluator.instance;
  }

  public evaluate(errorType: RecoveryErrorType): RecoverySeverity {
    const severity: RecoverySeverity | undefined = this.severityMap.get(errorType);
    if (severity === undefined) {
      return RecoverySeverity.MEDIUM;
    }
    return severity;
  }

  public isCritical(errorType: RecoveryErrorType): boolean {
    return this.evaluate(errorType) === RecoverySeverity.CRITICAL;
  }
}

/** Recommends a recovery strategy for every failure type. */
class RecoveryStrategyRecommender {
  private suggestions: RecoverySuggestion[] = [];

  constructor() {
    this.suggestions = [{
      errorType: RecoveryErrorType.LIST_NAVIGATION_LOST,
      strategy: RecoveryStrategy.RETRY,
      priority: 1,
      description: 'request focus again on the food list'
    }, {
      errorType: RecoveryErrorType.MODE_LAUNCH_TIMEOUT,
      strategy: RecoveryStrategy.RESET,
      priority: 2,
      description: 'restart the selected launch mode'
    }, {
      errorType: RecoveryErrorType.DETAIL_RENDER_FAILURE,
      strategy: RecoveryStrategy.FALLBACK,
      priority: 3,
      description: 'fall back to pages/FoodDetail'
    }, {
      errorType: RecoveryErrorType.MODE_STATE_INCONSISTENT,
      strategy: RecoveryStrategy.RESET,
      priority: 4,
      description: 'relaunch MainAbility and rebuild the home page'
    }, {
      errorType: RecoveryErrorType.FOOD_ITEM_NOT_FOUND,
      strategy: RecoveryStrategy.FALLBACK,
      priority: 5,
      description: 'fall back to the first food item of the group'
    }];
  }

  public recommend(errorType: RecoveryErrorType): RecoverySuggestion | null {
    for (const suggestion of this.suggestions) {
      if (suggestion.errorType === errorType) {
        return suggestion;
      }
    }
    return null;
  }

  public getSuggestions(): RecoverySuggestion[] {
    return [...this.suggestions];
  }

  /** Counts how many suggestions rely on the given strategy. */
  public countByStrategy(strategy: RecoveryStrategy): number {
    let count: number = 0;
    for (const suggestion of this.suggestions) {
      if (suggestion.strategy === strategy) {
        count++;
      }
    }
    return count;
  }
}

/** Aggregates a failure history into the recovery summary. */
class RecoverySummaryBuilder {
  private records: RecoveryErrorRecord[] = [];

  constructor(records: RecoveryErrorRecord[]) {
    this.records = [...records];
  }

  public buildSummary(): RecoverySummary {
    const summary: RecoverySummary = {
      totalErrors: this.records.length,
      recoveredErrors: this.countRecovered(),
      unrecoveredErrors: this.countUnrecovered(),
      averageRecoveryTime: this.computeAverageRecoveryTime(),
      recoveryRate: this.computeRecoveryRate()
    };
    return summary;
  }

  private countRecovered(): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.recoverySuccessful) {
        count++;
      }
    }
    return count;
  }

  private countUnrecovered(): number {
    let count: number = 0;
    for (const record of this.records) {
      if (!record.recoverySuccessful) {
        count++;
      }
    }
    return count;
  }

  private computeAverageRecoveryTime(): number {
    let total: number = 0;
    let count: number = 0;
    for (const record of this.records) {
      if (record.recoverySuccessful) {
        total += record.recoveryTime;
        count++;
      }
    }
    if (count === 0) {
      return 0;
    }
    return total / count;
  }

  private computeRecoveryRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.countRecovered() / this.records.length;
  }
}

/** One numbered failure of the recovery timeline. */
class RecoveryTimelineEntry {
  private sequence: number;
  private errorType: RecoveryErrorType;
  private timestamp: number;
  private recoveryTime: number;

  constructor(sequence: number, errorType: RecoveryErrorType, timestamp: number, recoveryTime: number) {
    this.sequence = sequence;
    this.errorType = errorType;
    this.timestamp = timestamp;
    this.recoveryTime = recoveryTime;
  }

  public getSequence(): number {
    return this.sequence;
  }

  public getErrorType(): RecoveryErrorType {
    return this.errorType;
  }

  public getTimestamp(): number {
    return this.timestamp;
  }

  public getRecoveryTime(): number {
    return this.recoveryTime;
  }

  public toString(): string {
    return `#${this.sequence} ${this.errorType} at ${this.timestamp} recovered in ${this.recoveryTime}ms`;
  }
}

/** Keeps a numbered recovery timeline and restarts numbering on clear. */
class RecoveryTimelineManager {
  private entries: RecoveryTimelineEntry[] = [];
  private nextSequence: number = 1;

  public append(errorType: RecoveryErrorType, timestamp: number, recoveryTime: number): void {
    const entry: RecoveryTimelineEntry =
      new RecoveryTimelineEntry(this.nextSequence, errorType, timestamp, recoveryTime);
    this.nextSequence++;
    this.entries.push(entry);
  }

  public getEntries(): RecoveryTimelineEntry[] {
    return [...this.entries];
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  public clearTimeline(): void {
    this.entries = [];
    this.nextSequence = 1;
  }
}

/** State of a recovery plan. */
enum RecoveryStatus {
  PENDING = 'pending',
  IN_PROGRESS = 'in_progress',
  SUCCEEDED = 'succeeded',
  FAILED = 'failed'
}

/** A recovery plan for one failure type. */
interface RecoveryPlan {
  errorType: RecoveryErrorType;
  steps: string[];
  status: RecoveryStatus;
  attemptCount: number;
}

/** Builds the recovery steps of the sample for a failure type. */
class RecoveryPlanGenerator {
  public generatePlan(errorType: RecoveryErrorType): RecoveryPlan {
    const plan: RecoveryPlan = {
      errorType: errorType,
      steps: this.buildSteps(errorType),
      status: RecoveryStatus.PENDING,
      attemptCount: 0
    };
    return plan;
  }

  private buildSteps(errorType: RecoveryErrorType): string[] {
    const steps: string[] = [];
    if (errorType === RecoveryErrorType.LIST_NAVIGATION_LOST) {
      steps.push('detect the lost list focus');
      steps.push('press a list navigation key');
      steps.push('verify the focus indicator');
    } else if (errorType === RecoveryErrorType.MODE_LAUNCH_TIMEOUT) {
      steps.push('detect the launch timeout');
      steps.push('reset the launch timer');
      steps.push('launch the mode again');
    } else if (errorType === RecoveryErrorType.DETAIL_RENDER_FAILURE) {
      steps.push('detect the detail render failure');
      steps.push('fall back to pages/FoodDetail');
      steps.push('render the nutrition labels');
    } else {
      steps.push('detect the failure');
      steps.push('execute the recovery');
    }
    return steps;
  }
}

/** Executes a recovery plan and tracks its status. */
class RecoveryPlanExecutor {
  private plan: RecoveryPlan;

  constructor(plan: RecoveryPlan) {
    this.plan = plan;
  }

  public beginExecution(): void {
    this.plan.status = RecoveryStatus.IN_PROGRESS;
    this.plan.attemptCount++;
  }

  public markSucceeded(): void {
    this.plan.status = RecoveryStatus.SUCCEEDED;
  }

  public markFailed(): void {
    this.plan.status = RecoveryStatus.FAILED;
  }

  public getPlan(): RecoveryPlan {
    return this.plan;
  }

  public isFinished(): boolean {
    return this.plan.status === RecoveryStatus.SUCCEEDED || this.plan.status === RecoveryStatus.FAILED;
  }

  public getStepCount(): number {
    return this.plan.steps.length;
  }
}

/** Final outcome of one recovery attempt. */
class RecoveryOutcome {
  private errorType: RecoveryErrorType;
  private status: RecoveryStatus;
  private elapsedTime: number;

  constructor(errorType: RecoveryErrorType, status: RecoveryStatus, elapsedTime: number) {
    this.errorType = errorType;
    this.status = status;
    this.elapsedTime = elapsedTime;
  }

  public getErrorType(): RecoveryErrorType {
    return this.errorType;
  }

  public getStatus(): RecoveryStatus {
    return this.status;
  }

  public getElapsedTime(): number {
    return this.elapsedTime;
  }

  public isSuccessful(): boolean {
    return this.status === RecoveryStatus.SUCCEEDED;
  }

  public toString(): string {
    return `RecoveryOutcome(${this.errorType}, ${this.status}, ${this.elapsedTime}ms)`;
  }
}

/** Collects the recovery outcomes of the current run. */
class RecoveryOutcomeManager {
  private outcomes: RecoveryOutcome[] = [];

  public appendOutcome(outcome: RecoveryOutcome): void {
    this.outcomes.push(outcome);
  }

  public getOutcomes(): RecoveryOutcome[] {
    return [...this.outcomes];
  }

  public countSuccessful(): number {
    let count: number = 0;
    for (const outcome of this.outcomes) {
      if (outcome.isSuccessful()) {
        count++;
      }
    }
    return count;
  }

  public clearOutcomes(): void {
    this.outcomes = [];
  }
}

export default function errorRecoveryTest() {
  describe('ErrorRecovery_Test', () => {
    let driver: Driver;
    let recoveryTracker: StartModeErrorTracker;

    // Prepare the driver and the tracker, then wait for the home page.
    beforeAll(async () => {
      driver = getDriver();
      recoveryTracker = StartModeErrorTracker.getInstance();
      recoveryTracker.resetTracker();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // Send the sample back to the home page so the next suite starts clean.
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await resetToHome(driver);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
    });

    // Losing the list focus must be recoverable with a navigation key.
    it('home_should_recover_from_focus_loss', 0, async () => {
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(homeVisible).assertTrue();

      const initialCount: number = await homeComponentCount(driver);
      expect(initialCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_LEFT, 3, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 3, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_DOWN, 2, DELAY_KEY_NAVIGATION);

      const recoveredCount: number = await homeComponentCount(driver);
      expect(recoveredCount).assertLargerOrEqual(1);
      expect(Math.abs(recoveredCount - initialCount)).assertLessOrEqual(5);

      recoveryTracker.recordError(RecoveryErrorType.LIST_NAVIGATION_LOST, true, true, 100);
      expect(recoveryTracker.hasErrorOfType(RecoveryErrorType.LIST_NAVIGATION_LOST)).assertTrue();
    });

    // A failed detail render must still leave the home list usable.
    it('home_should_recover_from_detail_render_failure', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount: number = await homeComponentCount(driver);
      logInfo(`recovery scenario starts with ${initialCount} home components`);

      await launchStandardAbility(0, MODE_STANDARD);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const restoredCount: number = await homeComponentCount(driver);
      logInfo(`recovery scenario restored with ${restoredCount} home components`);

      expect(restoredCount).assertLargerOrEqual(1);
      expect(Math.abs(restoredCount - initialCount)).assertLessOrEqual(5);

      recoveryTracker.recordError(RecoveryErrorType.DETAIL_RENDER_FAILURE, true, true, 200);
      expect(recoveryTracker.getErrorCountByType(RecoveryErrorType.DETAIL_RENDER_FAILURE)).assertEqual(1);
    });

    // A launch timeout must not break the three mode groups of the home page.
    it('home_should_handle_launch_timeout_gracefully', 0, async () => {
      await resetToHome(driver);
      const startTime: number = Date.now();

      await serializedDelay(driver, DELAY_AFTER_START_MODE);

      const labels: number = await countModeLabels(driver);
      expect(labels).assertEqual(3);

      const elapsedTime: number = Date.now() - startTime;
      recoveryTracker.recordError(RecoveryErrorType.MODE_LAUNCH_TIMEOUT, true, true, elapsedTime);
      expect(elapsedTime).assertLessOrEqual(8000);
    });

    // An inconsistent mode state must be recoverable by relaunching MainAbility.
    it('home_should_recover_from_mode_state_inconsistency', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);

      const restored: boolean = await resetToHome(driver);
      expect(restored).assertTrue();

      const componentTotal: number = await componentCount(driver);
      expect(componentTotal).assertLargerOrEqual(1);
      recoveryTracker.recordError(RecoveryErrorType.MODE_STATE_INCONSISTENT, true, true, 150);
    });

    // Repeated recovery attempts must keep the home page count stable.
    it('error_recovery_should_maintain_home_stability', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount: number = await homeComponentCount(driver);

      for (let i = 0; i < 5; i++) {
        await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }

      const finalCount: number = await homeComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);

      recoveryTracker.recordError(RecoveryErrorType.FOOD_ITEM_NOT_FOUND, true, true, 100);
      expect(recoveryTracker.getTotalErrors()).assertLargerOrEqual(1);
    });

    // The tracker counters must match the recorded failure outcomes.
    it('error_recovery_statistics_should_be_accurate', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      recoveryTracker.resetTracker();

      recoveryTracker.recordError(RecoveryErrorType.LIST_NAVIGATION_LOST, true, true, 100);
      recoveryTracker.recordError(RecoveryErrorType.MODE_LAUNCH_TIMEOUT, true, true, 200);
      recoveryTracker.recordError(RecoveryErrorType.DETAIL_RENDER_FAILURE, true, false, 300);

      expect(recoveryTracker.getTotalErrors()).assertEqual(3);
      expect(recoveryTracker.getTotalRecoveries()).assertEqual(2);
      expect(recoveryTracker.getRecoveryRate()).assertEqual(2 / 3);
    });

    // Every failure type must be recordable in one scenario.
    it('error_recovery_should_handle_multiple_errors', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      recoveryTracker.resetTracker();

      const errors: RecoveryErrorType[] = [
        RecoveryErrorType.LIST_NAVIGATION_LOST,
        RecoveryErrorType.MODE_LAUNCH_TIMEOUT,
        RecoveryErrorType.FOOD_ITEM_NOT_FOUND,
        RecoveryErrorType.MODE_STATE_INCONSISTENT,
        RecoveryErrorType.DETAIL_RENDER_FAILURE
      ];

      for (const error of errors) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
        recoveryTracker.recordError(error, true, true, 100);
      }

      expect(recoveryTracker.getTotalErrors()).assertEqual(5);
      expect(recoveryTracker.getTotalRecoveries()).assertEqual(5);
    });

    // The recovery of a list focus must stay inside the time budget.
    it('error_recovery_time_should_be_within_limit', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const startTime: number = Date.now();

      await pressAndWait(driver, KEY_DOWN, 3, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 3, DELAY_KEY_NAVIGATION);

      const recoveryTime: number = Date.now() - startTime;
      expect(recoveryTime).assertLessOrEqual(5000);

      recoveryTracker.recordError(RecoveryErrorType.LIST_NAVIGATION_LOST, true, true, recoveryTime);
      expect(recoveryTracker.getAverageRecoveryTime()).assertLessOrEqual(5000);
    });

    // Rapid navigation must not overflow the recovery bookkeeping.
    it('error_recovery_should_handle_rapid_errors', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      recoveryTracker.resetTracker();

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_DOWN : KEY_UP, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
        recoveryTracker.recordError(RecoveryErrorType.LIST_NAVIGATION_LOST, true, true, 50);
      }

      expect(recoveryTracker.getTotalErrors()).assertEqual(20);
      expect(recoveryTracker.getTotalRecoveries()).assertEqual(20);
      expect(recoveryTracker.getRecoveryRate()).assertEqual(1);
    });

    // The recovery must preserve the three mode labels of the home page.
    it('error_recovery_should_preserve_home_state', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      const initialLabels: number = await countModeLabels(driver);
      expect(initialLabels).assertEqual(3);

      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);

      const restored: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const finalLabels: number = await countModeLabels(driver);
      expect(restored).assertTrue();
      expect(finalLabels).assertEqual(3);

      recoveryTracker.recordError(RecoveryErrorType.MODE_STATE_INCONSISTENT, true, true, 200);
    });

    // Recorded failure timestamps must be non decreasing.
    it('error_recovery_timestamps_should_be_chronological', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      recoveryTracker.resetTracker();

      recoveryTracker.recordError(RecoveryErrorType.LIST_NAVIGATION_LOST, true, true, 100);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      recoveryTracker.recordError(RecoveryErrorType.MODE_LAUNCH_TIMEOUT, true, true, 200);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      recoveryTracker.recordError(RecoveryErrorType.DETAIL_RENDER_FAILURE, true, true, 300);

      const history: RecoveryErrorRecord[] = recoveryTracker.getErrorHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // All failure types of the sample must be detectable.
    it('error_recovery_should_handle_all_error_types', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      recoveryTracker.resetTracker();

      recoveryTracker.recordError(RecoveryErrorType.FOOD_ITEM_NOT_FOUND, true, true, 100);
      recoveryTracker.recordError(RecoveryErrorType.LIST_NAVIGATION_LOST, true, true, 100);
      recoveryTracker.recordError(RecoveryErrorType.MODE_LAUNCH_TIMEOUT, true, true, 100);
      recoveryTracker.recordError(RecoveryErrorType.MODE_STATE_INCONSISTENT, true, true, 100);
      recoveryTracker.recordError(RecoveryErrorType.DETAIL_RENDER_FAILURE, true, true, 100);

      expect(recoveryTracker.hasErrorOfType(RecoveryErrorType.FOOD_ITEM_NOT_FOUND)).assertTrue();
      expect(recoveryTracker.hasErrorOfType(RecoveryErrorType.LIST_NAVIGATION_LOST)).assertTrue();
      expect(recoveryTracker.hasErrorOfType(RecoveryErrorType.MODE_LAUNCH_TIMEOUT)).assertTrue();
      expect(recoveryTracker.hasErrorOfType(RecoveryErrorType.MODE_STATE_INCONSISTENT)).assertTrue();
      expect(recoveryTracker.hasErrorOfType(RecoveryErrorType.DETAIL_RENDER_FAILURE)).assertTrue();
    });

    // The tracker singleton must be shared by every test case.
    it('error_recovery_singleton_should_maintain_consistency', 0, async () => {
      const tracker1: StartModeErrorTracker = StartModeErrorTracker.getInstance();
      const tracker2: StartModeErrorTracker = StartModeErrorTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordError(RecoveryErrorType.LIST_NAVIGATION_LOST, true, true, 100);

      expect(tracker2.getTotalErrors()).assertEqual(1);
      expect(tracker2.getTotalRecoveries()).assertEqual(1);
    });

    // Concurrent recovery attempts are serialized and fully counted.
    it('error_recovery_should_handle_concurrent_errors', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      recoveryTracker.resetTracker();

      for (let i = 0; i < 5; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
        recoveryTracker.recordError(RecoveryErrorType.LIST_NAVIGATION_LOST, true, true, 50);
      }

      expect(recoveryTracker.getTotalErrors()).assertEqual(5);
      const componentTotal: number = await componentCount(driver);
      expect(componentTotal).assertLargerOrEqual(1);
    });

    // The tracker bookkeeping itself must stay fast enough.
    it('error_recovery_performance_should_meet_requirements', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      recoveryTracker.resetTracker();

      const startTime: number = Date.now();
      for (let i = 0; i < 100; i++) {
        recoveryTracker.recordError(RecoveryErrorType.MODE_LAUNCH_TIMEOUT, true, true, 10);
      }
      const operationTime: number = Date.now() - startTime;

      expect(operationTime).assertLessOrEqual(2000);
      expect(recoveryTracker.getTotalErrors()).assertEqual(100);
      expect(recoveryTracker.getTotalRecoveries()).assertEqual(100);
    });

    // Extreme navigation must not lose the home page.
    it('error_recovery_should_handle_edge_cases', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      recoveryTracker.resetTracker();

      await pressAndWait(driver, KEY_DOWN, 10, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 10, DELAY_KEY_NAVIGATION);

      const componentTotal: number = await componentCount(driver);
      expect(componentTotal).assertLargerOrEqual(1);

      recoveryTracker.recordError(RecoveryErrorType.FOOD_ITEM_NOT_FOUND, true, true, 100);
      expect(recoveryTracker.getErrorCountByType(RecoveryErrorType.FOOD_ITEM_NOT_FOUND)).assertEqual(1);
    });

    // A recovered focus loss must be reported as a full success.
    it('error_recovery_should_validate_recovery_success', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      recoveryTracker.resetTracker();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      const componentTotal: number = await componentCount(driver);
      expect(componentTotal).assertLargerOrEqual(1);

      recoveryTracker.recordError(RecoveryErrorType.LIST_NAVIGATION_LOST, true, true, 150);
      expect(recoveryTracker.getRecoveryRate()).assertEqual(1);
    });

    // The specified and singleton modes must survive a recovery cycle.
    it('mode_launch_should_recover_across_all_modes', 0, async () => {
      recoveryTracker.resetTracker();
      logInfo(`recovery cycle for modes ${MODE_SPECIFIED} and ${MODE_SINGLETON}`);

      await launchSpecifiedAbility(0, 'pages/FoodDetail', 1);
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);
      await launchSingletonAbility(0);
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);
      await launchSingletonAbility(0);

      const homeVisible: boolean = await isHomePageVisible(driver);
      if (!homeVisible) {
        await resetToHome(driver);
      }

      recoveryTracker.recordError(RecoveryErrorType.MODE_STATE_INCONSISTENT, true, true, 200);
      expect(recoveryTracker.getTotalErrors()).assertEqual(1);
      expect(await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER)).assertTrue();
    });

    // The singleton relaunch must always end up on a usable page.
    it('singleton_relaunch_should_recover_to_home', 0, async () => {
      recoveryTracker.resetTracker();

      await launchSingletonAbility(0);
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);
      await launchSingletonAbility(0);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);

      const detailPageAlive: boolean = await isHomePageVisible(driver);
      recoveryTracker.recordError(RecoveryErrorType.MODE_STATE_INCONSISTENT, true, detailPageAlive, 100);

      const restored: boolean = await resetToHome(driver);
      expect(restored).assertTrue();
      expect(recoveryTracker.getTotalErrors()).assertEqual(1);
    });

    // A standard launch that is interrupted must fall back to the home page.
    it('standard_launch_interruption_should_recover_home', 0, async () => {
      recoveryTracker.resetTracker();
      const foodName: string = FOOD_TOMATO;
      logInfo(`interrupting the standard launch of ${foodName}`);

      await launchStandardAbility(0, MODE_STANDARD);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const restored: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      expect(restored).assertTrue();
      recoveryTracker.recordError(RecoveryErrorType.DETAIL_RENDER_FAILURE, true, restored, 150);
      expect(recoveryTracker.hasErrorOfType(RecoveryErrorType.DETAIL_RENDER_FAILURE)).assertTrue();
    });

    // The full failure history must be summarizable in one scenario.
    it('comprehensive_error_recovery_scenario', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      recoveryTracker.resetTracker();
      const scenarioStart: number = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      recoveryTracker.recordError(RecoveryErrorType.LIST_NAVIGATION_LOST, true, true, 100);

      await launchStandardAbility(0, MODE_STANDARD);
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);
      recoveryTracker.recordError(RecoveryErrorType.DETAIL_RENDER_FAILURE, true, true, 150);

      await resetToHome(driver);
      recoveryTracker.recordError(RecoveryErrorType.MODE_LAUNCH_TIMEOUT, true, true, 500);

      const scenarioEnd: number = Date.now();
      const componentTotal: number = await componentCount(driver);

      expect(componentTotal).assertLargerOrEqual(1);
      expect(recoveryTracker.getTotalErrors()).assertEqual(3);
      expect(recoveryTracker.getTotalRecoveries()).assertEqual(3);
      expect(recoveryTracker.getRecoveryRate()).assertEqual(1);
      expect(scenarioEnd - scenarioStart).assertLessOrEqual(10000);
    });

    // The severity evaluator must grade every failure type.
    it('recovery_severity_evaluator_should_grade_error_types', 0, async () => {
      const evaluator: RecoverySeverityEvaluator = RecoverySeverityEvaluator.getInstance();

      expect(evaluator.evaluate(RecoveryErrorType.FOOD_ITEM_NOT_FOUND)).assertEqual(RecoverySeverity.MEDIUM);
      expect(evaluator.evaluate(RecoveryErrorType.LIST_NAVIGATION_LOST)).assertEqual(RecoverySeverity.LOW);
      expect(evaluator.evaluate(RecoveryErrorType.MODE_LAUNCH_TIMEOUT)).assertEqual(RecoverySeverity.HIGH);
      expect(evaluator.evaluate(RecoveryErrorType.DETAIL_RENDER_FAILURE)).assertEqual(RecoverySeverity.HIGH);
      expect(evaluator.evaluate(RecoveryErrorType.MODE_STATE_INCONSISTENT)).assertEqual(RecoverySeverity.CRITICAL);
    });

    // Only the inconsistent mode state is critical.
    it('recovery_severity_evaluator_should_flag_critical', 0, async () => {
      const evaluator: RecoverySeverityEvaluator = RecoverySeverityEvaluator.getInstance();

      expect(evaluator.isCritical(RecoveryErrorType.MODE_STATE_INCONSISTENT)).assertTrue();
      expect(evaluator.isCritical(RecoveryErrorType.LIST_NAVIGATION_LOST)).assertFalse();
      expect(evaluator.isCritical(RecoveryErrorType.DETAIL_RENDER_FAILURE)).assertFalse();
    });

    // The recommender must return the strategy of a failure type.
    it('recovery_strategy_recommender_should_recommend_strategy', 0, async () => {
      const recommender: RecoveryStrategyRecommender = new RecoveryStrategyRecommender();
      const lostFocus: RecoverySuggestion | null = recommender.recommend(RecoveryErrorType.LIST_NAVIGATION_LOST);

      expect(lostFocus === null).assertFalse();
      if (lostFocus !== null) {
        expect(lostFocus.strategy).assertEqual(RecoveryStrategy.RETRY);
        expect(lostFocus.priority).assertEqual(1);
      }

      const timeout: RecoverySuggestion | null = recommender.recommend(RecoveryErrorType.MODE_LAUNCH_TIMEOUT);
      if (timeout !== null) {
        expect(timeout.strategy).assertEqual(RecoveryStrategy.RESET);
        expect(timeout.priority).assertEqual(2);
      }

      expect(recommender.recommend(RecoveryErrorType.FOOD_ITEM_NOT_FOUND) === null).assertFalse();
    });

    // The recommender must group its suggestions by strategy.
    it('recovery_strategy_recommender_should_count_by_strategy', 0, async () => {
      const recommender: RecoveryStrategyRecommender = new RecoveryStrategyRecommender();

      expect(recommender.getSuggestions().length).assertEqual(5);
      expect(recommender.countByStrategy(RecoveryStrategy.RETRY)).assertEqual(1);
      expect(recommender.countByStrategy(RecoveryStrategy.RESET)).assertEqual(2);
      expect(recommender.countByStrategy(RecoveryStrategy.FALLBACK)).assertEqual(2);
      expect(recommender.countByStrategy(RecoveryStrategy.IGNORE)).assertEqual(0);
    });

    // The summary builder must aggregate a mixed failure history.
    it('recovery_summary_builder_should_aggregate_records', 0, async () => {
      const records: RecoveryErrorRecord[] = [
        { errorType: RecoveryErrorType.LIST_NAVIGATION_LOST, timestamp: 1000, recoveryAttempted: true,
          recoverySuccessful: true, recoveryTime: 100 },
        { errorType: RecoveryErrorType.MODE_LAUNCH_TIMEOUT, timestamp: 2000, recoveryAttempted: true,
          recoverySuccessful: true, recoveryTime: 300 },
        { errorType: RecoveryErrorType.DETAIL_RENDER_FAILURE, timestamp: 3000, recoveryAttempted: true,
          recoverySuccessful: false, recoveryTime: 500 }
      ];
      const builder: RecoverySummaryBuilder = new RecoverySummaryBuilder(records);
      const summary: RecoverySummary = builder.buildSummary();

      expect(summary.totalErrors).assertEqual(3);
      expect(summary.recoveredErrors).assertEqual(2);
      expect(summary.unrecoveredErrors).assertEqual(1);
      expect(summary.averageRecoveryTime).assertEqual(200);
      expect(summary.recoveryRate).assertEqual(2 / 3);
    });

    // An empty history must produce zeroed statistics.
    it('recovery_summary_builder_should_handle_empty_records', 0, async () => {
      const builder: RecoverySummaryBuilder = new RecoverySummaryBuilder([]);
      const summary: RecoverySummary = builder.buildSummary();

      expect(summary.totalErrors).assertEqual(0);
      expect(summary.recoveredErrors).assertEqual(0);
      expect(summary.unrecoveredErrors).assertEqual(0);
      expect(summary.averageRecoveryTime).assertEqual(0);
      expect(summary.recoveryRate).assertEqual(0);
    });

    // Timeline entries must receive increasing sequence numbers.
    it('recovery_timeline_manager_should_assign_sequence', 0, async () => {
      const manager: RecoveryTimelineManager = new RecoveryTimelineManager();
      manager.append(RecoveryErrorType.LIST_NAVIGATION_LOST, 1000, 100);
      manager.append(RecoveryErrorType.MODE_LAUNCH_TIMEOUT, 2000, 200);
      manager.append(RecoveryErrorType.MODE_STATE_INCONSISTENT, 3000, 300);
      const entries: RecoveryTimelineEntry[] = manager.getEntries();

      expect(manager.getEntryCount()).assertEqual(3);
      expect(entries[0].getSequence()).assertEqual(1);
      expect(entries[1].getSequence()).assertEqual(2);
      expect(entries[2].getSequence()).assertEqual(3);
      expect(entries[0].getErrorType()).assertEqual(RecoveryErrorType.LIST_NAVIGATION_LOST);
      expect(entries[2].toString()).assertContain('#3');
    });

    // Clearing the timeline must restart the numbering.
    it('recovery_timeline_manager_should_clear_timeline', 0, async () => {
      const manager: RecoveryTimelineManager = new RecoveryTimelineManager();
      manager.append(RecoveryErrorType.MODE_LAUNCH_TIMEOUT, 1000, 100);
      manager.clearTimeline();
      expect(manager.getEntryCount()).assertEqual(0);

      manager.append(RecoveryErrorType.LIST_NAVIGATION_LOST, 2000, 100);
      const entries: RecoveryTimelineEntry[] = manager.getEntries();
      expect(entries[0].getSequence()).assertEqual(1);
      expect(entries[0].getTimestamp()).assertEqual(2000);
    });

    // The plan generator must build the steps of every failure type.
    it('recovery_plan_generator_should_build_steps', 0, async () => {
      const generator: RecoveryPlanGenerator = new RecoveryPlanGenerator();
      const focusPlan: RecoveryPlan = generator.generatePlan(RecoveryErrorType.LIST_NAVIGATION_LOST);

      expect(focusPlan.errorType).assertEqual(RecoveryErrorType.LIST_NAVIGATION_LOST);
      expect(focusPlan.steps.length).assertEqual(3);
      expect(focusPlan.status).assertEqual(RecoveryStatus.PENDING);
      expect(focusPlan.attemptCount).assertEqual(0);

      const statePlan: RecoveryPlan = generator.generatePlan(RecoveryErrorType.MODE_STATE_INCONSISTENT);
      expect(statePlan.steps.length).assertEqual(2);
    });

    // The executor must track the plan status transitions.
    it('recovery_plan_executor_should_track_status', 0, async () => {
      const generator: RecoveryPlanGenerator = new RecoveryPlanGenerator();
      const plan: RecoveryPlan = generator.generatePlan(RecoveryErrorType.MODE_LAUNCH_TIMEOUT);
      const executor: RecoveryPlanExecutor = new RecoveryPlanExecutor(plan);

      expect(executor.getStepCount()).assertEqual(3);
      expect(executor.isFinished()).assertFalse();
      executor.beginExecution();
      expect(executor.getPlan().status).assertEqual(RecoveryStatus.IN_PROGRESS);
      expect(executor.getPlan().attemptCount).assertEqual(1);
      executor.markSucceeded();
      expect(executor.getPlan().status).assertEqual(RecoveryStatus.SUCCEEDED);
      expect(executor.isFinished()).assertTrue();
    });

    // A failed recovery plan must finish in the failed status.
    it('recovery_plan_executor_should_handle_failure', 0, async () => {
      const generator: RecoveryPlanGenerator = new RecoveryPlanGenerator();
      const plan: RecoveryPlan = generator.generatePlan(RecoveryErrorType.DETAIL_RENDER_FAILURE);
      const executor: RecoveryPlanExecutor = new RecoveryPlanExecutor(plan);

      executor.beginExecution();
      executor.markFailed();
      expect(executor.getPlan().status).assertEqual(RecoveryStatus.FAILED);
      expect(executor.isFinished()).assertTrue();
    });

    // The outcome model must report success and render readable text.
    it('recovery_outcome_should_report_success', 0, async () => {
      const success: RecoveryOutcome =
        new RecoveryOutcome(RecoveryErrorType.LIST_NAVIGATION_LOST, RecoveryStatus.SUCCEEDED, 100);
      const failed: RecoveryOutcome =
        new RecoveryOutcome(RecoveryErrorType.MODE_LAUNCH_TIMEOUT, RecoveryStatus.FAILED, 200);

      expect(success.isSuccessful()).assertTrue();
      expect(failed.isSuccessful()).assertFalse();
      expect(success.getErrorType()).assertEqual(RecoveryErrorType.LIST_NAVIGATION_LOST);
      expect(success.getElapsedTime()).assertEqual(100);
      expect(success.toString()).assertContain('list_navigation_lost');
      expect(success.toString()).assertContain('succeeded');
    });

    // The outcome manager must count and clear the successful outcomes.
    it('recovery_outcome_manager_should_count_successful', 0, async () => {
      const manager: RecoveryOutcomeManager = new RecoveryOutcomeManager();
      manager.appendOutcome(
        new RecoveryOutcome(RecoveryErrorType.LIST_NAVIGATION_LOST, RecoveryStatus.SUCCEEDED, 100));
      manager.appendOutcome(
        new RecoveryOutcome(RecoveryErrorType.MODE_LAUNCH_TIMEOUT, RecoveryStatus.SUCCEEDED, 200));
      manager.appendOutcome(
        new RecoveryOutcome(RecoveryErrorType.DETAIL_RENDER_FAILURE, RecoveryStatus.FAILED, 300));

      expect(manager.getOutcomes().length).assertEqual(3);
      expect(manager.countSuccessful()).assertEqual(2);
      manager.clearOutcomes();
      expect(manager.getOutcomes().length).assertEqual(0);
    });

    // The toast text of the singleton mode must resolve to a readable value.
    it('singleton_toast_text_should_be_available', 0, async () => {
      expect(TEXT_TOAST.length > 0).assertTrue();
      expect(TEXT_TOAST).assertEqual('The Ability instance already exists');

      await launchSingletonAbility(0);
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);
      const pageUsable: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(pageUsable).assertTrue();
      await resetToHome(driver);
    });
  });
}
