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

import { describe, it, expect } from '@ohos/hypium';

const TAP_SLOP_PX: number = 16;

const MAX_TAP_DURATION_MS: number = 300;

const LONG_PRESS_MS: number = 500;

const SWIPE_MIN_DISTANCE: number = 120;

const MAX_TOUCH_POINTS: number = 10;

const TOUCH_DOWN: string = 'down';

const TOUCH_MOVE: string = 'move';

const TOUCH_UP: string = 'up';

const TOUCH_CANCEL: string = 'cancel';

interface TouchPoint {
  id: number;
  x: number;
  y: number;
  timestamp: number;
}

// Tracks active touch points for multi-touch gestures
class TouchTracker {
  private points: Map<number, TouchPoint> = new Map<number, TouchPoint>();
  private maxSimultaneous: number = 0;

  public down(id: number, x: number, y: number, now: number): boolean {
    if (id < 0 || this.points.size >= MAX_TOUCH_POINTS) {
      return false;
    }
    this.points.set(id, { id: id, x: x, y: y, timestamp: now });
    if (this.points.size > this.maxSimultaneous) {
      this.maxSimultaneous = this.points.size;
    }
    return true;
  }

  public move(id: number, x: number, y: number, now: number): boolean {
    const point = this.points.get(id);
    if (point === undefined) {
      return false;
    }
    point.x = x;
    point.y = y;
    point.timestamp = now;
    return true;
  }

  public up(id: number): TouchPoint | undefined {
    const point = this.points.get(id);
    if (point === undefined) {
      return undefined;
    }
    this.points.delete(id);
    return point;
  }

  public cancelAll(): number {
    const count = this.points.size;
    this.points = new Map<number, TouchPoint>();
    return count;
  }

  public count(): number {
    return this.points.size;
  }

  public getMaxSimultaneous(): number {
    return this.maxSimultaneous;
  }

  public contains(id: number): boolean {
    return this.points.has(id);
  }

  public get(id: number): TouchPoint | undefined {
    return this.points.get(id);
  }
}

// Distinguishes taps from drags and long presses
class TapDetector {
  public static distance(startX: number, startY: number, endX: number, endY: number): number {
    const deltaX = endX - startX;
    const deltaY = endY - startY;
    return Math.sqrt(deltaX * deltaX + deltaY * deltaY);
  }

  public static isTap(startX: number, startY: number, endX: number, endY: number,
    durationMs: number): boolean {
    return TapDetector.distance(startX, startY, endX, endY) <= TAP_SLOP_PX &&
      durationMs >= 0 && durationMs <= MAX_TAP_DURATION_MS;
  }

  public static isLongPress(durationMs: number): boolean {
    return durationMs >= LONG_PRESS_MS;
  }

  public static isDrag(startX: number, startY: number, endX: number, endY: number): boolean {
    return TapDetector.distance(startX, startY, endX, endY) > TAP_SLOP_PX;
  }

  public static isSwipe(startX: number, startY: number, endX: number, endY: number): boolean {
    return TapDetector.distance(startX, startY, endX, endY) >= SWIPE_MIN_DISTANCE;
  }
}

// Computes pinch scale from two touch points
class PinchDetector {
  private initialDistance: number = 0;
  private lastDistance: number = 0;

  public begin(first: TouchPoint, second: TouchPoint): void {
    this.initialDistance = PinchDetector.distanceBetween(first, second);
    this.lastDistance = this.initialDistance;
  }

  public update(first: TouchPoint, second: TouchPoint): number {
    this.lastDistance = PinchDetector.distanceBetween(first, second);
    return this.scale();
  }

  public scale(): number {
    return this.initialDistance <= 0 ? 0 : this.lastDistance / this.initialDistance;
  }

  public isPinchingOut(): boolean {
    return this.scale() > 1;
  }

  public isPinchingIn(): boolean {
    return this.scale() > 0 && this.scale() < 1;
  }

  public static distanceBetween(first: TouchPoint, second: TouchPoint): number {
    return TapDetector.distance(first.x, first.y, second.x, second.y);
  }

  public getInitialDistance(): number {
    return this.initialDistance;
  }

  public reset(): void {
    this.initialDistance = 0;
    this.lastDistance = 0;
  }
}

// Records dispatched touch events for assertions
class TouchDispatcher {
  private events: string[] = [];
  private handled: number = 0;
  private ignored: number = 0;

  public dispatch(kind: string, handled: boolean): void {
    this.events.push(kind);
    if (handled) {
      this.handled++;
    } else {
      this.ignored++;
    }
  }

  public getEvents(): string[] {
    return [...this.events];
  }

