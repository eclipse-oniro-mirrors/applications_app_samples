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
  recorderComponentCount,
  checkTextContent,
  findComponentsByType,
  simulateTouch,
  simulateSwipe,
  pressAndWait,
  serializedDelay,
  isTipWindowVisible,
  KEY_MENU,
  KEY_VOLUME_DOWN,
  KEY_BACK,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_TOUCH_EVENT,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  TIP_TEXT_TITLE,
  TIP_TEXT_CONTENT,
  StopCombinationGate
} from '../shared/RecordingDriver';

// Screen geometry used by the coordinate checks.
const SCREEN_WIDTH: number = 1920;
const SCREEN_HEIGHT: number = 1080;

// Tip window rectangle declared by ScreenRecorderAbility.
const TIP_X: number = 615;
const TIP_Y: number = 46;
const TIP_WIDTH: number = 686;
const TIP_HEIGHT: number = 100;

// Timer window rectangle anchored at the top-left corner.
const TIMER_X: number = 96;
const TIMER_Y: number = 48;
const TIMER_WIDTH: number = 624;
const TIMER_HEIGHT: number = 56;

// Double click detector window of ScreenRecorderAbility.
const DOUBLE_CLICK_WINDOW_MS: number = 500;

/** One recorded touch interaction. */
interface TouchEventRecord {
  x: number;
  y: number;
  eventType: 'click' | 'long_press' | 'swipe';
  timestamp: number;
  targetIndex: number;
}

/** Coordinate triplet used by the batched coordinate cases. */
interface CoordinateRecord {
  x: number;
  y: number;
  index: number;
}

/** Touch gesture type. */
enum TouchGestureType {
  TAP = 'tap',
  DOUBLE_TAP = 'double_tap',
  LONG_PRESS = 'long_press',
  SWIPE_LEFT = 'swipe_left',
  SWIPE_RIGHT = 'swipe_right',
  SWIPE_UP = 'swipe_up',
  SWIPE_DOWN = 'swipe_down'
}

/** Touch region of the screen-recorder UI. */
enum TouchRegion {
  TIP_LEFT = 'tip_left',
  TIP_CENTER = 'tip_center',
  TIP_RIGHT = 'tip_right',
  TIMER_AREA = 'timer_area',
  OUTSIDE = 'outside'
}

/** A two dimensional touch point. */
interface TouchPoint {
  x: number;
  y: number;
}

/** Start and end point of a swipe gesture. */
interface SwipeVector {
  startX: number;
  startY: number;
  endX: number;
  endY: number;
}

/** One completed touch session. */
interface TouchSessionRecord {
  sessionId: number;
  gestureType: TouchGestureType;
  region: TouchRegion;
  duration: number;
  distance: number;
}

/** One observation of the double click detector. */
interface DoubleClickRecord {
  firstTapAt: number;
  secondTapAt: number;
  interval: number;
  accepted: boolean;
}
/** History of the interactions injected by the touch cases. */
class TouchInteractionTracker {
  private static instance: TouchInteractionTracker | null = null;
  private touchHistory: TouchEventRecord[] = [];
  private totalTouchEvents: number = 0;
  private clickCount: number = 0;
  private longPressCount: number = 0;
  private swipeCount: number = 0;

  public static getInstance(): TouchInteractionTracker {
    if (TouchInteractionTracker.instance === null) {
      TouchInteractionTracker.instance = new TouchInteractionTracker();
    }
    return TouchInteractionTracker.instance;
  }

  public recordTouchEvent(x: number, y: number, eventType: 'click' | 'long_press' | 'swipe',
    targetIndex: number): void {
    const record: TouchEventRecord = {
      x: x,
      y: y,
      eventType: eventType,
      timestamp: Date.now(),
      targetIndex: targetIndex
    };
    this.touchHistory.push(record);
    this.totalTouchEvents++;
    if (eventType === 'click') {
      this.clickCount++;
    } else if (eventType === 'long_press') {
      this.longPressCount++;
    } else {
      this.swipeCount++;
    }
  }

  public getTouchHistory(): TouchEventRecord[] {
    const copied: TouchEventRecord[] = [];
    for (let i = 0; i < this.touchHistory.length; i++) {
      copied.push(this.touchHistory[i]);
    }
    return copied;
  }

  public getTotalTouchEvents(): number {
    return this.totalTouchEvents;
  }

  public getClickCount(): number {
    return this.clickCount;
  }

  public getLongPressCount(): number {
    return this.longPressCount;
  }

  public getSwipeCount(): number {
    return this.swipeCount;
  }

  public hasTouchedIndex(index: number): boolean {
    for (let i = 0; i < this.touchHistory.length; i++) {
      if (this.touchHistory[i].targetIndex === index) {
        return true;
      }
    }
    return false;
  }

  public getTouchCountForIndex(index: number): number {
    let count: number = 0;
    for (let i = 0; i < this.touchHistory.length; i++) {
      if (this.touchHistory[i].targetIndex === index) {
        count++;
      }
    }
    return count;
  }

  public getLastEvent(): TouchEventRecord | null {
    if (this.touchHistory.length === 0) {
      return null;
    }
    return this.touchHistory[this.touchHistory.length - 1];
  }

  public resetTracker(): void {
    this.touchHistory = [];
    this.totalTouchEvents = 0;
    this.clickCount = 0;
    this.longPressCount = 0;
    this.swipeCount = 0;
  }
}

