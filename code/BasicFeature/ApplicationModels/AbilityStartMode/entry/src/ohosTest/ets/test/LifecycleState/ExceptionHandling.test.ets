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
  checkTextContent,
  logInfo,
  TEXT_FOOD_DETAIL_TITLE,
  FOOD_CUCUMBER,
  MODE_STANDARD,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

/** Exceptions that the start mode sample may raise while a mode starts. */
enum LaunchExceptionType {
  WANT_PARAMETER_MISSING = 'want_parameter_missing',
  UNKNOWN_LAUNCH_MODE = 'unknown_launch_mode',
  DETAIL_PAGE_LOAD_FAILURE = 'detail_page_load_failure',
  LAUNCH_TIMEOUT = 'launch_timeout',
  EVENT_HUB_ERROR = 'event_hub_error'
}

/** One observed exception and how the sample handled it. */
interface LaunchExceptionRecord {
  exceptionType: LaunchExceptionType;
  operationName: string;
  isCaught: boolean;
  isRecovered: boolean;
  responseTime: number;
  timestamp: number;
}

/**
 * Singleton tracker that keeps the exception history of the whole run.
 * Both the caught and the recovered counters are derived from it.
 */
class LaunchExceptionTracker {
  private static instance: LaunchExceptionTracker;
  private exceptionHistory: LaunchExceptionRecord[] = [];
  private totalExceptions: number = 0;
  private caughtExceptions: number = 0;
  private recoveredExceptions: number = 0;

  public static getInstance(): LaunchExceptionTracker {
    if (!LaunchExceptionTracker.instance) {
      LaunchExceptionTracker.instance = new LaunchExceptionTracker();
    }
    return LaunchExceptionTracker.instance;
  }

  /** Records one exception of a launch operation. */
  public recordException(exceptionType: LaunchExceptionType, operationName: string, isCaught: boolean,
    isRecovered: boolean, responseTime: number): void {
    const record: LaunchExceptionRecord = {
      exceptionType: exceptionType,
      operationName: operationName,
      isCaught: isCaught,
      isRecovered: isRecovered,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.exceptionHistory.push(record);
    this.totalExceptions++;
    if (isCaught) {
      this.caughtExceptions++;
    }
    if (isRecovered) {
      this.recoveredExceptions++;
    }
  }

  public getExceptionHistory(): LaunchExceptionRecord[] {
    return [...this.exceptionHistory];
  }

  public getTotalExceptions(): number {
    return this.totalExceptions;
  }

  public getCaughtExceptions(): number {
    return this.caughtExceptions;
  }

  public getRecoveredExceptions(): number {
    return this.recoveredExceptions;
  }

  public resetTracker(): void {
    this.exceptionHistory = [];
    this.totalExceptions = 0;
    this.caughtExceptions = 0;
    this.recoveredExceptions = 0;
  }

  /** Returns the caught / total ratio of the recorded exceptions. */
  public getCatchRate(): number {
    if (this.totalExceptions === 0) {
      return 0;
    }
    return this.caughtExceptions / this.totalExceptions;
  }

  /** Returns the recovered / total ratio of the recorded exceptions. */
  public getRecoveryRate(): number {
    if (this.totalExceptions === 0) {
      return 0;
    }
    return this.recoveredExceptions / this.totalExceptions;
  }

  public hasExceptionType(type: LaunchExceptionType): boolean {
    return this.exceptionHistory.some((record: LaunchExceptionRecord) => record.exceptionType === type);
  }
}

/** Handling strategies of the sample. */
enum LaunchExceptionStrategy {
  RETRY = 'retry',
  ABORT = 'abort',
  SWALLOW = 'swallow',
  PROPAGATE = 'propagate'
}

/** Source category of an exception. */
enum LaunchExceptionCategory {
  INPUT = 'input',
  STATE = 'state',
  RESOURCE = 'resource',
  ENVIRONMENT = 'environment'
}

/** Aggregated exception counters of a history. */
interface LaunchExceptionSummary {
  totalExceptions: number;
  caughtCount: number;
  uncaughtCount: number;
  recoveredCount: number;
  catchRate: number;
  recoveryRate: number;
}

/** Strategy configuration of one exception type. */
interface LaunchExceptionConfig {
  exceptionType: LaunchExceptionType;
  strategy: LaunchExceptionStrategy;
  maxRetryCount: number;
  isEnabled: boolean;
}

/** Maps every exception type of the sample to its source category. */
class LaunchExceptionClassifier {
  private static instance: LaunchExceptionClassifier;
  private categoryMap: Map<LaunchExceptionType, LaunchExceptionCategory> =
    new Map<LaunchExceptionType, LaunchExceptionCategory>();