  public countOf(kind: string): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i] === kind) {
        count++;
      }
    }
    return count;
  }

  public getHandled(): number {
    return this.handled;
  }

  public getIgnored(): number {
    return this.ignored;
  }

  public sequence(): string {
    return this.events.join(',');
  }

  public clear(): void {
    this.events = [];
    this.handled = 0;
    this.ignored = 0;
  }
}

export default function touchInteractionTest() {
  describe('TouchInteraction_Test', () => {

    it('tracker_should_track_single_touch', 0, () => {
      const tracker = new TouchTracker();
      expect(tracker.down(0, 100, 100, 1000)).assertTrue();
      expect(tracker.count()).assertEqual(1);
      expect(tracker.contains(0)).assertTrue();
      expect(tracker.get(0) !== undefined).assertTrue();
      const point = tracker.up(0) as TouchPoint;
      expect(point.x).assertEqual(100);
      expect(tracker.count()).assertEqual(0);
      expect(tracker.up(0) === undefined).assertTrue();
    });

    it('tracker_should_track_multi_touch', 0, () => {
      const tracker = new TouchTracker();
      expect(tracker.down(0, 10, 10, 1000)).assertTrue();
      expect(tracker.down(1, 20, 20, 1001)).assertTrue();
      expect(tracker.count()).assertEqual(2);
      expect(tracker.getMaxSimultaneous()).assertEqual(2);
      expect(tracker.move(0, 30, 30, 1010)).assertTrue();
      expect((tracker.get(0) as TouchPoint).x).assertEqual(30);
      expect(tracker.move(9, 0, 0, 1010)).assertFalse();
    });

    it('tracker_should_cancel_all', 0, () => {
      const tracker = new TouchTracker();
      tracker.down(0, 0, 0, 0);
      tracker.down(1, 0, 0, 0);
      expect(tracker.cancelAll()).assertEqual(2);
      expect(tracker.count()).assertEqual(0);
      expect(tracker.contains(0)).assertFalse();
      expect(tracker.get(0) === undefined).assertTrue();
    });

    it('tracker_should_limit_touch_points', 0, () => {
      const tracker = new TouchTracker();
      for (let i = 0; i < MAX_TOUCH_POINTS; i++) {
        expect(tracker.down(i, i, i, i)).assertTrue();
      }
      expect(tracker.down(MAX_TOUCH_POINTS, 0, 0, 0)).assertFalse();
      expect(tracker.down(-1, 0, 0, 0)).assertFalse();
      expect(tracker.count()).assertEqual(MAX_TOUCH_POINTS);
      expect(tracker.getMaxSimultaneous()).assertEqual(MAX_TOUCH_POINTS);
    });

    it('tap_detector_should_accept_tap', 0, () => {
      expect(TapDetector.isTap(100, 100, 105, 105, 150)).assertTrue();
      expect(TapDetector.isTap(100, 100, 100, 100, 0)).assertTrue();
      expect(TapDetector.isTap(100, 100, 100, 100, MAX_TAP_DURATION_MS)).assertTrue();
      expect(TapDetector.distance(0, 0, 3, 4)).assertEqual(5);
    });

    it('tap_detector_should_reject_drag_or_slow', 0, () => {
      expect(TapDetector.isTap(100, 100, 200, 100, 100)).assertFalse();
      expect(TapDetector.isTap(100, 100, 100, 100, MAX_TAP_DURATION_MS + 1)).assertFalse();
      expect(TapDetector.isTap(100, 100, 100, 100, -1)).assertFalse();
      expect(TapDetector.isDrag(100, 100, 200, 100)).assertTrue();
      expect(TapDetector.isDrag(100, 100, 105, 100)).assertFalse();
    });

    it('tap_detector_should_classify_long_press', 0, () => {
      expect(TapDetector.isLongPress(500)).assertTrue();
      expect(TapDetector.isLongPress(499)).assertFalse();
      expect(TapDetector.isLongPress(5000)).assertTrue();
      expect(TapDetector.isTap(0, 0, 0, 0, 500)).assertFalse();
    });

    it('tap_detector_should_classify_swipe', 0, () => {
      expect(TapDetector.isSwipe(0, 0, 120, 0)).assertTrue();
      expect(TapDetector.isSwipe(0, 0, 100, 0)).assertFalse();
      expect(TapDetector.isSwipe(0, 0, 0, 200)).assertTrue();
      expect(TapDetector.isSwipe(0, 0, 60, 60)).assertFalse();
    });

    it('pinch_detector_should_scale_out', 0, () => {
      const detector = new PinchDetector();
      const first: TouchPoint = { id: 0, x: 0, y: 0, timestamp: 0 };
      const second: TouchPoint = { id: 1, x: 100, y: 0, timestamp: 0 };
      detector.begin(first, second);
      expect(detector.getInitialDistance()).assertEqual(100);
      const scaled = detector.update({ id: 0, x: -100, y: 0, timestamp: 1 },
        { id: 1, x: 200, y: 0, timestamp: 1 });
      expect(scaled).assertEqual(3);
      expect(detector.isPinchingOut()).assertTrue();
      expect(detector.isPinchingIn()).assertFalse();
    });

    it('pinch_detector_should_scale_in', 0, () => {
      const detector = new PinchDetector();
      detector.begin({ id: 0, x: 0, y: 0, timestamp: 0 }, { id: 1, x: 100, y: 0, timestamp: 0 });
      detector.update({ id: 0, x: 40, y: 0, timestamp: 1 }, { id: 1, x: 60, y: 0, timestamp: 1 });
      expect(detector.scale()).assertEqual(0.2);
      expect(detector.isPinchingIn()).assertTrue();
      expect(detector.isPinchingOut()).assertFalse();
      detector.reset();
      expect(detector.getInitialDistance()).assertEqual(0);
      expect(detector.scale()).assertEqual(0);
    });

    it('pinch_detector_should_measure_distance', 0, () => {
      const first: TouchPoint = { id: 0, x: 0, y: 0, timestamp: 0 };
      const second: TouchPoint = { id: 1, x: 3, y: 4, timestamp: 0 };
      expect(PinchDetector.distanceBetween(first, second)).assertEqual(5);
      const same: TouchPoint = { id: 2, x: 0, y: 0, timestamp: 0 };
      expect(PinchDetector.distanceBetween(first, same)).assertEqual(0);
    });

    it('dispatcher_should_record_sequence', 0, () => {
      const dispatcher = new TouchDispatcher();
      dispatcher.dispatch(TOUCH_DOWN, true);
      dispatcher.dispatch(TOUCH_MOVE, true);
      dispatcher.dispatch(TOUCH_UP, true);
      dispatcher.dispatch(TOUCH_CANCEL, false);
      expect(dispatcher.getEvents().length).assertEqual(4);
      expect(dispatcher.sequence()).assertEqual('down,move,up,cancel');
      expect(dispatcher.countOf(TOUCH_MOVE)).assertEqual(1);
      expect(dispatcher.getHandled()).assertEqual(3);
      expect(dispatcher.getIgnored()).assertEqual(1);
      dispatcher.clear();
      expect(dispatcher.getEvents().length).assertEqual(0);
    });

    it('dispatcher_should_count_repeated_events', 0, () => {
      const dispatcher = new TouchDispatcher();
      for (let i = 0; i < 5; i++) {
        dispatcher.dispatch(TOUCH_MOVE, true);
      }
      expect(dispatcher.countOf(TOUCH_MOVE)).assertEqual(5);
      expect(dispatcher.countOf(TOUCH_UP)).assertEqual(0);
      expect(dispatcher.getHandled()).assertEqual(5);
    });

    it('touch_flow_should_track_tap_gesture', 0, () => {
      const tracker = new TouchTracker();
      const dispatcher = new TouchDispatcher();
      tracker.down(0, 500, 500, 1000);
      dispatcher.dispatch(TOUCH_DOWN, true);
      tracker.move(0, 505, 503, 1050);
      dispatcher.dispatch(TOUCH_MOVE, true);
      const point = tracker.up(0) as TouchPoint;
      dispatcher.dispatch(TOUCH_UP, true);
      const duration = 1150 - 1000;
      expect(TapDetector.isTap(500, 500, point.x, point.y, duration)).assertTrue();
      expect(TapDetector.isSwipe(500, 500, point.x, point.y)).assertFalse();
      expect(dispatcher.sequence()).assertEqual('down,move,up');
    });

    it('touch_flow_should_support_two_finger_pinch', 0, () => {
      const tracker = new TouchTracker();
      const pinch = new PinchDetector();
      tracker.down(0, 100, 100, 0);
      tracker.down(1, 300, 100, 0);
      pinch.begin(tracker.get(0) as TouchPoint, tracker.get(1) as TouchPoint);
      tracker.move(0, 50, 100, 10);
      tracker.move(1, 350, 100, 10);
      const scale = pinch.update(tracker.get(0) as TouchPoint, tracker.get(1) as TouchPoint);
      expect(scale).assertEqual(1.5);
      expect(pinch.isPinchingOut()).assertTrue();
      expect(tracker.cancelAll()).assertEqual(2);
    });

    it('touch_constants_should_be_stable', 0, () => {
      expect(TAP_SLOP_PX).assertEqual(16);
      expect(MAX_TAP_DURATION_MS).assertEqual(300);
      expect(LONG_PRESS_MS).assertEqual(500);
      expect(SWIPE_MIN_DISTANCE).assertEqual(120);
      expect(MAX_TOUCH_POINTS).assertEqual(10);
      expect(TOUCH_CANCEL).assertEqual('cancel');
    });
  });
}