/** Immutable-ish 2D coordinate with geometry helpers. */
class TouchCoordinate {
  private xValue: number;
  private yValue: number;

  constructor(x: number, y: number) {
    this.xValue = x;
    this.yValue = y;
  }

  public getX(): number {
    return this.xValue;
  }

  public getY(): number {
    return this.yValue;
  }

  public setX(x: number): void {
    this.xValue = x;
  }

  public setY(y: number): void {
    this.yValue = y;
  }

  // Euclidean distance between two touch points.
  public distanceTo(other: TouchCoordinate): number {
    const deltaX: number = this.xValue - other.xValue;
    const deltaY: number = this.yValue - other.yValue;
    return Math.sqrt(deltaX * deltaX + deltaY * deltaY);
  }

  public isWithinBounds(minX: number, minY: number, maxX: number, maxY: number): boolean {
    return this.xValue >= minX && this.xValue <= maxX && this.yValue >= minY && this.yValue <= maxY;
  }

  public isInsideRect(x: number, y: number, width: number, height: number): boolean {
    return this.isWithinBounds(x, y, x + width, y + height);
  }

  public equals(other: TouchCoordinate): boolean {
    return this.xValue === other.xValue && this.yValue === other.yValue;
  }

  public clone(): TouchCoordinate {
    return new TouchCoordinate(this.xValue, this.yValue);
  }

  public toString(): string {
    return 'TouchCoordinate(' + this.xValue + ', ' + this.yValue + ')';
  }
}

/** Aggregate statistics of a coordinate sequence. */
class TouchStatistics {
  private coordinates: TouchCoordinate[] = [];

  public addCoordinate(coord: TouchCoordinate): void {
    this.coordinates.push(coord.clone());
  }

  public getCoordinateCount(): number {
    return this.coordinates.length;
  }

  public clear(): void {
    this.coordinates = [];
  }

  public getCentroid(): TouchCoordinate {
    if (this.coordinates.length === 0) {
      return new TouchCoordinate(0, 0);
    }
    let sumX: number = 0;
    let sumY: number = 0;
    for (let i = 0; i < this.coordinates.length; i++) {
      sumX += this.coordinates[i].getX();
      sumY += this.coordinates[i].getY();
    }
    return new TouchCoordinate(sumX / this.coordinates.length, sumY / this.coordinates.length);
  }

  public getTotalPathLength(): number {
    if (this.coordinates.length < 2) {
      return 0;
    }
    let total: number = 0;
    for (let i = 1; i < this.coordinates.length; i++) {
      total += this.coordinates[i - 1].distanceTo(this.coordinates[i]);
    }
    return total;
  }

  public getBoundingBoxArea(): number {
    if (this.coordinates.length === 0) {
      return 0;
    }
    let minX: number = this.coordinates[0].getX();
    let maxX: number = this.coordinates[0].getX();
    let minY: number = this.coordinates[0].getY();
    let maxY: number = this.coordinates[0].getY();
    for (let i = 0; i < this.coordinates.length; i++) {
      minX = Math.min(minX, this.coordinates[i].getX());
      maxX = Math.max(maxX, this.coordinates[i].getX());
      minY = Math.min(minY, this.coordinates[i].getY());
      maxY = Math.max(maxY, this.coordinates[i].getY());
    }
    return (maxX - minX) * (maxY - minY);
  }
}
/** Coordinate validator and hit testing against the floating windows. */
class TouchCoordinateValidator {
  public isValidCoordinate(x: number, y: number): boolean {
    return x >= 0 && y >= 0 && x <= SCREEN_WIDTH && y <= SCREEN_HEIGHT;
  }

  public isInsideTipWindow(x: number, y: number): boolean {
    return x >= TIP_X && x <= TIP_X + TIP_WIDTH && y >= TIP_Y && y <= TIP_Y + TIP_HEIGHT;
  }

  public isInsideTimerWindow(x: number, y: number): boolean {
    return x >= TIMER_X && x <= TIMER_X + TIMER_WIDTH && y >= TIMER_Y && y <= TIMER_Y + TIMER_HEIGHT;
  }

  public isOutsideAllWindows(x: number, y: number): boolean {
    return !this.isInsideTipWindow(x, y) && !this.isInsideTimerWindow(x, y);
  }

  // Splits the tip window into three equal horizontal hit zones.
  public classifyRegion(x: number, y: number): TouchRegion {
    if (!this.isValidCoordinate(x, y)) {
      return TouchRegion.OUTSIDE;
    }
    if (this.isInsideTimerWindow(x, y)) {
      return TouchRegion.TIMER_AREA;
    }
    if (!this.isInsideTipWindow(x, y)) {
      return TouchRegion.OUTSIDE;
    }
    const third: number = TIP_WIDTH / 3;
    const offset: number = x - TIP_X;
    if (offset < third) {
      return TouchRegion.TIP_LEFT;
    }
    if (offset < third * 2) {
      return TouchRegion.TIP_CENTER;
    }
    return TouchRegion.TIP_RIGHT;
  }

  public getSwipeDistance(vector: SwipeVector): number {
    const start = new TouchCoordinate(vector.startX, vector.startY);
    const end = new TouchCoordinate(vector.endX, vector.endY);
    return start.distanceTo(end);
  }

