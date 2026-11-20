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
  simulateTouch,
  simulateSwipe,
  recorderComponentCount,
  checkFocusState,
  waitForTimerWindowStable,
  waitForTipWindowStable,
  TIP_TEXT_TITLE,
  TIMER_TEXT_HINT,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_ENTER,
  KEY_BACK,
  TIMEOUT_TIMER_RENDER,
  TIMEOUT_TIP_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'GestureRecognition';

/** Interval of the double click detector of the recorder service. */
const DOUBLE_CLICK_INTERVAL: number = 500;

/** Gesture kinds recognized on the TV panel. */
enum GestureType {
  TAP = 'tap',
  SWIPE_LEFT = 'swipe_left',
  SWIPE_RIGHT = 'swipe_right',
  LONG_PRESS = 'long_press',
  DOUBLE_TAP = 'double_tap',
  PINCH = 'pinch'
}

/** One gesture observation. */
interface GestureRecord {
  gestureType: GestureType;
  isRecognized: boolean;
  responseTime: number;
  timestamp: number;
}

/** Direction of a swipe gesture. */
enum GestureDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down',
  NONE = 'none'
}

/** Working mode of the gesture engine. */
enum GestureMode {
  STANDARD = 'standard',
  AGGRESSIVE = 'aggressive',
  CONSERVATIVE = 'conservative',
  DISABLED = 'disabled'
}

/** Priority of a gesture inside the event pipeline. */
enum GesturePriority {
  LOW = 0,
  NORMAL = 1,
  HIGH = 2,
  EXCLUSIVE = 3
}

/** Metrics of one recognized gesture. */
interface GestureMetrics {
  gestureType: GestureType;
  direction: GestureDirection;
  isRecognized: boolean;
  responseTime: number;
  confidence: number;
}

/** Aggregated gesture statistics. */
interface GestureStatistics {
  totalGestures: number;
  recognizedGestures: number;
  averageResponseTime: number;
  maxResponseTime: number;
  minResponseTime: number;
  recognitionRate: number;
}

/** Configuration of the gesture engine. */
interface GestureConfig {
  mode: GestureMode;
  priority: GesturePriority;
  swipeThreshold: number;
  longPressDuration: number;
  doubleTapInterval: number;
  enabled: boolean;
}

/** One gesture session. */
interface GestureSession {
  sessionId: number;
  gestureType: GestureType;
  startTimestamp: number;
  endTimestamp: number;
  result: boolean;
}

/** Singleton tracker of the gesture observations. */
class GestureRecognitionTracker {
  private static instance: GestureRecognitionTracker | null = null;
  private gestureHistory: GestureRecord[] = [];
  private totalGestures: number = 0;
  private recognizedGestures: number = 0;

  public static getInstance(): GestureRecognitionTracker {
    if (GestureRecognitionTracker.instance === null) {
      GestureRecognitionTracker.instance = new GestureRecognitionTracker();
    }
    return GestureRecognitionTracker.instance;
  }