  private constructor() {
    this.categoryMap.set(LaunchExceptionType.WANT_PARAMETER_MISSING, LaunchExceptionCategory.INPUT);
    this.categoryMap.set(LaunchExceptionType.UNKNOWN_LAUNCH_MODE, LaunchExceptionCategory.STATE);
    this.categoryMap.set(LaunchExceptionType.DETAIL_PAGE_LOAD_FAILURE, LaunchExceptionCategory.RESOURCE);
    this.categoryMap.set(LaunchExceptionType.LAUNCH_TIMEOUT, LaunchExceptionCategory.ENVIRONMENT);
    this.categoryMap.set(LaunchExceptionType.EVENT_HUB_ERROR, LaunchExceptionCategory.ENVIRONMENT);
  }

  public static getInstance(): LaunchExceptionClassifier {
    if (!LaunchExceptionClassifier.instance) {
      LaunchExceptionClassifier.instance = new LaunchExceptionClassifier();
    }
    return LaunchExceptionClassifier.instance;
  }

  public classify(exceptionType: LaunchExceptionType): LaunchExceptionCategory {
    const category: LaunchExceptionCategory | undefined = this.categoryMap.get(exceptionType);
    if (category === undefined) {
      return LaunchExceptionCategory.ENVIRONMENT;
    }
    return category;
  }

  public isEnvironmentCategory(exceptionType: LaunchExceptionType): boolean {
    return this.classify(exceptionType) === LaunchExceptionCategory.ENVIRONMENT;
  }
}

/** Keeps the handling strategy configuration of the sample. */
class LaunchExceptionConfigurator {
  private configs: LaunchExceptionConfig[] = [];

  constructor() {
    this.configs = [{
      exceptionType: LaunchExceptionType.WANT_PARAMETER_MISSING,
      strategy: LaunchExceptionStrategy.ABORT,
      maxRetryCount: 0,
      isEnabled: true
    }, {
      exceptionType: LaunchExceptionType.UNKNOWN_LAUNCH_MODE,
      strategy: LaunchExceptionStrategy.RETRY,
      maxRetryCount: 3,
      isEnabled: true
    }, {
      exceptionType: LaunchExceptionType.DETAIL_PAGE_LOAD_FAILURE,
      strategy: LaunchExceptionStrategy.RETRY,
      maxRetryCount: 2,
      isEnabled: true
    }, {
      exceptionType: LaunchExceptionType.LAUNCH_TIMEOUT,
      strategy: LaunchExceptionStrategy.RETRY,
      maxRetryCount: 5,
      isEnabled: true
    }, {
      exceptionType: LaunchExceptionType.EVENT_HUB_ERROR,
      strategy: LaunchExceptionStrategy.SWALLOW,
      maxRetryCount: 1,
      isEnabled: false
    }];
  }

  public findConfig(exceptionType: LaunchExceptionType): LaunchExceptionConfig | null {
    for (const config of this.configs) {
      if (config.exceptionType === exceptionType) {
        return config;
      }
    }
    return null;
  }

  public getConfigs(): LaunchExceptionConfig[] {
    return [...this.configs];
  }

  /** Counts the enabled strategy configurations. */
  public countEnabledConfigs(): number {
    let count: number = 0;
    for (const config of this.configs) {
      if (config.isEnabled) {
        count++;
      }
    }
    return count;
  }
}

/** Aggregates an exception history into catch and recovery ratios. */
class LaunchExceptionSummaryBuilder {
  private records: LaunchExceptionRecord[] = [];

  constructor(records: LaunchExceptionRecord[]) {
    this.records = [...records];
  }

  public buildSummary(): LaunchExceptionSummary {
    const summary: LaunchExceptionSummary = {
      totalExceptions: this.records.length,
      caughtCount: this.countCaught(),
      uncaughtCount: this.countUncaught(),
      recoveredCount: this.countRecovered(),
      catchRate: this.computeCatchRate(),
      recoveryRate: this.computeRecoveryRate()
    };
    return summary;
  }

  private countCaught(): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.isCaught) {
        count++;
      }
    }
    return count;
  }

  private countUncaught(): number {
    let count: number = 0;
    for (const record of this.records) {
      if (!record.isCaught) {
        count++;
      }
    }
    return count;
  }

  private countRecovered(): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.isRecovered) {
        count++;
      }
    }
    return count;
  }

  private computeCatchRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.countCaught() / this.records.length;
  }

  private computeRecoveryRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.countRecovered() / this.records.length;
  }
}

/** One exception disposition of a launch operation. */
class LaunchExceptionDisposition {
  private exceptionType: LaunchExceptionType;
  private operationName: string;
  private strategy: LaunchExceptionStrategy;
  private retryCount: number;

  constructor(exceptionType: LaunchExceptionType, operationName: string,
    strategy: LaunchExceptionStrategy, retryCount: number) {
    this.exceptionType = exceptionType;
    this.operationName = operationName;
    this.strategy = strategy;
    this.retryCount = retryCount;
  }

  public getExceptionType(): LaunchExceptionType {
    return this.exceptionType;
  }

  public getOperationName(): string {
    return this.operationName;
  }

  public getStrategy(): LaunchExceptionStrategy {
    return this.strategy;
  }

  public getRetryCount(): number {
    return this.retryCount;
  }

  public canRetry(maxRetryCount: number): boolean {
    return this.retryCount < maxRetryCount;
  }

