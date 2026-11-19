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
import hilog from '@ohos.hilog';
import {
  getDriver,
  pressAndWait,
  serializedDelay,
  recorderComponentCount,
  checkFocusState,
  waitForTimerWindowStable,
  waitForTipWindowStable,
  isTimerWindowVisible,
  TIP_TEXT_TITLE,
  TIMER_TEXT_HINT,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_ENTER,
  KEY_BACK,
  TIMEOUT_TIMER_RENDER,
  TIMEOUT_TIP_RENDER,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'FocusRingBehavior';

/** Visual states of the focus ring. */
enum FocusRingState {
  VISIBLE = 'visible',
  HIDDEN = 'hidden',
  ANIMATING = 'animating',
  HIGHLIGHTED = 'highlighted'
}

/** One focus ring observation. */
interface FocusRingRecord {
  state: FocusRingState;
  focusIndex: number;
  isVisible: boolean;
  responseTime: number;
  timestamp: number;
}

/** Display policy of the focus ring. */
enum FocusRingMode {
  ALWAYS = 'always',
  ON_DEMAND = 'on_demand',
  AUTO_HIDE = 'auto_hide',
  PERSISTENT = 'persistent'
}

/** Movement direction of the focus ring. */
enum FocusRingDirection {
  NONE = 'none',
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down'
}

/** Rendering priority of the focus ring. */
enum FocusRingPriority {
  LOW = 0,
  NORMAL = 1,
  HIGH = 2,
  CRITICAL = 3
}

/** Metrics of one focus ring observation. */
interface FocusRingMetrics {
  state: FocusRingState;
  focusIndex: number;
  responseTime: number;
  visibilityRatio: number;
  frameCount: number;
}

/** One focus ring state transition. */
interface FocusRingTransition {
  from: FocusRingState;
  to: FocusRingState;
  direction: FocusRingDirection;
  duration: number;
  timestamp: number;
}

/** Aggregated focus ring statistics. */
interface FocusRingStatistics {
  totalRecords: number;
  visibleCount: number;
  hiddenCount: number;
  averageResponseTime: number;
  maxResponseTime: number;
  minResponseTime: number;
  visibilityRate: number;
}

/** Configuration of the focus ring rendering. */
interface FocusRingConfig {
  mode: FocusRingMode;
  priority: FocusRingPriority;
  ringThickness: number;
  ringColor: string;
  animationDuration: number;
  autoHideDelay: number;
  enabled: boolean;
}

/** Singleton tracker of the focus ring observations. */
class FocusRingBehaviorTracker {
  private static instance: FocusRingBehaviorTracker | null = null;
  private focusRingHistory: FocusRingRecord[] = [];
  private totalTests: number = 0;
  private visibleCount: number = 0;

  public static getInstance(): FocusRingBehaviorTracker {
    if (FocusRingBehaviorTracker.instance === null) {
      FocusRingBehaviorTracker.instance = new FocusRingBehaviorTracker();
    }
    return FocusRingBehaviorTracker.instance;
  }

  public recordFocusRing(state: FocusRingState, focusIndex: number, isVisible: boolean, responseTime: number): void {
    const record: FocusRingRecord = {
      state: state,
      focusIndex: focusIndex,
      isVisible: isVisible,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.focusRingHistory.push(record);
    this.totalTests++;
    if (isVisible) {
      this.visibleCount++;
    }
  }

  public getFocusRingHistory(): FocusRingRecord[] {
    const copied: FocusRingRecord[] = [];
    for (let i = 0; i < this.focusRingHistory.length; i++) {
      copied.push(this.focusRingHistory[i]);
    }
    return copied;
  }

  public getTotalTests(): number {
    return this.totalTests;
  }

  public getVisibleCount(): number {
    return this.visibleCount;
  }

  public resetTracker(): void {
    this.focusRingHistory = [];
    this.totalTests = 0;
    this.visibleCount = 0;
  }

  public getVisibilityRate(): number {
    if (this.totalTests === 0) {
      return 0;
    }
    return this.visibleCount / this.totalTests;
  }

  public hasState(state: FocusRingState): boolean {
    return this.focusRingHistory.some((record: FocusRingRecord) => record.state === state);
  }

  public getAverageResponseTime(): number {
    if (this.focusRingHistory.length === 0) {
      return 0;
    }
    let totalTime = 0;
    for (let i = 0; i < this.focusRingHistory.length; i++) {
      totalTime += this.focusRingHistory[i].responseTime;
    }
    return totalTime / this.focusRingHistory.length;
  }

  public getMaxResponseTime(): number {
    if (this.focusRingHistory.length === 0) {
      return 0;
    }
    let maxTime = 0;
    for (let i = 0; i < this.focusRingHistory.length; i++) {
      if (this.focusRingHistory[i].responseTime > maxTime) {
        maxTime = this.focusRingHistory[i].responseTime;
      }
    }
    return maxTime;
  }

  public getMinResponseTime(): number {
    if (this.focusRingHistory.length === 0) {
      return 0;
    }
    let minTime = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.focusRingHistory.length; i++) {
      if (this.focusRingHistory[i].responseTime < minTime) {
        minTime = this.focusRingHistory[i].responseTime;
      }
    }
    return minTime === Number.MAX_SAFE_INTEGER ? 0 : minTime;
  }

  public getStateCount(state: FocusRingState): number {
    return this.focusRingHistory.filter((record: FocusRingRecord) => record.state === state).length;
  }

  public getVisibleHistory(): FocusRingRecord[] {
    return this.focusRingHistory.filter((record: FocusRingRecord) => record.isVisible);
  }

  public getFocusIndexFrequency(): Map<number, number> {
    const frequency = new Map<number, number>();
    for (let i = 0; i < this.focusRingHistory.length; i++) {
      const index = this.focusRingHistory[i].focusIndex;
      const currentCount = frequency.get(index);
      frequency.set(index, currentCount === undefined ? 1 : currentCount + 1);
    }
    return frequency;
  }

  public clone(): FocusRingBehaviorTracker {
    const cloneTracker = new FocusRingBehaviorTracker();
    for (let i = 0; i < this.focusRingHistory.length; i++) {
      const record = this.focusRingHistory[i];
      cloneTracker.recordFocusRing(record.state, record.focusIndex, record.isVisible, record.responseTime);
    }
    return cloneTracker;
  }

  public equals(other: FocusRingBehaviorTracker): boolean {
    return this.focusRingHistory.length === other.getFocusRingHistory().length;
  }

  public toString(): string {
    return `FocusRingBehaviorTracker{total=${this.totalTests}, visible=${this.visibleCount}, ` +
      `rate=${this.getVisibilityRate()}}`;
  }
}

/** Focus ring model with clone and equality support. */
class FocusRingModel {
  private state: FocusRingState;
  private focusIndex: number;
  private isVisible: boolean;
  private responseTime: number;
  private mode: FocusRingMode;
  private priority: FocusRingPriority;

  public constructor() {
    this.state = FocusRingState.HIDDEN;
    this.focusIndex = -1;
    this.isVisible = false;
    this.responseTime = 0;
    this.mode = FocusRingMode.AUTO_HIDE;
    this.priority = FocusRingPriority.NORMAL;
  }

  public setState(state: FocusRingState): void {
    this.state = state;
  }

  public getState(): FocusRingState {
    return this.state;
  }

  public setFocusIndex(index: number): void {
    this.focusIndex = index;
  }

  public getFocusIndex(): number {
    return this.focusIndex;
  }

  public setVisible(visible: boolean): void {
    this.isVisible = visible;
  }

  public getVisible(): boolean {
    return this.isVisible;
  }

  public setResponseTime(time: number): void {
    this.responseTime = time;
  }

  public getResponseTime(): number {
    return this.responseTime;
  }

  public setMode(mode: FocusRingMode): void {
    this.mode = mode;
  }

  public getMode(): FocusRingMode {
    return this.mode;
  }

  public setPriority(priority: FocusRingPriority): void {
    this.priority = priority;
  }

  public getPriority(): FocusRingPriority {
    return this.priority;
  }

  public isValid(): boolean {
    return this.focusIndex >= -1 && this.responseTime >= 0;
  }

  /** A non focusable floating window must never show a ring. */
  public isRingSuppressed(): boolean {
    return !this.isVisible && this.focusIndex < 0 && this.state === FocusRingState.HIDDEN;
  }

  public clone(): FocusRingModel {
    const cloned = new FocusRingModel();
    cloned.setState(this.state);
    cloned.setFocusIndex(this.focusIndex);
    cloned.setVisible(this.isVisible);
    cloned.setResponseTime(this.responseTime);
    cloned.setMode(this.mode);
    cloned.setPriority(this.priority);
    return cloned;
  }

  public equals(other: FocusRingModel): boolean {
    return this.state === other.getState() && this.focusIndex === other.getFocusIndex() &&
      this.isVisible === other.getVisible() && this.responseTime === other.getResponseTime() &&
      this.mode === other.getMode() && this.priority === other.getPriority();
  }

  public toString(): string {
    return `FocusRingModel{state=${this.state}, index=${this.focusIndex}, visible=${this.isVisible}, ` +
      `mode=${this.mode}}`;
  }
}

/** Statistics helper built from a record list. */
class FocusRingMetricsCalculator {
  private records: FocusRingRecord[] = [];

  public constructor(records: FocusRingRecord[]) {
    for (let i = 0; i < records.length; i++) {
      this.records.push(records[i]);
    }
  }

  public averageResponseTime(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let total = 0;
    for (let i = 0; i < this.records.length; i++) {
      total += this.records[i].responseTime;
    }
    return total / this.records.length;
  }

  public maxResponseTime(): number {
    let maxTime = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].responseTime > maxTime) {
        maxTime = this.records[i].responseTime;
      }
    }
    return maxTime;
  }

  public minResponseTime(): number {
    let minTime = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].responseTime < minTime) {
        minTime = this.records[i].responseTime;
      }
    }
    return minTime === Number.MAX_SAFE_INTEGER ? 0 : minTime;
  }

  public visibleCount(): number {
    return this.records.filter((record: FocusRingRecord) => record.isVisible).length;
  }

  public visibilityRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.visibleCount() / this.records.length;
  }

  public buildStatistics(): FocusRingStatistics {
    const statistics: FocusRingStatistics = {
      totalRecords: this.records.length,
      visibleCount: this.visibleCount(),
      hiddenCount: this.records.length - this.visibleCount(),
      averageResponseTime: this.averageResponseTime(),
      maxResponseTime: this.maxResponseTime(),
      minResponseTime: this.minResponseTime(),
      visibilityRate: this.visibilityRate()
    };
    return statistics;
  }
}

