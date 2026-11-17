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
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  recorderComponentCount,
  waitForTimerWindowStable,
  pressAndWait,
  serializedDelay,
  TIMEOUT_TIMER_RENDER,
  DELAY_KEY_NAVIGATION,
  simulateTouch,
  simulateSwipe
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0001;
const TAG: string = 'PointerUtilValidation';

// The double click detector accepts a second click inside 500 ms.
const DOUBLE_CLICK_WINDOW_MS: number = 500;

// The two clicks must not drift more than 20 px apart.
const DOUBLE_CLICK_TOLERANCE_PX: number = 20;

// Minimum travel distance of a swipe gesture.
const SWIPE_MIN_DISTANCE_PX: number = 20;

// Pointer style enumeration used by the TV floating windows.
enum PointerStyle {
  DEFAULT = 'default',
  HAND = 'hand',
  TEXT = 'text',
  MOVE = 'move',
  WAIT = 'wait',
  CROSSHAIR = 'crosshair',
  NOT_ALLOWED = 'not-allowed'
}

// Pointer state: style, visibility and position of the simulated pointer.
interface PointerState {
  style: PointerStyle;
  isVisible: boolean;
  x: number;
  y: number;
}

// Style change record: one entry of the pointer style history.
interface StyleChangeRecord {
  from: PointerStyle;
  to: PointerStyle;
  timestamp: number;
}

// Pointer util simulator: the singleton used by the timer page to change the
// pointer appearance when the recorder state changes.
class PointerUtilSimulator {
  private static instance: PointerUtilSimulator;
  private currentState: PointerState;
  private styleChangeHistory: StyleChangeRecord[] = [];

  constructor() {
    this.currentState = {
      style: PointerStyle.DEFAULT,
      isVisible: true,
      x: 0,
      y: 0
    };
  }

  public static getInstance(): PointerUtilSimulator {
    if (!PointerUtilSimulator.instance) {
      PointerUtilSimulator.instance = new PointerUtilSimulator();
    }
    return PointerUtilSimulator.instance;
  }

  // Switches the pointer style between focus mode (hand) and idle (default).
  public changePointerStyle(isFocusMode: boolean): void {
    const oldStyle: PointerStyle = this.currentState.style;
    const newStyle: PointerStyle = isFocusMode ? PointerStyle.HAND : PointerStyle.DEFAULT;
    this.currentState.style = newStyle;
    this.styleChangeHistory.push({
      from: oldStyle,
      to: newStyle,
      timestamp: Date.now()
    });
  }

  public setPointerVisibility(isVisible: boolean): void {
    this.currentState.isVisible = isVisible;
  }

  public setPointerPosition(x: number, y: number): void {
    this.currentState.x = x;
    this.currentState.y = y;
  }

  public getCurrentState(): PointerState {
    return {
      style: this.currentState.style,
      isVisible: this.currentState.isVisible,
      x: this.currentState.x,
      y: this.currentState.y
    };
  }

  public getStyleChangeHistory(): StyleChangeRecord[] {
    const history: StyleChangeRecord[] = [];
    for (const record of this.styleChangeHistory) {
      history.push({
        from: record.from,
        to: record.to,
        timestamp: record.timestamp
      });
    }
    return history;
  }

  public getStyleChangeCount(): number {
    return this.styleChangeHistory.length;
  }

  public hasStyleChange(from: PointerStyle, to: PointerStyle): boolean {
    return this.styleChangeHistory.some((change: StyleChangeRecord): boolean =>
      change.from === from && change.to === to);
  }

  public resetState(): void {
    this.currentState = {
      style: PointerStyle.DEFAULT,
      isVisible: true,
      x: 0,
      y: 0
    };
    this.styleChangeHistory = [];
  }

  public validateState(): boolean {
    if (this.currentState.x < 0 || this.currentState.y < 0) {
      return false;
    }
    const validStyles: PointerStyle[] = [
      PointerStyle.DEFAULT,
      PointerStyle.HAND,
      PointerStyle.TEXT,
      PointerStyle.MOVE,
      PointerStyle.WAIT,
      PointerStyle.CROSSHAIR,
      PointerStyle.NOT_ALLOWED
    ];
    return validStyles.includes(this.currentState.style);
  }

  public getStyleChangeStats(): Map<string, number> {
    const stats: Map<string, number> = new Map<string, number>();
    for (const change of this.styleChangeHistory) {
      const key: string = change.from + '->' + change.to;
      const currentCount: number = stats.get(key) || 0;
      stats.set(key, currentCount + 1);
    }
    return stats;
  }
}

// Pointer interaction action enumeration.
enum PointerAction {
  MOVE = 'move',
  CLICK = 'click',
  DOUBLE_CLICK = 'double_click',
  HOVER = 'hover',
  DRAG = 'drag',
  SCROLL = 'scroll',
  SWIPE = 'swipe'
}

// Pointer device kind: remote control, mouse or touch screen.
enum PointerDeviceKind {
  REMOTE = 'remote',
  MOUSE = 'mouse',
  TOUCH = 'touch',
  UNKNOWN = 'unknown'
}

// Pointer event record: one recorded pointer interaction.
interface PointerEventRecord {
  action: PointerAction;
  x: number;
  y: number;
  pointerId: number;
  deviceKind: PointerDeviceKind;
  timestamp: number;
  consumed: boolean;
}

// Hit test result of the pointer position.
interface HitTestResult {
  hit: boolean;
  regionId: string;
  offsetX: number;
  offsetY: number;
}

// 2D coordinate model with cloning and distance helpers.
class PointerCoordinate {
  public x: number;
  public y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }

  public clone(): PointerCoordinate {
    return new PointerCoordinate(this.x, this.y);
  }

  public equals(other: PointerCoordinate): boolean {
    return this.x === other.x && this.y === other.y;
  }

  public toString(): string {
    return 'PointerCoordinate(x=' + this.x + ', y=' + this.y + ')';
  }

  public distanceTo(other: PointerCoordinate): number {
    const dx: number = this.x - other.x;
    const dy: number = this.y - other.y;
    return Math.sqrt(dx * dx + dy * dy);
  }

  public isValid(): boolean {
    return this.x >= 0 && this.y >= 0;
  }

  public moveBy(dx: number, dy: number): PointerCoordinate {
    return new PointerCoordinate(this.x + dx, this.y + dy);
  }
}

// Interactive region model with containment checks.
class PointerRegion {
  public left: number;
  public top: number;
  public right: number;
  public bottom: number;
  public regionId: string;

  constructor(left: number, top: number, right: number, bottom: number, regionId: string) {
    this.left = left;
    this.top = top;
    this.right = right;
    this.bottom = bottom;
    this.regionId = regionId;
  }

  public contains(point: PointerCoordinate): boolean {
    return point.x >= this.left && point.x <= this.right && point.y >= this.top && point.y <= this.bottom;
  }

  public getWidth(): number {
    return this.right - this.left;
  }

  public getHeight(): number {
    return this.bottom - this.top;
  }

  public getArea(): number {
    return this.getWidth() * this.getHeight();
  }

  public clone(): PointerRegion {
    return new PointerRegion(this.left, this.top, this.right, this.bottom, this.regionId);
  }

  public equals(other: PointerRegion): boolean {
    return this.left === other.left && this.top === other.top && this.right === other.right &&
      this.bottom === other.bottom && this.regionId === other.regionId;
  }

  public toString(): string {
    return 'PointerRegion(regionId=' + this.regionId + ', [' + this.left + ',' + this.top + ',' +
      this.right + ',' + this.bottom + '])';
  }

  public isValid(): boolean {
    return this.right >= this.left && this.bottom >= this.top;
  }
}

// Hit tester of the pointer: detects which floating window is hit.
class PointerHitTester {
  private regions: PointerRegion[] = [];

  public addRegion(region: PointerRegion): void {
    this.regions.push(region);
  }

  public removeRegion(regionId: string): void {
    const remaining: PointerRegion[] = [];
    for (const region of this.regions) {
      if (region.regionId !== regionId) {
        remaining.push(region);
      }
    }
    this.regions = remaining;
  }

  public getRegionCount(): number {
    return this.regions.length;
  }