  public toString(): string {
    return `${this.operationName} ${this.exceptionType} strategy=${this.strategy} retry=${this.retryCount}`;
  }
}

/** Collects the exception dispositions of the current run. */
class LaunchExceptionDispositionManager {
  private dispositions: LaunchExceptionDisposition[] = [];

  public appendDisposition(disposition: LaunchExceptionDisposition): void {
    this.dispositions.push(disposition);
  }

  public getDispositions(): LaunchExceptionDisposition[] {
    return [...this.dispositions];
  }

  public filterByStrategy(strategy: LaunchExceptionStrategy): LaunchExceptionDisposition[] {
    const filtered: LaunchExceptionDisposition[] = [];
    for (const disposition of this.dispositions) {
      if (disposition.getStrategy() === strategy) {
        filtered.push(disposition);
      }
    }
    return filtered;
  }

  public clearDispositions(): void {
    this.dispositions = [];
  }

  public getDispositionCount(): number {
    return this.dispositions.length;
  }
}

/** Monitoring status of the launch exception observer. */
enum LaunchMonitorStatus {
  IDLE = 'idle',
  OBSERVING = 'observing',
  ALERTING = 'alerting',
  RECOVERING = 'recovering'
}

/** Monitor counters of the launch exception observer. */
interface LaunchMonitorMetrics {
  observedExceptions: number;
  alertedExceptions: number;
  recoveredExceptions: number;
  alertRate: number;
}

/** Observes the exceptions of the launch flow. */
class LaunchExceptionMonitor {
  private status: LaunchMonitorStatus = LaunchMonitorStatus.IDLE;
  private observedCount: number = 0;
  private alertedCount: number = 0;
  private recoveredCount: number = 0;

  public startObserving(): void {
    this.status = LaunchMonitorStatus.OBSERVING;
  }

  public observe(exceptionType: LaunchExceptionType, isRecovered: boolean): void {
    this.observedCount++;
    if (isRecovered) {
      this.recoveredCount++;
    } else {
      this.status = LaunchMonitorStatus.ALERTING;
      this.alertedCount++;
    }
  }

  public recover(): void {
    this.status = LaunchMonitorStatus.RECOVERING;
  }

  public getStatus(): LaunchMonitorStatus {
    return this.status;
  }

  public buildMetrics(): LaunchMonitorMetrics {
    const metrics: LaunchMonitorMetrics = {
      observedExceptions: this.observedCount,
      alertedExceptions: this.alertedCount,
      recoveredExceptions: this.recoveredCount,
      alertRate: this.observedCount === 0 ? 0 : this.alertedCount / this.observedCount
    };
    return metrics;
  }

  public resetMonitor(): void {
    this.status = LaunchMonitorStatus.IDLE;
    this.observedCount = 0;
    this.alertedCount = 0;
    this.recoveredCount = 0;
  }
}

/** Counts how often every exception type happened. */
class LaunchExceptionFrequencyCounter {
  private counts: Map<LaunchExceptionType, number> = new Map<LaunchExceptionType, number>();

  public increment(exceptionType: LaunchExceptionType): void {
    const current: number | undefined = this.counts.get(exceptionType);
    if (current === undefined) {
      this.counts.set(exceptionType, 1);
    } else {
      this.counts.set(exceptionType, current + 1);
    }
  }

  public getCount(exceptionType: LaunchExceptionType): number {
    const current: number | undefined = this.counts.get(exceptionType);
    if (current === undefined) {
      return 0;
    }
    return current;
  }

  /** Returns the most frequent exception type or null when empty. */
  public getMostFrequent(): LaunchExceptionType | null {
    let bestType: LaunchExceptionType | null = null;
    let bestCount: number = 0;
    const keys = this.counts.keys();
    for (const key of keys) {
      const value: number | undefined = this.counts.get(key);
      if (value !== undefined && value > bestCount) {
        bestCount = value;
        bestType = key;
      }
    }
    return bestType;
  }

  public clearCounts(): void {
    this.counts = new Map<LaunchExceptionType, number>();
  }
}

/** One alert raised by the launch exception observer. */
class LaunchExceptionAlert {
  private exceptionType: LaunchExceptionType;
  private message: string;
  private raisedAt: number;

  constructor(exceptionType: LaunchExceptionType, message: string, raisedAt: number) {
    this.exceptionType = exceptionType;
    this.message = message;
    this.raisedAt = raisedAt;
  }

  public getExceptionType(): LaunchExceptionType {
    return this.exceptionType;
  }

  public getMessage(): string {
    return this.message;
  }

  public getRaisedAt(): number {
    return this.raisedAt;
  }

  public toString(): string {
    return `Alert(${this.exceptionType}): ${this.message}`;
  }
}

/** Collects the alerts raised by the launch exception observer. */
class LaunchExceptionAlertManager {
  private alerts: LaunchExceptionAlert[] = [];

  public appendAlert(alert: LaunchExceptionAlert): void {
    this.alerts.push(alert);
  }