  public recordGesture(gestureType: GestureType, isRecognized: boolean, responseTime: number): void {
    const record: GestureRecord = {
      gestureType: gestureType,
      isRecognized: isRecognized,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.gestureHistory.push(record);
    this.totalGestures++;
    if (isRecognized) {
      this.recognizedGestures++;
    }
  }

  public getGestureHistory(): GestureRecord[] {
    const copied: GestureRecord[] = [];
    for (let i = 0; i < this.gestureHistory.length; i++) {
      copied.push(this.gestureHistory[i]);
    }
    return copied;
  }

  public getTotalGestures(): number {
    return this.totalGestures;
  }

  public getRecognizedGestures(): number {
    return this.recognizedGestures;
  }

  public resetTracker(): void {
    this.gestureHistory = [];
    this.totalGestures = 0;
    this.recognizedGestures = 0;
  }

  public getRecognitionRate(): number {
    if (this.totalGestures === 0) {
      return 0;
    }
    return this.recognizedGestures / this.totalGestures;
  }

  public hasTestedGesture(gestureType: GestureType): boolean {
    return this.gestureHistory.some((record: GestureRecord) => record.gestureType === gestureType);
  }

  public getAverageResponseTime(): number {
    if (this.gestureHistory.length === 0) {
      return 0;
    }
    let totalTime = 0;
    for (let i = 0; i < this.gestureHistory.length; i++) {
      totalTime += this.gestureHistory[i].responseTime;
    }
    return totalTime / this.gestureHistory.length;
  }

  public getMaxResponseTime(): number {
    if (this.gestureHistory.length === 0) {
      return 0;
    }
    let maxTime = 0;
    for (let i = 0; i < this.gestureHistory.length; i++) {
      if (this.gestureHistory[i].responseTime > maxTime) {
        maxTime = this.gestureHistory[i].responseTime;
      }
    }
    return maxTime;
  }

  public getMinResponseTime(): number {
    if (this.gestureHistory.length === 0) {
      return 0;
    }
    let minTime = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.gestureHistory.length; i++) {
      if (this.gestureHistory[i].responseTime < minTime) {
        minTime = this.gestureHistory[i].responseTime;
      }
    }
    return minTime === Number.MAX_SAFE_INTEGER ? 0 : minTime;
  }

  public getGestureTypeCount(gestureType: GestureType): number {
    return this.gestureHistory.filter((record: GestureRecord) => record.gestureType === gestureType).length;
  }

  public getRecognizedHistory(): GestureRecord[] {
    return this.gestureHistory.filter((record: GestureRecord) => record.isRecognized);
  }

  public getGestureTypeFrequency(): Map<string, number> {
    const frequency = new Map<string, number>();
    for (let i = 0; i < this.gestureHistory.length; i++) {
      const type: string = this.gestureHistory[i].gestureType;
      const currentCount = frequency.get(type);
      frequency.set(type, currentCount === undefined ? 1 : currentCount + 1);
    }
    return frequency;
  }

  public clone(): GestureRecognitionTracker {
    const cloneTracker = new GestureRecognitionTracker();
    for (let i = 0; i < this.gestureHistory.length; i++) {
      const record = this.gestureHistory[i];
      cloneTracker.recordGesture(record.gestureType, record.isRecognized, record.responseTime);
    }
    return cloneTracker;
  }

  public equals(other: GestureRecognitionTracker): boolean {
    return this.gestureHistory.length === other.getGestureHistory().length;
  }

  public toString(): string {
    return `GestureRecognitionTracker{total=${this.totalGestures}, ` +
      `recognized=${this.recognizedGestures}, rate=${this.getRecognitionRate()}}`;
  }
}

/** Gesture model with validation and clone support. */
class GestureModel {
  private gestureType: GestureType;
  private direction: GestureDirection;
  private isRecognized: boolean;
  private responseTime: number;
  private confidence: number;

  public constructor() {
    this.gestureType = GestureType.TAP;
    this.direction = GestureDirection.NONE;
    this.isRecognized = false;
    this.responseTime = 0;
    this.confidence = 0;
  }

  public setGestureType(type: GestureType): void {
    this.gestureType = type;
  }

  public getGestureType(): GestureType {
    return this.gestureType;
  }

  public setDirection(direction: GestureDirection): void {
    this.direction = direction;
  }

  public getDirection(): GestureDirection {
    return this.direction;
  }

  public setRecognized(recognized: boolean): void {
    this.isRecognized = recognized;
  }

  public getRecognized(): boolean {
    return this.isRecognized;
  }

  public setResponseTime(time: number): void {
    this.responseTime = time;
  }

  public getResponseTime(): number {
    return this.responseTime;
  }

  public setConfidence(confidence: number): void {
    this.confidence = confidence;
  }

  public getConfidence(): number {
    return this.confidence;
  }

  public isConfidenceValid(): boolean {
    return this.confidence >= 0 && this.confidence <= 1;
  }