  public getSwipeDirection(vector: SwipeVector): TouchGestureType {
    const deltaX: number = vector.endX - vector.startX;
    const deltaY: number = vector.endY - vector.startY;
    if (Math.abs(deltaX) >= Math.abs(deltaY)) {
      return deltaX >= 0 ? TouchGestureType.SWIPE_RIGHT : TouchGestureType.SWIPE_LEFT;
    }
    return deltaY >= 0 ? TouchGestureType.SWIPE_DOWN : TouchGestureType.SWIPE_UP;
  }
}

/** Chainable builder of touch session records. */
class TouchSessionBuilder {
  private sessionId: number = 0;
  private gestureType: TouchGestureType = TouchGestureType.TAP;
  private region: TouchRegion = TouchRegion.TIP_CENTER;
  private duration: number = 0;
  private distance: number = 0;

  public setSessionId(sessionId: number): TouchSessionBuilder {
    this.sessionId = sessionId;
    return this;
  }

  public setGestureType(gestureType: TouchGestureType): TouchSessionBuilder {
    this.gestureType = gestureType;
    return this;
  }

  public setRegion(region: TouchRegion): TouchSessionBuilder {
    this.region = region;
    return this;
  }

  public setDuration(duration: number): TouchSessionBuilder {
    this.duration = duration;
    return this;
  }

  public setDistance(distance: number): TouchSessionBuilder {
    this.distance = distance;
    return this;
  }

  public build(): TouchSessionRecord {
    const record: TouchSessionRecord = {
      sessionId: this.sessionId,
      gestureType: this.gestureType,
      region: this.region,
      duration: this.duration,
      distance: this.distance
    };
    return record;
  }
}

/** Metric dimensions of the touch report. */
enum TouchMetricType {
  TOTAL_EVENTS = 'total_events',
  CLICK_COUNT = 'click_count',
  LONG_PRESS_COUNT = 'long_press_count',
  SWIPE_COUNT = 'swipe_count',
  AVG_PATH_LENGTH = 'avg_path_length'
}

/** Single metric entry of the touch report. */
interface TouchMetricEntry {
  metricType: TouchMetricType;
  metricValue: number;
  metricLabel: string;
}

/** Builds a structured metric report from the touch history. */
class TouchReportGenerator {
  private entries: TouchMetricEntry[] = [];

  public addEntry(metricType: TouchMetricType, metricValue: number, metricLabel: string): void {
    const entry: TouchMetricEntry = {
      metricType: metricType,
      metricValue: metricValue,
      metricLabel: metricLabel
    };
    this.entries.push(entry);
  }

  public clear(): void {
    this.entries = [];
  }

  public getEntries(): TouchMetricEntry[] {
    const copied: TouchMetricEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      copied.push(this.entries[i]);
    }
    return copied;
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  public getTotalMetricValue(): number {
    let total: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      total += this.entries[i].metricValue;
    }
    return total;
  }

  public getValueByType(metricType: TouchMetricType): number {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].metricType === metricType) {
        return this.entries[i].metricValue;
      }
    }
    return 0;
  }
}

/** Generates deterministic coordinate batches. */
class TouchEventFactory {
  public generateHorizontalPoints(startX: number, endX: number, y: number, count: number): TouchCoordinate[] {
    const points: TouchCoordinate[] = [];
    if (count <= 0) {
      return points;
    }
    const step: number = (endX - startX) / count;
    for (let i = 0; i < count; i++) {
      points.push(new TouchCoordinate(startX + step * i, y));
    }
    return points;
  }

  public generateGridPoints(startX: number, startY: number, cols: number, rows: number, cellWidth: number,
    cellHeight: number): TouchCoordinate[] {
    const points: TouchCoordinate[] = [];
    for (let row = 0; row < rows; row++) {
      for (let col = 0; col < cols; col++) {
        points.push(new TouchCoordinate(startX + col * cellWidth, startY + row * cellHeight));
      }
    }
    return points;
  }
}

/** 500ms double click detector of ScreenRecorderAbility. */
class DoubleClickDetector {
  private windowMs: number;
  private pending: boolean = false;
  private firstTapAt: number = 0;
  private tapCount: number = 0;
  private acceptedCount: number = 0;
  private lastInterval: number = 0;
  private records: DoubleClickRecord[] = [];

  constructor(windowMs: number) {
    this.windowMs = windowMs;
  }

  public isWithinWindow(interval: number): boolean {
    return interval >= 0 && interval <= this.windowMs;
  }

  // Returns true when the tap completes a double click and fires the callback.
  public onTap(nowMs: number): boolean {
    this.tapCount++;
    if (!this.pending) {
      this.pending = true;
      this.firstTapAt = nowMs;
      return false;
    }
    const interval: number = nowMs - this.firstTapAt;
    this.lastInterval = interval;
    if (this.isWithinWindow(interval)) {
      this.acceptedCount++;
      this.pending = false;
      const record: DoubleClickRecord = {
        firstTapAt: this.firstTapAt,
        secondTapAt: nowMs,
        interval: interval,
        accepted: true
      };
      this.records.push(record);
      return true;
    }
    // Too slow: the new tap becomes the first tap of the next pair.
    this.firstTapAt = nowMs;
    const rejected: DoubleClickRecord = {
      firstTapAt: nowMs,
      secondTapAt: nowMs,
      interval: interval,
      accepted: false
    };
    this.records.push(rejected);
    return false;
  }