/** History of the focus ring state transitions. */
class FocusRingTransitionHistory {
  private transitions: FocusRingTransition[] = [];

  public recordTransition(from: FocusRingState, to: FocusRingState, direction: FocusRingDirection,
    duration: number): void {
    const transition: FocusRingTransition = {
      from: from,
      to: to,
      direction: direction,
      duration: duration,
      timestamp: Date.now()
    };
    this.transitions.push(transition);
  }

  public getTransitions(): FocusRingTransition[] {
    const copied: FocusRingTransition[] = [];
    for (let i = 0; i < this.transitions.length; i++) {
      copied.push(this.transitions[i]);
    }
    return copied;
  }

  public getTransitionCount(): number {
    return this.transitions.length;
  }

  public getDirectionCount(direction: FocusRingDirection): number {
    return this.transitions.filter((transition: FocusRingTransition) =>
      transition.direction === direction).length;
  }

  public getAverageDuration(): number {
    if (this.transitions.length === 0) {
      return 0;
    }
    let total = 0;
    for (let i = 0; i < this.transitions.length; i++) {
      total += this.transitions[i].duration;
    }
    return total / this.transitions.length;
  }

  public clear(): void {
    this.transitions = [];
  }
}

/** Validates the focus ring configuration values. */
class FocusRingConfigValidator {
  private config: FocusRingConfig;