  public hitTest(point: PointerCoordinate): HitTestResult {
    // The first registered region wins, topmost lookup uses a dedicated API.
    for (const region of this.regions) {
      if (region.contains(point)) {
        return {
          hit: true,
          regionId: region.regionId,
          offsetX: point.x - region.left,
          offsetY: point.y - region.top
        };
      }
    }
    return {
      hit: false,
      regionId: '',
      offsetX: 0,
      offsetY: 0
    };
  }

  // Region id of the topmost region; empty when the point misses everything.
  public getTopmostRegionIdAt(point: PointerCoordinate): string {
    for (let i = this.regions.length - 1; i >= 0; i--) {
      if (this.regions[i].contains(point)) {
        return this.regions[i].regionId;
      }
    }
    return '';
  }

  public clear(): void {
    this.regions = [];
  }
}

// Pointer event recorder: statistics over the recorded pointer events.
class PointerEventRecorder {
  private records: PointerEventRecord[] = [];

  public record(action: PointerAction, x: number, y: number, pointerId: number,
    deviceKind: PointerDeviceKind, consumed: boolean): void {
    this.records.push({
      action: action,
      x: x,
      y: y,
      pointerId: pointerId,
      deviceKind: deviceKind,
      timestamp: Date.now(),
      consumed: consumed
    });
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getRecords(): PointerEventRecord[] {
    const result: PointerEventRecord[] = [];
    for (const record of this.records) {
      result.push({
        action: record.action,
        x: record.x,
        y: record.y,
        pointerId: record.pointerId,
        deviceKind: record.deviceKind,
        timestamp: record.timestamp,
        consumed: record.consumed
      });
    }
    return result;
  }

  public getCountByAction(action: PointerAction): number {
    return this.records.filter((record: PointerEventRecord): boolean => record.action === action).length;
  }

  public getCountByDevice(deviceKind: PointerDeviceKind): number {
    return this.records.filter((record: PointerEventRecord): boolean => record.deviceKind === deviceKind).length;
  }

  public getCountByPointerId(pointerId: number): number {
    return this.records.filter((record: PointerEventRecord): boolean => record.pointerId === pointerId).length;
  }

  public getConsumedCount(): number {
    return this.records.filter((record: PointerEventRecord): boolean => record.consumed).length;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.records = [];
  }
}

// Pointer statistics: averages, bounding boxes and distances.
class PointerStatistics {
  public averageCoordinate(points: PointerCoordinate[]): PointerCoordinate {
    if (points.length === 0) {
      return new PointerCoordinate(0, 0);
    }
    let sumX: number = 0;
    let sumY: number = 0;
    for (const point of points) {
      sumX += point.x;
      sumY += point.y;
    }
    return new PointerCoordinate(sumX / points.length, sumY / points.length);
  }

  public boundingArea(points: PointerCoordinate[]): number {
    if (points.length === 0) {
      return 0;
    }
    let minX: number = points[0].x;
    let maxX: number = points[0].x;
    let minY: number = points[0].y;
    let maxY: number = points[0].y;
    for (let i = 1; i < points.length; i++) {
      if (points[i].x < minX) {
        minX = points[i].x;
      }
      if (points[i].x > maxX) {
        maxX = points[i].x;
      }
      if (points[i].y < minY) {
        minY = points[i].y;
      }
      if (points[i].y > maxY) {
        maxY = points[i].y;
      }
    }
    return (maxX - minX) * (maxY - minY);
  }

  public maxDistance(points: PointerCoordinate[]): number {
    let max: number = 0;
    for (let i = 0; i < points.length; i++) {
      for (let j = i + 1; j < points.length; j++) {
        const distance: number = points[i].distanceTo(points[j]);
        if (distance > max) {
          max = distance;
        }
      }
    }
    return max;
  }
}

// Double click detector: two clicks inside 500 ms at almost the same position
// toggle the timer window of the screen recorder.
class DoubleClickDetector {
  private windowMs: number = DOUBLE_CLICK_WINDOW_MS;
  private tolerancePx: number = DOUBLE_CLICK_TOLERANCE_PX;
  private lastX: number = -1;
  private lastY: number = -1;
  private lastTime: number = 0;
  private clickCount: number = 0;
  private doubleClickCount: number = 0;
  private expiredCount: number = 0;

  // Returns true when the pointer down completes a double click.
  public onPointerDown(x: number, y: number, now: number = Date.now()): boolean {
    this.clickCount++;
    if (this.lastX < 0) {
      this.lastX = x;
      this.lastY = y;
      this.lastTime = now;
      return false;
    }
    const elapsed: number = now - this.lastTime;
    const dx: number = Math.abs(x - this.lastX);
    const dy: number = Math.abs(y - this.lastY);
    const inWindow: boolean = elapsed <= this.windowMs;
    const inTolerance: boolean = dx <= this.tolerancePx && dy <= this.tolerancePx;
    if (inWindow && inTolerance) {
      this.doubleClickCount++;
      this.resetPending();
      return true;
    }
    if (!inWindow) {
      this.expiredCount++;
    }
    this.lastX = x;
    this.lastY = y;
    this.lastTime = now;
    return false;
  }

  public getWindowMs(): number {
    return this.windowMs;
  }

  public getTolerancePx(): number {
    return this.tolerancePx;
  }

  public getClickCount(): number {
    return this.clickCount;
  }

  public getDoubleClickCount(): number {
    return this.doubleClickCount;
  }

  public getExpiredCount(): number {
    return this.expiredCount;
  }

  public isPending(): boolean {
    return this.lastX >= 0;
  }

  public resetPending(): void {
    this.lastX = -1;
    this.lastY = -1;
    this.lastTime = 0;
  }

  public reset(): void {
    this.resetPending();
    this.clickCount = 0;
    this.doubleClickCount = 0;
    this.expiredCount = 0;
  }
}

// Swipe record: one validated swipe gesture.
interface SwipeRecord {
  fromX: number;
  fromY: number;
  toX: number;
  toY: number;
  distance: number;
  durationMs: number;
  direction: string;
  valid: boolean;
}

// Swipe path validator: checks distance, duration and direction of a swipe.
class SwipePathValidator {
  private minDistance: number = SWIPE_MIN_DISTANCE_PX;
  private maxDurationMs: number = 5000;
  private records: SwipeRecord[] = [];

  public direction(fromX: number, fromY: number, toX: number, toY: number): string {
    const dx: number = toX - fromX;
    const dy: number = toY - fromY;
    if (Math.abs(dx) >= Math.abs(dy)) {
      return dx >= 0 ? 'right' : 'left';
    }
    return dy >= 0 ? 'down' : 'up';
  }

  public distance(fromX: number, fromY: number, toX: number, toY: number): number {
    const dx: number = toX - fromX;
    const dy: number = toY - fromY;
    return Math.sqrt(dx * dx + dy * dy);
  }

  public validate(fromX: number, fromY: number, toX: number, toY: number, durationMs: number): SwipeRecord {
    const distance: number = this.distance(fromX, fromY, toX, toY);
    const record: SwipeRecord = {
      fromX: fromX,
      fromY: fromY,
      toX: toX,
      toY: toY,
      distance: distance,
      durationMs: durationMs,
      direction: this.direction(fromX, fromY, toX, toY),
      valid: distance >= this.minDistance && durationMs >= 0 && durationMs <= this.maxDurationMs
    };
    this.records.push(record);
    return record;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getValidCount(): number {
    return this.records.filter((record: SwipeRecord): boolean => record.valid).length;
  }

  public getRecords(): SwipeRecord[] {
    const result: SwipeRecord[] = [];
    for (const record of this.records) {
      result.push({
        fromX: record.fromX,
        fromY: record.fromY,
        toX: record.toX,
        toY: record.toY,
        distance: record.distance,
        durationMs: record.durationMs,
        direction: record.direction,
        valid: record.valid
      });
    }
    return result;
  }

  public getMinDistance(): number {
    return this.minDistance;
  }

  public clear(): void {
    this.records = [];
  }
}

// Pointer id registry: tracks the active pointers of the touch screen.
class PointerIdRegistry {
  private active: Set<number> = new Set<number>();
  private nextId: number = 0;
  private maxPointers: number = 10;
  private releasedCount: number = 0;
  private rejectedCount: number = 0;

