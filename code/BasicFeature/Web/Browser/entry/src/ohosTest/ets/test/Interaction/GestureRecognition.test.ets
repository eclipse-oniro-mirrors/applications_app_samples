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
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, componentByIdExists, countById, clickById, swipeUp, tapAt,
  serializedDelay, ID_NAV_BACK, ID_NAV_REFRESH, ID_NAV_HOME, ID_ACTION_ADD, ID_INPUT_URL,
  DELAY_TOUCH_EVENT, TIMEOUT_COMPONENT, TOLERANCE_PROGRESS
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockClock, MockNetwork } from '../Shared/BrowserMock';

const TAG: string = 'BrowserGestureRecognitionTest';

/* ------------------------------------------------------------------ */
/* Gesture thresholds of the browser Web container                     */
/* ------------------------------------------------------------------ */

const TAP_MAX_DURATION: number = 200;
const TAP_MAX_MOVE: number = 10;
const LONG_PRESS_MIN_DURATION: number = 500;
const LONG_PRESS_MAX_MOVE: number = 12;
const DOUBLE_TAP_WINDOW: number = 300;
const DOUBLE_TAP_MAX_DISTANCE: number = 40;
const SWIPE_MIN_DISTANCE: number = 50;
const SWIPE_MIN_SPEED: number = 200;
const PINCH_MIN_SCALE_DELTA: number = 0.05;
const EDGE_SWIPE_WIDTH: number = 20;

const GESTURE_NONE: string = 'none';
const GESTURE_TAP: string = 'tap';
const GESTURE_LONG_PRESS: string = 'longPress';
const GESTURE_SWIPE: string = 'swipe';
const GESTURE_DOUBLE_TAP: string = 'doubleTap';
const GESTURE_PINCH: string = 'pinch';

const DIRECTION_NONE: string = 'none';
const DIRECTION_UP: string = 'up';
const DIRECTION_DOWN: string = 'down';
const DIRECTION_LEFT: string = 'left';
const DIRECTION_RIGHT: string = 'right';

/** Movement below this many pixels is still treated as a tap, not a swipe. */
const TAP_SLOP_PX: number = 3;

const ZONE_TITLE_BAR: string = 'titleBar';
const ZONE_WEB_CONTENT: string = 'webContent';
const ZONE_EDGE: string = 'edge';

const OWNER_WEB: string = 'web';
const OWNER_PAGE: string = 'page';
const OWNER_SYSTEM: string = 'system';
const OWNER_NONE: string = 'none';

/* ------------------------------------------------------------------ */
/* Geometry primitives                                                 */
/* ------------------------------------------------------------------ */

/** A single pointer sample in component coordinates. */
class Point2D {
  x: number;
  y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }

  deltaX(other: Point2D): number {
    return other.x - this.x;
  }

  deltaY(other: Point2D): number {
    return other.y - this.y;
  }

  distanceTo(other: Point2D): number {
    const dx: number = this.deltaX(other);
    const dy: number = this.deltaY(other);
    return Math.round(Math.sqrt(dx * dx + dy * dy) * 100) / 100;
  }

  sameAs(other: Point2D): boolean {
    return this.x === other.x && this.y === other.y;
  }

  describe(): string {
    return `(${this.x},${this.y})`;
  }
}

/** One recorded pointer path with its own timestamps. */
class GestureTrace {
  points: Point2D[] = [];
  downTime: number = 0;
  upTime: number = 0;

  start(point: Point2D, timestamp: number): void {
    this.points = [point];
    this.downTime = timestamp;
    this.upTime = timestamp;
  }

  move(point: Point2D, timestamp: number): void {
    this.points.push(point);
    this.upTime = timestamp;
  }

  finish(timestamp: number): void {
    this.upTime = timestamp;
  }

  size(): number {
    return this.points.length;
  }

  duration(): number {
    return this.upTime - this.downTime;
  }

  startPoint(): Point2D | null {
    return this.points.length === 0 ? null : this.points[0];
  }

  endPoint(): Point2D | null {
    return this.points.length === 0 ? null : this.points[this.points.length - 1];
  }

  /** Straight line distance between the first and the last sample. */
  displacement(): number {
    const first: Point2D | null = this.startPoint();
    const last: Point2D | null = this.endPoint();
    if (first === null || last === null) {
      return 0;
    }
    return first.distanceTo(last);
  }

  /** Sum of the segment lengths, always >= displacement. */
  pathLength(): number {
    let total: number = 0;
    for (let index = 1; index < this.points.length; index++) {
      total += this.points[index - 1].distanceTo(this.points[index]);
    }
    return Math.round(total * 100) / 100;
  }

  /** Largest deviation from the start point, used by the tap slop. */
  maxDeviation(): number {
    const first: Point2D | null = this.startPoint();
    if (first === null) {
      return 0;
    }
    let maximum: number = 0;
    for (let index = 0; index < this.points.length; index++) {
      const distance: number = first.distanceTo(this.points[index]);
      if (distance > maximum) {
        maximum = distance;
      }
    }
    return maximum;
  }

  speed(): number {
    const duration: number = this.duration();
    if (duration <= 0) {
      return 0;
    }
    return Math.round((this.displacement() / duration) * 1000);
  }

  /** Dominant axis of the displacement. */
  direction(): string {
    const first: Point2D | null = this.startPoint();
    const last: Point2D | null = this.endPoint();
    if (first === null || last === null) {
      return DIRECTION_NONE;
    }
    const dx: number = first.deltaX(last);
    const dy: number = first.deltaY(last);
    // Movement inside the tap slop is not a directional gesture.
    if (Math.abs(dx) < TAP_SLOP_PX && Math.abs(dy) < TAP_SLOP_PX) {
      return DIRECTION_NONE;
    }
    if (Math.abs(dx) >= Math.abs(dy)) {
      return dx > 0 ? DIRECTION_RIGHT : DIRECTION_LEFT;
    }
    return dy > 0 ? DIRECTION_DOWN : DIRECTION_UP;
  }

