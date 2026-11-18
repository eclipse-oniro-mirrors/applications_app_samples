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
  serializedDelay,
  ensureHomePage,
  backToHome,
  simulateSwipe,
  simulateTouch,
  componentCount,
  waitForAnyText,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  TOLERANCE_COMPONENT_COUNT,
  TEXT_CREATE_ISSUE_CANDIDATES,
  TEXT_HOME_HEADER_CANDIDATES,
} from '../Shared/BetaClubDriver';

const SWIPE_THRESHOLD_PX: number = 100;

const LONG_PRESS_THRESHOLD_MS: number = 500;

const DOUBLE_TAP_INTERVAL_MS: number = 300;

const MOVE_TOLERANCE_PX: number = 8;

const DIRECTION_UP: string = 'up';

const DIRECTION_DOWN: string = 'down';

const DIRECTION_LEFT: string = 'left';

const DIRECTION_RIGHT: string = 'right';

const DIRECTION_NONE: string = 'none';

interface GesturePoint {
  x: number;
  y: number;
  timestamp: number;
}

// Recognizes swipe direction and distance from a point trail
class SwipeRecognizer {
  private points: GesturePoint[] = [];

  public begin(point: GesturePoint): void {
    this.points = [point];
  }

  public addPoint(point: GesturePoint): void {
    this.points.push(point);
  }

  public getPointCount(): number {
    return this.points.length;
  }

  public getDistance(): number {
    if (this.points.length < 2) {
      return 0;
    }
    const first = this.points[0];
    const last = this.points[this.points.length - 1];
    const deltaX = last.x - first.x;
    const deltaY = last.y - first.y;
    return Math.sqrt(deltaX * deltaX + deltaY * deltaY);
  }

  public getDirection(): string {
    if (this.points.length < 2) {
      return DIRECTION_NONE;
    }
    const first = this.points[0];
    const last = this.points[this.points.length - 1];
    const deltaX = last.x - first.x;
    const deltaY = last.y - first.y;
    if (Math.abs(deltaX) < MOVE_TOLERANCE_PX && Math.abs(deltaY) < MOVE_TOLERANCE_PX) {
      return DIRECTION_NONE;
    }
    if (Math.abs(deltaX) >= Math.abs(deltaY)) {
      return deltaX > 0 ? DIRECTION_RIGHT : DIRECTION_LEFT;
    }
    return deltaY > 0 ? DIRECTION_DOWN : DIRECTION_UP;
  }

  public isSwipe(): boolean {
    return this.getDistance() >= SWIPE_THRESHOLD_PX;
  }

  public getDuration(): number {
    if (this.points.length < 2) {
      return 0;
    }
    return this.points[this.points.length - 1].timestamp - this.points[0].timestamp;
  }

  public getVelocity(): number {
    const duration = this.getDuration();
    return duration <= 0 ? 0 : this.getDistance() / duration;
  }

  public reset(): void {
    this.points = [];
  }
}

// Detects long press from key or touch durations
class LongPressRecognizer {
  private downAt: number = 0;
  private tracking: boolean = false;

  public onDown(now: number): void {
    if (!this.tracking) {
      this.downAt = now;
      this.tracking = true;
    }
  }

  public onUp(now: number): boolean {
    if (!this.tracking) {
      return false;
    }
    const duration = now - this.downAt;
    this.tracking = false;
    return duration >= LONG_PRESS_THRESHOLD_MS;
  }

  public isTracking(): boolean {
    return this.tracking;
  }

  public cancel(): void {
    this.tracking = false;
    this.downAt = 0;
  }
}

// Detects double tap from successive tap timestamps
class DoubleTapRecognizer {
  private taps: number[] = [];

  public tap(now: number): boolean {
    if (this.taps.length > 0) {
      const last = this.taps[this.taps.length - 1];
      if (now - last >= 0 && now - last <= DOUBLE_TAP_INTERVAL_MS) {
        this.taps = [];
        return true;
      }
      // The previous tap is too old to form a double tap, drop it so that only the
      // current press stays pending.
      this.taps = [];
    }
    this.taps.push(now);
    return false;
  }

  public getPendingTapCount(): number {
    return this.taps.length;
  }