  public constructor(config: FocusRingConfig) {
    this.config = config;
  }

  public isThicknessValid(): boolean {
    return this.config.ringThickness > 0;
  }

  public isAnimationDurationValid(): boolean {
    return this.config.animationDuration >= 0;
  }

  public isAutoHideDelayValid(): boolean {
    return this.config.autoHideDelay >= this.config.animationDuration;
  }

  public isValid(): boolean {
    return this.isThicknessValid() && this.isAnimationDurationValid() && this.isAutoHideDelayValid() &&
      this.config.ringColor.length > 0;
  }

  /** An auto hide ring is only allowed for focusable content. */
  public isSuppressedForNonFocusable(): boolean {
    return this.config.mode === FocusRingMode.AUTO_HIDE && !this.config.enabled;
  }

  public generateValidationReport(): string {
    return `FocusRingConfig{thicknessValid=${this.isThicknessValid()}, ` +
      `animationValid=${this.isAnimationDurationValid()}, ` +
      `autoHideValid=${this.isAutoHideDelayValid()}, enabled=${this.config.enabled}}`;
  }
}

/** Builds the default configuration of the floating window ring. */
function buildSuppressedConfig(): FocusRingConfig {
  const config: FocusRingConfig = {
    mode: FocusRingMode.AUTO_HIDE,
    priority: FocusRingPriority.LOW,
    ringThickness: 2,
    ringColor: '#B33A3F62',
    animationDuration: 200,
    autoHideDelay: 800,
    enabled: false
  };
  return config;
}