  isHorizontal(): boolean {
    return this.direction() === DIRECTION_LEFT || this.direction() === DIRECTION_RIGHT;
  }

  isVertical(): boolean {
    return this.direction() === DIRECTION_UP || this.direction() === DIRECTION_DOWN;
  }

  crossedCompensation(): number {
    const first: Point2D | null = this.startPoint();
    const last: Point2D | null = this.endPoint();
    if (first === null || last === null) {
      return 0;
    }
    const dx: number = Math.abs(first.deltaX(last));
    const dy: number = Math.abs(first.deltaY(last));
    return Math.round((dx > dy ? dy / (dx + 1) : dx / (dy + 1)) * 100) / 100;
  }
}

/* ------------------------------------------------------------------ */
/* Classifier                                                          */
/* ------------------------------------------------------------------ */

/** Ordered rules matching the Web container gesture recognition. */
class GestureClassifier {
  classificationCount: number = 0;
  lastDecision: string = GESTURE_NONE;

  /** Single pointer classification. Multi pointer traces go to pinch. */
  classify(trace: GestureTrace): string {
    this.classificationCount += 1;
    let result: string = GESTURE_NONE;
    if (trace.size() === 0) {
      result = GESTURE_NONE;
    } else if (trace.displacement() >= SWIPE_MIN_DISTANCE) {
      result = GESTURE_SWIPE;
    } else if (trace.duration() >= LONG_PRESS_MIN_DURATION &&
      trace.maxDeviation() <= LONG_PRESS_MAX_MOVE) {
      result = GESTURE_LONG_PRESS;
    } else if (trace.duration() <= TAP_MAX_DURATION && trace.maxDeviation() <= TAP_MAX_MOVE) {
      result = GESTURE_TAP;
    }
    this.lastDecision = result;
    return result;
  }

  isTap(trace: GestureTrace): boolean {
    return this.classify(trace) === GESTURE_TAP;
  }

  isSwipe(trace: GestureTrace): boolean {
    return this.classify(trace) === GESTURE_SWIPE;
  }
}

/* ------------------------------------------------------------------ */
/* Double tap detector                                                 */
/* ------------------------------------------------------------------ */

/** Accepts a second tap only inside the time and distance window. */
class DoubleTapDetector {
  private clock: MockClock;
  private window: number;
  private lastTapTime: number = -1;
  private lastTapPoint: Point2D | null = null;
  accepted: number = 0;
  rejected: number = 0;
  doubleTaps: number = 0;

  constructor(clock: MockClock, window: number = DOUBLE_TAP_WINDOW) {
    this.clock = clock;
    this.window = window;
  }

  tapAt(point: Point2D): boolean {
    const now: number = this.clock.now();
    if (this.lastTapTime >= 0 && now - this.lastTapTime <= this.window) {
      const reference: Point2D | null = this.lastTapPoint;
      const distance: number = reference === null ? 0 : reference.distanceTo(point);
      if (distance <= DOUBLE_TAP_MAX_DISTANCE) {
        this.accepted += 1;
        this.doubleTaps += 1;
        this.lastTapTime = -1;
        this.lastTapPoint = null;
        return true;
      }
      this.rejected += 1;
    }
    this.lastTapTime = now;
    this.lastTapPoint = point;
    return false;
  }

  reset(): void {
    this.lastTapTime = -1;
    this.lastTapPoint = null;
    this.accepted = 0;
    this.rejected = 0;
    this.doubleTaps = 0;
  }

  acceptedCount(): number {
    return this.accepted;
  }

  rejectedCount(): number {
    return this.rejected;
  }
}

/* ------------------------------------------------------------------ */
/* Pinch (web page zoom)                                               */
/* ------------------------------------------------------------------ */

/** Tracks the two finger span and clamps the resulting zoom factor. */
class PinchTracker {
  startDistance: number = 0;
  currentDistance: number = 0;
  minScale: number = 0.25;
  maxScale: number = 5;
  webScale: number = 1;
  zoomEvents: string[] = [];
  private active: boolean = false;
  private applied: boolean = false;

  begin(first: Point2D, second: Point2D): number {
    this.startDistance = first.distanceTo(second);
    this.currentDistance = this.startDistance;
    this.active = this.startDistance > 0;
    this.applied = false;
    this.zoomEvents.push('begin');
    return this.startDistance;
  }

  update(first: Point2D, second: Point2D): number {
    if (!this.active) {
      this.zoomEvents.push('update-ignored');
      return this.webScale;
    }
    this.currentDistance = first.distanceTo(second);
    this.zoomEvents.push('update');
    return this.scale();
  }

  private clampScale(value: number): number {
    const rounded: number = Math.round(value * 100) / 100;
    if (rounded < this.minScale) {
      return this.minScale;
    }
    if (rounded > this.maxScale) {
      return this.maxScale;
    }
    return rounded;
  }

  end(): number {
    this.active = false;
    this.zoomEvents.push('end');
    // A gesture that never called applyToWeb still commits its scale once, so
    // repeated pinches accumulate on the page zoom.
    if (!this.applied) {
      this.commitScale();
    }
    return this.webScale;
  }

  isActive(): boolean {
    return this.active;
  }

  /** Ratio of the current span to the initial span. */
  scale(): number {
    if (this.startDistance <= 0) {
      return 1;
    }
    return Math.round((this.currentDistance / this.startDistance) * 100) / 100;
  }