  public reset(): void {
    this.taps = [];
  }
}

// Resolves competing gestures by priority
class GestureConflictResolver {
  private priorities: string[] = [];

  public register(name: string, priority: number): void {
    if (name.length === 0) {
      return;
    }
    while (this.priorities.length <= priority) {
      this.priorities.push('');
    }
    this.priorities[priority] = name;
  }

  public resolve(candidates: string[]): string {
    for (let i = 0; i < this.priorities.length; i++) {
      const name = this.priorities[i];
      if (name.length > 0 && candidates.includes(name)) {
        return name;
      }
    }
    return '';
  }

  public getPriority(name: string): number {
    return this.priorities.indexOf(name);
  }

  public size(): number {
    let count: number = 0;
    for (let i = 0; i < this.priorities.length; i++) {
      if (this.priorities[i].length > 0) {
        count++;
      }
    }
    return count;
  }

  public clear(): void {
    this.priorities = [];
  }
}

// Records recognized gestures during a session
class GestureSession {
  private counts: Map<string, number> = new Map<string, number>();
  private total: number = 0;

  public record(gesture: string): void {
    if (gesture.length === 0) {
      return;
    }
    const current = this.counts.get(gesture) ?? 0;
    this.counts.set(gesture, current + 1);
    this.total++;
  }

  public countOf(gesture: string): number {
    const value = this.counts.get(gesture);
    return value === undefined ? 0 : value;
  }

  public getTotal(): number {
    return this.total;
  }

  public getDistinct(): number {
    return this.counts.size;
  }

  public names(): string[] {
    const result: string[] = [];
    this.counts.forEach((value: number, name: string) => {
      result.push(name);
    });
    return result;
  }

  public reset(): void {
    this.counts = new Map<string, number>();
    this.total = 0;
  }
}

// Validates tap coordinates against the screen frame
class TapAreaValidator {
  public static isInsideFrame(x: number, y: number, width: number, height: number): boolean {
    return x >= 0 && y >= 0 && x < width && y < height;
  }

  public static isNearTarget(x: number, y: number, targetX: number, targetY: number,
    tolerance: number): boolean {
    return Math.abs(x - targetX) <= tolerance && Math.abs(y - targetY) <= tolerance;
  }
}