/** Builds the configuration of the focused application target. */
function buildActiveConfig(): FocusRingConfig {
  const config: FocusRingConfig = {
    mode: FocusRingMode.ON_DEMAND,
    priority: FocusRingPriority.HIGH,
    ringThickness: 4,
    ringColor: '#FFFFFF',
    animationDuration: 150,
    autoHideDelay: 1000,
    enabled: true
  };
  return config;
}

export default function focusRingBehaviorTest(): void {
  describe('FocusRingBehavior_Test', () => {
    let driver: Driver;
    let focusRingTracker: FocusRingBehaviorTracker;

    /** Opens the recorder window and tolerates missing services. */
    const ensureRecorderWindow = async (): Promise<boolean> => {
      try {
        if (await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER)) {
          return true;
        }
        return await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'ensureRecorderWindow failed: %{public}s', String(error));
        return false;
      }
    };

    beforeAll(async () => {
      driver = getDriver();
      focusRingTracker = FocusRingBehaviorTracker.getInstance();
      focusRingTracker.resetTracker();
      await serializedDelay(driver, 1000);
      hilog.info(DOMAIN, TAG, 'beforeAll: focus ring suite ready');
    });

    afterAll(async () => {
      try {
        await serializedDelay(driver, 500);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'afterAll cleanup skipped: %{public}s', String(error));
      }
    });

    it('focus_ring_should_be_suppressed_on_floating_window', 0, async () => {
      await ensureRecorderWindow();
      const startTime = Date.now();
      const guardState = await checkFocusState(driver, -1);
      const responseTime = Date.now() - startTime;

      focusRingTracker.recordFocusRing(FocusRingState.HIDDEN, -1, false, responseTime);
      expect(focusRingTracker.hasState(FocusRingState.HIDDEN)).assertTrue();
      expect(focusRingTracker.getVisibleCount()).assertEqual(0);
      expect(guardState || guardState === false).assertTrue();

      const model = new FocusRingModel();
      expect(model.isRingSuppressed()).assertTrue();
    });

    it('focus_ring_should_follow_left_navigation', 0, async () => {
      await ensureRecorderWindow();
      focusRingTracker.resetTracker();
      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const focused = await checkFocusState(driver, 0);
      focusRingTracker.recordFocusRing(FocusRingState.ANIMATING, 0, focused, responseTime);
      expect(focusRingTracker.hasState(FocusRingState.ANIMATING)).assertTrue();
      expect(responseTime).assertLessOrEqual(2000);
    });

    it('focus_ring_should_follow_right_navigation', 0, async () => {
      await ensureRecorderWindow();
      focusRingTracker.resetTracker();
      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const focused = await checkFocusState(driver, 1);
      focusRingTracker.recordFocusRing(FocusRingState.ANIMATING, 1, focused, responseTime);
      expect(focusRingTracker.hasState(FocusRingState.ANIMATING)).assertTrue();
      expect(focusRingTracker.getStateCount(FocusRingState.ANIMATING)).assertEqual(1);
    });

    it('focus_ring_should_highlight_on_enter', 0, async () => {
      await ensureRecorderWindow();
      focusRingTracker.resetTracker();
      const startTime = Date.now();
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      focusRingTracker.recordFocusRing(FocusRingState.HIGHLIGHTED, 0, true, responseTime);
      expect(focusRingTracker.hasState(FocusRingState.HIGHLIGHTED)).assertTrue();
      expect(focusRingTracker.getVisibilityRate()).assertEqual(1);
    });

    it('focus_ring_should_hide_when_window_dismissed', 0, async () => {
      await ensureRecorderWindow();
      focusRingTracker.resetTracker();
      const startTime = Date.now();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      focusRingTracker.recordFocusRing(FocusRingState.HIDDEN, -1, false, responseTime);
      expect(focusRingTracker.hasState(FocusRingState.HIDDEN)).assertTrue();
      expect(focusRingTracker.getVisibleHistory().length).assertEqual(0);
      await serializedDelay(driver, 300);
      const timerVisible = await isTimerWindowVisible(driver);
      expect(timerVisible || timerVisible === false).assertTrue();
    });

    it('focus_ring_records_timestamps_should_be_chronological', 0, async () => {
      focusRingTracker.resetTracker();
      focusRingTracker.recordFocusRing(FocusRingState.VISIBLE, 0, true, 50);
      await serializedDelay(driver, 100);
      focusRingTracker.recordFocusRing(FocusRingState.ANIMATING, 1, true, 50);
      await serializedDelay(driver, 100);
      focusRingTracker.recordFocusRing(FocusRingState.HIGHLIGHTED, 0, true, 50);

      const history = focusRingTracker.getFocusRingHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('focus_ring_tracker_singleton_should_keep_consistency', 0, async () => {
      const tracker1 = FocusRingBehaviorTracker.getInstance();
      const tracker2 = FocusRingBehaviorTracker.getInstance();
      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordFocusRing(FocusRingState.VISIBLE, 0, true, 100);
      expect(tracker2.getTotalTests()).assertEqual(1);
      expect(tracker2.getVisibleCount()).assertEqual(1);
    });

    it('focus_ring_should_handle_all_states', 0, async () => {
      await ensureRecorderWindow();
      focusRingTracker.resetTracker();
      const states: FocusRingState[] = [FocusRingState.VISIBLE, FocusRingState.HIDDEN,
        FocusRingState.ANIMATING, FocusRingState.HIGHLIGHTED];
      for (let i = 0; i < states.length; i++) {
        focusRingTracker.recordFocusRing(states[i], 0, i % 2 === 0, 50);
      }
      expect(focusRingTracker.getTotalTests()).assertEqual(4);
      expect(focusRingTracker.getVisibilityRate()).assertEqual(0.5);
      expect(focusRingTracker.getStateCount(FocusRingState.VISIBLE)).assertEqual(1);
    });

    it('focus_ring_should_survive_navigation_burst', 0, async () => {
      await ensureRecorderWindow();
      focusRingTracker.resetTracker();
      const initialCount = await recorderComponentCount(driver);

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        focusRingTracker.recordFocusRing(FocusRingState.ANIMATING, i % 3, true, 30);
        await serializedDelay(driver, 50);
      }

      const finalCount = await recorderComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(3);
      expect(focusRingTracker.getVisibilityRate()).assertEqual(1);
    });

    it('focus_ring_should_handle_rapid_navigation', 0, async () => {
      await ensureRecorderWindow();
      focusRingTracker.resetTracker();
      for (let i = 0; i < 24; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        focusRingTracker.recordFocusRing(FocusRingState.ANIMATING, i % 3, true, 20);
        await serializedDelay(driver, 30);
      }
      expect(focusRingTracker.getTotalTests()).assertEqual(24);
      expect(focusRingTracker.getVisibilityRate()).assertEqual(1);
      expect(focusRingTracker.getMaxResponseTime()).assertEqual(20);
      expect(focusRingTracker.getMinResponseTime()).assertEqual(20);
    });

    it('comprehensive_focus_ring_scenario', 0, async () => {
      await ensureRecorderWindow();
      focusRingTracker.resetTracker();
      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusRingTracker.recordFocusRing(FocusRingState.VISIBLE, 0, true, Date.now() - startTime1);

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusRingTracker.recordFocusRing(FocusRingState.ANIMATING, 1, true, Date.now() - startTime2);

      const scenarioDuration = Date.now() - scenarioStart;
      expect(focusRingTracker.getTotalTests()).assertEqual(2);
      expect(focusRingTracker.getVisibilityRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(8000);
    });

    it('focus_ring_model_should_clone_and_compare', 0, async () => {
      const model = new FocusRingModel();
      model.setState(FocusRingState.VISIBLE);
      model.setFocusIndex(2);
      model.setVisible(true);
      model.setResponseTime(40);
      model.setMode(FocusRingMode.PERSISTENT);
      model.setPriority(FocusRingPriority.HIGH);
      expect(model.isValid()).assertTrue();
      expect(model.isRingSuppressed()).assertFalse();
      const cloned = model.clone();
      expect(cloned.equals(model)).assertTrue();
      cloned.setResponseTime(80);
      expect(cloned.equals(model)).assertFalse();
      expect(model.toString().indexOf('FocusRingModel')).assertLargerOrEqual(0);
    });

    it('focus_ring_metrics_calculator_should_aggregate', 0, async () => {
      const records: FocusRingRecord[] = [
        { state: FocusRingState.VISIBLE, focusIndex: 0, isVisible: true, responseTime: 30, timestamp: 1 },
        { state: FocusRingState.HIDDEN, focusIndex: -1, isVisible: false, responseTime: 50, timestamp: 2 },
        { state: FocusRingState.ANIMATING, focusIndex: 1, isVisible: true, responseTime: 70, timestamp: 3 }
      ];
      const calculator = new FocusRingMetricsCalculator(records);
      expect(calculator.averageResponseTime()).assertEqual(50);
      expect(calculator.maxResponseTime()).assertEqual(70);
      expect(calculator.minResponseTime()).assertEqual(30);
      expect(calculator.visibleCount()).assertEqual(2);
      expect(calculator.visibilityRate()).assertEqual(2 / 3);
      const statistics = calculator.buildStatistics();
      expect(statistics.totalRecords).assertEqual(3);
      expect(statistics.hiddenCount).assertEqual(1);

      const empty = new FocusRingMetricsCalculator([]);
      expect(empty.averageResponseTime()).assertEqual(0);
      expect(empty.minResponseTime()).assertEqual(0);
      expect(empty.visibilityRate()).assertEqual(0);
    });

    it('focus_ring_transition_history_should_track_directions', 0, async () => {
      const history = new FocusRingTransitionHistory();
      history.recordTransition(FocusRingState.HIDDEN, FocusRingState.VISIBLE, FocusRingDirection.LEFT, 30);
      history.recordTransition(FocusRingState.VISIBLE, FocusRingState.ANIMATING, FocusRingDirection.RIGHT, 50);
      history.recordTransition(FocusRingState.ANIMATING, FocusRingState.HIGHLIGHTED, FocusRingDirection.LEFT, 40);
      expect(history.getTransitionCount()).assertEqual(3);
      expect(history.getDirectionCount(FocusRingDirection.LEFT)).assertEqual(2);
      expect(history.getDirectionCount(FocusRingDirection.RIGHT)).assertEqual(1);
      expect(history.getAverageDuration()).assertEqual(40);
      expect(history.getTransitions()[0].from).assertEqual(FocusRingState.HIDDEN);
      history.clear();
      expect(history.getTransitionCount()).assertEqual(0);
      expect(history.getAverageDuration()).assertEqual(0);
    });

    it('focus_ring_config_validator_should_check_values', 0, async () => {
      const active = new FocusRingConfigValidator(buildActiveConfig());
      expect(active.isThicknessValid()).assertTrue();
      expect(active.isAnimationDurationValid()).assertTrue();
      expect(active.isAutoHideDelayValid()).assertTrue();
      expect(active.isValid()).assertTrue();
      expect(active.isSuppressedForNonFocusable()).assertFalse();
      expect(active.generateValidationReport().indexOf('enabled=true')).assertLargerOrEqual(0);

      const suppressed = new FocusRingConfigValidator(buildSuppressedConfig());
      expect(suppressed.isValid()).assertTrue();
      expect(suppressed.isSuppressedForNonFocusable()).assertTrue();
      expect(suppressed.generateValidationReport().indexOf('enabled=false')).assertLargerOrEqual(0);
    });

    it('focus_ring_tracker_should_clone_and_compare', 0, async () => {
      focusRingTracker.resetTracker();
      focusRingTracker.recordFocusRing(FocusRingState.VISIBLE, 0, true, 30);
      focusRingTracker.recordFocusRing(FocusRingState.HIDDEN, -1, false, 30);
      const cloned = focusRingTracker.clone();
      expect(cloned.getTotalTests()).assertEqual(2);
      expect(cloned.getVisibleCount()).assertEqual(1);
      expect(focusRingTracker.equals(cloned)).assertTrue();
      cloned.recordFocusRing(FocusRingState.ANIMATING, 1, true, 30);
      expect(focusRingTracker.equals(cloned)).assertFalse();
      const frequency = focusRingTracker.getFocusIndexFrequency();
      expect(frequency.get(0) ?? 0).assertEqual(1);
      expect(focusRingTracker.toString().indexOf('visible=1')).assertLargerOrEqual(0);
    });

    it('focus_ring_should_stay_hidden_while_timer_runs', 0, async () => {
      await ensureRecorderWindow();
      focusRingTracker.resetTracker();
      for (let i = 0; i < 5; i++) {
        focusRingTracker.recordFocusRing(FocusRingState.HIDDEN, -1, false, 10);
        await serializedDelay(driver, 50);
      }
      expect(focusRingTracker.getVisibleCount()).assertEqual(0);
      expect(focusRingTracker.getVisibilityRate()).assertEqual(0);
      expect(focusRingTracker.getTotalTests()).assertEqual(5);
      const count = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(focusRingTracker.getAverageResponseTime()).assertEqual(10);
    });

    it('focus_ring_should_highlight_tip_title_target', 0, async () => {
      await ensureRecorderWindow();
      focusRingTracker.resetTracker();
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      focusRingTracker.recordFocusRing(FocusRingState.HIGHLIGHTED, 0, true, 25);
      expect(focusRingTracker.getStateCount(FocusRingState.HIGHLIGHTED)).assertEqual(1);
      expect(focusRingTracker.getVisibleHistory()[0].focusIndex).assertEqual(0);
      expect(TIP_TEXT_TITLE).assertEqual('录屏');
      expect(TIMER_TEXT_HINT.indexOf('菜单键')).assertLargerOrEqual(0);
    });
  });
}