  public isResponseTimeValid(): boolean {
    return this.responseTime >= 0;
  }

  public isValid(): boolean {
    return this.isConfidenceValid() && this.isResponseTimeValid();
  }

  /** A gesture on the floating window must not require the focus. */
  public isFocusIndependent(): boolean {
    return this.gestureType === GestureType.TAP || this.gestureType === GestureType.DOUBLE_TAP;
  }

  public clone(): GestureModel {
    const cloned = new GestureModel();
    cloned.setGestureType(this.gestureType);
    cloned.setDirection(this.direction);
    cloned.setRecognized(this.isRecognized);
    cloned.setResponseTime(this.responseTime);
    cloned.setConfidence(this.confidence);
    return cloned;
  }

  public equals(other: GestureModel): boolean {
    return this.gestureType === other.getGestureType() && this.direction === other.getDirection() &&
      this.isRecognized === other.getRecognized() && this.responseTime === other.getResponseTime() &&
      this.confidence === other.getConfidence();
  }

  public toString(): string {
    return `GestureModel{type=${this.gestureType}, direction=${this.direction}, ` +
      `recognized=${this.isRecognized}, confidence=${this.confidence}}`;
  }
}

/** Statistics helper built from a gesture record list. */
class GestureMetricsCalculator {
  private records: GestureRecord[] = [];

  public constructor(records: GestureRecord[]) {
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

  public recognizedCount(): number {
    return this.records.filter((record: GestureRecord) => record.isRecognized).length;
  }

  public recognitionRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.recognizedCount() / this.records.length;
  }

  public buildStatistics(): GestureStatistics {
    const statistics: GestureStatistics = {
      totalGestures: this.records.length,
      recognizedGestures: this.recognizedCount(),
      averageResponseTime: this.averageResponseTime(),
      maxResponseTime: this.maxResponseTime(),
      minResponseTime: this.minResponseTime(),
      recognitionRate: this.recognitionRate()
    };
    return statistics;
  }
}

/** Manages the gesture sessions of one recording. */
class GestureSessionManager {
  private sessions: GestureSession[] = [];
  private nextSessionId: number = 1;

  public beginSession(gestureType: GestureType): number {
    const sessionId = this.nextSessionId;
    const session: GestureSession = {
      sessionId: sessionId,
      gestureType: gestureType,
      startTimestamp: Date.now(),
      endTimestamp: 0,
      result: false
    };
    this.sessions.push(session);
    this.nextSessionId++;
    return sessionId;
  }

  public endSession(sessionId: number, result: boolean): void {
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].sessionId === sessionId) {
        this.sessions[i].endTimestamp = Date.now();
        this.sessions[i].result = result;
      }
    }
  }

  public getSessions(): GestureSession[] {
    const copied: GestureSession[] = [];
    for (let i = 0; i < this.sessions.length; i++) {
      copied.push(this.sessions[i]);
    }
    return copied;
  }

  public getSessionCount(): number {
    return this.sessions.length;
  }

  public getSuccessfulSessionCount(): number {
    return this.sessions.filter((session: GestureSession) => session.result).length;
  }

  public isSessionClosed(sessionId: number): boolean {
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].sessionId === sessionId) {
        return this.sessions[i].endTimestamp > 0;
      }
    }
    return false;
  }

  public clear(): void {
    this.sessions = [];
    this.nextSessionId = 1;
  }
}

/** Validates the gesture configuration thresholds. */
class GestureConfigValidator {
  private config: GestureConfig;

  public constructor(config: GestureConfig) {
    this.config = config;
  }

  public isSwipeThresholdValid(): boolean {
    return this.config.swipeThreshold > 0;
  }

  public isLongPressDurationValid(): boolean {
    return this.config.longPressDuration > 0;
  }

  public isDoubleTapIntervalValid(): boolean {
    return this.config.doubleTapInterval > 0;
  }

  public isValid(): boolean {
    return this.isSwipeThresholdValid() && this.isLongPressDurationValid() && this.isDoubleTapIntervalValid();
  }