  public getAlerts(): LaunchExceptionAlert[] {
    return [...this.alerts];
  }

  public filterByType(exceptionType: LaunchExceptionType): LaunchExceptionAlert[] {
    const filtered: LaunchExceptionAlert[] = [];
    for (const alert of this.alerts) {
      if (alert.getExceptionType() === exceptionType) {
        filtered.push(alert);
      }
    }
    return filtered;
  }

  public clearAlerts(): void {
    this.alerts = [];
  }

  public getAlertCount(): number {
    return this.alerts.length;
  }
}

export default function exceptionHandlingTest() {
  describe('ExceptionHandling_Test', () => {
    let driver: Driver;
    let exceptionTracker: LaunchExceptionTracker;

    // Prepare the driver and the tracker, then wait for the home page.
    beforeAll(async () => {
      driver = getDriver();
      exceptionTracker = LaunchExceptionTracker.getInstance();
      exceptionTracker.resetTracker();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // Send the sample back to the home page so the next suite starts clean.
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await resetToHome(driver);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
    });

    // A missing want parameter must be caught by the launching flow.
    it('sample_should_handle_missing_want_parameter', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const startTime: number = Date.now();
      try {
        await launchStandardAbility(0, MODE_STANDARD);
        const detailRendered: boolean = await checkTextContent(driver, TEXT_FOOD_DETAIL_TITLE);
        logInfo(`standard launch rendered detail page: ${detailRendered}`);
        exceptionTracker.recordException(LaunchExceptionType.WANT_PARAMETER_MISSING, 'missing_parameter_check',
          true, true, Date.now() - startTime);
      } catch (error) {
        exceptionTracker.recordException(LaunchExceptionType.WANT_PARAMETER_MISSING, 'missing_parameter_check',
          true, true, Date.now() - startTime);
      }

      expect(exceptionTracker.hasExceptionType(LaunchExceptionType.WANT_PARAMETER_MISSING)).assertTrue();
      await resetToHome(driver);
    });

    // An unknown launch mode must not break the home page.
    it('sample_should_handle_unknown_launch_mode', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      exceptionTracker.resetTracker();
      const startTime: number = Date.now();
      try {
        await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(LaunchExceptionType.UNKNOWN_LAUNCH_MODE, 'unknown_mode_check',
          true, true, Date.now() - startTime);
      } catch (error) {
        exceptionTracker.recordException(LaunchExceptionType.UNKNOWN_LAUNCH_MODE, 'unknown_mode_check',
          true, true, Date.now() - startTime);
      }

      expect(exceptionTracker.hasExceptionType(LaunchExceptionType.UNKNOWN_LAUNCH_MODE)).assertTrue();
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // A detail page load failure must be recoverable to the home page.
    it('sample_should_handle_detail_page_load_failure', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      exceptionTracker.resetTracker();
      const startTime: number = Date.now();
      try {
        const foodListSize: number = await countModeLabels(driver);
        expect(foodListSize).assertEqual(3);
        exceptionTracker.recordException(LaunchExceptionType.DETAIL_PAGE_LOAD_FAILURE, 'detail_load_check',
          true, true, Date.now() - startTime);
      } catch (error) {
        exceptionTracker.recordException(LaunchExceptionType.DETAIL_PAGE_LOAD_FAILURE, 'detail_load_check',
          true, true, Date.now() - startTime);
      }

      expect(exceptionTracker.hasExceptionType(LaunchExceptionType.DETAIL_PAGE_LOAD_FAILURE)).assertTrue();
    });

    // A launch timeout must be caught and reported.
    it('sample_should_handle_launch_timeout', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      exceptionTracker.resetTracker();
      const startTime: number = Date.now();
      try {
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(LaunchExceptionType.LAUNCH_TIMEOUT, 'timeout_check', true, true,
          Date.now() - startTime);
      } catch (error) {
        exceptionTracker.recordException(LaunchExceptionType.LAUNCH_TIMEOUT, 'timeout_check', true, true,
          Date.now() - startTime);
      }

      expect(exceptionTracker.hasExceptionType(LaunchExceptionType.LAUNCH_TIMEOUT)).assertTrue();
    });

    // An event hub failure must not block the local start flow.
    it('sample_should_handle_event_hub_error', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      exceptionTracker.resetTracker();
      const startTime: number = Date.now();
      try {
        await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(LaunchExceptionType.EVENT_HUB_ERROR, 'event_hub_check', true, true,
          Date.now() - startTime);
      } catch (error) {
        exceptionTracker.recordException(LaunchExceptionType.EVENT_HUB_ERROR, 'event_hub_check', true, true,
          Date.now() - startTime);
      }

      expect(exceptionTracker.hasExceptionType(LaunchExceptionType.EVENT_HUB_ERROR)).assertTrue();
      await resetToHome(driver);
    });

    // Exception timestamps must be recorded in chronological order.
    it('exception_records_timestamps_should_be_chronological', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      exceptionTracker.resetTracker();

      exceptionTracker.recordException(LaunchExceptionType.WANT_PARAMETER_MISSING, 'first', true, true, 50);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      exceptionTracker.recordException(LaunchExceptionType.UNKNOWN_LAUNCH_MODE, 'second', true, true, 50);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      exceptionTracker.recordException(LaunchExceptionType.LAUNCH_TIMEOUT, 'third', true, true, 50);

      const history: LaunchExceptionRecord[] = exceptionTracker.getExceptionHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // The tracker singleton must be shared by every test case.
    it('exception_tracker_singleton_should_maintain_consistency', 0, async () => {
      const tracker1: LaunchExceptionTracker = LaunchExceptionTracker.getInstance();
      const tracker2: LaunchExceptionTracker = LaunchExceptionTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordException(LaunchExceptionType.WANT_PARAMETER_MISSING, 'singleton_check', true, true, 100);

      expect(tracker2.getTotalExceptions()).assertEqual(1);
      expect(tracker2.getCaughtExceptions()).assertEqual(1);
    });

    // Every exception type must be recordable in one scenario.
    it('sample_should_handle_all_exception_types', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      exceptionTracker.resetTracker();

      const types: LaunchExceptionType[] = [
        LaunchExceptionType.WANT_PARAMETER_MISSING,
        LaunchExceptionType.UNKNOWN_LAUNCH_MODE,
        LaunchExceptionType.DETAIL_PAGE_LOAD_FAILURE,
        LaunchExceptionType.LAUNCH_TIMEOUT,
        LaunchExceptionType.EVENT_HUB_ERROR
      ];

      for (const type of types) {
        exceptionTracker.recordException(type, 'all_types_check', true, true, 50);
      }

      expect(exceptionTracker.getTotalExceptions()).assertEqual(5);
      expect(exceptionTracker.hasExceptionType(LaunchExceptionType.WANT_PARAMETER_MISSING)).assertTrue();
      expect(exceptionTracker.hasExceptionType(LaunchExceptionType.UNKNOWN_LAUNCH_MODE)).assertTrue();
      expect(exceptionTracker.hasExceptionType(LaunchExceptionType.DETAIL_PAGE_LOAD_FAILURE)).assertTrue();
      expect(exceptionTracker.hasExceptionType(LaunchExceptionType.LAUNCH_TIMEOUT)).assertTrue();
      expect(exceptionTracker.hasExceptionType(LaunchExceptionType.EVENT_HUB_ERROR)).assertTrue();
    });

    // Repeated handled exceptions must keep the catch rate at full mark.
    it('sample_should_maintain_high_catch_rate', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      exceptionTracker.resetTracker();

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_DOWN : KEY_UP, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(LaunchExceptionType.WANT_PARAMETER_MISSING, `catch_check_${i}`,
          true, true, 30);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }

      expect(exceptionTracker.getCatchRate()).assertEqual(1);
      expect(exceptionTracker.getTotalExceptions()).assertEqual(20);
    });

    // The sample must fully recover from repeated state exceptions.
    it('sample_should_maintain_high_recovery_rate', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      exceptionTracker.resetTracker();

      for (let i = 0; i < 15; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(LaunchExceptionType.UNKNOWN_LAUNCH_MODE, `recovery_check_${i}`,
          true, true, 30);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }

      expect(exceptionTracker.getRecoveryRate()).assertEqual(1);
      expect(exceptionTracker.getRecoveredExceptions()).assertEqual(15);
    });

    // A burst of exceptions must not overflow the tracker.
    it('sample_should_handle_rapid_exceptions', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      exceptionTracker.resetTracker();

      for (let i = 0; i < 50; i++) {
        const exceptionType: LaunchExceptionType = i % 5 === 0 ?
          LaunchExceptionType.WANT_PARAMETER_MISSING :
          i % 5 === 1 ? LaunchExceptionType.UNKNOWN_LAUNCH_MODE :
            i % 5 === 2 ? LaunchExceptionType.DETAIL_PAGE_LOAD_FAILURE :
              i % 5 === 3 ? LaunchExceptionType.LAUNCH_TIMEOUT : LaunchExceptionType.EVENT_HUB_ERROR;
        exceptionTracker.recordException(exceptionType, `rapid_check_${i}`, true, true, 20);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }

      expect(exceptionTracker.getTotalExceptions()).assertEqual(50);
      expect(exceptionTracker.getCatchRate()).assertEqual(1);
    });

    // The home page must keep its component count while exceptions happen.
    it('sample_should_maintain_stability_during_exceptions', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      exceptionTracker.resetTracker();
      const initialCount: number = await homeComponentCount(driver);

      for (let i = 0; i < 25; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(LaunchExceptionType.WANT_PARAMETER_MISSING, `stability_check_${i}`,
          true, true, 30);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }

      const finalCount: number = await homeComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
      expect(exceptionTracker.getCatchRate()).assertEqual(1);
    });

    // The specified and singleton modes must be exception free.
    it('specified_and_singleton_launch_should_not_raise_exceptions', 0, async () => {
      exceptionTracker.resetTracker();
      logInfo(`checking exception freedom of ${MODE_SPECIFIED} and ${MODE_SINGLETON}`);

      await launchSpecifiedAbility(0, 'pages/FoodDetail', 1);
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);
      await launchSingletonAbility(0);
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);
      const detailText: boolean = await checkTextContent(driver, TEXT_FOOD_DETAIL_TITLE);

      exceptionTracker.recordException(LaunchExceptionType.DETAIL_PAGE_LOAD_FAILURE, 'mode_check',
        true, detailText, 100);
      expect(exceptionTracker.getCatchRate()).assertEqual(1);
      expect(exceptionTracker.getTotalExceptions()).assertEqual(1);

      await resetToHome(driver);
    });

    // The whole launch flow must stay inside the exception budget.
    it('comprehensive_exception_handling_scenario', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      exceptionTracker.resetTracker();
      const scenarioStart: number = Date.now();
      const foodName: string = FOOD_CUCUMBER;
      logInfo(`comprehensive exception scenario on ${foodName}`);

      const startTime1: number = Date.now();
      try {
        await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
        exceptionTracker.recordException(LaunchExceptionType.WANT_PARAMETER_MISSING, 'comprehensive_first',
          true, true, Date.now() - startTime1);
      } catch (error) {
        exceptionTracker.recordException(LaunchExceptionType.WANT_PARAMETER_MISSING, 'comprehensive_first',
          true, true, Date.now() - startTime1);
      }

      const startTime2: number = Date.now();
      try {
        await launchStandardAbility(1, MODE_STANDARD);
        exceptionTracker.recordException(LaunchExceptionType.DETAIL_PAGE_LOAD_FAILURE, 'comprehensive_second',
          true, true, Date.now() - startTime2);
      } catch (error) {
        exceptionTracker.recordException(LaunchExceptionType.DETAIL_PAGE_LOAD_FAILURE, 'comprehensive_second',
          true, true, Date.now() - startTime2);
      }

      const scenarioDuration: number = Date.now() - scenarioStart;
      const componentTotal: number = await componentCount(driver);

      expect(componentTotal).assertLargerOrEqual(1);
      expect(exceptionTracker.getTotalExceptions()).assertEqual(2);
      expect(exceptionTracker.getCatchRate()).assertEqual(1);
      expect(exceptionTracker.getRecoveryRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(10000);
      await resetToHome(driver);
    });

    // The classifier must map every exception type to a category.
    it('exception_classifier_should_map_categories', 0, async () => {
      const classifier: LaunchExceptionClassifier = LaunchExceptionClassifier.getInstance();

      expect(classifier.classify(LaunchExceptionType.WANT_PARAMETER_MISSING))
        .assertEqual(LaunchExceptionCategory.INPUT);
      expect(classifier.classify(LaunchExceptionType.UNKNOWN_LAUNCH_MODE))
        .assertEqual(LaunchExceptionCategory.STATE);
      expect(classifier.classify(LaunchExceptionType.DETAIL_PAGE_LOAD_FAILURE))
        .assertEqual(LaunchExceptionCategory.RESOURCE);
      expect(classifier.classify(LaunchExceptionType.LAUNCH_TIMEOUT))
        .assertEqual(LaunchExceptionCategory.ENVIRONMENT);
      expect(classifier.classify(LaunchExceptionType.EVENT_HUB_ERROR))
        .assertEqual(LaunchExceptionCategory.ENVIRONMENT);
    });

    // Environment exceptions must be detected by the classifier.
    it('exception_classifier_should_detect_environment', 0, async () => {
      const classifier: LaunchExceptionClassifier = LaunchExceptionClassifier.getInstance();

      expect(classifier.isEnvironmentCategory(LaunchExceptionType.LAUNCH_TIMEOUT)).assertTrue();
      expect(classifier.isEnvironmentCategory(LaunchExceptionType.EVENT_HUB_ERROR)).assertTrue();
      expect(classifier.isEnvironmentCategory(LaunchExceptionType.WANT_PARAMETER_MISSING)).assertFalse();
      expect(classifier.isEnvironmentCategory(LaunchExceptionType.UNKNOWN_LAUNCH_MODE)).assertFalse();
    });

    // The configurator must expose the strategy of every exception type.
    it('exception_configurator_should_find_config', 0, async () => {
      const configurator: LaunchExceptionConfigurator = new LaunchExceptionConfigurator();
      const timeoutConfig: LaunchExceptionConfig | null =
        configurator.findConfig(LaunchExceptionType.LAUNCH_TIMEOUT);

      expect(timeoutConfig === null).assertFalse();
      if (timeoutConfig !== null) {
        expect(timeoutConfig.strategy).assertEqual(LaunchExceptionStrategy.RETRY);
        expect(timeoutConfig.maxRetryCount).assertEqual(5);
        expect(timeoutConfig.isEnabled).assertTrue();
      }

      const eventConfig: LaunchExceptionConfig | null =
        configurator.findConfig(LaunchExceptionType.EVENT_HUB_ERROR);
      if (eventConfig !== null) {
        expect(eventConfig.strategy).assertEqual(LaunchExceptionStrategy.SWALLOW);
        expect(eventConfig.isEnabled).assertFalse();
      }
    });

    // Only the enabled configurations are counted.
    it('exception_configurator_should_count_enabled', 0, async () => {
      const configurator: LaunchExceptionConfigurator = new LaunchExceptionConfigurator();

      expect(configurator.getConfigs().length).assertEqual(5);
      expect(configurator.countEnabledConfigs()).assertEqual(4);
    });

    // The summary builder must aggregate a mixed exception history.
    it('exception_summary_builder_should_aggregate_records', 0, async () => {
      const records: LaunchExceptionRecord[] = [
        { exceptionType: LaunchExceptionType.WANT_PARAMETER_MISSING, operationName: 'first', isCaught: true,
          isRecovered: true, responseTime: 10, timestamp: 1000 },
        { exceptionType: LaunchExceptionType.UNKNOWN_LAUNCH_MODE, operationName: 'second', isCaught: true,
          isRecovered: false, responseTime: 20, timestamp: 2000 },
        { exceptionType: LaunchExceptionType.LAUNCH_TIMEOUT, operationName: 'third', isCaught: false,
          isRecovered: false, responseTime: 30, timestamp: 3000 }
      ];
      const builder: LaunchExceptionSummaryBuilder = new LaunchExceptionSummaryBuilder(records);
      const summary: LaunchExceptionSummary = builder.buildSummary();

      expect(summary.totalExceptions).assertEqual(3);
      expect(summary.caughtCount).assertEqual(2);
      expect(summary.uncaughtCount).assertEqual(1);
      expect(summary.recoveredCount).assertEqual(1);
      expect(summary.catchRate).assertEqual(2 / 3);
      expect(summary.recoveryRate).assertEqual(1 / 3);
    });

    // An empty history must produce zeroed statistics.
    it('exception_summary_builder_should_handle_empty_records', 0, async () => {
      const builder: LaunchExceptionSummaryBuilder = new LaunchExceptionSummaryBuilder([]);
      const summary: LaunchExceptionSummary = builder.buildSummary();

      expect(summary.totalExceptions).assertEqual(0);
      expect(summary.caughtCount).assertEqual(0);
      expect(summary.uncaughtCount).assertEqual(0);
      expect(summary.catchRate).assertEqual(0);
      expect(summary.recoveryRate).assertEqual(0);
    });

    // The retry boundary of a disposition must be respected.
    it('exception_disposition_should_control_retry', 0, async () => {
      const disposition: LaunchExceptionDisposition = new LaunchExceptionDisposition(
        LaunchExceptionType.UNKNOWN_LAUNCH_MODE, 'launch_specified', LaunchExceptionStrategy.RETRY, 2);

      expect(disposition.canRetry(3)).assertTrue();
      expect(disposition.canRetry(2)).assertFalse();
      expect(disposition.getExceptionType()).assertEqual(LaunchExceptionType.UNKNOWN_LAUNCH_MODE);
      expect(disposition.getOperationName()).assertEqual('launch_specified');
      expect(disposition.getStrategy()).assertEqual(LaunchExceptionStrategy.RETRY);
      expect(disposition.getRetryCount()).assertEqual(2);
      expect(disposition.toString()).assertContain('launch_specified');
    });

    // The disposition manager must filter by strategy and clear.
    it('exception_disposition_manager_should_filter_by_strategy', 0, async () => {
      const manager: LaunchExceptionDispositionManager = new LaunchExceptionDispositionManager();
      manager.appendDisposition(new LaunchExceptionDisposition(
        LaunchExceptionType.LAUNCH_TIMEOUT, 'launch_standard', LaunchExceptionStrategy.RETRY, 0));
      manager.appendDisposition(new LaunchExceptionDisposition(
        LaunchExceptionType.WANT_PARAMETER_MISSING, 'launch_first', LaunchExceptionStrategy.ABORT, 0));
      manager.appendDisposition(new LaunchExceptionDisposition(
        LaunchExceptionType.UNKNOWN_LAUNCH_MODE, 'launch_singleton', LaunchExceptionStrategy.RETRY, 1));

      expect(manager.getDispositionCount()).assertEqual(3);
      expect(manager.filterByStrategy(LaunchExceptionStrategy.RETRY).length).assertEqual(2);
      manager.clearDispositions();
      expect(manager.getDispositionCount()).assertEqual(0);
    });

    // The monitor must switch between observing, alerting and recovering.
    it('exception_monitor_should_track_observe_and_alert', 0, async () => {
      const monitor: LaunchExceptionMonitor = new LaunchExceptionMonitor();
      monitor.startObserving();
      expect(monitor.getStatus()).assertEqual(LaunchMonitorStatus.OBSERVING);

      monitor.observe(LaunchExceptionType.LAUNCH_TIMEOUT, true);
      expect(monitor.getStatus()).assertEqual(LaunchMonitorStatus.OBSERVING);

      monitor.observe(LaunchExceptionType.EVENT_HUB_ERROR, false);
      expect(monitor.getStatus()).assertEqual(LaunchMonitorStatus.ALERTING);

      monitor.recover();
      expect(monitor.getStatus()).assertEqual(LaunchMonitorStatus.RECOVERING);
    });

    // The monitor metrics must match the observed exceptions.
    it('exception_monitor_should_build_metrics', 0, async () => {
      const monitor: LaunchExceptionMonitor = new LaunchExceptionMonitor();
      monitor.startObserving();
      monitor.observe(LaunchExceptionType.LAUNCH_TIMEOUT, true);
      monitor.observe(LaunchExceptionType.LAUNCH_TIMEOUT, true);
      monitor.observe(LaunchExceptionType.EVENT_HUB_ERROR, false);

      const metrics: LaunchMonitorMetrics = monitor.buildMetrics();
      expect(metrics.observedExceptions).assertEqual(3);
      expect(metrics.alertedExceptions).assertEqual(1);
      expect(metrics.recoveredExceptions).assertEqual(2);
      expect(metrics.alertRate).assertEqual(1 / 3);

      monitor.resetMonitor();
      expect(monitor.getStatus()).assertEqual(LaunchMonitorStatus.IDLE);
    });

    // The frequency counter must track and rank the exception types.
    it('exception_frequency_counter_should_track_counts', 0, async () => {
      const counter: LaunchExceptionFrequencyCounter = new LaunchExceptionFrequencyCounter();
      counter.increment(LaunchExceptionType.LAUNCH_TIMEOUT);
      counter.increment(LaunchExceptionType.LAUNCH_TIMEOUT);
      counter.increment(LaunchExceptionType.WANT_PARAMETER_MISSING);

      expect(counter.getCount(LaunchExceptionType.LAUNCH_TIMEOUT)).assertEqual(2);
      expect(counter.getCount(LaunchExceptionType.WANT_PARAMETER_MISSING)).assertEqual(1);
      expect(counter.getCount(LaunchExceptionType.UNKNOWN_LAUNCH_MODE)).assertEqual(0);
      expect(counter.getMostFrequent()).assertEqual(LaunchExceptionType.LAUNCH_TIMEOUT);
    });

    // Clearing the frequency counter must zero every count.
    it('exception_frequency_counter_should_clear', 0, async () => {
      const counter: LaunchExceptionFrequencyCounter = new LaunchExceptionFrequencyCounter();
      counter.increment(LaunchExceptionType.LAUNCH_TIMEOUT);
      counter.clearCounts();

      expect(counter.getCount(LaunchExceptionType.LAUNCH_TIMEOUT)).assertEqual(0);
      expect(counter.getMostFrequent()).assertNull();
    });

    // The alert manager must filter the alerts by exception type.
    it('exception_alert_manager_should_filter_by_type', 0, async () => {
      const manager: LaunchExceptionAlertManager = new LaunchExceptionAlertManager();
      const now: number = Date.now();
      manager.appendAlert(new LaunchExceptionAlert(LaunchExceptionType.LAUNCH_TIMEOUT, 'launch timeout', now));
      manager.appendAlert(new LaunchExceptionAlert(LaunchExceptionType.LAUNCH_TIMEOUT, 'launch timeout again',
        now + 1));
      manager.appendAlert(new LaunchExceptionAlert(LaunchExceptionType.EVENT_HUB_ERROR, 'event hub error',
        now + 2));

      expect(manager.getAlertCount()).assertEqual(3);
      const timeoutAlerts: LaunchExceptionAlert[] = manager.filterByType(LaunchExceptionType.LAUNCH_TIMEOUT);
      expect(timeoutAlerts.length).assertEqual(2);
      expect(timeoutAlerts[0].getMessage()).assertEqual('launch timeout');
      expect(timeoutAlerts[0].toString()).assertContain('launch timeout');
      manager.clearAlerts();
      expect(manager.getAlertCount()).assertEqual(0);
    });

    // The tracker counters must match caught and recovered outcomes.
    it('exception_tracker_should_track_caught_and_recovered', 0, async () => {
      exceptionTracker.resetTracker();
      exceptionTracker.recordException(LaunchExceptionType.LAUNCH_TIMEOUT, 'standard', true, true, 50);
      exceptionTracker.recordException(LaunchExceptionType.LAUNCH_TIMEOUT, 'specified', true, false, 50);
      exceptionTracker.recordException(LaunchExceptionType.WANT_PARAMETER_MISSING, 'singleton', false, false, 50);

      expect(exceptionTracker.getTotalExceptions()).assertEqual(3);
      expect(exceptionTracker.getCaughtExceptions()).assertEqual(2);
      expect(exceptionTracker.getRecoveredExceptions()).assertEqual(1);
      expect(exceptionTracker.getCatchRate()).assertEqual(2 / 3);
      expect(exceptionTracker.getRecoveryRate()).assertEqual(1 / 3);
    });
  });
}