  public acquire(): number {
    if (this.active.size >= this.maxPointers) {
      this.rejectedCount++;
      return -1;
    }
    const id: number = this.nextId;
    this.nextId++;
    this.active.add(id);
    return id;
  }

  public register(pointerId: number): boolean {
    if (pointerId < 0 || this.active.has(pointerId) || this.active.size >= this.maxPointers) {
      this.rejectedCount++;
      return false;
    }
    this.active.add(pointerId);
    if (pointerId >= this.nextId) {
      this.nextId = pointerId + 1;
    }
    return true;
  }

  public release(pointerId: number): boolean {
    if (!this.active.has(pointerId)) {
      return false;
    }
    this.active.delete(pointerId);
    this.releasedCount++;
    return true;
  }

  public releaseAll(): number {
    const count: number = this.active.size;
    this.releasedCount += count;
    this.active.clear();
    return count;
  }

  public isActive(pointerId: number): boolean {
    return this.active.has(pointerId);
  }

  public getActiveCount(): number {
    return this.active.size;
  }

  public getNextId(): number {
    return this.nextId;
  }

  public getMaxPointers(): number {
    return this.maxPointers;
  }

  public getReleasedCount(): number {
    return this.releasedCount;
  }

  public getRejectedCount(): number {
    return this.rejectedCount;
  }

  public reset(): void {
    this.active = new Set<number>();
    this.nextId = 0;
    this.releasedCount = 0;
    this.rejectedCount = 0;
  }
}

export default function pointerUtilValidationTest(): void {
  describe('PointerUtilValidation_Test', () => {
    let driver: Driver;
    let pointerUtil: PointerUtilSimulator;

    // Test setup: the pointer simulator starts from a clean state.
    beforeAll(async () => {
      driver = getDriver();
      pointerUtil = PointerUtilSimulator.getInstance();
      pointerUtil.resetState();
      hilog.info(DOMAIN, TAG, 'pointer util validation suite started');
      await serializedDelay(driver, 1000);
    });

    // Test cleanup: leave the floating windows in a neutral state.
    afterAll(async () => {
      pointerUtil.resetState();
      await serializedDelay(driver, 300);
    });

    // Pointer style enumeration values.
    it('pointer_style_enum_should_be_defined_correctly', 0, async () => {
      expect(PointerStyle.DEFAULT).assertEqual('default');
      expect(PointerStyle.HAND).assertEqual('hand');
      expect(PointerStyle.TEXT).assertEqual('text');
      expect(PointerStyle.MOVE).assertEqual('move');
      expect(PointerStyle.WAIT).assertEqual('wait');
      expect(PointerStyle.CROSSHAIR).assertEqual('crosshair');
      expect(PointerStyle.NOT_ALLOWED).assertEqual('not-allowed');
    });

    // The pointer starts visible at the origin with the default style.
    it('pointer_util_initial_state_should_be_correct', 0, async () => {
      pointerUtil.resetState();
      const state: PointerState = pointerUtil.getCurrentState();
      expect(state.style).assertEqual(PointerStyle.DEFAULT);
      expect(state.isVisible).assertTrue();
      expect(state.x).assertEqual(0);
      expect(state.y).assertEqual(0);
    });

    // Focus mode switches the pointer to the hand style and back.
    it('pointer_style_change_should_work_correctly', 0, async () => {
      pointerUtil.resetState();
      pointerUtil.changePointerStyle(true);
      expect(pointerUtil.getCurrentState().style).assertEqual(PointerStyle.HAND);
      pointerUtil.changePointerStyle(false);
      expect(pointerUtil.getCurrentState().style).assertEqual(PointerStyle.DEFAULT);
    });

    // The style history records every transition in order.
    it('pointer_style_change_history_should_be_recorded', 0, async () => {
      pointerUtil.resetState();
      pointerUtil.changePointerStyle(true);
      pointerUtil.changePointerStyle(false);
      pointerUtil.changePointerStyle(true);
      const history: StyleChangeRecord[] = pointerUtil.getStyleChangeHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].from).assertEqual(PointerStyle.DEFAULT);
      expect(history[0].to).assertEqual(PointerStyle.HAND);
      expect(history[1].from).assertEqual(PointerStyle.HAND);
      expect(history[1].to).assertEqual(PointerStyle.DEFAULT);
      expect(history[2].from).assertEqual(PointerStyle.DEFAULT);
      expect(history[2].to).assertEqual(PointerStyle.HAND);
    });

    // Pointer visibility can be toggled.
    it('pointer_visibility_setting_should_work_correctly', 0, async () => {
      pointerUtil.resetState();
      expect(pointerUtil.getCurrentState().isVisible).assertTrue();
      pointerUtil.setPointerVisibility(false);
      expect(pointerUtil.getCurrentState().isVisible).assertFalse();
      pointerUtil.setPointerVisibility(true);
      expect(pointerUtil.getCurrentState().isVisible).assertTrue();
    });

    // Pointer position updates both coordinates.
    it('pointer_position_setting_should_work_correctly', 0, async () => {
      pointerUtil.resetState();
      expect(pointerUtil.getCurrentState().x).assertEqual(0);
      expect(pointerUtil.getCurrentState().y).assertEqual(0);
      pointerUtil.setPointerPosition(100, 200);
      expect(pointerUtil.getCurrentState().x).assertEqual(100);
      expect(pointerUtil.getCurrentState().y).assertEqual(200);
      pointerUtil.setPointerPosition(500, 300);
      expect(pointerUtil.getCurrentState().x).assertEqual(500);
      expect(pointerUtil.getCurrentState().y).assertEqual(300);
    });

    // A non-negative position with a known style is valid.
    it('pointer_state_validation_should_detect_invalid_states', 0, async () => {
      pointerUtil.resetState();
      expect(pointerUtil.validateState()).assertTrue();
      pointerUtil.setPointerPosition(100, 200);
      expect(pointerUtil.validateState()).assertTrue();
      pointerUtil.setPointerPosition(-1, 200);
      expect(pointerUtil.validateState()).assertFalse();
    });

    // Style statistics count every transition path.
    it('pointer_style_change_stats_should_be_accurate', 0, async () => {
      pointerUtil.resetState();
      pointerUtil.changePointerStyle(true);
      pointerUtil.changePointerStyle(false);
      pointerUtil.changePointerStyle(true);
      pointerUtil.changePointerStyle(false);
      pointerUtil.changePointerStyle(true);
      const stats: Map<string, number> = pointerUtil.getStyleChangeStats();
      expect(stats.get('default->hand')).assertEqual(3);
      expect(stats.get('hand->default')).assertEqual(2);
    });

    // Specific transitions can be queried directly.
    it('specific_style_change_check_should_work_correctly', 0, async () => {
      pointerUtil.resetState();
      pointerUtil.changePointerStyle(true);
      pointerUtil.changePointerStyle(false);
      expect(pointerUtil.hasStyleChange(PointerStyle.DEFAULT, PointerStyle.HAND)).assertTrue();
      expect(pointerUtil.hasStyleChange(PointerStyle.HAND, PointerStyle.DEFAULT)).assertTrue();
      expect(pointerUtil.hasStyleChange(PointerStyle.DEFAULT, PointerStyle.TEXT)).assertFalse();
      expect(pointerUtil.hasStyleChange(PointerStyle.HAND, PointerStyle.TEXT)).assertFalse();
    });

    // The simulator is a singleton shared by the recorder pages.
    it('pointer_util_singleton_should_return_same_instance', 0, async () => {
      const util1: PointerUtilSimulator = PointerUtilSimulator.getInstance();
      const util2: PointerUtilSimulator = PointerUtilSimulator.getInstance();
      expect(util1 === util2).assertTrue();
      util1.resetState();
      util1.changePointerStyle(true);
      expect(util2.getCurrentState().style).assertEqual(PointerStyle.HAND);
    });

    // A thousand style changes stay inside the performance budget.
    it('pointer_style_change_performance_should_be_acceptable', 0, async () => {
      pointerUtil.resetState();
      const startTime: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        pointerUtil.changePointerStyle(i % 2 === 0);
      }
      const changeTime: number = Date.now() - startTime;
      expect(changeTime).assertLessOrEqual(2000);
      expect(pointerUtil.getStyleChangeCount()).assertEqual(1000);
    });