export default function gestureRecognitionTest() {
  describe('GestureRecognition_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 300);
      await ensureHomePage(driver);
    });

    afterAll(async () => {
      await backToHome(driver, 3);
    });

    it('swipe_recognizer_should_detect_horizontal_direction', 0, () => {
      const recognizer = new SwipeRecognizer();
      recognizer.begin({ x: 0, y: 100, timestamp: 0 });
      recognizer.addPoint({ x: 150, y: 105, timestamp: 100 });
      expect(recognizer.getPointCount()).assertEqual(2);
      expect(recognizer.getDirection()).assertEqual(DIRECTION_RIGHT);
      expect(recognizer.isSwipe()).assertTrue();
      recognizer.reset();
      expect(recognizer.getPointCount()).assertEqual(0);
      expect(recognizer.getDirection()).assertEqual(DIRECTION_NONE);
    });

    it('swipe_recognizer_should_detect_left_and_vertical', 0, () => {
      const left = new SwipeRecognizer();
      left.begin({ x: 300, y: 0, timestamp: 0 });
      left.addPoint({ x: 100, y: 10, timestamp: 100 });
      expect(left.getDirection()).assertEqual(DIRECTION_LEFT);

      const up = new SwipeRecognizer();
      up.begin({ x: 0, y: 300, timestamp: 0 });
      up.addPoint({ x: 5, y: 50, timestamp: 100 });
      expect(up.getDirection()).assertEqual(DIRECTION_UP);

      const down = new SwipeRecognizer();
      down.begin({ x: 0, y: 0, timestamp: 0 });
      down.addPoint({ x: 5, y: 300, timestamp: 100 });
      expect(down.getDirection()).assertEqual(DIRECTION_DOWN);
    });

    it('swipe_recognizer_should_reject_small_moves', 0, () => {
      const recognizer = new SwipeRecognizer();
      recognizer.begin({ x: 10, y: 10, timestamp: 0 });
      recognizer.addPoint({ x: 12, y: 11, timestamp: 50 });
      expect(recognizer.getDirection()).assertEqual(DIRECTION_NONE);
      expect(recognizer.isSwipe()).assertFalse();
      expect(recognizer.getDistance()).assertLess(SWIPE_THRESHOLD_PX);
    });

    it('swipe_recognizer_should_compute_velocity', 0, () => {
      const recognizer = new SwipeRecognizer();
      recognizer.begin({ x: 0, y: 0, timestamp: 0 });
      recognizer.addPoint({ x: 300, y: 0, timestamp: 100 });
      expect(recognizer.getDuration()).assertEqual(100);
      expect(recognizer.getVelocity()).assertEqual(3);
      expect(recognizer.getDistance()).assertEqual(300);
    });

    it('swipe_recognizer_should_handle_zero_duration', 0, () => {
      const recognizer = new SwipeRecognizer();
      recognizer.begin({ x: 0, y: 0, timestamp: 10 });
      recognizer.addPoint({ x: 100, y: 0, timestamp: 10 });
      expect(recognizer.getDuration()).assertEqual(0);
      expect(recognizer.getVelocity()).assertEqual(0);
      expect(recognizer.isSwipe()).assertTrue();
    });

    it('long_press_recognizer_should_detect_threshold', 0, () => {
      const recognizer = new LongPressRecognizer();
      expect(recognizer.isTracking()).assertFalse();
      recognizer.onDown(1000);
      expect(recognizer.isTracking()).assertTrue();
      expect(recognizer.onUp(1400)).assertFalse();
      expect(recognizer.isTracking()).assertFalse();
      recognizer.onDown(2000);
      expect(recognizer.onUp(2500)).assertTrue();
    });

    it('long_press_recognizer_should_cancel', 0, () => {
      const recognizer = new LongPressRecognizer();
      recognizer.onDown(100);
      recognizer.cancel();
      expect(recognizer.isTracking()).assertFalse();
      expect(recognizer.onUp(1000)).assertFalse();
      recognizer.onDown(2000);
      recognizer.onDown(2500);
      expect(recognizer.onUp(2600)).assertTrue();
    });

    it('double_tap_recognizer_should_detect_sequence', 0, () => {
      const recognizer = new DoubleTapRecognizer();
      expect(recognizer.tap(1000)).assertFalse();
      expect(recognizer.getPendingTapCount()).assertEqual(1);
      expect(recognizer.tap(1200)).assertTrue();
      expect(recognizer.getPendingTapCount()).assertEqual(0);
    });

    it('double_tap_recognizer_should_reject_slow_second_tap', 0, () => {
      const recognizer = new DoubleTapRecognizer();
      expect(recognizer.tap(1000)).assertFalse();
      expect(recognizer.tap(1400)).assertFalse();
      expect(recognizer.getPendingTapCount()).assertEqual(1);
      expect(recognizer.tap(1500)).assertTrue();
      recognizer.reset();
      expect(recognizer.getPendingTapCount()).assertEqual(0);
    });

    it('conflict_resolver_should_pick_highest_priority', 0, () => {
      const resolver = new GestureConflictResolver();
      resolver.register('tap', 2);
      resolver.register('longPress', 1);
      resolver.register('swipe', 0);
      expect(resolver.size()).assertEqual(3);
      expect(resolver.resolve(['tap', 'longPress', 'swipe'])).assertEqual('swipe');
      expect(resolver.resolve(['tap', 'longPress'])).assertEqual('longPress');
      expect(resolver.resolve(['tap'])).assertEqual('tap');
      expect(resolver.resolve(['unknown'])).assertEqual('');
    });

    it('conflict_resolver_should_ignore_invalid_registrations', 0, () => {
      const resolver = new GestureConflictResolver();
      resolver.register('', 0);
      expect(resolver.size()).assertEqual(0);
      resolver.register('tap', 0);
      expect(resolver.getPriority('tap')).assertEqual(0);
      expect(resolver.getPriority('missing')).assertEqual(-1);
      resolver.clear();
      expect(resolver.size()).assertEqual(0);
      expect(resolver.resolve(['tap'])).assertEqual('');
    });

    it('gesture_session_should_aggregate_counts', 0, () => {
      const session = new GestureSession();
      session.record('tap');
      session.record('tap');
      session.record('swipe');
      session.record('');
      expect(session.getTotal()).assertEqual(3);
      expect(session.countOf('tap')).assertEqual(2);
      expect(session.countOf('swipe')).assertEqual(1);
      expect(session.countOf('missing')).assertEqual(0);
      expect(session.getDistinct()).assertEqual(2);
      expect(session.names().length).assertEqual(2);
      session.reset();
      expect(session.getTotal()).assertEqual(0);
      expect(session.getDistinct()).assertEqual(0);
    });

    it('tap_area_validator_should_check_frame_bounds', 0, () => {
      expect(TapAreaValidator.isInsideFrame(0, 0, 1920, 1080)).assertTrue();
      expect(TapAreaValidator.isInsideFrame(1919, 1079, 1920, 1080)).assertTrue();
      expect(TapAreaValidator.isInsideFrame(1920, 1079, 1920, 1080)).assertFalse();
      expect(TapAreaValidator.isInsideFrame(-1, 0, 1920, 1080)).assertFalse();
      expect(TapAreaValidator.isNearTarget(100, 100, 105, 95, 8)).assertTrue();
      expect(TapAreaValidator.isNearTarget(100, 100, 120, 95, 8)).assertFalse();
    });

    it('swipe_recognizer_should_track_multi_point_trail', 0, () => {
      const recognizer = new SwipeRecognizer();
      recognizer.begin({ x: 0, y: 0, timestamp: 0 });
      recognizer.addPoint({ x: 40, y: 0, timestamp: 40 });
      recognizer.addPoint({ x: 80, y: 0, timestamp: 80 });
      recognizer.addPoint({ x: 120, y: 0, timestamp: 120 });
      expect(recognizer.getPointCount()).assertEqual(4);
      expect(recognizer.getDistance()).assertEqual(120);
      expect(recognizer.getDuration()).assertEqual(120);
      expect(recognizer.getDirection()).assertEqual(DIRECTION_RIGHT);
    });

    it('gesture_constants_should_be_consistent', 0, () => {
      expect(SWIPE_THRESHOLD_PX).assertEqual(100);
      expect(LONG_PRESS_THRESHOLD_MS).assertEqual(500);
      expect(DOUBLE_TAP_INTERVAL_MS).assertEqual(300);
      expect(MOVE_TOLERANCE_PX).assertEqual(8);
      expect(DOUBLE_TAP_INTERVAL_MS).assertLess(LONG_PRESS_THRESHOLD_MS);
    });

    it('swipe_on_home_should_keep_page_stable', 0, async () => {
      await ensureHomePage(driver);
      const before = await componentCount(driver);
      await simulateSwipe(driver, 600, 400, 600, 100);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      const after = await componentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      const homeVisible = await waitForAnyText(driver, TEXT_HOME_HEADER_CANDIDATES, TIMEOUT_PAGE_RENDER);
      expect(homeVisible !== '').assertTrue();
    });

    it('tap_on_home_should_not_crash', 0, async () => {
      await ensureHomePage(driver);
      await simulateTouch(driver, 480, 320);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      expect(await componentCount(driver)).assertLargerOrEqual(0);
      await backToHome(driver, 2);
    });

    it('gesture_pipeline_should_resolve_real_swipe', 0, () => {
      const resolver = new GestureConflictResolver();
      resolver.register('longPress', 2);
      resolver.register('swipe', 1);
      resolver.register('tap', 0);
      const recognizer = new SwipeRecognizer();
      recognizer.begin({ x: 500, y: 300, timestamp: 0 });
      recognizer.addPoint({ x: 200, y: 300, timestamp: 200 });
      const candidates: string[] = [];
      if (recognizer.isSwipe()) {
        candidates.push('swipe');
      }
      if (recognizer.getDuration() >= LONG_PRESS_THRESHOLD_MS) {
        candidates.push('longPress');
      }
      expect(candidates.length).assertEqual(1);
      expect(resolver.resolve(candidates)).assertEqual('swipe');
      expect(recognizer.getDirection()).assertEqual(DIRECTION_LEFT);
    });
  });
}