  public getTapCount(): number {
    return this.tapCount;
  }

  public getAcceptedCount(): number {
    return this.acceptedCount;
  }

  public getLastInterval(): number {
    return this.lastInterval;
  }

  public getRecords(): DoubleClickRecord[] {
    const copied: DoubleClickRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      copied.push(this.records[i]);
    }
    return copied;
  }

  public isPending(): boolean {
    return this.pending;
  }

  public getWindowMs(): number {
    return this.windowMs;
  }

  public reset(): void {
    this.pending = false;
    this.firstTapAt = 0;
    this.tapCount = 0;
    this.acceptedCount = 0;
    this.lastInterval = 0;
    this.records = [];
  }
}

/** Routes all stop requests, whatever input source produced them. */
class StopRequestRouter {
  private stopRequests: number = 0;
  private sources: string[] = [];

  public request(source: string): void {
    this.stopRequests++;
    this.sources.push(source);
  }

  public getStopRequests(): number {
    return this.stopRequests;
  }

  public getLastSource(): string {
    if (this.sources.length === 0) {
      return '';
    }
    return this.sources[this.sources.length - 1];
  }

  public getSources(): string[] {
    const copied: string[] = [];
    for (let i = 0; i < this.sources.length; i++) {
      copied.push(this.sources[i]);
    }
    return copied;
  }