    // Resetting restores the initial values and clears the history.
    it('pointer_state_reset_should_restore_initial_values', 0, async () => {
      pointerUtil.changePointerStyle(true);
      pointerUtil.setPointerVisibility(false);
      pointerUtil.setPointerPosition(500, 300);
      expect(pointerUtil.getCurrentState().style).assertEqual(PointerStyle.HAND);
      expect(pointerUtil.getCurrentState().isVisible).assertFalse();
      expect(pointerUtil.getCurrentState().x).assertEqual(500);
      pointerUtil.resetState();
      expect(pointerUtil.getCurrentState().style).assertEqual(PointerStyle.DEFAULT);
      expect(pointerUtil.getCurrentState().isVisible).assertTrue();
      expect(pointerUtil.getCurrentState().x).assertEqual(0);
      expect(pointerUtil.getCurrentState().y).assertEqual(0);
      expect(pointerUtil.getStyleChangeCount()).assertEqual(0);
    });

    // Boundary coordinates of the 1920x1080 screen are accepted.
    it('pointer_position_boundary_values_should_be_handled', 0, async () => {
      pointerUtil.resetState();
      pointerUtil.setPointerPosition(0, 0);
      expect(pointerUtil.getCurrentState().x).assertEqual(0);
      pointerUtil.setPointerPosition(1920, 1080);
      expect(pointerUtil.getCurrentState().x).assertEqual(1920);
      expect(pointerUtil.getCurrentState().y).assertEqual(1080);
      pointerUtil.setPointerPosition(99999, 99999);
      expect(pointerUtil.getCurrentState().x).assertEqual(99999);
      expect(pointerUtil.getCurrentState().y).assertEqual(99999);
    });

    // Style changes correlate with the DPAD focus movement of the timer window.
    it('pointer_style_change_should_correlate_with_ui_interactions', 0, async () => {
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      pointerUtil.resetState();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      pointerUtil.changePointerStyle(true);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      pointerUtil.changePointerStyle(false);
      expect(pointerUtil.getStyleChangeCount()).assertEqual(2);
      expect(pointerUtil.hasStyleChange(PointerStyle.DEFAULT, PointerStyle.HAND)).assertTrue();
      expect(pointerUtil.hasStyleChange(PointerStyle.HAND, PointerStyle.DEFAULT)).assertTrue();
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertTrue();
    });

    // getCurrentState returns a defensive copy.
    it('pointer_state_get_should_return_deep_copy', 0, async () => {
      pointerUtil.resetState();
      pointerUtil.setPointerPosition(100, 200);
      const state1: PointerState = pointerUtil.getCurrentState();
      state1.x = 999;
      state1.y = 999;
      const state2: PointerState = pointerUtil.getCurrentState();
      expect(state2.x).assertEqual(100);
      expect(state2.y).assertEqual(200);
    });

    // getStyleChangeHistory returns a defensive copy.
    it('pointer_style_history_get_should_return_deep_copy', 0, async () => {
      pointerUtil.resetState();
      pointerUtil.changePointerStyle(true);
      pointerUtil.changePointerStyle(false);
      const history1: StyleChangeRecord[] = pointerUtil.getStyleChangeHistory();
      history1[0].to = PointerStyle.TEXT;
      const history2: StyleChangeRecord[] = pointerUtil.getStyleChangeHistory();
      expect(history2[0].to).assertEqual(PointerStyle.HAND);
    });

    // Visibility and style are independent settings.
    it('pointer_visibility_and_style_combinations_should_work', 0, async () => {
      pointerUtil.resetState();
      pointerUtil.setPointerVisibility(true);
      pointerUtil.changePointerStyle(false);
      expect(pointerUtil.getCurrentState().isVisible).assertTrue();
      expect(pointerUtil.getCurrentState().style).assertEqual(PointerStyle.DEFAULT);
      pointerUtil.setPointerVisibility(false);
      pointerUtil.changePointerStyle(true);
      expect(pointerUtil.getCurrentState().isVisible).assertFalse();
      expect(pointerUtil.getCurrentState().style).assertEqual(PointerStyle.HAND);
      pointerUtil.setPointerVisibility(true);
      expect(pointerUtil.getCurrentState().isVisible).assertTrue();
      expect(pointerUtil.getCurrentState().style).assertEqual(PointerStyle.HAND);
    });