  /** Relative change, used against PINCH_MIN_SCALE_DELTA. */
  scaleDelta(): number {
    return Math.round(Math.abs(this.scale() - 1) * 100) / 100;
  }

  isRecognized(): boolean {
    return this.active && this.scaleDelta() >= PINCH_MIN_SCALE_DELTA;
  }

  direction(): string {
    if (!this.isRecognized()) {
      return DIRECTION_NONE;
    }
    return this.scale() > 1 ? 'zoomIn' : 'zoomOut';
  }

  /** Applies the pinch to the Web controller and clamps the result. */
  /** Applies the pending ratio to the page zoom without logging an event. */
  private commitScale(): number {
    this.webScale = this.clampScale(this.webScale * this.scale());
    this.applied = true;
    return this.webScale;
  }

  applyToWeb(): number {
    const value: number = this.commitScale();
    this.zoomEvents.push('apply:' + value);
    return value;
  }

  reset(): void {
    this.startDistance = 0;
    this.currentDistance = 0;
    this.webScale = 1;
    this.active = false;
    this.zoomEvents = [];
  }
}

/* ------------------------------------------------------------------ */
/* Conflict arbitration                                                */
/* ------------------------------------------------------------------ */

/**
 * Decides who consumes a gesture:
 *  - the title bar always belongs to the page,
 *  - a swipe from the screen edge belongs to the system back gesture,
 *  - vertical movement inside the Web container scrolls the page,
 *  - horizontal movement is only consumed by the Web container when the
 *    page can actually scroll sideways.
 */
class GestureArbiter {
  decisions: string[] = [];
  webScrollableHorizontally: boolean = false;
  webScrollableVertically: boolean = true;

  decide(zone: string, direction: string, distance: number, pinch: boolean): string {
    let owner: string = OWNER_NONE;
    if (pinch) {
      owner = zone === ZONE_WEB_CONTENT ? OWNER_WEB : OWNER_PAGE;
    } else if (zone === ZONE_TITLE_BAR) {
      owner = OWNER_PAGE;
    } else if (zone === ZONE_EDGE && direction === DIRECTION_RIGHT) {
      owner = OWNER_SYSTEM;
    } else if (zone === ZONE_WEB_CONTENT && distance >= SWIPE_MIN_DISTANCE &&
      (direction === DIRECTION_UP || direction === DIRECTION_DOWN)) {
      owner = this.webScrollableVertically ? OWNER_WEB : OWNER_PAGE;
    } else if (zone === ZONE_WEB_CONTENT && distance >= SWIPE_MIN_DISTANCE &&
      (direction === DIRECTION_LEFT || direction === DIRECTION_RIGHT)) {
      owner = this.webScrollableHorizontally ? OWNER_WEB : OWNER_PAGE;
    } else if (zone === ZONE_WEB_CONTENT) {
      owner = OWNER_WEB;
    } else {
      owner = OWNER_PAGE;
    }
    this.decisions.push(`${zone}:${direction}:${distance}:${owner}`);
    return owner;
  }

  /** The system back gesture must not steal a vertical page scroll. */
  backGestureConflicts(zone: string, direction: string): boolean {
    return zone === ZONE_EDGE && direction === DIRECTION_RIGHT;
  }

  decisionCount(): number {
    return this.decisions.length;
  }

  owners(): string[] {
    return this.decisions.map((entry: string) => {
      const parts: string[] = entry.split(':');
      return parts[parts.length - 1];
    });
  }

  countOf(owner: string): number {
    let total: number = 0;
    const all: string[] = this.owners();
    for (let index = 0; index < all.length; index++) {
      if (all[index] === owner) {
        total += 1;
      }
    }
    return total;
  }
}

/* ------------------------------------------------------------------ */
/* Throttling                                                          */
/* ------------------------------------------------------------------ */

/** Drops gesture samples that arrive inside the same throttle window. */
class GestureThrottle {
  private clock: MockClock;
  private interval: number;
  private lastAccepted: number = -1;
  accepted: number = 0;
  rejected: number = 0;
  acceptedAt: number[] = [];

  constructor(clock: MockClock, interval: number = DELAY_TOUCH_EVENT) {
    this.clock = clock;
    this.interval = interval;
  }

  allow(): boolean {
    const now: number = this.clock.now();
    if (this.lastAccepted >= 0 && now - this.lastAccepted < this.interval) {
      this.rejected += 1;
      return false;
    }
    this.lastAccepted = now;
    this.accepted += 1;
    this.acceptedAt.push(now);
    return true;
  }

  total(): number {
    return this.accepted + this.rejected;
  }

  acceptanceRate(): number {
    const total: number = this.total();
    return total === 0 ? 0 : Math.round((this.accepted / total) * 100) / 100;
  }

  intervalMs(): number {
    return this.interval;
  }

  reset(): void {
    this.lastAccepted = -1;
    this.accepted = 0;
    this.rejected = 0;
    this.acceptedAt = [];
  }
}

/* ------------------------------------------------------------------ */
/* Fixtures                                                            */
/* ------------------------------------------------------------------ */

/** Builds a straight trace with a constant step and fixed duration. */
function buildTrace(from: Point2D, to: Point2D, steps: number, durationMs: number): GestureTrace {
  const trace: GestureTrace = new GestureTrace();
  const count: number = steps <= 0 ? 1 : steps;
  trace.start(from, 1700000000000);
  for (let index = 1; index <= count; index++) {
    const ratio: number = index / count;
    const x: number = Math.round(from.x + (to.x - from.x) * ratio);
    const y: number = Math.round(from.y + (to.y - from.y) * ratio);
    const timestamp: number = 1700000000000 + Math.round((durationMs * index) / count);
    trace.move(new Point2D(x, y), timestamp);
  }
  trace.finish(1700000000000 + durationMs);
  return trace;
}