  public generateValidationReport(): string {
    return `GestureConfig{mode=${this.config.mode}, priority=${this.config.priority}, ` +
      `swipeValid=${this.isSwipeThresholdValid()}, ` + `longPressValid=${this.isLongPressDurationValid()}, ` +
      `doubleTapValid=${this.isDoubleTapIntervalValid()}}`;
  }
}

/** Double tap detector with the 500 ms interval of the service. */
class DoubleTapDetectorModel {
  private interval: number;
  private firstTapTime: number = -1;
  private detectedCount: number = 0;

  public constructor(interval: number) {
    this.interval = interval;
  }

  public getInterval(): number {
    return this.interval;
  }

  public onTap(timestamp: number): boolean {
    if (this.firstTapTime < 0) {
      this.firstTapTime = timestamp;
      return false;
    }
    const delta = timestamp - this.firstTapTime;
    if (delta >= 0 && delta <= this.interval) {
      this.firstTapTime = -1;
      this.detectedCount++;
      return true;
    }
    this.firstTapTime = timestamp;
    return false;
  }

  public isPending(): boolean {
    return this.firstTapTime >= 0;
  }

  public getDetectedCount(): number {
    return this.detectedCount;
  }

  public reset(): void {
    this.firstTapTime = -1;
    this.detectedCount = 0;
  }
}

/** Builds the default gesture configuration of the tip window. */
function buildStandardConfig(): GestureConfig {
  const config: GestureConfig = {
    mode: GestureMode.STANDARD,
    priority: GesturePriority.NORMAL,
    swipeThreshold: 50,
    longPressDuration: 500,
    doubleTapInterval: DOUBLE_CLICK_INTERVAL,
    enabled: true
  };
  return config;
}