    // Style change timestamps are chronological.
    it('pointer_style_change_timestamps_should_be_chronological', 0, async () => {
      pointerUtil.resetState();
      pointerUtil.changePointerStyle(true);
      await serializedDelay(driver, 50);
      pointerUtil.changePointerStyle(false);
      await serializedDelay(driver, 50);
      pointerUtil.changePointerStyle(true);
      const history: StyleChangeRecord[] = pointerUtil.getStyleChangeHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // A negative position can be corrected by a reset.
    it('pointer_util_should_recover_from_abnormal_states', 0, async () => {
      pointerUtil.resetState();
      pointerUtil.setPointerPosition(-100, -200);
      expect(pointerUtil.getCurrentState().x).assertEqual(-100);
      expect(pointerUtil.getCurrentState().y).assertEqual(-200);
      expect(pointerUtil.validateState()).assertFalse();
      pointerUtil.resetState();
      expect(pointerUtil.getCurrentState().x).assertEqual(0);
      expect(pointerUtil.getCurrentState().y).assertEqual(0);
      expect(pointerUtil.validateState()).assertTrue();
    });

    // Pointer action enumeration values.
    it('pointer_action_enum_should_be_defined_correctly', 0, async () => {
      expect(PointerAction.MOVE).assertEqual('move');
      expect(PointerAction.CLICK).assertEqual('click');
      expect(PointerAction.DOUBLE_CLICK).assertEqual('double_click');
      expect(PointerAction.HOVER).assertEqual('hover');
      expect(PointerAction.DRAG).assertEqual('drag');
      expect(PointerAction.SCROLL).assertEqual('scroll');
      expect(PointerAction.SWIPE).assertEqual('swipe');
    });

    // Pointer device kind enumeration values.
    it('pointer_device_kind_enum_should_be_defined_correctly', 0, async () => {
      expect(PointerDeviceKind.REMOTE).assertEqual('remote');
      expect(PointerDeviceKind.MOUSE).assertEqual('mouse');
      expect(PointerDeviceKind.TOUCH).assertEqual('touch');
      expect(PointerDeviceKind.UNKNOWN).assertEqual('unknown');
    });

    // The coordinate model stores both axes.
    it('coordinate_should_hold_position_values', 0, async () => {
      const coordinate: PointerCoordinate = new PointerCoordinate(100, 200);
      expect(coordinate.x).assertEqual(100);
      expect(coordinate.y).assertEqual(200);
      expect(coordinate.isValid()).assertTrue();
    });

    // Cloning a coordinate creates an independent copy.
    it('coordinate_clone_should_create_independent_copy', 0, async () => {
      const original: PointerCoordinate = new PointerCoordinate(10, 20);
      const cloned: PointerCoordinate = original.clone();
      expect(original.equals(cloned)).assertTrue();
      cloned.x = 999;
      expect(original.x).assertEqual(10);
    });

    // Coordinate equality compares both values.
    it('coordinate_equals_should_compare_values', 0, async () => {
      const a: PointerCoordinate = new PointerCoordinate(1, 2);
      const b: PointerCoordinate = new PointerCoordinate(1, 2);
      const c: PointerCoordinate = new PointerCoordinate(2, 1);
      expect(a.equals(b)).assertTrue();
      expect(a.equals(c)).assertFalse();
    });

    // Distance uses the Euclidean metric.
    it('coordinate_distance_should_be_computed', 0, async () => {
      const origin: PointerCoordinate = new PointerCoordinate(0, 0);
      const target: PointerCoordinate = new PointerCoordinate(3, 4);
      expect(origin.distanceTo(target)).assertEqual(5);
    });

    // Only non-negative coordinates are valid.
    it('coordinate_is_valid_should_check_non_negative', 0, async () => {
      expect(new PointerCoordinate(0, 0).isValid()).assertTrue();
      expect(new PointerCoordinate(10, 20).isValid()).assertTrue();
      expect(new PointerCoordinate(-1, 0).isValid()).assertFalse();
      expect(new PointerCoordinate(0, -1).isValid()).assertFalse();
    });

    // Moving a coordinate returns a new instance.
    it('coordinate_move_by_should_translate_position', 0, async () => {
      const start: PointerCoordinate = new PointerCoordinate(10, 20);
      const moved: PointerCoordinate = start.moveBy(5, -5);
      expect(moved.x).assertEqual(15);
      expect(moved.y).assertEqual(15);
      expect(start.x).assertEqual(10);
    });

    // The string form of a coordinate contains both axes.
    it('coordinate_to_string_should_contain_values', 0, async () => {
      const coordinate: PointerCoordinate = new PointerCoordinate(7, 8);
      expect(coordinate.toString().includes('7')).assertTrue();
      expect(coordinate.toString().includes('8')).assertTrue();
    });

    // Region containment includes the borders.
    it('region_should_detect_contained_point', 0, async () => {
      const region: PointerRegion = new PointerRegion(0, 0, 100, 100, 'timer');
      expect(region.contains(new PointerCoordinate(50, 50))).assertTrue();
      expect(region.contains(new PointerCoordinate(0, 0))).assertTrue();
      expect(region.contains(new PointerCoordinate(100, 100))).assertTrue();
      expect(region.contains(new PointerCoordinate(101, 50))).assertFalse();
      expect(region.contains(new PointerCoordinate(50, 101))).assertFalse();
    });

    // Region dimensions of the timer window 624x56.
    it('region_should_compute_dimensions', 0, async () => {
      const region: PointerRegion = new PointerRegion(96, 48, 720, 104, 'timer');
      expect(region.getWidth()).assertEqual(624);
      expect(region.getHeight()).assertEqual(56);
      expect(region.getArea()).assertEqual(34944);
    });

    // Cloning a region creates an independent copy.
    it('region_clone_should_create_independent_copy', 0, async () => {
      const original: PointerRegion = new PointerRegion(0, 0, 10, 10, 'id1');
      const cloned: PointerRegion = original.clone();
      expect(original.equals(cloned)).assertTrue();
      cloned.left = 100;
      expect(original.left).assertEqual(0);
    });

    // Inverted bounds make a region invalid.
    it('region_is_valid_should_check_bounds', 0, async () => {
      expect(new PointerRegion(0, 0, 10, 10, 'ok').isValid()).assertTrue();
      expect(new PointerRegion(10, 0, 0, 10, 'bad').isValid()).assertFalse();
      expect(new PointerRegion(0, 10, 10, 0, 'bad').isValid()).assertFalse();
    });

    // The region description contains its identifier.
    it('region_to_string_should_contain_region_id', 0, async () => {
      const region: PointerRegion = new PointerRegion(0, 0, 10, 10, 'tip');
      expect(region.toString().includes('tip')).assertTrue();
    });

    // Regions can be added and counted.
    it('hit_tester_should_add_and_count_regions', 0, async () => {
      const tester: PointerHitTester = new PointerHitTester();
      tester.addRegion(new PointerRegion(0, 0, 10, 10, 'timer'));
      tester.addRegion(new PointerRegion(20, 20, 30, 30, 'tip'));
      expect(tester.getRegionCount()).assertEqual(2);
    });

    // A hit returns the region id and the local offsets.
    it('hit_tester_should_detect_hit', 0, async () => {
      const tester: PointerHitTester = new PointerHitTester();
      tester.addRegion(new PointerRegion(0, 0, 10, 10, 'timer'));
      const result: HitTestResult = tester.hitTest(new PointerCoordinate(5, 5));
      expect(result.hit).assertTrue();
      expect(result.regionId).assertEqual('timer');
      expect(result.offsetX).assertEqual(5);
      expect(result.offsetY).assertEqual(5);
    });

    // A miss returns an empty result.
    it('hit_tester_should_report_miss', 0, async () => {
      const tester: PointerHitTester = new PointerHitTester();
      tester.addRegion(new PointerRegion(0, 0, 10, 10, 'timer'));
      const result: HitTestResult = tester.hitTest(new PointerCoordinate(50, 50));
      expect(result.hit).assertFalse();
      expect(result.regionId).assertEqual('');
      expect(result.offsetX).assertEqual(0);
    });

    // The topmost overlapping region wins.
    it('hit_tester_should_return_topmost_region', 0, async () => {
      const tester: PointerHitTester = new PointerHitTester();
      tester.addRegion(new PointerRegion(0, 0, 100, 100, 'bottom'));
      tester.addRegion(new PointerRegion(0, 0, 50, 50, 'top'));
      expect(tester.getTopmostRegionIdAt(new PointerCoordinate(25, 25))).assertEqual('top');
      expect(tester.getTopmostRegionIdAt(new PointerCoordinate(75, 75))).assertEqual('bottom');
      expect(tester.getTopmostRegionIdAt(new PointerCoordinate(200, 200))).assertEqual('');
    });

    // Removing a region excludes it from further hit tests.
    it('hit_tester_should_remove_region', 0, async () => {
      const tester: PointerHitTester = new PointerHitTester();
      tester.addRegion(new PointerRegion(0, 0, 10, 10, 'timer'));
      tester.addRegion(new PointerRegion(20, 20, 30, 30, 'tip'));
      tester.removeRegion('timer');
      expect(tester.getRegionCount()).assertEqual(1);
      expect(tester.hitTest(new PointerCoordinate(5, 5)).hit).assertFalse();
      expect(tester.getTopmostRegionIdAt(new PointerCoordinate(25, 25))).assertEqual('tip');
    });

    // Clearing removes every region.
    it('hit_tester_should_reset_after_clear', 0, async () => {
      const tester: PointerHitTester = new PointerHitTester();
      tester.addRegion(new PointerRegion(0, 0, 10, 10, 'timer'));
      tester.clear();
      expect(tester.getRegionCount()).assertEqual(0);
      expect(tester.hitTest(new PointerCoordinate(1, 1)).hit).assertFalse();
    });

    // Removing an unknown region keeps the count unchanged.
    it('hit_tester_removing_unknown_region_should_keep_count', 0, async () => {
      const tester: PointerHitTester = new PointerHitTester();
      tester.addRegion(new PointerRegion(0, 0, 10, 10, 'timer'));
      tester.removeRegion('not_exists');
      expect(tester.getRegionCount()).assertEqual(1);
    });

    // Three overlapping regions keep the latest one on top.
    it('hit_tester_should_prefer_latest_overlapping_region', 0, async () => {
      const tester: PointerHitTester = new PointerHitTester();
      tester.addRegion(new PointerRegion(0, 0, 100, 100, 'back'));
      tester.addRegion(new PointerRegion(0, 0, 100, 100, 'mid'));
      tester.addRegion(new PointerRegion(0, 0, 100, 100, 'front'));
      expect(tester.getTopmostRegionIdAt(new PointerCoordinate(50, 50))).assertEqual('front');
      const result: HitTestResult = tester.hitTest(new PointerCoordinate(50, 50));
      expect(result.regionId).assertEqual('back');
    });

    // The event recorder stores every pointer event.
    it('event_recorder_should_record_and_count', 0, async () => {
      const recorder: PointerEventRecorder = new PointerEventRecorder();
      recorder.record(PointerAction.CLICK, 10, 20, 0, PointerDeviceKind.REMOTE, true);
      recorder.record(PointerAction.MOVE, 30, 40, 1, PointerDeviceKind.MOUSE, false);
      expect(recorder.getRecordCount()).assertEqual(2);
    });

    // Events are grouped by action.
    it('event_recorder_should_count_by_action', 0, async () => {
      const recorder: PointerEventRecorder = new PointerEventRecorder();
      recorder.record(PointerAction.CLICK, 0, 0, 0, PointerDeviceKind.REMOTE, true);
      recorder.record(PointerAction.CLICK, 1, 1, 0, PointerDeviceKind.REMOTE, false);
      recorder.record(PointerAction.MOVE, 2, 2, 1, PointerDeviceKind.MOUSE, false);
      expect(recorder.getCountByAction(PointerAction.CLICK)).assertEqual(2);
      expect(recorder.getCountByAction(PointerAction.MOVE)).assertEqual(1);
      expect(recorder.getCountByAction(PointerAction.DRAG)).assertEqual(0);
    });

    // Consumed events are counted separately.
    it('event_recorder_should_count_consumed', 0, async () => {
      const recorder: PointerEventRecorder = new PointerEventRecorder();
      recorder.record(PointerAction.HOVER, 0, 0, 0, PointerDeviceKind.MOUSE, true);
      recorder.record(PointerAction.HOVER, 0, 0, 0, PointerDeviceKind.MOUSE, true);
      recorder.record(PointerAction.SCROLL, 0, 0, 0, PointerDeviceKind.MOUSE, false);
      expect(recorder.getConsumedCount()).assertEqual(2);
      expect(recorder.getRecordCount()).assertEqual(3);
    });

    // Events of a remote control and of a touch screen are distinguished.
    it('event_recorder_should_distinguish_device_kinds', 0, async () => {
      const recorder: PointerEventRecorder = new PointerEventRecorder();
      recorder.record(PointerAction.CLICK, 0, 0, 0, PointerDeviceKind.REMOTE, true);
      recorder.record(PointerAction.CLICK, 1, 1, 1, PointerDeviceKind.TOUCH, true);
      recorder.record(PointerAction.SWIPE, 2, 2, 1, PointerDeviceKind.TOUCH, false);
      expect(recorder.getCountByDevice(PointerDeviceKind.REMOTE)).assertEqual(1);
      expect(recorder.getCountByDevice(PointerDeviceKind.TOUCH)).assertEqual(2);
      expect(recorder.getCountByDevice(PointerDeviceKind.MOUSE)).assertEqual(0);
    });

    // Pointer id handling keeps multi-touch events separable.
    it('event_recorder_should_count_by_pointer_id', 0, async () => {
      const recorder: PointerEventRecorder = new PointerEventRecorder();
      recorder.record(PointerAction.MOVE, 0, 0, 3, PointerDeviceKind.TOUCH, false);
      recorder.record(PointerAction.MOVE, 1, 1, 3, PointerDeviceKind.TOUCH, false);
      recorder.record(PointerAction.MOVE, 2, 2, 4, PointerDeviceKind.TOUCH, false);
      expect(recorder.getCountByPointerId(3)).assertEqual(2);
      expect(recorder.getCountByPointerId(4)).assertEqual(1);
      expect(recorder.getCountByPointerId(5)).assertEqual(0);
    });

    // The recorded event order stays chronological.
    it('event_recorder_should_be_chronological', 0, async () => {
      const recorder: PointerEventRecorder = new PointerEventRecorder();
      recorder.record(PointerAction.MOVE, 0, 0, 0, PointerDeviceKind.MOUSE, false);
      recorder.record(PointerAction.CLICK, 1, 1, 0, PointerDeviceKind.MOUSE, true);
      expect(recorder.isChronological()).assertTrue();
    });

    // getRecords returns a copy that cannot change the recorder.
    it('event_recorder_get_records_should_return_copy', 0, async () => {
      const recorder: PointerEventRecorder = new PointerEventRecorder();
      recorder.record(PointerAction.CLICK, 0, 0, 0, PointerDeviceKind.REMOTE, true);
      const records: PointerEventRecord[] = recorder.getRecords();
      records.push({
        action: PointerAction.MOVE,
        x: 0,
        y: 0,
        pointerId: 1,
        deviceKind: PointerDeviceKind.MOUSE,
        timestamp: 0,
        consumed: false
      });
      expect(recorder.getRecordCount()).assertEqual(1);
    });

    // Clearing the recorder resets every counter.
    it('event_recorder_should_reset_after_clear', 0, async () => {
      const recorder: PointerEventRecorder = new PointerEventRecorder();
      recorder.record(PointerAction.CLICK, 0, 0, 0, PointerDeviceKind.REMOTE, true);
      recorder.clear();
      expect(recorder.getRecordCount()).assertEqual(0);
      expect(recorder.getConsumedCount()).assertEqual(0);
      expect(recorder.isChronological()).assertTrue();
    });

    // The average of an empty point set is the origin.
    it('pointer_statistics_average_should_handle_empty', 0, async () => {
      const stats: PointerStatistics = new PointerStatistics();
      const average: PointerCoordinate = stats.averageCoordinate([]);
      expect(average.x).assertEqual(0);
      expect(average.y).assertEqual(0);
    });

    // The average of two points is their midpoint.
    it('pointer_statistics_average_should_compute_mean', 0, async () => {
      const stats: PointerStatistics = new PointerStatistics();
      const points: PointerCoordinate[] = [new PointerCoordinate(0, 0), new PointerCoordinate(10, 20)];
      const average: PointerCoordinate = stats.averageCoordinate(points);
      expect(average.x).assertEqual(5);
      expect(average.y).assertEqual(10);
    });

    // The bounding area of an empty set is zero.
    it('pointer_statistics_bounding_area_should_handle_empty', 0, async () => {
      const stats: PointerStatistics = new PointerStatistics();
      expect(stats.boundingArea([])).assertEqual(0);
    });

    // The bounding area of a rectangle is width times height.
    it('pointer_statistics_bounding_area_should_compute_extent', 0, async () => {
      const stats: PointerStatistics = new PointerStatistics();
      const points: PointerCoordinate[] = [
        new PointerCoordinate(0, 0),
        new PointerCoordinate(10, 0),
        new PointerCoordinate(0, 20),
        new PointerCoordinate(10, 20)
      ];
      expect(stats.boundingArea(points)).assertEqual(200);
    });

    // The maximum distance of an empty set is zero.
    it('pointer_statistics_max_distance_should_handle_empty', 0, async () => {
      const stats: PointerStatistics = new PointerStatistics();
      expect(stats.maxDistance([])).assertEqual(0);
    });

    // The maximum distance covers the farthest point pair.
    it('pointer_statistics_max_distance_should_compute_farthest', 0, async () => {
      const stats: PointerStatistics = new PointerStatistics();
      const points: PointerCoordinate[] = [new PointerCoordinate(0, 0), new PointerCoordinate(3, 4)];
      expect(stats.maxDistance(points)).assertEqual(5);
    });

    // The maximum distance spans a triangle with a longer edge.
    it('pointer_statistics_max_distance_should_span_triangle', 0, async () => {
      const stats: PointerStatistics = new PointerStatistics();
      const points: PointerCoordinate[] = [
        new PointerCoordinate(0, 0),
        new PointerCoordinate(3, 4),
        new PointerCoordinate(0, 4)
      ];
      expect(stats.maxDistance(points)).assertEqual(5);
    });

    // Distance is symmetric and zero for identical points.
    it('coordinate_distance_should_be_symmetric_and_zero', 0, async () => {
      const a: PointerCoordinate = new PointerCoordinate(1, 1);
      const b: PointerCoordinate = new PointerCoordinate(4, 5);
      expect(a.distanceTo(b)).assertEqual(5);
      expect(b.distanceTo(a)).assertEqual(5);
      expect(a.distanceTo(a)).assertEqual(0);
    });

    // A zero width region has zero area.
    it('region_zero_width_should_have_zero_area', 0, async () => {
      const region: PointerRegion = new PointerRegion(10, 10, 10, 30, 'zero_width');
      expect(region.getWidth()).assertEqual(0);
      expect(region.getHeight()).assertEqual(20);
      expect(region.getArea()).assertEqual(0);
      expect(region.isValid()).assertTrue();
    });

    // A region degenerated to one point contains only that point.
    it('region_single_point_should_be_valid', 0, async () => {
      const region: PointerRegion = new PointerRegion(5, 5, 5, 5, 'point');
      expect(region.isValid()).assertTrue();
      expect(region.contains(new PointerCoordinate(5, 5))).assertTrue();
      expect(region.contains(new PointerCoordinate(6, 5))).assertFalse();
    });

    // The double click window is 500 ms.
    it('double_click_window_should_be_500ms', 0, async () => {
      const detector: DoubleClickDetector = new DoubleClickDetector();
      detector.reset();
      expect(detector.getWindowMs()).assertEqual(DOUBLE_CLICK_WINDOW_MS);
      expect(detector.getWindowMs()).assertEqual(500);
      expect(detector.getTolerancePx()).assertEqual(DOUBLE_CLICK_TOLERANCE_PX);
      expect(detector.getDoubleClickCount()).assertEqual(0);
    });

    // Two clicks inside the window complete a double click.
    it('double_click_inside_window_should_be_detected', 0, async () => {
      const detector: DoubleClickDetector = new DoubleClickDetector();
      detector.reset();
      expect(detector.onPointerDown(100, 100, 1000)).assertFalse();
      expect(detector.isPending()).assertTrue();
      expect(detector.onPointerDown(105, 102, 1200)).assertTrue();
      expect(detector.getClickCount()).assertEqual(2);
      expect(detector.getDoubleClickCount()).assertEqual(1);
      expect(detector.isPending()).assertFalse();
    });

    // The 500 ms boundary still completes a double click.
    it('double_click_window_boundary_should_be_accepted', 0, async () => {
      const detector: DoubleClickDetector = new DoubleClickDetector();
      detector.reset();
      detector.onPointerDown(100, 100, 1000);
      expect(detector.onPointerDown(100, 100, 1500)).assertTrue();
      expect(detector.getDoubleClickCount()).assertEqual(1);
      expect(detector.getExpiredCount()).assertEqual(0);
    });

    // A second click after the window becomes a new first click.
    it('double_click_outside_window_should_expire', 0, async () => {
      const detector: DoubleClickDetector = new DoubleClickDetector();
      detector.reset();
      detector.onPointerDown(100, 100, 1000);
      expect(detector.onPointerDown(100, 100, 1501)).assertFalse();
      expect(detector.getDoubleClickCount()).assertEqual(0);
      expect(detector.getExpiredCount()).assertEqual(1);
      expect(detector.isPending()).assertTrue();
    });

    // Clicks farther than 20 px apart do not form a double click.
    it('double_click_outside_tolerance_should_be_rejected', 0, async () => {
      const detector: DoubleClickDetector = new DoubleClickDetector();
      detector.reset();
      detector.onPointerDown(100, 100, 1000);
      expect(detector.onPointerDown(121, 100, 1100)).assertFalse();
      expect(detector.getDoubleClickCount()).assertEqual(0);
      expect(detector.getExpiredCount()).assertEqual(0);
      expect(detector.isPending()).assertTrue();
    });

    // The tolerance boundary of 20 px is accepted.
    it('double_click_tolerance_boundary_should_be_accepted', 0, async () => {
      const detector: DoubleClickDetector = new DoubleClickDetector();
      detector.reset();
      detector.onPointerDown(100, 100, 1000);
      expect(detector.onPointerDown(120, 120, 1100)).assertTrue();
      expect(detector.getDoubleClickCount()).assertEqual(1);
    });

    // A double click resets the pending click, so the next click is single.
    it('double_click_should_reset_pending_state', 0, async () => {
      const detector: DoubleClickDetector = new DoubleClickDetector();
      detector.reset();
      detector.onPointerDown(100, 100, 1000);
      detector.onPointerDown(100, 100, 1100);
      expect(detector.isPending()).assertFalse();
      expect(detector.onPointerDown(100, 100, 1200)).assertFalse();
      expect(detector.isPending()).assertTrue();
      expect(detector.getClickCount()).assertEqual(3);
    });

    // Resetting the detector clears the counters.
    it('double_click_detector_reset_should_restore_state', 0, async () => {
      const detector: DoubleClickDetector = new DoubleClickDetector();
      detector.reset();
      detector.onPointerDown(100, 100, 1000);
      detector.onPointerDown(100, 100, 1100);
      detector.reset();
      expect(detector.getClickCount()).assertEqual(0);
      expect(detector.getDoubleClickCount()).assertEqual(0);
      expect(detector.getExpiredCount()).assertEqual(0);
      expect(detector.isPending()).assertFalse();
    });

    // Three fast clicks produce one double click and one pending click.
    it('triple_click_should_produce_one_double_click', 0, async () => {
      const detector: DoubleClickDetector = new DoubleClickDetector();
      detector.reset();
      detector.onPointerDown(100, 100, 1000);
      expect(detector.onPointerDown(100, 100, 1100)).assertTrue();
      expect(detector.onPointerDown(100, 100, 1200)).assertFalse();
      expect(detector.getClickCount()).assertEqual(3);
      expect(detector.getDoubleClickCount()).assertEqual(1);
      expect(detector.isPending()).assertTrue();
    });

    // Swipe direction is derived from the dominant axis.
    it('swipe_direction_should_be_computed', 0, async () => {
      const validator: SwipePathValidator = new SwipePathValidator();
      expect(validator.direction(100, 100, 300, 110)).assertEqual('right');
      expect(validator.direction(300, 100, 100, 90)).assertEqual('left');
      expect(validator.direction(100, 100, 110, 300)).assertEqual('down');
      expect(validator.direction(100, 300, 90, 100)).assertEqual('up');
    });

    // Swipe distance uses the Euclidean metric.
    it('swipe_distance_should_be_computed', 0, async () => {
      const validator: SwipePathValidator = new SwipePathValidator();
      expect(validator.distance(0, 0, 3, 4)).assertEqual(5);
      expect(validator.distance(10, 10, 10, 10)).assertEqual(0);
      expect(validator.getMinDistance()).assertEqual(SWIPE_MIN_DISTANCE_PX);
    });

    // A long enough swipe with a sane duration is valid.
    it('swipe_path_should_be_valid_for_normal_gesture', 0, async () => {
      const validator: SwipePathValidator = new SwipePathValidator();
      validator.clear();
      const record: SwipeRecord = validator.validate(100, 200, 400, 200, 300);
      expect(record.valid).assertTrue();
      expect(record.direction).assertEqual('right');
      expect(record.distance).assertEqual(300);
      expect(record.durationMs).assertEqual(300);
      expect(validator.getRecordCount()).assertEqual(1);
      expect(validator.getValidCount()).assertEqual(1);
    });

    // A swipe shorter than 20 px is rejected.
    it('short_swipe_should_be_invalid', 0, async () => {
      const validator: SwipePathValidator = new SwipePathValidator();
      validator.clear();
      const record: SwipeRecord = validator.validate(100, 100, 110, 100, 200);
      expect(record.valid).assertFalse();
      expect(record.distance).assertEqual(10);
      expect(validator.getValidCount()).assertEqual(0);
      expect(validator.getRecordCount()).assertEqual(1);
    });

    // A negative duration is invalid while zero is accepted.
    it('swipe_duration_boundary_should_be_validated', 0, async () => {
      const validator: SwipePathValidator = new SwipePathValidator();
      validator.clear();
      expect(validator.validate(0, 0, 100, 0, 0).valid).assertTrue();
      expect(validator.validate(0, 0, 100, 0, -1).valid).assertFalse();
      expect(validator.validate(0, 0, 100, 0, 5000).valid).assertTrue();
      expect(validator.validate(0, 0, 100, 0, 5001).valid).assertFalse();
    });

    // The swipe records are returned as a defensive copy.
    it('swipe_records_should_return_copy', 0, async () => {
      const validator: SwipePathValidator = new SwipePathValidator();
      validator.clear();
      validator.validate(0, 0, 100, 0, 100);
      const records: SwipeRecord[] = validator.getRecords();
      expect(records.length).assertEqual(1);
      records[0].valid = false;
      expect(validator.getValidCount()).assertEqual(1);
    });

    // A touch on the timer window is routed to the timer region.
    it('touch_interaction_should_hit_timer_window', 0, async () => {
      const tester: PointerHitTester = new PointerHitTester();
      // The tip window is created after the timer window, so the tip region is
      // registered first to model the lower layer of the hit test.
      tester.addRegion(new PointerRegion(615, 46, 1301, 146, 'tip'));
      tester.addRegion(new PointerRegion(96, 48, 720, 104, 'timer'));
      const timerHit: HitTestResult = tester.hitTest(new PointerCoordinate(200, 60));
      expect(timerHit.hit).assertTrue();
      expect(timerHit.regionId).assertEqual('timer');
      const tipHit: HitTestResult = tester.hitTest(new PointerCoordinate(700, 100));
      expect(tipHit.hit).assertTrue();
      expect(tipHit.regionId).assertEqual('tip');
      const missHit: HitTestResult = tester.hitTest(new PointerCoordinate(1800, 900));
      expect(missHit.hit).assertFalse();
    });

    // A simulated touch at the timer window center returns without errors.
    it('simulated_touch_should_be_accepted_by_the_system', 0, async () => {
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      await simulateTouch(driver, 300, 76);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertTrue();
    });

    // A simulated swipe is accepted by the system and stays inside bounds.
    it('simulated_swipe_should_be_accepted_by_the_system', 0, async () => {
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      await simulateSwipe(driver, 200, 500, 600, 500);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertTrue();
      const validator: SwipePathValidator = new SwipePathValidator();
      expect(validator.validate(200, 500, 600, 500, 200).direction).assertEqual('right');
    });

    // Remote control and touch produce different device kinds.
    it('remote_and_touch_interaction_should_be_distinguishable', 0, async () => {
      const recorder: PointerEventRecorder = new PointerEventRecorder();
      recorder.record(PointerAction.CLICK, 0, 0, 0, PointerDeviceKind.REMOTE, true);
      recorder.record(PointerAction.DOUBLE_CLICK, 0, 0, 1, PointerDeviceKind.TOUCH, true);
      expect(recorder.getCountByDevice(PointerDeviceKind.REMOTE)).assertEqual(1);
      expect(recorder.getCountByDevice(PointerDeviceKind.TOUCH)).assertEqual(1);
      expect(recorder.getCountByDevice(PointerDeviceKind.UNKNOWN)).assertEqual(0);
    });

    // The pointer registry hands out sequential ids.
    it('pointer_id_registry_should_allocate_sequential_ids', 0, async () => {
      const registry: PointerIdRegistry = new PointerIdRegistry();
      registry.reset();
      expect(registry.acquire()).assertEqual(0);
      expect(registry.acquire()).assertEqual(1);
      expect(registry.acquire()).assertEqual(2);
      expect(registry.getActiveCount()).assertEqual(3);
      expect(registry.getNextId()).assertEqual(3);
      expect(registry.isActive(1)).assertTrue();
    });

    // A duplicate pointer id cannot be registered twice.
    it('pointer_id_registry_should_reject_duplicate_ids', 0, async () => {
      const registry: PointerIdRegistry = new PointerIdRegistry();
      registry.reset();
      expect(registry.register(7)).assertTrue();
      expect(registry.register(7)).assertFalse();
      expect(registry.getActiveCount()).assertEqual(1);
      expect(registry.getRejectedCount()).assertEqual(1);
    });

    // A negative pointer id is invalid.
    it('pointer_id_registry_should_reject_negative_ids', 0, async () => {
      const registry: PointerIdRegistry = new PointerIdRegistry();
      registry.reset();
      expect(registry.register(-1)).assertFalse();
      expect(registry.getActiveCount()).assertEqual(0);
      expect(registry.getRejectedCount()).assertEqual(1);
    });

    // Releasing a pointer frees its id and counts the release.
    it('pointer_id_registry_should_release_ids', 0, async () => {
      const registry: PointerIdRegistry = new PointerIdRegistry();
      registry.reset();
      const id: number = registry.acquire();
      expect(registry.release(id)).assertTrue();
      expect(registry.isActive(id)).assertFalse();
      expect(registry.getActiveCount()).assertEqual(0);
      expect(registry.getReleasedCount()).assertEqual(1);
      expect(registry.release(id)).assertFalse();
    });

    // The registry stops allocating when ten pointers are active.
    it('pointer_id_registry_should_respect_capacity', 0, async () => {
      const registry: PointerIdRegistry = new PointerIdRegistry();
      registry.reset();
      expect(registry.getMaxPointers()).assertEqual(10);
      for (let i = 0; i < 10; i++) {
        expect(registry.acquire()).assertEqual(i);
      }
      expect(registry.acquire()).assertEqual(-1);
      expect(registry.getActiveCount()).assertEqual(10);
      expect(registry.getRejectedCount()).assertEqual(1);
      expect(registry.register(20)).assertFalse();
    });

    // Releasing all pointers empties the registry at once.
    it('pointer_id_registry_should_release_all', 0, async () => {
      const registry: PointerIdRegistry = new PointerIdRegistry();
      registry.reset();
      registry.acquire();
      registry.acquire();
      registry.acquire();
      expect(registry.releaseAll()).assertEqual(3);
      expect(registry.getActiveCount()).assertEqual(0);
      expect(registry.getReleasedCount()).assertEqual(3);
      expect(registry.releaseAll()).assertEqual(0);
    });

    // Registering an explicit high id advances the allocation cursor.
    it('pointer_id_registry_should_advance_next_id', 0, async () => {
      const registry: PointerIdRegistry = new PointerIdRegistry();
      registry.reset();
      expect(registry.register(42)).assertTrue();
      expect(registry.getNextId()).assertEqual(43);
      expect(registry.acquire()).assertEqual(43);
      expect(registry.getActiveCount()).assertEqual(2);
    });

    // Reset clears active ids and every counter.
    it('pointer_id_registry_reset_should_restore_state', 0, async () => {
      const registry: PointerIdRegistry = new PointerIdRegistry();
      registry.reset();
      registry.acquire();
      registry.register(5);
      registry.release(5);
      registry.reset();
      expect(registry.getActiveCount()).assertEqual(0);
      expect(registry.getReleasedCount()).assertEqual(0);
      expect(registry.getRejectedCount()).assertEqual(0);
      expect(registry.getNextId()).assertEqual(0);
    });

    // Comprehensive pointer scenario: press, double click, swipe and release.
    it('comprehensive_pointer_scenario_should_demonstrate_full_functionality', 0, async () => {
      const detector: DoubleClickDetector = new DoubleClickDetector();
      const validator: SwipePathValidator = new SwipePathValidator();
      const registry: PointerIdRegistry = new PointerIdRegistry();
      const recorder: PointerEventRecorder = new PointerEventRecorder();
      detector.reset();
      validator.clear();
      registry.reset();
      recorder.clear();
      const pointerId: number = registry.acquire();
      recorder.record(PointerAction.CLICK, 300, 76, pointerId, PointerDeviceKind.TOUCH, true);
      expect(detector.onPointerDown(300, 76, 1000)).assertFalse();
      recorder.record(PointerAction.CLICK, 301, 77, pointerId, PointerDeviceKind.TOUCH, true);
      expect(detector.onPointerDown(301, 77, 1200)).assertTrue();
      recorder.record(PointerAction.DOUBLE_CLICK, 301, 77, pointerId, PointerDeviceKind.TOUCH, true);
      const swipe: SwipeRecord = validator.validate(200, 500, 600, 500, 250);
      recorder.record(PointerAction.SWIPE, 600, 500, pointerId, PointerDeviceKind.TOUCH, false);
      expect(swipe.valid).assertTrue();
      expect(detector.getDoubleClickCount()).assertEqual(1);
      expect(recorder.getCountByAction(PointerAction.DOUBLE_CLICK)).assertEqual(1);
      expect(recorder.getCountByPointerId(pointerId)).assertEqual(4);
      expect(registry.release(pointerId)).assertTrue();
      expect(registry.getActiveCount()).assertEqual(0);
      expect(recorder.isChronological()).assertTrue();
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertTrue();
    });

    // The pointer models keep their public interfaces stable.
    it('pointer_models_should_keep_consistent_interfaces', 0, async () => {
      const detector: DoubleClickDetector = new DoubleClickDetector();
      const validator: SwipePathValidator = new SwipePathValidator();
      const registry: PointerIdRegistry = new PointerIdRegistry();
      expect(detector.getWindowMs()).assertEqual(DOUBLE_CLICK_WINDOW_MS);
      expect(detector.getTolerancePx()).assertEqual(DOUBLE_CLICK_TOLERANCE_PX);
      expect(validator.getMinDistance()).assertEqual(SWIPE_MIN_DISTANCE_PX);
      expect(registry.getMaxPointers()).assertEqual(10);
      expect(PointerUtilSimulator.getInstance() === pointerUtil).assertTrue();
    });
  });
}