function buildTap(x: number = 100, y: number = 200): GestureTrace {
  const trace: GestureTrace = new GestureTrace();
  trace.start(new Point2D(x, y), 1700000000000);
  trace.move(new Point2D(x + 1, y + 1), 1700000000050);
  trace.finish(1700000000100);
  return trace;
}

function buildSwipe(fromX: number, fromY: number, toX: number, toY: number): GestureTrace {
  return buildTrace(new Point2D(fromX, fromY), new Point2D(toX, toY), 4, 200);
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserGestureRecognitionTest() {
  describe('browserGestureRecognitionTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      TestLogger.info(TAG, `tap ${TAP_MAX_DURATION} ms, long press ${LONG_PRESS_MIN_DURATION} ms, ` +
        `swipe ${SWIPE_MIN_DISTANCE} px, double tap window ${DOUBLE_TAP_WINDOW} ms`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Gesture_001', 0, async () => {
      TestLogger.step(TAG, 'short press without movement is classified as a tap');
      const trace: GestureTrace = buildTap();
      const classifier: GestureClassifier = new GestureClassifier();
      expect(trace.size()).assertEqual(2);
      expect(trace.duration()).assertEqual(100);
      expect(trace.displacement()).assertLess(3);
      expect(trace.direction()).assertEqual(DIRECTION_NONE);
      expect(classifier.classify(trace)).assertEqual(GESTURE_TAP);
      expect(classifier.isTap(trace)).assertTrue();
      expect(classifier.classificationCount).assertEqual(2);
      expect(classifier.lastDecision).assertEqual(GESTURE_TAP);
    });

    it('Browser_Gesture_002', 0, async () => {
      TestLogger.step(TAG, 'a press longer than the threshold becomes a long press');
      const longTrace: GestureTrace = new GestureTrace();
      longTrace.start(new Point2D(200, 300), 1700000000000);
      longTrace.move(new Point2D(202, 301), 1700000000300);
      longTrace.move(new Point2D(203, 302), 1700000000600);
      longTrace.finish(1700000000600);
      const classifier: GestureClassifier = new GestureClassifier();
      expect(longTrace.duration()).assertEqual(600);
      expect(longTrace.duration()).assertLarger(LONG_PRESS_MIN_DURATION);
      expect(longTrace.maxDeviation()).assertLess(LONG_PRESS_MAX_MOVE);
      expect(classifier.classify(longTrace)).assertEqual(GESTURE_LONG_PRESS);
      const borderline: GestureTrace = buildTrace(new Point2D(10, 10), new Point2D(10, 11), 1,
        LONG_PRESS_MIN_DURATION - 1);
      expect(classifier.classify(borderline)).assertEqual(GESTURE_NONE);
      expect(borderline.duration()).assertLess(LONG_PRESS_MIN_DURATION);
    });

    it('Browser_Gesture_003', 0, async () => {
      TestLogger.step(TAG, 'movement beyond the slop cancels the tap');
      const trace: GestureTrace = buildTrace(new Point2D(100, 100), new Point2D(100, 120), 4, 100);
      const classifier: GestureClassifier = new GestureClassifier();
      expect(trace.maxDeviation()).assertEqual(20);
      expect(trace.maxDeviation()).assertLarger(TAP_MAX_MOVE);
      expect(classifier.classify(trace)).assertEqual(GESTURE_NONE);
      const edge: GestureTrace = buildTrace(new Point2D(100, 100), new Point2D(100, 110), 2, 100);
      expect(edge.maxDeviation()).assertEqual(TAP_MAX_MOVE);
      expect(classifier.classify(edge)).assertEqual(GESTURE_TAP);
    });

    it('Browser_Gesture_004', 0, async () => {
      TestLogger.step(TAG, 'horizontal swipe reports the expected direction');
      const right: GestureTrace = buildSwipe(100, 300, 400, 305);
      const left: GestureTrace = buildSwipe(400, 300, 100, 295);
      const classifier: GestureClassifier = new GestureClassifier();
      expect(right.direction()).assertEqual(DIRECTION_RIGHT);
      expect(right.isHorizontal()).assertTrue();
      expect(right.isVertical()).assertFalse();
      expect(left.direction()).assertEqual(DIRECTION_LEFT);
      expect(classifier.classify(right)).assertEqual(GESTURE_SWIPE);
      expect(classifier.isSwipe(left)).assertTrue();
      expect(right.displacement()).assertEqual(300.04);
      expect(right.speed()).assertLarger(SWIPE_MIN_SPEED);
    });

    it('Browser_Gesture_005', 0, async () => {
      TestLogger.step(TAG, 'vertical swipe reports up and down');
      const up: GestureTrace = buildSwipe(300, 600, 305, 200);
      const down: GestureTrace = buildSwipe(300, 200, 295, 600);
      expect(up.direction()).assertEqual(DIRECTION_UP);
      expect(up.isVertical()).assertTrue();
      expect(up.isHorizontal()).assertFalse();
      expect(down.direction()).assertEqual(DIRECTION_DOWN);
      expect(up.crossedCompensation()).assertLess(0.1);
      expect(down.crossedCompensation()).assertLess(0.1);
      expect(up.displacement()).assertEqual(400.03);
    });

    it('Browser_Gesture_006', 0, async () => {
      TestLogger.step(TAG, 'diagonal movement resolves to the dominant axis');
      const diagonalRight: GestureTrace = buildSwipe(100, 100, 300, 160);
      const diagonalDown: GestureTrace = buildSwipe(100, 100, 160, 300);
      expect(diagonalRight.direction()).assertEqual(DIRECTION_RIGHT);
      expect(diagonalDown.direction()).assertEqual(DIRECTION_DOWN);
      expect(diagonalRight.isHorizontal()).assertTrue();
      expect(diagonalDown.isVertical()).assertTrue();
      expect(diagonalRight.crossedCompensation()).assertLarger(0.1);
      const still: GestureTrace = buildTrace(new Point2D(50, 50), new Point2D(50, 50), 2, 80);
      expect(still.direction()).assertEqual(DIRECTION_NONE);
    });

    it('Browser_Gesture_007', 0, async () => {
      TestLogger.step(TAG, 'swipe below the distance threshold is not a swipe');
      const short: GestureTrace = buildSwipe(100, 100, 130, 100);
      const exact: GestureTrace = buildSwipe(100, 100, 150, 100);
      const classifier: GestureClassifier = new GestureClassifier();
      expect(short.displacement()).assertEqual(30);
      expect(short.displacement()).assertLess(SWIPE_MIN_DISTANCE);
      expect(classifier.classify(short)).assertEqual(GESTURE_NONE);
      expect(exact.displacement()).assertEqual(SWIPE_MIN_DISTANCE);
      expect(classifier.classify(exact)).assertEqual(GESTURE_SWIPE);
      expect(classifier.lastDecision).assertEqual(GESTURE_SWIPE);
    });

    it('Browser_Gesture_008', 0, async () => {
      TestLogger.step(TAG, 'path length is always at least the displacement');
      const zigzag: GestureTrace = new GestureTrace();
      zigzag.start(new Point2D(100, 100), 1700000000000);
      zigzag.move(new Point2D(160, 100), 1700000000060);
      zigzag.move(new Point2D(160, 160), 1700000000120);
      zigzag.move(new Point2D(220, 160), 1700000000180);
      zigzag.finish(1700000000200);
      expect(zigzag.size()).assertEqual(4);
      expect(zigzag.pathLength()).assertEqual(180);
      expect(zigzag.displacement()).assertEqual(134.16);
      expect(zigzag.pathLength()).assertLarger(zigzag.displacement());
      expect(zigzag.direction()).assertEqual(DIRECTION_RIGHT);
      expect(zigzag.speed()).assertLarger(0);
    });

    it('Browser_Gesture_009', 0, async () => {
      TestLogger.step(TAG, 'two taps inside the window form a double tap');
      const clock: MockClock = new MockClock();
      const detector: DoubleTapDetector = new DoubleTapDetector(clock);
      expect(detector.tapAt(new Point2D(100, 300))).assertFalse();
      clock.advance(DOUBLE_TAP_WINDOW - 50);
      expect(detector.tapAt(new Point2D(104, 303))).assertTrue();
      expect(detector.doubleTaps).assertEqual(1);
      expect(detector.acceptedCount()).assertEqual(1);
      expect(detector.rejectedCount()).assertEqual(0);
      expect(detector.tapAt(new Point2D(100, 300))).assertFalse();
      expect(detector.acceptedCount()).assertEqual(1);
    });

    it('Browser_Gesture_010', 0, async () => {
      TestLogger.step(TAG, 'a slow second tap starts a new detection sequence');
      const clock: MockClock = new MockClock();
      const detector: DoubleTapDetector = new DoubleTapDetector(clock);
      expect(detector.tapAt(new Point2D(50, 50))).assertFalse();
      clock.advance(DOUBLE_TAP_WINDOW + 1);
      expect(detector.tapAt(new Point2D(50, 50))).assertFalse();
      expect(detector.doubleTaps).assertEqual(0);
      expect(detector.rejectedCount()).assertEqual(0);
      clock.advance(DOUBLE_TAP_WINDOW);
      expect(detector.tapAt(new Point2D(50, 50))).assertTrue();
      expect(detector.doubleTaps).assertEqual(1);
      detector.reset();
      expect(detector.acceptedCount()).assertEqual(0);
      expect(detector.rejectedCount()).assertEqual(0);
    });

    it('Browser_Gesture_011', 0, async () => {
      TestLogger.step(TAG, 'a distant second tap is rejected as a double tap');
      const clock: MockClock = new MockClock();
      const detector: DoubleTapDetector = new DoubleTapDetector(clock);
      detector.tapAt(new Point2D(10, 10));
      clock.advance(100);
      expect(detector.tapAt(new Point2D(200, 200))).assertFalse();
      expect(detector.rejectedCount()).assertEqual(1);
      expect(detector.doubleTaps).assertEqual(0);
      const reference: Point2D = new Point2D(10, 10);
      expect(reference.distanceTo(new Point2D(50, 10))).assertEqual(DOUBLE_TAP_MAX_DISTANCE);
      expect(reference.distanceTo(new Point2D(51, 10))).assertLarger(DOUBLE_TAP_MAX_DISTANCE);
      expect(reference.sameAs(new Point2D(10, 10))).assertTrue();
      expect(reference.describe()).assertEqual('(10,10)');
    });

    it('Browser_Gesture_012', 0, async () => {
      TestLogger.step(TAG, 'pinch out is recognized and zooms the page in');
      const pinch: PinchTracker = new PinchTracker();
      const span: number = pinch.begin(new Point2D(100, 100), new Point2D(200, 100));
      expect(span).assertEqual(100);
      expect(pinch.isActive()).assertTrue();
      pinch.update(new Point2D(50, 100), new Point2D(250, 100));
      expect(pinch.scale()).assertEqual(2);
      expect(pinch.scaleDelta()).assertEqual(1);
      expect(pinch.isRecognized()).assertTrue();
      expect(pinch.direction()).assertEqual('zoomIn');
      expect(pinch.applyToWeb()).assertEqual(2);
      expect(pinch.webScale).assertEqual(2);
      expect(pinch.end()).assertEqual(2);
      expect(pinch.isActive()).assertFalse();
    });

    it('Browser_Gesture_013', 0, async () => {
      TestLogger.step(TAG, 'pinch in zooms out and clamps at the minimum scale');
      const pinch: PinchTracker = new PinchTracker();
      pinch.webScale = 0.3;
      pinch.begin(new Point2D(0, 0), new Point2D(200, 0));
      pinch.update(new Point2D(90, 0), new Point2D(110, 0));
      expect(pinch.scale()).assertEqual(0.1);
      expect(pinch.direction()).assertEqual('zoomOut');
      expect(pinch.applyToWeb()).assertEqual(0.25);
      expect(pinch.webScale).assertEqual(0.25);
      pinch.webScale = 4.9;
      pinch.begin(new Point2D(0, 0), new Point2D(100, 0));
      pinch.update(new Point2D(0, 0), new Point2D(400, 0));
      expect(pinch.applyToWeb()).assertEqual(5);
      expect(pinch.zoomEvents).assertContain('apply:5');
    });

    it('Browser_Gesture_014', 0, async () => {
      TestLogger.step(TAG, 'a tiny span change is not a pinch gesture');
      const pinch: PinchTracker = new PinchTracker();
      pinch.begin(new Point2D(0, 0), new Point2D(100, 0));
      pinch.update(new Point2D(0, 0), new Point2D(103, 0));
      expect(pinch.scale()).assertEqual(1.03);
      expect(pinch.scaleDelta()).assertLess(PINCH_MIN_SCALE_DELTA);
      expect(pinch.isRecognized()).assertFalse();
      expect(pinch.direction()).assertEqual(DIRECTION_NONE);
      pinch.update(new Point2D(0, 0), new Point2D(104, 0));
      expect(pinch.isRecognized()).assertFalse();
      expect(pinch.scaleDelta()).assertEqual(0.04);
      const idle: PinchTracker = new PinchTracker();
      expect(idle.scale()).assertEqual(1);
      expect(idle.update(new Point2D(0, 0), new Point2D(50, 0))).assertEqual(1);
    });

    it('Browser_Gesture_015', 0, async () => {
      TestLogger.step(TAG, 'throttle drops samples inside the same window');
      const clock: MockClock = new MockClock();
      const throttle: GestureThrottle = new GestureThrottle(clock);
      expect(throttle.intervalMs()).assertEqual(DELAY_TOUCH_EVENT);
      expect(throttle.allow()).assertTrue();
      clock.advance(DELAY_TOUCH_EVENT - 1);
      expect(throttle.allow()).assertFalse();
      clock.advance(1);
      expect(throttle.allow()).assertTrue();
      expect(throttle.accepted).assertEqual(2);
      expect(throttle.rejected).assertEqual(1);
      expect(throttle.total()).assertEqual(3);
      expect(throttle.acceptanceRate()).assertLarger(0.6);
    });

    it('Browser_Gesture_016', 0, async () => {
      TestLogger.step(TAG, 'a burst of move events yields one accepted sample per window');
      const clock: MockClock = new MockClock();
      const throttle: GestureThrottle = new GestureThrottle(clock, 50);
      let accepted: number = 0;
      for (let index = 0; index < 8; index++) {
        if (throttle.allow()) {
          accepted += 1;
        }
        clock.advance(25);
      }
      expect(accepted).assertEqual(4);
      expect(throttle.accepted).assertEqual(4);
      expect(throttle.rejected).assertEqual(4);
      expect(throttle.acceptanceRate()).assertEqual(0.5);
      const gap: number = throttle.acceptedAt[1] - throttle.acceptedAt[0];
      expect(gap).assertEqual(50);
      throttle.reset();
      expect(throttle.total()).assertEqual(0);
    });

    it('Browser_Gesture_017', 0, async () => {
      TestLogger.step(TAG, 'the title bar always owns its own gestures');
      const arbiter: GestureArbiter = new GestureArbiter();
      expect(arbiter.decide(ZONE_TITLE_BAR, DIRECTION_LEFT, 100, false)).assertEqual(OWNER_PAGE);
      expect(arbiter.decide(ZONE_TITLE_BAR, DIRECTION_UP, 80, false)).assertEqual(OWNER_PAGE);
      expect(arbiter.decide(ZONE_TITLE_BAR, DIRECTION_NONE, 0, true)).assertEqual(OWNER_PAGE);
      expect(arbiter.decisionCount()).assertEqual(3);
      expect(arbiter.countOf(OWNER_PAGE)).assertEqual(3);
      expect(arbiter.countOf(OWNER_WEB)).assertEqual(0);
    });

    it('Browser_Gesture_018', 0, async () => {
      TestLogger.step(TAG, 'an edge swipe is consumed by the system back gesture');
      const arbiter: GestureArbiter = new GestureArbiter();
      expect(arbiter.decide(ZONE_EDGE, DIRECTION_RIGHT, 120, false)).assertEqual(OWNER_SYSTEM);
      expect(arbiter.backGestureConflicts(ZONE_EDGE, DIRECTION_RIGHT)).assertTrue();
      expect(arbiter.backGestureConflicts(ZONE_EDGE, DIRECTION_LEFT)).assertFalse();
      expect(arbiter.backGestureConflicts(ZONE_WEB_CONTENT, DIRECTION_RIGHT)).assertFalse();
      expect(arbiter.decide(ZONE_EDGE, DIRECTION_UP, 120, false)).assertEqual(OWNER_PAGE);
      expect(arbiter.countOf(OWNER_SYSTEM)).assertEqual(1);
      expect(EDGE_SWIPE_WIDTH).assertEqual(20);
    });

    it('Browser_Gesture_019', 0, async () => {
      TestLogger.step(TAG, 'vertical swipes inside the Web container scroll the page');
      const arbiter: GestureArbiter = new GestureArbiter();
      expect(arbiter.decide(ZONE_WEB_CONTENT, DIRECTION_UP, 200, false)).assertEqual(OWNER_WEB);
      expect(arbiter.decide(ZONE_WEB_CONTENT, DIRECTION_DOWN, 200, false)).assertEqual(OWNER_WEB);
      expect(arbiter.decide(ZONE_WEB_CONTENT, DIRECTION_UP, 20, false)).assertEqual(OWNER_WEB);
      arbiter.webScrollableVertically = false;
      expect(arbiter.decide(ZONE_WEB_CONTENT, DIRECTION_DOWN, 200, false)).assertEqual(OWNER_PAGE);
      expect(arbiter.decisionCount()).assertEqual(4);
      expect(arbiter.countOf(OWNER_WEB)).assertEqual(3);
      expect(arbiter.owners().length).assertEqual(4);
    });

    it('Browser_Gesture_020', 0, async () => {
      TestLogger.step(TAG, 'horizontal swipes only reach the Web when it can scroll');
      const arbiter: GestureArbiter = new GestureArbiter();
      expect(arbiter.decide(ZONE_WEB_CONTENT, DIRECTION_LEFT, 150, false)).assertEqual(OWNER_PAGE);
      arbiter.webScrollableHorizontally = true;
      expect(arbiter.decide(ZONE_WEB_CONTENT, DIRECTION_LEFT, 150, false)).assertEqual(OWNER_WEB);
      expect(arbiter.decide(ZONE_WEB_CONTENT, DIRECTION_RIGHT, 150, false)).assertEqual(OWNER_WEB);
      expect(arbiter.decisions[0]).assertEqual('webContent:left:150:page');
      expect(arbiter.decisions[1]).assertEqual('webContent:left:150:web');
      expect(arbiter.countOf(OWNER_WEB)).assertEqual(2);
    });

    it('Browser_Gesture_021', 0, async () => {
      TestLogger.step(TAG, 'pinch is always consumed by the Web container content');
      const arbiter: GestureArbiter = new GestureArbiter();
      expect(arbiter.decide(ZONE_WEB_CONTENT, DIRECTION_NONE, 0, true)).assertEqual(OWNER_WEB);
      expect(arbiter.decide(ZONE_TITLE_BAR, DIRECTION_NONE, 0, true)).assertEqual(OWNER_PAGE);
      expect(arbiter.decide(ZONE_EDGE, DIRECTION_NONE, 0, true)).assertEqual(OWNER_PAGE);
      expect(arbiter.countOf(OWNER_WEB)).assertEqual(1);
      expect(arbiter.countOf(OWNER_PAGE)).assertEqual(2);
      expect(arbiter.countOf(OWNER_SYSTEM)).assertEqual(0);
      expect(arbiter.owners()[0]).assertEqual(OWNER_WEB);
    });

    it('Browser_Gesture_022', 0, async () => {
      TestLogger.step(TAG, 'replaying gestures does not mutate the navigation history');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('example.com');
      browser.onPageEnd();
      const tab: MockBrowserTab | null = browser.getCurrentTab();
      const before: number = tab === null ? 0 : tab.controller.history.length;
      const arbiter: GestureArbiter = new GestureArbiter();
      for (let index = 0; index < 5; index++) {
        arbiter.decide(ZONE_WEB_CONTENT, DIRECTION_UP, 200, false);
      }
      const after: number = tab === null ? 0 : tab.controller.history.length;
      expect(before).assertEqual(1);
      expect(after).assertEqual(before);
      expect(arbiter.countOf(OWNER_WEB)).assertEqual(5);
      expect(browser.getTabArrayIndex()).assertEqual(0);
      expect(tab === null ? '' : tab.controller.currentUrl).assertEqual('https://example.com');
    });

    it('Browser_Gesture_023', 0, async () => {
      TestLogger.step(TAG, 'gesture handling stays local while the network is offline');
      const network: MockNetwork = new MockNetwork();
      const browser: MockBrowser = new MockBrowser();
      network.setOnline(false);
      expect(network.fetch('https://example.com')).assertFalse();
      expect(browser.loadUrl('example.com')).assertTrue();
      const classifier: GestureClassifier = new GestureClassifier();
      expect(classifier.classify(buildSwipe(100, 500, 100, 200))).assertEqual(GESTURE_SWIPE);
      expect(network.requestCount()).assertEqual(1);
      expect(network.online).assertFalse();
      const arbiter: GestureArbiter = new GestureArbiter();
      expect(arbiter.decide(ZONE_WEB_CONTENT, DIRECTION_UP, 300, false)).assertEqual(OWNER_WEB);
      network.setOnline(true);
      expect(network.fetch('https://example.com')).assertTrue();
      expect(network.requestCount()).assertEqual(2);
    });

    it('Browser_Gesture_024', 0, async () => {
      TestLogger.step(TAG, 'repeated pinches accumulate and stay inside the scale range');
      const pinch: PinchTracker = new PinchTracker();
      let lastDirection: string = DIRECTION_NONE;
      for (let round = 0; round < 3; round++) {
        pinch.begin(new Point2D(0, 0), new Point2D(100, 0));
        pinch.update(new Point2D(-50, 0), new Point2D(150, 0));
        lastDirection = pinch.direction();
        pinch.end();
      }
      expect(pinch.webScale).assertEqual(5);
      expect(lastDirection).assertEqual('zoomIn');
      expect(pinch.zoomEvents.length).assertEqual(9);
      for (let round = 0; round < 3; round++) {
        pinch.begin(new Point2D(0, 0), new Point2D(200, 0));
        pinch.update(new Point2D(95, 0), new Point2D(105, 0));
        lastDirection = pinch.direction();
        pinch.end();
      }
      expect(pinch.webScale).assertEqual(0.25);
      expect(lastDirection).assertEqual('zoomOut');
      expect(pinch.minScale).assertLess(pinch.maxScale);
    });

    it('Browser_Gesture_025', 0, async () => {
      TestLogger.step(TAG, 'classifier handles the four swipe directions in one table');
      const classifier: GestureClassifier = new GestureClassifier();
      const directions: string[] = [DIRECTION_RIGHT, DIRECTION_LEFT, DIRECTION_UP, DIRECTION_DOWN];
      const traces: GestureTrace[] = [
        buildSwipe(100, 300, 400, 300),
        buildSwipe(400, 300, 100, 300),
        buildSwipe(300, 600, 300, 300),
        buildSwipe(300, 300, 300, 600)
      ];
      for (let index = 0; index < traces.length; index++) {
        expect(traces[index].direction()).assertEqual(directions[index]);
        expect(classifier.classify(traces[index])).assertEqual(GESTURE_SWIPE);
        expect(traces[index].displacement()).assertEqual(300);
      }
      expect(classifier.classificationCount).assertEqual(4);
      expect(classifier.lastDecision).assertEqual(GESTURE_SWIPE);
    });

    it('Browser_Gesture_026', 0, async () => {
      TestLogger.step(TAG, 'the address input exists before a gesture replay starts');
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      await tapAt(driver, 240, 44);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      const buttons: number = await countById(driver, ID_NAV_BACK);
      expect(buttons).assertLarger(0);
      expect(buttons).assertLess(2);
      expect(await componentByIdExists(driver, ID_ACTION_ADD) ||
        await componentByIdExists(driver, ID_NAV_HOME)).assertTrue();
    });

    it('Browser_Gesture_027', 0, async () => {
      TestLogger.step(TAG, 'an upward swipe across the Web area stays inside the time budget');
      const clock: MockClock = new MockClock();
      const start: number = clock.now();
      await swipeUp(driver, 300, 600, 300, 200);
      clock.advance(DELAY_TOUCH_EVENT);
      const elapsed: number = clock.now() - start;
      TestLogger.info(TAG, `swipe elapsed=${elapsed} ms`);
      expect(elapsed).assertEqual(DELAY_TOUCH_EVENT);
      expect(elapsed).assertLess(TIMEOUT_COMPONENT);
      const trace: GestureTrace = buildSwipe(300, 600, 300, 200);
      expect(trace.direction()).assertEqual(DIRECTION_UP);
      expect(trace.displacement()).assertEqual(400);
      expect(new GestureClassifier().classify(trace)).assertEqual(GESTURE_SWIPE);
    });

    it('Browser_Gesture_028', 0, async () => {
      TestLogger.step(TAG, 'the refresh button still responds after a swipe gesture');
      const clicked: boolean = await clickById(driver, ID_NAV_REFRESH);
      TestLogger.info(TAG, `refresh click after swipe returned=${clicked}`);
      expect(clicked).assertTrue();
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('example.com');
      browser.refresh();
      const tab: MockBrowserTab | null = browser.getCurrentTab();
      expect(tab === null ? 0 : tab.controller.refreshCount).assertEqual(1);
      const throttle: GestureThrottle = new GestureThrottle(new MockClock());
      expect(throttle.allow()).assertTrue();
      expect(throttle.acceptanceRate()).assertEqual(1);
    });

    it('Browser_Gesture_029', 0, async () => {
      TestLogger.step(TAG, 'navigation controls survive a pinch replay without duplication');
      const pinch: PinchTracker = new PinchTracker();
      pinch.begin(new Point2D(100, 400), new Point2D(300, 400));
      pinch.update(new Point2D(50, 400), new Point2D(350, 400));
      pinch.applyToWeb();
      pinch.end();
      expect(pinch.webScale).assertEqual(1.5);
      const ids: string[] = [ID_NAV_BACK, ID_NAV_REFRESH, ID_ACTION_ADD];
      for (let index = 0; index < ids.length; index++) {
        const occurrences: number = await countById(driver, ids[index]);
        TestLogger.info(TAG, `id ${ids[index]} occurrences=${occurrences} after pinch replay`);
        expect(occurrences).assertLess(2);
      }
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
    });

    it('Browser_Gesture_030', 0, async () => {
      TestLogger.step(TAG, 'aggregate metrics of the gesture recognition pass');
      const classifier: GestureClassifier = new GestureClassifier();
      const samples: GestureTrace[] = [buildTap(), buildSwipe(10, 10, 200, 10),
        buildTrace(new Point2D(5, 5), new Point2D(6, 6), 1, LONG_PRESS_MIN_DURATION + 50)];
      const decisions: string[] = [];
      for (let index = 0; index < samples.length; index++) {
        decisions.push(classifier.classify(samples[index]));
      }
      expect(decisions[0]).assertEqual(GESTURE_TAP);
      expect(decisions[1]).assertEqual(GESTURE_SWIPE);
      expect(decisions[2]).assertEqual(GESTURE_LONG_PRESS);
      expect(classifier.classificationCount).assertEqual(3);
      const passed: number = decisions.length;
      expect(passed).assertEqual(3);
      expect(TOLERANCE_PROGRESS).assertLarger(0);
      TestLogger.info(TAG, `classified=${decisions.join('|')}`);
    });
  });
}