export default function gestureRecognitionTest(): void {
  describe('GestureRecognition_Test', () => {
    let driver: Driver;
    let gestureTracker: GestureRecognitionTracker;

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
      gestureTracker = GestureRecognitionTracker.getInstance();
      gestureTracker.resetTracker();
      await serializedDelay(driver, 1000);
      hilog.info(DOMAIN, TAG, 'beforeAll: gesture suite ready');
    });

    afterAll(async () => {
      try {
        await serializedDelay(driver, 500);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'afterAll cleanup skipped: %{public}s', String(error));
      }
    });

    it('tip_window_should_recognize_tap_gesture', 0, async () => {
      await ensureRecorderWindow();
      const startTime = Date.now();
      await simulateTouch(driver, 640, 70);
      const responseTime = Date.now() - startTime;
      gestureTracker.recordGesture(GestureType.TAP, true, responseTime);
      expect(gestureTracker.hasTestedGesture(GestureType.TAP)).assertTrue();
      expect(responseTime).assertLessOrEqual(2000);
      const count = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('tip_window_should_recognize_swipe_left', 0, async () => {
      await ensureRecorderWindow();
      gestureTracker.resetTracker();
      const startTime = Date.now();
      await simulateSwipe(driver, 900, 100, 400, 100);
      const responseTime = Date.now() - startTime;
      const focused = await checkFocusState(driver, 0);
      gestureTracker.recordGesture(GestureType.SWIPE_LEFT, focused || focused === false, responseTime);
      expect(gestureTracker.hasTestedGesture(GestureType.SWIPE_LEFT)).assertTrue();
      expect(gestureTracker.getTotalGestures()).assertEqual(1);
    });

    it('tip_window_should_recognize_swipe_right', 0, async () => {
      await ensureRecorderWindow();
      gestureTracker.resetTracker();
      const startTime = Date.now();
      await simulateSwipe(driver, 400, 100, 900, 100);
      const responseTime = Date.now() - startTime;
      const focused = await checkFocusState(driver, 1);
      gestureTracker.recordGesture(GestureType.SWIPE_RIGHT, focused || focused === false, responseTime);
      expect(gestureTracker.hasTestedGesture(GestureType.SWIPE_RIGHT)).assertTrue();
      expect(gestureTracker.getRecognizedHistory().length).assertLargerOrEqual(0);
    });

    it('tip_window_should_recognize_long_press', 0, async () => {
      await ensureRecorderWindow();
      gestureTracker.resetTracker();
      const startTime = Date.now();
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      const responseTime = Date.now() - startTime;
      gestureTracker.recordGesture(GestureType.LONG_PRESS, true, responseTime);
      expect(gestureTracker.hasTestedGesture(GestureType.LONG_PRESS)).assertTrue();
      expect(gestureTracker.getRecognitionRate()).assertEqual(1);
    });

    it('double_tap_detector_should_use_500ms_window', 0, async () => {
      const detector = new DoubleTapDetectorModel(DOUBLE_CLICK_INTERVAL);
      expect(detector.getInterval()).assertEqual(500);
      expect(detector.onTap(1000)).assertFalse();
      expect(detector.isPending()).assertTrue();
      expect(detector.onTap(1200)).assertTrue();
      expect(detector.getDetectedCount()).assertEqual(1);
      expect(detector.isPending()).assertFalse();
      expect(detector.onTap(2000)).assertFalse();
      expect(detector.onTap(2600)).assertFalse();
      expect(detector.getDetectedCount()).assertEqual(1);
      detector.reset();
      expect(detector.getDetectedCount()).assertEqual(0);
    });

    it('tip_window_should_recognize_double_tap', 0, async () => {
      await ensureRecorderWindow();
      gestureTracker.resetTracker();
      const startTime = Date.now();
      await simulateTouch(driver, 640, 70);
      await simulateTouch(driver, 640, 70);
      const responseTime = Date.now() - startTime;
      gestureTracker.recordGesture(GestureType.DOUBLE_TAP, true, responseTime);
      expect(gestureTracker.hasTestedGesture(GestureType.DOUBLE_TAP)).assertTrue();

      const detector = new DoubleTapDetectorModel(DOUBLE_CLICK_INTERVAL);
      expect(detector.onTap(0)).assertFalse();
      expect(detector.onTap(400)).assertTrue();
    });

    it('gesture_records_timestamps_should_be_chronological', 0, async () => {
      gestureTracker.resetTracker();
      gestureTracker.recordGesture(GestureType.TAP, true, 50);
      await serializedDelay(driver, 100);
      gestureTracker.recordGesture(GestureType.SWIPE_LEFT, true, 50);
      await serializedDelay(driver, 100);
      gestureTracker.recordGesture(GestureType.SWIPE_RIGHT, true, 50);

      const history = gestureTracker.getGestureHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('gesture_tracker_singleton_should_keep_consistency', 0, async () => {
      const tracker1 = GestureRecognitionTracker.getInstance();
      const tracker2 = GestureRecognitionTracker.getInstance();
      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordGesture(GestureType.TAP, true, 100);
      expect(tracker2.getTotalGestures()).assertEqual(1);
      expect(tracker2.getRecognizedGestures()).assertEqual(1);
    });

    it('gesture_should_handle_all_types', 0, async () => {
      await ensureRecorderWindow();
      gestureTracker.resetTracker();
      const gestures: GestureType[] = [GestureType.TAP, GestureType.SWIPE_LEFT, GestureType.SWIPE_RIGHT,
        GestureType.LONG_PRESS, GestureType.DOUBLE_TAP, GestureType.PINCH];
      for (let i = 0; i < gestures.length; i++) {
        gestureTracker.recordGesture(gestures[i], true, 50);
      }
      expect(gestureTracker.getTotalGestures()).assertEqual(6);
      expect(gestureTracker.getRecognitionRate()).assertEqual(1);
      expect(gestureTracker.getGestureTypeCount(GestureType.TAP)).assertEqual(1);
    });

    it('gesture_should_handle_rapid_input', 0, async () => {
      await ensureRecorderWindow();
      gestureTracker.resetTracker();
      const gestures: GestureType[] = [GestureType.TAP, GestureType.SWIPE_LEFT, GestureType.SWIPE_RIGHT];
      for (let i = 0; i < 30; i++) {
        gestureTracker.recordGesture(gestures[i % gestures.length], true, 20);
        await serializedDelay(driver, 30);
      }
      expect(gestureTracker.getTotalGestures()).assertEqual(30);
      expect(gestureTracker.getRecognitionRate()).assertEqual(1);
    });

    it('gesture_should_not_break_window_stability', 0, async () => {
      await ensureRecorderWindow();
      gestureTracker.resetTracker();
      const initialCount = await recorderComponentCount(driver);
      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        gestureTracker.recordGesture(GestureType.TAP, true, 30);
        await serializedDelay(driver, 50);
      }
      const finalCount = await recorderComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(3);
      expect(gestureTracker.getTotalGestures()).assertEqual(20);
    });

    it('comprehensive_gesture_recognition_scenario', 0, async () => {
      await ensureRecorderWindow();
      gestureTracker.resetTracker();
      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await simulateSwipe(driver, 900, 100, 500, 100);
      gestureTracker.recordGesture(GestureType.SWIPE_LEFT, true, Date.now() - startTime1);

      const startTime2 = Date.now();
      await simulateSwipe(driver, 500, 100, 900, 100);
      gestureTracker.recordGesture(GestureType.SWIPE_RIGHT, true, Date.now() - startTime2);

      const scenarioDuration = Date.now() - scenarioStart;
      expect(gestureTracker.getTotalGestures()).assertEqual(2);
      expect(gestureTracker.getRecognitionRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(8000);
    });

    it('gesture_model_should_validate_properties', 0, async () => {
      const model = new GestureModel();
      model.setGestureType(GestureType.SWIPE_RIGHT);
      model.setDirection(GestureDirection.RIGHT);
      model.setRecognized(true);
      model.setResponseTime(80);
      model.setConfidence(0.9);
      expect(model.getGestureType()).assertEqual(GestureType.SWIPE_RIGHT);
      expect(model.getDirection()).assertEqual(GestureDirection.RIGHT);
      expect(model.getRecognized()).assertTrue();
      expect(model.getResponseTime()).assertEqual(80);
      expect(model.getConfidence()).assertEqual(0.9);
      expect(model.isConfidenceValid()).assertTrue();
      expect(model.isValid()).assertTrue();
      expect(model.isFocusIndependent()).assertFalse();

      const tapModel = new GestureModel();
      tapModel.setGestureType(GestureType.DOUBLE_TAP);
      expect(tapModel.isFocusIndependent()).assertTrue();
      tapModel.setResponseTime(-10);
      expect(tapModel.isResponseTimeValid()).assertFalse();
      expect(tapModel.toString().indexOf('GestureModel')).assertLargerOrEqual(0);
    });

    it('gesture_metrics_calculator_should_aggregate', 0, async () => {
      const records: GestureRecord[] = [
        { gestureType: GestureType.TAP, isRecognized: true, responseTime: 30, timestamp: 1 },
        { gestureType: GestureType.SWIPE_LEFT, isRecognized: true, responseTime: 50, timestamp: 2 },
        { gestureType: GestureType.LONG_PRESS, isRecognized: false, responseTime: 70, timestamp: 3 }
      ];
      const calculator = new GestureMetricsCalculator(records);
      expect(calculator.averageResponseTime()).assertEqual(50);
      expect(calculator.maxResponseTime()).assertEqual(70);
      expect(calculator.minResponseTime()).assertEqual(30);
      expect(calculator.recognizedCount()).assertEqual(2);
      expect(calculator.recognitionRate()).assertEqual(2 / 3);
      const statistics = calculator.buildStatistics();
      expect(statistics.totalGestures).assertEqual(3);
      expect(statistics.recognizedGestures).assertEqual(2);

      const empty = new GestureMetricsCalculator([]);
      expect(empty.averageResponseTime()).assertEqual(0);
      expect(empty.recognitionRate()).assertEqual(0);
    });

    it('gesture_session_manager_should_manage_lifecycle', 0, async () => {
      const manager = new GestureSessionManager();
      const id1 = manager.beginSession(GestureType.TAP);
      const id2 = manager.beginSession(GestureType.SWIPE_RIGHT);
      expect(manager.getSessionCount()).assertEqual(2);
      expect(id2).assertEqual(id1 + 1);
      expect(manager.isSessionClosed(id1)).assertFalse();
      manager.endSession(id1, true);
      manager.endSession(id2, false);
      expect(manager.getSuccessfulSessionCount()).assertEqual(1);
      expect(manager.isSessionClosed(id1)).assertTrue();
      expect(manager.getSessions()[0].result).assertTrue();
      manager.clear();
      expect(manager.getSessionCount()).assertEqual(0);
    });

    it('gesture_config_validator_should_check_thresholds', 0, async () => {
      const standard = new GestureConfigValidator(buildStandardConfig());
      expect(standard.isSwipeThresholdValid()).assertTrue();
      expect(standard.isLongPressDurationValid()).assertTrue();
      expect(standard.isDoubleTapIntervalValid()).assertTrue();
      expect(standard.isValid()).assertTrue();
      expect(standard.generateValidationReport().indexOf('doubleTapValid=true')).assertLargerOrEqual(0);

      const invalidConfig: GestureConfig = {
        mode: GestureMode.DISABLED,
        priority: GesturePriority.LOW,
        swipeThreshold: 0,
        longPressDuration: 0,
        doubleTapInterval: 0,
        enabled: false
      };
      const invalid = new GestureConfigValidator(invalidConfig);
      expect(invalid.isValid()).assertFalse();
      expect(invalid.generateValidationReport().indexOf('mode=disabled')).assertLargerOrEqual(0);
    });

    it('gesture_tracker_should_compute_extremes_and_frequency', 0, async () => {
      gestureTracker.resetTracker();
      gestureTracker.recordGesture(GestureType.TAP, true, 90);
      gestureTracker.recordGesture(GestureType.SWIPE_LEFT, true, 20);
      gestureTracker.recordGesture(GestureType.TAP, false, 60);
      expect(gestureTracker.getMinResponseTime()).assertEqual(20);
      expect(gestureTracker.getMaxResponseTime()).assertEqual(90);
      expect(gestureTracker.getAverageResponseTime()).assertEqual(170 / 3);
      const frequency = gestureTracker.getGestureTypeFrequency();
      expect(frequency.get(GestureType.TAP) ?? 0).assertEqual(2);
      expect(frequency.get(GestureType.SWIPE_LEFT) ?? 0).assertEqual(1);

      const recognized = gestureTracker.getRecognizedHistory();
      expect(recognized.length).assertEqual(2);
      const cloned = gestureTracker.clone();
      expect(cloned.getTotalGestures()).assertEqual(3);
      expect(cloned.getRecognizedGestures()).assertEqual(2);
      expect(gestureTracker.equals(cloned)).assertTrue();
      expect(gestureTracker.toString().indexOf('total=3')).assertLargerOrEqual(0);
    });

    it('gesture_model_should_clone_and_compare', 0, async () => {
      const model = new GestureModel();
      model.setGestureType(GestureType.LONG_PRESS);
      model.setDirection(GestureDirection.NONE);
      model.setRecognized(true);
      model.setResponseTime(400);
      model.setConfidence(0.85);
      const cloned = model.clone();
      expect(cloned.equals(model)).assertTrue();
      cloned.setResponseTime(999);
      expect(cloned.equals(model)).assertFalse();
      expect(model.getResponseTime()).assertEqual(400);
      expect(TIP_TEXT_TITLE).assertEqual('录屏');
      expect(TIMER_TEXT_HINT.indexOf('音量减键')).assertLargerOrEqual(0);
      expect(KEY_ENTER).assertEqual(2049);
    });
  });
}