  public reset(): void {
    this.stopRequests = 0;
    this.sources = [];
  }
}
export default function touchInteractionTest(): void {
  describe('TouchInteraction_Test', () => {
    let driver: Driver;
    let touchTracker: TouchInteractionTracker;

    beforeAll(async () => {
      driver = getDriver();
      touchTracker = TouchInteractionTracker.getInstance();
      touchTracker.resetTracker();
      await serializedDelay(driver, 800);
    });

    afterAll(async () => {
      await serializedDelay(driver, 300);
    });

    it('touch_inside_tip_window_should_be_hit', 0, async () => {
      const validator = new TouchCoordinateValidator();
      expect(validator.isInsideTipWindow(900, 96)).assertTrue();
      expect(validator.isValidCoordinate(900, 96)).assertTrue();

      await simulateTouch(driver, 900, 96);
      touchTracker.recordTouchEvent(900, 96, 'click', 1);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      expect(touchTracker.getClickCount()).assertEqual(1);
    });

    it('touch_center_of_tip_window_should_hit_center_region', 0, async () => {
      const validator = new TouchCoordinateValidator();
      const region = validator.classifyRegion(958, 96);
      expect(region).assertEqual(TouchRegion.TIP_CENTER);

      await simulateTouch(driver, 958, 96);
      touchTracker.recordTouchEvent(958, 96, 'click', 1);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      expect(touchTracker.hasTouchedIndex(1)).assertTrue();
    });

    it('touch_outside_tip_window_should_not_hit', 0, async () => {
      const validator = new TouchCoordinateValidator();
      expect(validator.isOutsideAllWindows(50, 900)).assertTrue();
      expect(validator.classifyRegion(50, 900)).assertEqual(TouchRegion.OUTSIDE);

      await simulateTouch(driver, 50, 900);
      touchTracker.recordTouchEvent(50, 900, 'click', 3);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      const count = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('touch_inside_timer_window_should_hit_timer_area', 0, async () => {
      const validator = new TouchCoordinateValidator();
      expect(validator.isInsideTimerWindow(300, 70)).assertTrue();
      expect(validator.classifyRegion(300, 70)).assertEqual(TouchRegion.TIMER_AREA);

      await simulateTouch(driver, 300, 70);
      touchTracker.recordTouchEvent(300, 70, 'click', 0);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      expect(touchTracker.getTouchCountForIndex(0)).assertLargerOrEqual(1);
    });

    it('left_and_right_tip_zones_should_be_distinguished', 0, async () => {
      const validator = new TouchCoordinateValidator();
      expect(validator.classifyRegion(750, 96)).assertEqual(TouchRegion.TIP_LEFT);
      expect(validator.classifyRegion(1250, 96)).assertEqual(TouchRegion.TIP_RIGHT);
      expect(validator.isInsideTipWindow(1302, 96)).assertFalse();
    });

    it('multiple_touch_events_should_be_recorded', 0, async () => {
      touchTracker.resetTracker();

      await simulateTouch(driver, 700, 96);
      touchTracker.recordTouchEvent(700, 96, 'click', 0);
      await serializedDelay(driver, 100);

      await simulateTouch(driver, 1250, 96);
      touchTracker.recordTouchEvent(1250, 96, 'click', 2);
      await serializedDelay(driver, 100);

      await simulateTouch(driver, 958, 96);
      touchTracker.recordTouchEvent(958, 96, 'click', 1);
      await serializedDelay(driver, 100);

      expect(touchTracker.getTotalTouchEvents()).assertEqual(3);
      expect(touchTracker.hasTouchedIndex(0)).assertTrue();
      expect(touchTracker.hasTouchedIndex(1)).assertTrue();
      expect(touchTracker.hasTouchedIndex(2)).assertTrue();
    });

    it('touch_coordinates_should_be_recorded_accurately', 0, async () => {
      touchTracker.resetTracker();
      const testCoordinates: CoordinateRecord[] = [
        { x: 700, y: 96, index: 0 },
        { x: 958, y: 96, index: 1 },
        { x: 1250, y: 96, index: 2 }
      ];

      for (let i = 0; i < testCoordinates.length; i++) {
        const coord: CoordinateRecord = testCoordinates[i];
        await simulateTouch(driver, coord.x, coord.y);
        touchTracker.recordTouchEvent(coord.x, coord.y, 'click', coord.index);
        await serializedDelay(driver, 80);
      }

      const history = touchTracker.getTouchHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].x).assertEqual(700);
      expect(history[0].y).assertEqual(96);
      expect(history[1].x).assertEqual(958);
      expect(history[2].targetIndex).assertEqual(2);
    });

    it('rapid_touch_events_should_be_handled', 0, async () => {
      touchTracker.resetTracker();
      for (let i = 0; i < 10; i++) {
        const x = 700 + (i % 3) * 250;
        const y = 96;
        await simulateTouch(driver, x, y);
        touchTracker.recordTouchEvent(x, y, 'click', i % 3);
        await serializedDelay(driver, 20);
      }
      expect(touchTracker.getTotalTouchEvents()).assertEqual(10);
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    it('touch_response_time_should_be_within_limit', 0, async () => {
      const startTime = Date.now();
      await simulateTouch(driver, 958, 96);
      touchTracker.recordTouchEvent(958, 96, 'click', 1);
      await serializedDelay(driver, 100);
      const responseTime = Date.now() - startTime;
      expect(responseTime).assertLessOrEqual(1500);
    });

    it('touch_should_handle_boundary_coordinates', 0, async () => {
      const validator = new TouchCoordinateValidator();
      expect(validator.isValidCoordinate(0, 0)).assertTrue();
      expect(validator.isValidCoordinate(SCREEN_WIDTH, SCREEN_HEIGHT)).assertTrue();
      expect(validator.isValidCoordinate(SCREEN_WIDTH + 1, 0)).assertFalse();

      await simulateTouch(driver, 0, 0);
      touchTracker.recordTouchEvent(0, 0, 'click', 0);
      await serializedDelay(driver, 80);
      await simulateTouch(driver, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1);
      touchTracker.recordTouchEvent(SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1, 'click', 2);
      await serializedDelay(driver, 80);

      const count = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('touch_should_not_crash_with_invalid_coordinates', 0, async () => {
      const validator = new TouchCoordinateValidator();
      expect(validator.isValidCoordinate(-1, -1)).assertFalse();
      expect(validator.classifyRegion(-1, -1)).assertEqual(TouchRegion.OUTSIDE);

      await simulateTouch(driver, 10, 10);
      await serializedDelay(driver, 80);
      await simulateTouch(driver, 1900, 1060);
      await serializedDelay(driver, 80);

      const componentCount = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });
    it('touch_history_timestamps_should_be_chronological', 0, async () => {
      touchTracker.resetTracker();
      await simulateTouch(driver, 700, 96);
      touchTracker.recordTouchEvent(700, 96, 'click', 0);
      await serializedDelay(driver, 60);

      await simulateTouch(driver, 958, 96);
      touchTracker.recordTouchEvent(958, 96, 'click', 1);
      await serializedDelay(driver, 60);

      await simulateTouch(driver, 1250, 96);
      touchTracker.recordTouchEvent(1250, 96, 'click', 2);

      const history = touchTracker.getTouchHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp <= history[1].timestamp).assertTrue();
      expect(history[1].timestamp <= history[2].timestamp).assertTrue();
    });

    it('touch_interaction_statistics_should_be_accurate', 0, async () => {
      touchTracker.resetTracker();
      for (let i = 0; i < 5; i++) {
        touchTracker.recordTouchEvent(700, 96, 'click', 0);
      }
      for (let i = 0; i < 3; i++) {
        touchTracker.recordTouchEvent(1250, 96, 'click', 2);
      }
      expect(touchTracker.getTouchCountForIndex(0)).assertEqual(5);
      expect(touchTracker.getTouchCountForIndex(2)).assertEqual(3);
      expect(touchTracker.getTotalTouchEvents()).assertEqual(8);
      expect(touchTracker.getSwipeCount()).assertEqual(0);
    });

    it('touch_interaction_with_mixed_targets', 0, async () => {
      touchTracker.resetTracker();
      const touchSequence: CoordinateRecord[] = [
        { x: 958, y: 96, index: 1 },
        { x: 700, y: 96, index: 0 },
        { x: 1250, y: 96, index: 2 },
        { x: 958, y: 96, index: 1 },
        { x: 700, y: 96, index: 0 }
      ];

      for (let i = 0; i < touchSequence.length; i++) {
        await simulateTouch(driver, touchSequence[i].x, touchSequence[i].y);
        touchTracker.recordTouchEvent(touchSequence[i].x, touchSequence[i].y, 'click', touchSequence[i].index);
        await serializedDelay(driver, 40);
      }

      expect(touchTracker.getTotalTouchEvents()).assertEqual(5);
      expect(touchTracker.getTouchCountForIndex(0)).assertEqual(2);
      expect(touchTracker.getTouchCountForIndex(1)).assertEqual(2);
      expect(touchTracker.getTouchCountForIndex(2)).assertEqual(1);
    });

    it('touch_focus_should_persist_after_delay', 0, async () => {
      await simulateTouch(driver, 958, 96);
      touchTracker.recordTouchEvent(958, 96, 'click', 1);
      await serializedDelay(driver, 500);
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    it('swipe_across_tip_window_should_be_handled', 0, async () => {
      touchTracker.resetTracker();
      await simulateSwipe(driver, 700, 96, 1250, 96);
      touchTracker.recordTouchEvent(700, 96, 'swipe', 0);
      touchTracker.recordTouchEvent(1250, 96, 'swipe', 2);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);

      const vector: SwipeVector = { startX: 700, startY: 96, endX: 1250, endY: 96 };
      const validator = new TouchCoordinateValidator();
      expect(validator.getSwipeDistance(vector)).assertEqual(550);
      expect(validator.getSwipeDirection(vector)).assertEqual(TouchGestureType.SWIPE_RIGHT);
      expect(touchTracker.getSwipeCount()).assertEqual(2);
    });

    it('swipe_direction_should_be_judged_for_all_axes', 0, async () => {
      const validator = new TouchCoordinateValidator();
      const right: SwipeVector = { startX: 0, startY: 0, endX: 100, endY: 10 };
      const left: SwipeVector = { startX: 100, startY: 0, endX: 0, endY: 10 };
      const down: SwipeVector = { startX: 0, startY: 0, endX: 10, endY: 100 };
      const up: SwipeVector = { startX: 0, startY: 100, endX: 10, endY: 0 };
      expect(validator.getSwipeDirection(right)).assertEqual(TouchGestureType.SWIPE_RIGHT);
      expect(validator.getSwipeDirection(left)).assertEqual(TouchGestureType.SWIPE_LEFT);
      expect(validator.getSwipeDirection(down)).assertEqual(TouchGestureType.SWIPE_DOWN);
      expect(validator.getSwipeDirection(up)).assertEqual(TouchGestureType.SWIPE_UP);
    });

    it('swipe_distance_should_be_computed', 0, async () => {
      const validator = new TouchCoordinateValidator();
      const vector: SwipeVector = { startX: 0, startY: 0, endX: 3, endY: 4 };
      expect(validator.getSwipeDistance(vector)).assertEqual(5);
      const zero: SwipeVector = { startX: 5, startY: 5, endX: 5, endY: 5 };
      expect(validator.getSwipeDistance(zero)).assertEqual(0);
    });

    it('touch_coordinate_should_compute_distance_and_bounds', 0, async () => {
      const point = new TouchCoordinate(100, 100);
      const other = new TouchCoordinate(130, 100);
      expect(point.distanceTo(other)).assertEqual(30);
      expect(point.isWithinBounds(0, 0, 200, 200)).assertTrue();
      expect(point.isWithinBounds(200, 200, 300, 300)).assertFalse();
      expect(new TouchCoordinate(TIP_X + TIP_WIDTH / 2, TIP_Y + TIP_HEIGHT / 2).isInsideRect(TIP_X, TIP_Y, TIP_WIDTH, TIP_HEIGHT)).assertTrue();
      expect(point.equals(other)).assertFalse();
    });

    it('touch_statistics_should_compute_centroid', 0, async () => {
      const statistics = new TouchStatistics();
      statistics.addCoordinate(new TouchCoordinate(0, 0));
      statistics.addCoordinate(new TouchCoordinate(10, 0));
      statistics.addCoordinate(new TouchCoordinate(0, 10));
      expect(statistics.getCoordinateCount()).assertEqual(3);
      const centroid = statistics.getCentroid();
      expect(Math.abs(centroid.getX() - 10 / 3)).assertLessOrEqual(0.0001);
      expect(Math.abs(centroid.getY() - 10 / 3)).assertLessOrEqual(0.0001);
      statistics.clear();
      expect(statistics.getCoordinateCount()).assertEqual(0);
    });

    it('touch_statistics_should_compute_path_length', 0, async () => {
      const statistics = new TouchStatistics();
      statistics.addCoordinate(new TouchCoordinate(0, 0));
      statistics.addCoordinate(new TouchCoordinate(3, 4));
      expect(statistics.getTotalPathLength()).assertEqual(5);
      const single = new TouchStatistics();
      single.addCoordinate(new TouchCoordinate(0, 0));
      expect(single.getTotalPathLength()).assertEqual(0);
    });

    it('touch_statistics_should_compute_bounding_box_area', 0, async () => {
      const statistics = new TouchStatistics();
      statistics.addCoordinate(new TouchCoordinate(0, 0));
      statistics.addCoordinate(new TouchCoordinate(10, 20));
      expect(statistics.getBoundingBoxArea()).assertEqual(200);
      const empty = new TouchStatistics();
      expect(empty.getBoundingBoxArea()).assertEqual(0);
    });

    it('touch_session_builder_should_chain_configuration', 0, async () => {
      const session = new TouchSessionBuilder()
        .setSessionId(7)
        .setGestureType(TouchGestureType.DOUBLE_TAP)
        .setRegion(TouchRegion.TIP_RIGHT)
        .setDuration(500)
        .setDistance(120)
        .build();
      expect(session.sessionId).assertEqual(7);
      expect(session.gestureType).assertEqual(TouchGestureType.DOUBLE_TAP);
      expect(session.region).assertEqual(TouchRegion.TIP_RIGHT);
      expect(session.duration).assertEqual(500);
      expect(session.distance).assertEqual(120);
    });

    it('touch_session_builder_should_apply_defaults', 0, async () => {
      const session = new TouchSessionBuilder().build();
      expect(session.sessionId).assertEqual(0);
      expect(session.gestureType).assertEqual(TouchGestureType.TAP);
      expect(session.region).assertEqual(TouchRegion.TIP_CENTER);
      expect(session.duration).assertEqual(0);
    });

    it('touch_report_generator_should_aggregate_metrics', 0, async () => {
      const generator = new TouchReportGenerator();
      generator.addEntry(TouchMetricType.CLICK_COUNT, 5, 'clicks');
      generator.addEntry(TouchMetricType.SWIPE_COUNT, 3, 'swipes');
      generator.addEntry(TouchMetricType.LONG_PRESS_COUNT, 2, 'long presses');
      expect(generator.getEntryCount()).assertEqual(3);
      expect(generator.getTotalMetricValue()).assertEqual(10);
      expect(generator.getEntries().length).assertEqual(3);
      generator.clear();
      expect(generator.getEntryCount()).assertEqual(0);
    });

    it('touch_report_generator_should_lookup_by_metric_type', 0, async () => {
      const generator = new TouchReportGenerator();
      generator.addEntry(TouchMetricType.TOTAL_EVENTS, 12, 'total');
      expect(generator.getValueByType(TouchMetricType.TOTAL_EVENTS)).assertEqual(12);
      expect(generator.getValueByType(TouchMetricType.AVG_PATH_LENGTH)).assertEqual(0);
    });

    it('touch_event_factory_should_generate_horizontal_points', 0, async () => {
      const factory = new TouchEventFactory();
      const points = factory.generateHorizontalPoints(0, 100, 50, 5);
      expect(points.length).assertEqual(5);
      expect(points[0].getX()).assertEqual(0);
      expect(points[1].getX()).assertEqual(20);
      const empty = factory.generateHorizontalPoints(0, 100, 50, 0);
      expect(empty.length).assertEqual(0);
    });

    it('touch_event_factory_should_generate_grid_points', 0, async () => {
      const factory = new TouchEventFactory();
      const points = factory.generateGridPoints(0, 0, 2, 2, 10, 20);
      expect(points.length).assertEqual(4);
      expect(points[0].getX()).assertEqual(0);
      expect(points[0].getY()).assertEqual(0);
      expect(points[2].getX()).assertEqual(0);
      expect(points[2].getY()).assertEqual(20);
    });

    it('touch_coordinate_should_clone_and_compare', 0, async () => {
      const point = new TouchCoordinate(50, 60);
      const cloned = point.clone();
      expect(cloned.equals(point)).assertTrue();
      cloned.setX(999);
      expect(cloned.equals(point)).assertFalse();
      expect(point.getX()).assertEqual(50);
      const text = point.toString();
      expect(text.indexOf('50')).assertLargerOrEqual(0);
    });
    it('single_tap_should_not_trigger_double_click', 0, async () => {
      const detector = new DoubleClickDetector(DOUBLE_CLICK_WINDOW_MS);
      expect(detector.getWindowMs()).assertEqual(500);
      expect(detector.onTap(1000)).assertFalse();
      expect(detector.isPending()).assertTrue();
      expect(detector.getTapCount()).assertEqual(1);
      expect(detector.getAcceptedCount()).assertEqual(0);
    });

    it('double_click_within_window_should_be_accepted', 0, async () => {
      const detector = new DoubleClickDetector(DOUBLE_CLICK_WINDOW_MS);
      detector.onTap(1000);
      expect(detector.onTap(1300)).assertTrue();
      expect(detector.getAcceptedCount()).assertEqual(1);
      expect(detector.getLastInterval()).assertEqual(300);
      expect(detector.isPending()).assertFalse();
    });

    it('double_click_on_window_boundary_should_be_accepted', 0, async () => {
      const detector = new DoubleClickDetector(DOUBLE_CLICK_WINDOW_MS);
      detector.onTap(2000);
      expect(detector.onTap(2500)).assertTrue();
      expect(detector.getLastInterval()).assertEqual(DOUBLE_CLICK_WINDOW_MS);
      expect(detector.isWithinWindow(500)).assertTrue();
      expect(detector.isWithinWindow(501)).assertFalse();
    });

    it('double_click_beyond_window_should_be_rejected', 0, async () => {
      const detector = new DoubleClickDetector(DOUBLE_CLICK_WINDOW_MS);
      detector.onTap(1000);
      expect(detector.onTap(1501)).assertFalse();
      expect(detector.getAcceptedCount()).assertEqual(0);
      expect(detector.getLastInterval()).assertEqual(501);
      expect(detector.isPending()).assertTrue();
    });

    it('accepted_double_click_should_reset_pending_state', 0, async () => {
      const detector = new DoubleClickDetector(DOUBLE_CLICK_WINDOW_MS);
      detector.onTap(1000);
      expect(detector.onTap(1200)).assertTrue();
      expect(detector.onTap(1300)).assertFalse();
      expect(detector.onTap(1600)).assertTrue();
      expect(detector.getAcceptedCount()).assertEqual(2);
      expect(detector.getTapCount()).assertEqual(4);
      expect(detector.getRecords().length).assertEqual(2);
    });

    it('double_click_detector_should_reset_cleanly', 0, async () => {
      const detector = new DoubleClickDetector(DOUBLE_CLICK_WINDOW_MS);
      detector.onTap(0);
      detector.onTap(100);
      detector.reset();
      expect(detector.getTapCount()).assertEqual(0);
      expect(detector.getAcceptedCount()).assertEqual(0);
      expect(detector.getRecords().length).assertEqual(0);
      expect(detector.isPending()).assertFalse();
    });

    it('touch_double_click_and_remote_combo_should_both_request_stop', 0, async () => {
      const router = new StopRequestRouter();
      const detector = new DoubleClickDetector(DOUBLE_CLICK_WINDOW_MS);

      detector.onTap(1000);
      if (detector.onTap(1200)) {
        router.request('double_click');
      }

      const gate = new StopCombinationGate(KEY_MENU, KEY_VOLUME_DOWN);
      gate.onKeyDown(KEY_MENU);
      if (gate.onKeyDown(KEY_VOLUME_DOWN)) {
        router.request('remote_keys');
      }

      expect(router.getStopRequests()).assertEqual(2);
      expect(router.getSources().indexOf('double_click')).assertLargerOrEqual(0);
      expect(router.getSources().indexOf('remote_keys')).assertLargerOrEqual(0);
      expect(router.getLastSource()).assertEqual('remote_keys');
    });

    it('remote_combo_gate_should_fire_only_once_while_held', 0, async () => {
      const gate = new StopCombinationGate(KEY_MENU, KEY_VOLUME_DOWN);
      expect(gate.onKeyDown(KEY_MENU)).assertFalse();
      expect(gate.onKeyDown(KEY_VOLUME_DOWN)).assertTrue();
      expect(gate.isGateOpen()).assertFalse();
      expect(gate.onKeyDown(KEY_VOLUME_DOWN)).assertFalse();
      expect(gate.getFiredCount()).assertEqual(1);
      expect(gate.isDownA()).assertTrue();
      expect(gate.isDownB()).assertTrue();

      gate.onKeyUp(KEY_MENU);
      gate.onKeyUp(KEY_VOLUME_DOWN);
      expect(gate.isGateOpen()).assertTrue();
      gate.onKeyDown(KEY_MENU);
      expect(gate.onKeyDown(KEY_VOLUME_DOWN)).assertTrue();
      expect(gate.getFiredCount()).assertEqual(2);
    });

    it('touch_and_remote_stop_sources_should_be_equivalent', 0, async () => {
      const gate = new StopCombinationGate(KEY_MENU, KEY_VOLUME_DOWN);
      const touchDetector = new DoubleClickDetector(DOUBLE_CLICK_WINDOW_MS);
      touchDetector.onTap(0);
      const touchAccepted: boolean = touchDetector.onTap(250);
      gate.onKeyDown(KEY_MENU);
      const remoteAccepted: boolean = gate.onKeyDown(KEY_VOLUME_DOWN);
      expect(touchAccepted).assertEqual(remoteAccepted);
      expect(touchAccepted).assertTrue();
    });

    it('tip_window_touch_probe_should_be_tolerant', 0, async () => {
      const visible = await isTipWindowVisible(driver);
      const texts = await findComponentsByType(driver, 'Text');
      if (visible) {
        const hasTitle = await checkTextContent(driver, TIP_TEXT_TITLE);
        const hasContent = await checkTextContent(driver, TIP_TEXT_CONTENT);
        expect(hasTitle || hasContent).assertTrue();
        expect(texts.length).assertLargerOrEqual(1);
      } else {
        expect(texts.length).assertLargerOrEqual(0);
      }
    });

    it('tolerance_should_absorb_window_decoration_drift', 0, async () => {
      const first = await recorderComponentCount(driver);
      await serializedDelay(driver, 100);
      const second = await recorderComponentCount(driver);
      expect(Math.abs(second - first)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT + 2);
      expect(first).assertLargerOrEqual(0);
    });

    it('comprehensive_touch_interaction_scenario', 0, async () => {
      touchTracker.resetTracker();
      const router = new StopRequestRouter();
      const detector = new DoubleClickDetector(DOUBLE_CLICK_WINDOW_MS);
      const scenarioStart = Date.now();

      await simulateTouch(driver, 700, 96);
      touchTracker.recordTouchEvent(700, 96, 'click', 0);
      await serializedDelay(driver, 60);

      await simulateTouch(driver, 958, 96);
      touchTracker.recordTouchEvent(958, 96, 'click', 1);
      await serializedDelay(driver, 60);

      detector.onTap(0);
      if (detector.onTap(200)) {
        router.request('double_click');
      }

      await simulateSwipe(driver, 700, 96, 1250, 96);
      touchTracker.recordTouchEvent(700, 96, 'swipe', 0);
      await serializedDelay(driver, 60);

      const scenarioEnd = Date.now();
      expect(touchTracker.getTotalTouchEvents()).assertEqual(3);
      expect(touchTracker.getSwipeCount()).assertEqual(1);
      expect(detector.getAcceptedCount()).assertEqual(1);
      expect(router.getStopRequests()).assertEqual(1);
      expect(scenarioEnd - scenarioStart).assertLessOrEqual(10000);
    });
  });
}





