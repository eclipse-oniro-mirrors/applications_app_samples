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
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  tapAt, swipeUp, ID_INPUT_URL, ID_NAV_BACK, ID_NAV_HOME, DELAY_TOUCH_EVENT,
  TIMEOUT_COMPONENT, TOLERANCE_COMPONENT_COUNT
} from '../Shared/BrowserTestKit';
import { MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserPointerUtilValidationTest';

/* ------------------------------------------------------------------ */
/* Pointer protocol vocabulary                                        */
/* ------------------------------------------------------------------ */

const POINTER_DOWN: string = 'down';
const POINTER_MOVE: string = 'move';
const POINTER_UP: string = 'up';
const POINTER_CANCEL: string = 'cancel';

const GESTURE_TAP: string = 'tap';
const GESTURE_LONG_PRESS: string = 'longPress';
const GESTURE_SWIPE: string = 'swipe';
const GESTURE_DOUBLE_TAP: string = 'doubleTap';
const GESTURE_PINCH_IN: string = 'pinchIn';
const GESTURE_PINCH_OUT: string = 'pinchOut';
const GESTURE_NONE: string = 'none';

const DIRECTION_LEFT: string = 'left';
const DIRECTION_RIGHT: string = 'right';
const DIRECTION_UP: string = 'up';
const DIRECTION_DOWN: string = 'down';
const DIRECTION_NONE: string = 'none';

/* ------------------------------------------------------------------ */
/* Thresholds mirrored from the touch recognizer of the sample        */
/* ------------------------------------------------------------------ */

const TOUCH_SLOP_PX: number = 10;
const TAP_MAX_DURATION_MS: number = 200;
const LONG_PRESS_MIN_DURATION_MS: number = 500;
const SWIPE_MIN_DISTANCE_PX: number = 50;
const DOUBLE_TAP_WINDOW_MS: number = 300;
const DOUBLE_TAP_SLOP_PX: number = 24;
const PINCH_MIN_SCALE_DELTA: number = 0.05;
const PINCH_MIN_SPAN_PX: number = 20;
const SAMPLING_INTERVAL_MS: number = 16;
const DEBOUNCE_WINDOW_MS: number = 32;
const MIN_SAMPLE_DISTANCE_PX: number = 4;
const MAX_POINTERS: number = 10;
const MAX_TRACE_POINTS: number = 512;
const MAX_DISPATCH_QUEUE: number = 64;

const DEFAULT_VIEWPORT_WIDTH: number = 1260;
const DEFAULT_VIEWPORT_HEIGHT: number = 2720;
const PHONE_DENSITY: number = 3;
const TABLET_DENSITY: number = 2;
const BASE_DENSITY: number = 1;

/* ------------------------------------------------------------------ */
/* Number helpers                                                     */
/* ------------------------------------------------------------------ */

function roundTo(value: number, digits: number = 2): number {
  const factor: number = Math.pow(10, digits);
  return Math.round(value * factor) / factor;
}

function clampValue(value: number, min: number, max: number): number {
  if (value < min) {
    return min;
  }
  if (value > max) {
    return max;
  }
  return value;
}

function distanceBetween(x1: number, y1: number, x2: number, y2: number): number {
  const dx: number = x2 - x1;
  const dy: number = y2 - y1;
  return roundTo(Math.sqrt(dx * dx + dy * dy), 2);
}

function sameNumber(left: number, right: number, epsilon: number = 0.01): boolean {
  return Math.abs(left - right) <= epsilon;
}

function validDensity(density: number): number {
  if (Number.isNaN(density) || density <= 0) {
    return BASE_DENSITY;
  }
  return density;
}

/* ------------------------------------------------------------------ */
/* Table driven gesture expectations                                  */
/* ------------------------------------------------------------------ */

interface GestureCase {
  name: string;
  dx: number;
  dy: number;
  durationMs: number;
  expected: string;
}

interface ThresholdCase {
  label: string;
  durationMs: number;
  movedPx: number;
  expected: string;
}

const GESTURE_CASES: GestureCase[] = [
  { name: 'stationary-short', dx: 0, dy: 0, durationMs: 80, expected: GESTURE_TAP },
  { name: 'stationary-tap-limit', dx: 2, dy: 2, durationMs: 200, expected: GESTURE_TAP },
  { name: 'slow-hold', dx: 0, dy: 0, durationMs: 500, expected: GESTURE_LONG_PRESS },
  { name: 'slow-hold-long', dx: 3, dy: 4, durationMs: 1200, expected: GESTURE_LONG_PRESS },
  { name: 'fast-drag', dx: 60, dy: 0, durationMs: 120, expected: GESTURE_SWIPE },
  { name: 'vertical-drag', dx: 0, dy: -80, durationMs: 150, expected: GESTURE_SWIPE },
  { name: 'tiny-jitter', dx: 8, dy: 6, durationMs: 150, expected: GESTURE_TAP },
  { name: 'slow-short-drag', dx: 12, dy: 0, durationMs: 300, expected: GESTURE_NONE }
];

const THRESHOLD_CASES: ThresholdCase[] = [
  { label: 'tap-inside', durationMs: 120, movedPx: 9, expected: GESTURE_TAP },
  { label: 'tap-boundary', durationMs: 200, movedPx: 10, expected: GESTURE_TAP },
  { label: 'slop-exceeded', durationMs: 220, movedPx: 11, expected: GESTURE_NONE },
  { label: 'long-press-exact', durationMs: 500, movedPx: 0, expected: GESTURE_LONG_PRESS },
  { label: 'long-press-below', durationMs: 499, movedPx: 0, expected: GESTURE_NONE },
  { label: 'swipe-exact', durationMs: 260, movedPx: 50, expected: GESTURE_SWIPE },
  { label: 'swipe-below', durationMs: 260, movedPx: 49, expected: GESTURE_NONE }
];

/* ------------------------------------------------------------------ */
/* Geometry primitives                                                */
/* ------------------------------------------------------------------ */

/** A single coordinate pair in either px or vp. */
class TouchPoint {
  x: number;
  y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }

  offsetX(other: TouchPoint): number {
    return other.x - this.x;
  }

  offsetY(other: TouchPoint): number {
    return other.y - this.y;
  }

  distanceTo(other: TouchPoint): number {
    return distanceBetween(this.x, this.y, other.x, other.y);
  }

  sameAs(other: TouchPoint): boolean {
    return this.x === other.x && this.y === other.y;
  }

  translated(dx: number, dy: number): TouchPoint {
    return new TouchPoint(this.x + dx, this.y + dy);
  }

  scaled(factor: number): TouchPoint {
    return new TouchPoint(roundTo(this.x * factor), roundTo(this.y * factor));
  }

  isWithin(other: TouchPoint, slop: number = TOUCH_SLOP_PX): boolean {
    return this.distanceTo(other) <= slop;
  }

  /** Converts a device px point into vp using the supplied screen density. */
  toVp(density: number): TouchPoint {
    const ratio: number = validDensity(density);
    return new TouchPoint(roundTo(this.x / ratio), roundTo(this.y / ratio));
  }

  /** Converts a vp point into device px. */
  toPx(density: number): TouchPoint {
    const ratio: number = validDensity(density);
    return new TouchPoint(Math.round(this.x * ratio), Math.round(this.y * ratio));
  }

  describe(): string {
    return `(${roundTo(this.x)},${roundTo(this.y)})`;
  }
}

/** Screen box used for px/vp conversion and out-of-bounds checks. */
class Viewport {
  width: number;
  height: number;
  density: number;

  constructor(width: number = DEFAULT_VIEWPORT_WIDTH, height: number = DEFAULT_VIEWPORT_HEIGHT,
    density: number = PHONE_DENSITY) {
    this.width = width;
    this.height = height;
    this.density = validDensity(density);
  }

  pxToVp(px: number): number {
    return roundTo(px / this.density);
  }

  vpToPx(vp: number): number {
    return Math.round(vp * this.density);
  }

  isInside(x: number, y: number): boolean {
    return x >= 0 && x <= this.width && y >= 0 && y <= this.height;
  }

  isInsidePoint(point: TouchPoint): boolean {
    return this.isInside(point.x, point.y);
  }

  clampX(x: number): number {
    return clampValue(x, 0, this.width);
  }

  clampY(y: number): number {
    return clampValue(y, 0, this.height);
  }

  clampPoint(point: TouchPoint): TouchPoint {
    return new TouchPoint(this.clampX(point.x), this.clampY(point.y));
  }

  center(): TouchPoint {
    return new TouchPoint(roundTo(this.width / 2), roundTo(this.height / 2));
  }

  /** Shortest distance to any border, useful for edge gesture rejection. */
  edgeDistance(x: number, y: number): number {
    const left: number = x;
    const right: number = this.width - x;
    const top: number = y;
    const bottom: number = this.height - y;
    return roundTo(Math.min(Math.min(left, right), Math.min(top, bottom)));
  }

  widthVp(): number {
    return this.pxToVp(this.width);
  }

  heightVp(): number {
    return this.pxToVp(this.height);
  }

  sameAs(other: Viewport | null): boolean {
    if (other === null) {
      return false;
    }
    return this.width === other.width && this.height === other.height &&
      sameNumber(this.density, other.density);
  }

  describe(): string {
    return `${this.width}x${this.height}@${this.density}`;
  }
}

/** One timestamped sample of a pointer path. */
class TracePoint {
  x: number;
  y: number;
  timestamp: number;
  pressure: number;

  constructor(x: number, y: number, timestamp: number, pressure: number = 1) {
    this.x = x;
    this.y = y;
    this.timestamp = timestamp;
    this.pressure = pressure;
  }

  point(): TouchPoint {
    return new TouchPoint(this.x, this.y);
  }

  distanceTo(other: TracePoint): number {
    return distanceBetween(this.x, this.y, other.x, other.y);
  }

  samePositionAs(other: TracePoint): boolean {
    return this.x === other.x && this.y === other.y;
  }

  describe(): string {
    return `[${this.timestamp}](${this.x},${this.y},${roundTo(this.pressure)})`;
  }
}

/* ------------------------------------------------------------------ */
/* Pointer trace accumulator                                          */
/* ------------------------------------------------------------------ */

/**
 * Ordered samples of one pointer, the unit every recognizer works on.
 *
 * Points are appended chronologically by the framework; the class never
 * sorts them because a reordered stream is itself a defect the tests want
 * to observe.
 */
class PointerTrace {
  pointerId: number;
  points: TracePoint[] = [];
  truncated: number = 0;

  constructor(pointerId: number = 0) {
    this.pointerId = pointerId;
  }

  add(x: number, y: number, timestamp: number, pressure: number = 1): TracePoint {
    const sample: TracePoint = new TracePoint(x, y, timestamp, pressure);
    this.addSample(sample);
    return sample;
  }

  addSample(sample: TracePoint): boolean {
    if (this.points.length >= MAX_TRACE_POINTS) {
      this.truncated += 1;
      return false;
    }
    this.points.push(sample);
    return true;
  }

  count(): number {
    return this.points.length;
  }

  isEmpty(): boolean {
    return this.points.length === 0;
  }

  firstPoint(): TracePoint | null {
    if (this.points.length === 0) {
      return null;
    }
    return this.points[0];
  }

  lastPoint(): TracePoint | null {
    if (this.points.length === 0) {
      return null;
    }
    return this.points[this.points.length - 1];
  }

  pointAt(index: number): TracePoint | null {
    if (index < 0 || index >= this.points.length) {
      return null;
    }
    return this.points[index];
  }

  beginTime(): number {
    const first: TracePoint | null = this.firstPoint();
    return first === null ? 0 : first.timestamp;
  }

  endTime(): number {
    const last: TracePoint | null = this.lastPoint();
    return last === null ? 0 : last.timestamp;
  }

  duration(): number {
    if (this.points.length < 2) {
      return 0;
    }
    return this.endTime() - this.beginTime();
  }

  /** Sum of every segment length, i.e. the length actually travelled. */
  totalDistance(): number {
    let total: number = 0;
    for (let index = 1; index < this.points.length; index++) {
      total += this.points[index - 1].distanceTo(this.points[index]);
    }
    return roundTo(total);
  }

  /** Length of the straight line between first and last point. */
  straightDistance(): number {
    const first: TracePoint | null = this.firstPoint();
    const last: TracePoint | null = this.lastPoint();
    if (first === null || last === null) {
      return 0;
    }
    return first.distanceTo(last);
  }

  /** Ratio of straight to travelled distance, 1 means a perfectly straight path. */
  pathEfficiency(): number {
    const travelled: number = this.totalDistance();
    if (travelled <= 0) {
      return 0;
    }
    return roundTo(this.straightDistance() / travelled, 3);
  }

  displacementX(): number {
    const first: TracePoint | null = this.firstPoint();
    const last: TracePoint | null = this.lastPoint();
    if (first === null || last === null) {
      return 0;
    }
    return last.x - first.x;
  }

  displacementY(): number {
    const first: TracePoint | null = this.firstPoint();
    const last: TracePoint | null = this.lastPoint();
    if (first === null || last === null) {
      return 0;
    }
    return last.y - first.y;
  }

  displacement(): TouchPoint {
    return new TouchPoint(this.displacementX(), this.displacementY());
  }

  /** Largest per segment speed in px per second. */
  maxSpeed(): number {
    let maxValue: number = 0;
    for (let index = 1; index < this.points.length; index++) {
      const span: number = this.points[index].timestamp - this.points[index - 1].timestamp;
      if (span <= 0) {
        continue;
      }
      const speed: number = this.points[index - 1].distanceTo(this.points[index]) * 1000 / span;
      if (speed > maxValue) {
        maxValue = speed;
      }
    }
    return roundTo(maxValue);
  }

  /** Average speed over the whole trace, 0 when the duration is 0. */
  averageSpeed(): number {
    const elapsed: number = this.duration();
    if (elapsed <= 0) {
      return 0;
    }
    return roundTo(this.totalDistance() * 1000 / elapsed);
  }

  movedBeyond(slop: number = TOUCH_SLOP_PX): boolean {
    return this.straightDistance() > slop;
  }

  withinSlop(slop: number = TOUCH_SLOP_PX): boolean {
    return !this.movedBeyond(slop);
  }

  /** True when any segment exceeds the slop, not only the end to end vector. */
  everMovedBeyond(slop: number = TOUCH_SLOP_PX): boolean {
    const first: TracePoint | null = this.firstPoint();
    if (first === null) {
      return false;
    }
    for (let index = 1; index < this.points.length; index++) {
      if (this.points[index].distanceTo(first) > slop) {
        return true;
      }
    }
    return false;
  }

  peakPressure(): number {
    let peak: number = 0;
    for (let index = 0; index < this.points.length; index++) {
      if (this.points[index].pressure > peak) {
        peak = this.points[index].pressure;
      }
    }
    return roundTo(peak);
  }

  /** Drops samples that arrive within the same debounce bucket. */
  dedupe(windowMs: number = DEBOUNCE_WINDOW_MS): number {
    if (this.points.length <= 1 || windowMs <= 0) {
      return 0;
    }
    const kept: TracePoint[] = [this.points[0]];
    let removed: number = 0;
    for (let index = 1; index < this.points.length; index++) {
      const previous: TracePoint = kept[kept.length - 1];
      if (this.points[index].timestamp - previous.timestamp < windowMs &&
        this.points[index].samePositionAs(previous)) {
        removed += 1;
        continue;
      }
      kept.push(this.points[index]);
    }
    this.points = kept;
    return removed;
  }

  /** Keeps one sample per sampling interval plus the final sample. */
  sampleEvery(intervalMs: number = SAMPLING_INTERVAL_MS): number {
    if (this.points.length <= 2 || intervalMs <= 0) {
      return 0;
    }
    const kept: TracePoint[] = [this.points[0]];
    let removed: number = 0;
    let nextBoundary: number = this.points[0].timestamp + intervalMs;
    for (let index = 1; index < this.points.length - 1; index++) {
      if (this.points[index].timestamp >= nextBoundary) {
        kept.push(this.points[index]);
        nextBoundary = this.points[index].timestamp + intervalMs;
      } else {
        removed += 1;
      }
    }
    kept.push(this.points[this.points.length - 1]);
    this.points = kept;
    return removed;
  }

  /** Keeps samples only when they are at least minStep px away from the last one. */
  sampleByDistance(minStep: number = MIN_SAMPLE_DISTANCE_PX): number {
    if (this.points.length <= 2 || minStep <= 0) {
      return 0;
    }
    const kept: TracePoint[] = [this.points[0]];
    let removed: number = 0;
    for (let index = 1; index < this.points.length - 1; index++) {
      const previous: TracePoint = kept[kept.length - 1];
      if (this.points[index].distanceTo(previous) >= minStep) {
        kept.push(this.points[index]);
      } else {
        removed += 1;
      }
    }
    kept.push(this.points[this.points.length - 1]);
    this.points = kept;
    return removed;
  }

  /** Clamps every sample into the viewport and reports how many moved. */
  clampToViewport(viewport: Viewport): number {
    let clamped: number = 0;
    for (let index = 0; index < this.points.length; index++) {
      const sample: TracePoint = this.points[index];
      const x: number = viewport.clampX(sample.x);
      const y: number = viewport.clampY(sample.y);
      if (x !== sample.x || y !== sample.y) {
        sample.x = x;
        sample.y = y;
        clamped += 1;
      }
    }
    return clamped;
  }

  outOfBoundsCount(viewport: Viewport): number {
    let count: number = 0;
    for (let index = 0; index < this.points.length; index++) {
      if (!viewport.isInside(this.points[index].x, this.points[index].y)) {
        count += 1;
      }
    }
    return count;
  }

  clone(): PointerTrace {
    const copy: PointerTrace = new PointerTrace(this.pointerId);
    for (let index = 0; index < this.points.length; index++) {
      const sample: TracePoint = this.points[index];
      copy.points.push(new TracePoint(sample.x, sample.y, sample.timestamp, sample.pressure));
    }
    copy.truncated = this.truncated;
    return copy;
  }

  describe(): string {
    return `pointer=${this.pointerId} samples=${this.count()} duration=${this.duration()} ` +
      `travel=${this.totalDistance()} straight=${this.straightDistance()}`;
  }
}

/* ------------------------------------------------------------------ */
/* Recognizer thresholds                                              */
/* ------------------------------------------------------------------ */

/** Tunable thresholds of the recognizer, mirrored from PointerUtil. */
class GestureThresholds {
  slopPx: number;
  tapMaxMs: number;
  longPressMinMs: number;
  swipeMinPx: number;
  doubleTapWindowMs: number;
  doubleTapSlopPx: number;

  constructor(slopPx: number = TOUCH_SLOP_PX, tapMaxMs: number = TAP_MAX_DURATION_MS,
    longPressMinMs: number = LONG_PRESS_MIN_DURATION_MS,
    swipeMinPx: number = SWIPE_MIN_DISTANCE_PX,
    doubleTapWindowMs: number = DOUBLE_TAP_WINDOW_MS,
    doubleTapSlopPx: number = DOUBLE_TAP_SLOP_PX) {
    this.slopPx = slopPx;
    this.tapMaxMs = tapMaxMs;
    this.longPressMinMs = longPressMinMs;
    this.swipeMinPx = swipeMinPx;
    this.doubleTapWindowMs = doubleTapWindowMs;
    this.doubleTapSlopPx = doubleTapSlopPx;
  }

  static defaults(): GestureThresholds {
    return new GestureThresholds();
  }

  /** True when every threshold of this instance is at least as strict. */
  isStricterThan(other: GestureThresholds): boolean {
    return this.slopPx <= other.slopPx && this.tapMaxMs <= other.tapMaxMs &&
      this.longPressMinMs >= other.longPressMinMs && this.swipeMinPx >= other.swipeMinPx;
  }

  isTapDuration(durationMs: number): boolean {
    return durationMs >= 0 && durationMs <= this.tapMaxMs;
  }

  isLongPressDuration(durationMs: number): boolean {
    return durationMs >= this.longPressMinMs;
  }

  withSlop(slopPx: number): GestureThresholds {
    return new GestureThresholds(slopPx, this.tapMaxMs, this.longPressMinMs,
      this.swipeMinPx, this.doubleTapWindowMs, this.doubleTapSlopPx);
  }

  describe(): string {
    return `slop=${this.slopPx} tap=${this.tapMaxMs} longPress=${this.longPressMinMs} ` +
      `swipe=${this.swipeMinPx}`;
  }
}

/** Builds a synthetic trace from table driven expectations. */
function buildTraceFor(name: string, dx: number, dy: number, durationMs: number,
  pointerId: number = 0): PointerTrace {
  const trace: PointerTrace = new PointerTrace(pointerId);
  const originX: number = 200;
  const originY: number = 200;
  trace.add(originX, originY, 1000);
  if (dx === 0 && dy === 0) {
    trace.add(originX, originY, 1000 + Math.round(durationMs / 2));
  } else {
    trace.add(originX + Math.round(dx / 2), originY + Math.round(dy / 2),
      1000 + Math.round(durationMs / 2));
  }
  trace.add(originX + dx, originY + dy, 1000 + durationMs);
  return trace;
}

function buildTraceWithMoved(movedPx: number, durationMs: number,
  pointerId: number = 0): PointerTrace {
  return buildTraceFor('generated', movedPx, 0, durationMs, pointerId);
}

/* ------------------------------------------------------------------ */
/* Gesture classifier                                                 */
/* ------------------------------------------------------------------ */

class GestureClassifier {
  thresholds: GestureThresholds;

  constructor(thresholds: GestureThresholds = GestureThresholds.defaults()) {
    this.thresholds = thresholds;
  }

  /**
   * Priority order matters: a still pointer is a tap or a long press,
   * movement itself only promotes the gesture to a swipe.
   */
  classify(trace: PointerTrace): string {
    if (trace.isEmpty()) {
      return GESTURE_NONE;
    }
    const elapsed: number = trace.duration();
    const moved: boolean = trace.everMovedBeyond(this.thresholds.slopPx);
    if (!moved && elapsed <= this.thresholds.tapMaxMs) {
      return GESTURE_TAP;
    }
    if (!moved && elapsed >= this.thresholds.longPressMinMs) {
      return GESTURE_LONG_PRESS;
    }
    if (trace.straightDistance() >= this.thresholds.swipeMinPx) {
      return GESTURE_SWIPE;
    }
    return GESTURE_NONE;
  }

  /** Dominant axis of a swipe, the shorter axis is ignored. */
  direction(trace: PointerTrace): string {
    if (trace.isEmpty()) {
      return DIRECTION_NONE;
    }
    const dx: number = trace.displacementX();
    const dy: number = trace.displacementY();
    const magnitude: number = trace.straightDistance();
    if (magnitude < this.thresholds.swipeMinPx) {
      return DIRECTION_NONE;
    }
    const absX: number = Math.abs(dx);
    const absY: number = Math.abs(dy);
    if (absX >= absY) {
      return dx > 0 ? DIRECTION_RIGHT : DIRECTION_LEFT;
    }
    return dy > 0 ? DIRECTION_DOWN : DIRECTION_UP;
  }

  /** Two independent taps inside the window and close enough together. */
  isDoubleTap(first: PointerTrace, second: PointerTrace): boolean {
    if (first.isEmpty() || second.isEmpty()) {
      return false;
    }
    if (this.classify(first) !== GESTURE_TAP || this.classify(second) !== GESTURE_TAP) {
      return false;
    }
    const gap: number = second.beginTime() - first.endTime();
    if (gap < 0 || gap > this.thresholds.doubleTapWindowMs) {
      return false;
    }
    const firstPoint: TracePoint | null = first.firstPoint();
    const secondPoint: TracePoint | null = second.firstPoint();
    if (firstPoint === null || secondPoint === null) {
      return false;
    }
    return firstPoint.distanceTo(secondPoint) <= this.thresholds.doubleTapSlopPx;
  }

  classifyPair(first: PointerTrace, second: PointerTrace): string {
    return this.isDoubleTap(first, second) ? GESTURE_DOUBLE_TAP : this.classify(second);
  }

  /** Scale factor of two pointers measured before and after the gesture. */
  scaleFactor(startSpan: number, endSpan: number): number {
    if (startSpan <= 0) {
      return 0;
    }
    return roundTo(endSpan / startSpan, 3);
  }

  /** Pinch needs a minimal span and a minimal relative change. */
  pinchKind(startSpan: number, endSpan: number): string {
    if (startSpan < PINCH_MIN_SPAN_PX || endSpan < PINCH_MIN_SPAN_PX) {
      return GESTURE_NONE;
    }
    const scale: number = this.scaleFactor(startSpan, endSpan);
    if (Math.abs(scale - 1) < PINCH_MIN_SCALE_DELTA) {
      return GESTURE_NONE;
    }
    return scale > 1 ? GESTURE_PINCH_OUT : GESTURE_PINCH_IN;
  }

  /** Frame level label used by the scheduler when several pointers exist. */
  classifyMulti(session: MultiPointerSession): string {
    if (session.activeCount() < 2) {
      return this.classify(session.firstTrace());
    }
    const span: number = session.span();
    return this.pinchKind(session.initialSpan(), span);
  }
}

/* ------------------------------------------------------------------ */
/* Multi pointer session                                              */
/* ------------------------------------------------------------------ */

/**
 * Tracks several pointers at once.
 *
 * A finished pointer keeps its trace so the recognizer can inspect the
 * full path after the up event; concurrency limits only apply to pointers
 * that are still down.
 */
class MultiPointerSession {
  traces: Map<number, PointerTrace> = new Map<number, PointerTrace>();
  finished: number[] = [];
  cancelledCount: number = 0;
  maxConcurrent: number = 0;
  rejectedDown: number = 0;
  private spanOnSecondDown: number = 0;

  down(pointerId: number, x: number, y: number, timestamp: number): boolean {
    if (this.traces.has(pointerId)) {
      this.rejectedDown += 1;
      return false;
    }
    if (this.activeCount() >= MAX_POINTERS) {
      this.rejectedDown += 1;
      return false;
    }
    const trace: PointerTrace = new PointerTrace(pointerId);
    trace.add(x, y, timestamp);
    this.traces.set(pointerId, trace);
    if (this.activeCount() === 2) {
      this.spanOnSecondDown = this.span();
    }
    if (this.activeCount() > this.maxConcurrent) {
      this.maxConcurrent = this.activeCount();
    }
    return true;
  }

  move(pointerId: number, x: number, y: number, timestamp: number): boolean {
    const trace: PointerTrace | null = this.traceOf(pointerId);
    if (trace === null) {
      return false;
    }
    if (this.finished.indexOf(pointerId) >= 0) {
      return false;
    }
    trace.add(x, y, timestamp);
    return true;
  }

  up(pointerId: number, x: number, y: number, timestamp: number): boolean {
    const trace: PointerTrace | null = this.traceOf(pointerId);
    if (trace === null || this.finished.indexOf(pointerId) >= 0) {
      return false;
    }
    trace.add(x, y, timestamp);
    this.finished.push(pointerId);
    return true;
  }

  cancel(pointerId: number, timestamp: number): boolean {
    const trace: PointerTrace | null = this.traceOf(pointerId);
    if (trace === null || this.finished.indexOf(pointerId) >= 0) {
      return false;
    }
    const last: TracePoint | null = trace.lastPoint();
    if (last !== null) {
      trace.add(last.x, last.y, timestamp);
    }
    this.finished.push(pointerId);
    this.cancelledCount += 1;
    return true;
  }

  activeCount(): number {
    return this.traces.size - this.finished.length;
  }

  pointerCount(): number {
    return this.traces.size;
  }

  pointerIds(): number[] {
    const ids: number[] = [];
    this.traces.forEach((trace: PointerTrace, pointerId: number) => {
      ids.push(pointerId);
    });
    ids.sort((left: number, right: number) => left - right);
    return ids;
  }

  traceOf(pointerId: number): PointerTrace | null {
    const trace: PointerTrace | undefined = this.traces.get(pointerId);
    return trace === undefined ? null : trace;
  }

  firstTrace(): PointerTrace {
    let result: PointerTrace | null = null;
    this.traces.forEach((trace: PointerTrace) => {
      if (result === null) {
        result = trace;
      }
    });
    return result === null ? new PointerTrace(0) : result;
  }

  /** Average of the last sample of every pointer still down. */
  centroid(): TouchPoint {
    let sumX: number = 0;
    let sumY: number = 0;
    let count: number = 0;
    this.traces.forEach((trace: PointerTrace) => {
      if (this.finished.indexOf(trace.pointerId) >= 0) {
        return;
      }
      const last: TracePoint | null = trace.lastPoint();
      if (last !== null) {
        sumX += last.x;
        sumY += last.y;
        count += 1;
      }
    });
    if (count === 0) {
      return new TouchPoint(0, 0);
    }
    return new TouchPoint(roundTo(sumX / count), roundTo(sumY / count));
  }

  /** Largest distance between the last samples of two active pointers. */
  span(): number {
    const active: TracePoint[] = [];
    this.traces.forEach((trace: PointerTrace) => {
      if (this.finished.indexOf(trace.pointerId) >= 0) {
        return;
      }
      const last: TracePoint | null = trace.lastPoint();
      if (last !== null) {
        active.push(last);
      }
    });
    let maxSpan: number = 0;
    for (let left = 0; left < active.length; left++) {
      for (let right = left + 1; right < active.length; right++) {
        const span: number = active[left].distanceTo(active[right]);
        if (span > maxSpan) {
          maxSpan = span;
        }
      }
    }
    return maxSpan;
  }

  initialSpan(): number {
    return this.spanOnSecondDown;
  }

  totalSamples(): number {
    let total: number = 0;
    this.traces.forEach((trace: PointerTrace) => {
      total += trace.count();
    });
    return total;
  }

  isPinching(minSpan: number = PINCH_MIN_SPAN_PX): boolean {
    return this.activeCount() >= 2 && this.span() >= minSpan;
  }

  dropFinished(): number {
    const removed: number = this.finished.length;
    this.finished = [];
    return removed;
  }

  describe(): string {
    return `pointers=${this.pointerCount()} active=${this.activeCount()} ` +
      `max=${this.maxConcurrent} samples=${this.totalSamples()}`;
  }
}

/* ------------------------------------------------------------------ */
/* Debounce and sampling helpers                                      */
/* ------------------------------------------------------------------ */

/** Rejects duplicate taps produced by the same physical press. */
class TapDebouncer {
  windowMs: number;
  slopPx: number;
  accepted: number = 0;
  rejected: number = 0;
  private lastTimestamp: number = -1;
  private lastPoint: TouchPoint | null = null;

  constructor(windowMs: number = DEBOUNCE_WINDOW_MS, slopPx: number = TOUCH_SLOP_PX) {
    this.windowMs = windowMs;
    this.slopPx = slopPx;
  }

  shouldAccept(point: TouchPoint, timestamp: number): boolean {
    if (this.lastTimestamp >= 0 && timestamp - this.lastTimestamp < this.windowMs &&
      this.lastPoint !== null && point.isWithin(this.lastPoint, this.slopPx)) {
      this.rejected += 1;
      return false;
    }
    this.lastPoint = point;
    this.lastTimestamp = timestamp;
    this.accepted += 1;
    return true;
  }

  reset(): void {
    this.accepted = 0;
    this.rejected = 0;
    this.lastTimestamp = -1;
    this.lastPoint = null;
  }

  describe(): string {
    return `accepted=${this.accepted} rejected=${this.rejected} window=${this.windowMs}`;
  }
}

/** Resamples and interpolates traces before they reach the recognizer. */
class TraceSampler {
  intervalMs: number;
  minStep: number;

  constructor(intervalMs: number = SAMPLING_INTERVAL_MS,
    minStep: number = MIN_SAMPLE_DISTANCE_PX) {
    this.intervalMs = intervalMs;
    this.minStep = minStep;
  }

  /** Time based down sampling, the original trace is left untouched. */
  sampleByTime(trace: PointerTrace): PointerTrace {
    const copy: PointerTrace = trace.clone();
    copy.sampleEvery(this.intervalMs);
    return copy;
  }

  sampleByDistance(trace: PointerTrace): PointerTrace {
    const copy: PointerTrace = trace.clone();
    copy.sampleByDistance(this.minStep);
    return copy;
  }

  /** Keeps at most one sample per throttle window, plus the final sample. */
  throttle(trace: PointerTrace, windowMs: number): PointerTrace {
    const result: PointerTrace = new PointerTrace(trace.pointerId);
    if (trace.isEmpty()) {
      return result;
    }
    const first: TracePoint | null = trace.firstPoint();
    if (first !== null) {
      result.addSample(first);
    }
    let nextBoundary: number = trace.beginTime() + windowMs;
    for (let index = 1; index < trace.count() - 1; index++) {
      const sample: TracePoint | null = trace.pointAt(index);
      if (sample !== null && sample.timestamp >= nextBoundary) {
        result.addSample(sample);
        nextBoundary = sample.timestamp + windowMs;
      }
    }
    const last: TracePoint | null = trace.lastPoint();
    if (last !== null) {
      result.addSample(last);
    }
    return result;
  }

  /** Linear interpolation used when a frame has no native sample. */
  interpolate(start: TracePoint, end: TracePoint, ratio: number): TracePoint {
    const safeRatio: number = clampValue(ratio, 0, 1);
    const x: number = roundTo(start.x + (end.x - start.x) * safeRatio);
    const y: number = roundTo(start.y + (end.y - start.y) * safeRatio);
    const timestamp: number = Math.round(start.timestamp +
      (end.timestamp - start.timestamp) * safeRatio);
    const pressure: number = roundTo(start.pressure +
      (end.pressure - start.pressure) * safeRatio, 3);
    return new TracePoint(x, y, timestamp, pressure);
  }

  expectedSampleCount(trace: PointerTrace): number {
    if (trace.isEmpty()) {
      return 0;
    }
    return Math.floor(trace.duration() / this.intervalMs) + 2;
  }
}

/* ------------------------------------------------------------------ */
/* Dispatch queue                                                     */
/* ------------------------------------------------------------------ */

/** One event handed to the framework input pipeline. */
class PointerSample {
  kind: string;
  point: TouchPoint;
  timestamp: number;
  pointerId: number;
  pressure: number;

  constructor(kind: string, point: TouchPoint, timestamp: number,
    pointerId: number = 0, pressure: number = 1) {
    this.kind = kind;
    this.point = point;
    this.timestamp = timestamp;
    this.pointerId = pointerId;
    this.pressure = pressure;
  }

  isKnownKind(): boolean {
    return this.kind === POINTER_DOWN || this.kind === POINTER_MOVE ||
      this.kind === POINTER_UP || this.kind === POINTER_CANCEL;
  }

  sameAs(other: PointerSample): boolean {
    return this.kind === other.kind && this.pointerId === other.pointerId &&
      this.point.sameAs(other.point);
  }

  describe(): string {
    return `${this.kind}#${this.pointerId}@${this.timestamp}${this.point.describe()}`;
  }
}

/** Bounded FIFO standing in for the platform input queue. */
class PointerDispatch {
  capacity: number;
  queue: PointerSample[] = [];
  accepted: number = 0;
  dropped: number = 0;
  dispatched: number = 0;

  constructor(capacity: number = MAX_DISPATCH_QUEUE) {
    this.capacity = capacity <= 0 ? 1 : capacity;
  }

  enqueue(sample: PointerSample): boolean {
    if (!sample.isKnownKind()) {
      this.dropped += 1;
      return false;
    }
    if (this.queue.length >= this.capacity) {
      this.dropped += 1;
      return false;
    }
    this.queue.push(sample);
    this.accepted += 1;
    return true;
  }

  enqueueTrace(trace: PointerTrace, kind: string): number {
    let count: number = 0;
    for (let index = 0; index < trace.count(); index++) {
      const sample: TracePoint | null = trace.pointAt(index);
      if (sample === null) {
        continue;
      }
      if (this.enqueue(new PointerSample(kind, sample.point(), sample.timestamp,
        trace.pointerId, sample.pressure))) {
        count += 1;
      }
    }
    return count;
  }

  pending(): number {
    return this.queue.length;
  }

  /** Drains the queue and returns how many events reached the framework. */
  flush(): number {
    const count: number = this.queue.length;
    this.queue = [];
    this.dispatched += count;
    return count;
  }

  /** Removes repeated move samples inside one window, the last one wins. */
  coalesce(windowMs: number = DEBOUNCE_WINDOW_MS): number {
    if (this.queue.length <= 1) {
      return 0;
    }
    const kept: PointerSample[] = [this.queue[0]];
    let removed: number = 0;
    for (let index = 1; index < this.queue.length; index++) {
      const previous: PointerSample = kept[kept.length - 1];
      const current: PointerSample = this.queue[index];
      if (previous.kind === POINTER_MOVE && current.kind === POINTER_MOVE &&
        current.timestamp - previous.timestamp <= windowMs) {
        kept[kept.length - 1] = current;
        removed += 1;
        continue;
      }
      kept.push(current);
    }
    this.queue = kept;
    return removed;
  }

  describe(): string {
    return `pending=${this.pending()} accepted=${this.accepted} dropped=${this.dropped} ` +
      `dispatched=${this.dispatched}`;
  }
}

/* ------------------------------------------------------------------ */
/* Out of bounds guard                                                */
/* ------------------------------------------------------------------ */

/** Clamps coordinates and classifies which border was crossed. */
class BoundsGuard {
  viewport: Viewport;
  clampedCount: number = 0;
  insideCount: number = 0;
  rejectedCount: number = 0;

  constructor(viewport: Viewport = new Viewport()) {
    this.viewport = viewport;
  }

  apply(point: TouchPoint): TouchPoint {
    if (this.viewport.isInsidePoint(point)) {
      this.insideCount += 1;
      return point;
    }
    this.clampedCount += 1;
    return this.viewport.clampPoint(point);
  }

  /** Rejects instead of clamping, used by gestures that must start in bounds. */
  accept(point: TouchPoint): boolean {
    if (this.viewport.isInsidePoint(point)) {
      this.insideCount += 1;
      return true;
    }
    this.rejectedCount += 1;
    return false;
  }

  zone(x: number, y: number): string {
    const outsideLeft: boolean = x < 0;
    const outsideRight: boolean = x > this.viewport.width;
    const outsideTop: boolean = y < 0;
    const outsideBottom: boolean = y > this.viewport.height;
    const vertical: boolean = outsideTop || outsideBottom;
    const horizontal: boolean = outsideLeft || outsideRight;
    if (vertical && horizontal) {
      return 'corner';
    }
    if (outsideLeft) {
      return 'left';
    }
    if (outsideRight) {
      return 'right';
    }
    if (outsideTop) {
      return 'top';
    }
    if (outsideBottom) {
      return 'bottom';
    }
    return 'inside';
  }

  describe(): string {
    return `inside=${this.insideCount} clamped=${this.clampedCount} ` +
      `rejected=${this.rejectedCount} viewport=${this.viewport.describe()}`;
  }
}

export default function pointerUtilValidationTest() {
  describe('pointerUtilValidationTest', () => {
    let clock: MockClock = new MockClock(1700000000000);

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      TestLogger.step(TAG, 'launch browser application');
      await startBrowserApp();
      await serializedDelay(getDriver(), DELAY_TOUCH_EVENT);
      clock = new MockClock(1700000000000);
    });

    afterAll(() => {
      TestLogger.info(TAG, `suite end, ${TestLogger.summary(TAG)}`);
    });

    it('PointerUtil_Point_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'PointerUtil_Point_001');
      TestLogger.step(TAG, 'verify offset distance and equality of two points');
      const origin: TouchPoint = new TouchPoint(100, 200);
      const target: TouchPoint = new TouchPoint(160, 280);
      expect(origin.offsetX(target)).assertEqual(60);
      expect(origin.offsetY(target)).assertEqual(80);
      expect(origin.distanceTo(target)).assertEqual(100);
      expect(origin.distanceTo(origin)).assertEqual(0);
      expect(origin.sameAs(new TouchPoint(100, 200))).assertTrue();
      expect(origin.sameAs(target)).assertFalse();
      expect(origin.describe()).assertEqual('(100,200)');
      TestLogger.info(TAG, `distance=${origin.distanceTo(target)}`);
      TestLogger.pass(TAG, 'PointerUtil_Point_001');
    });

    it('PointerUtil_Point_002', 0, async () => {
      TestLogger.step(TAG, 'translate scale and slop containment of points');
      const point: TouchPoint = new TouchPoint(30, 40);
      const moved: TouchPoint = point.translated(5, -5);
      expect(moved.x).assertEqual(35);
      expect(moved.y).assertEqual(35);
      const doubled: TouchPoint = point.scaled(2);
      expect(doubled.x).assertEqual(60);
      expect(doubled.y).assertEqual(80);
      expect(point.isWithin(moved, TOUCH_SLOP_PX)).assertTrue();
      expect(point.isWithin(new TouchPoint(40, 40), TOUCH_SLOP_PX)).assertTrue();
      expect(point.isWithin(new TouchPoint(41, 40), TOUCH_SLOP_PX)).assertFalse();
      TestLogger.info(TAG, `translated=${moved.describe()} scaled=${doubled.describe()}`);
      TestLogger.pass(TAG, 'PointerUtil_Point_002');
    });

    it('PointerUtil_Vp_003', 0, async () => {
      TestLogger.step(TAG, 'convert px to vp for phone and tablet density');
      const phonePoint: TouchPoint = new TouchPoint(300, 600);
      const phoneVp: TouchPoint = phonePoint.toVp(PHONE_DENSITY);
      expect(phoneVp.x).assertEqual(100);
      expect(phoneVp.y).assertEqual(200);
      const tabletVp: TouchPoint = phonePoint.toVp(TABLET_DENSITY);
      expect(tabletVp.x).assertEqual(150);
      expect(tabletVp.y).assertEqual(300);
      const baseVp: TouchPoint = phonePoint.toVp(BASE_DENSITY);
      expect(baseVp.x).assertEqual(300);
      expect(baseVp.y).assertEqual(600);
      TestLogger.info(TAG, `phone=${phoneVp.describe()} tablet=${tabletVp.describe()}`);
      TestLogger.pass(TAG, 'PointerUtil_Vp_003');
    });

    it('PointerUtil_Vp_004', 0, async () => {
      TestLogger.step(TAG, 'vp to px rounding and invalid density fallback');
      const vpPoint: TouchPoint = new TouchPoint(100, 200);
      const pxPoint: TouchPoint = vpPoint.toPx(PHONE_DENSITY);
      expect(pxPoint.x).assertEqual(300);
      expect(pxPoint.y).assertEqual(600);
      const odd: TouchPoint = new TouchPoint(33.4, 66.8);
      expect(odd.toPx(PHONE_DENSITY).x).assertEqual(100);
      expect(odd.toPx(PHONE_DENSITY).y).assertEqual(200);
      const zeroDensity: TouchPoint = vpPoint.toPx(0);
      expect(zeroDensity.x).assertEqual(100);
      const negativeDensity: TouchPoint = vpPoint.toVp(-2);
      expect(negativeDensity.x).assertEqual(100);
      const viewport: Viewport = new Viewport(1080, 1920, PHONE_DENSITY);
      expect(viewport.pxToVp(1080)).assertEqual(360);
      expect(viewport.vpToPx(360)).assertEqual(1080);
      expect(viewport.widthVp()).assertEqual(360);
      TestLogger.info(TAG, `viewport ${viewport.describe()}`);
      TestLogger.pass(TAG, 'PointerUtil_Vp_004');
    });

    it('PointerUtil_Viewport_005', 0, async () => {
      TestLogger.step(TAG, 'viewport containment and clamping');
      const viewport: Viewport = new Viewport(1080, 1920, PHONE_DENSITY);
      expect(viewport.isInside(0, 0)).assertTrue();
      expect(viewport.isInside(1080, 1920)).assertTrue();
      expect(viewport.isInside(1081, 100)).assertFalse();
      expect(viewport.isInside(100, -1)).assertFalse();
      expect(viewport.isInsidePoint(new TouchPoint(-5, 10))).assertFalse();
      const clamped: TouchPoint = viewport.clampPoint(new TouchPoint(-40, 2000));
      expect(clamped.x).assertEqual(0);
      expect(clamped.y).assertEqual(1920);
      expect(viewport.clampX(5000)).assertEqual(1080);
      expect(viewport.clampY(-5000)).assertEqual(0);
      const center: TouchPoint = viewport.center();
      expect(center.x).assertEqual(540);
      expect(center.y).assertEqual(960);
      TestLogger.pass(TAG, 'PointerUtil_Viewport_005');
    });

    it('PointerUtil_Viewport_006', 0, async () => {
      TestLogger.step(TAG, 'edge distance and derived viewport identity');
      const viewport: Viewport = new Viewport(1000, 2000, TABLET_DENSITY);
      expect(viewport.edgeDistance(0, 1000)).assertEqual(0);
      expect(viewport.edgeDistance(10, 1000)).assertEqual(10);
      expect(viewport.edgeDistance(990, 1000)).assertEqual(10);
      expect(viewport.edgeDistance(500, 10)).assertEqual(10);
      expect(viewport.edgeDistance(500, 500)).assertEqual(500);
      expect(viewport.sameAs(new Viewport(1000, 2000, TABLET_DENSITY))).assertTrue();
      expect(viewport.sameAs(new Viewport(1000, 2000, PHONE_DENSITY))).assertFalse();
      expect(viewport.sameAs(null)).assertFalse();
      expect(new Viewport(0, 0, 0).density).assertEqual(BASE_DENSITY);
      TestLogger.info(TAG, `edge=${viewport.edgeDistance(500, 500)}`);
      TestLogger.pass(TAG, 'PointerUtil_Viewport_006');
    });

    it('PointerUtil_Trace_007', 0, async () => {
      TestLogger.step(TAG, 'accumulate a horizontal trace and measure it');
      const trace: PointerTrace = new PointerTrace(1);
      expect(trace.isEmpty()).assertTrue();
      expect(trace.count()).assertEqual(0);
      trace.add(100, 100, 1000);
      trace.add(150, 100, 1050);
      trace.add(200, 100, 1100);
      expect(trace.count()).assertEqual(3);
      expect(trace.beginTime()).assertEqual(1000);
      expect(trace.endTime()).assertEqual(1100);
      expect(trace.duration()).assertEqual(100);
      expect(trace.totalDistance()).assertEqual(100);
      expect(trace.straightDistance()).assertEqual(100);
      expect(trace.displacementX()).assertEqual(100);
      expect(trace.displacementY()).assertEqual(0);
      expect(trace.pathEfficiency()).assertEqual(1);
      TestLogger.info(TAG, trace.describe());
      TestLogger.pass(TAG, 'PointerUtil_Trace_007');
    });

    it('PointerUtil_Trace_008', 0, async () => {
      TestLogger.step(TAG, 'zigzag path lowers efficiency but keeps the endpoints');
      const trace: PointerTrace = new PointerTrace(2);
      trace.add(0, 0, 0);
      trace.add(0, 100, 10);
      trace.add(100, 100, 20);
      trace.add(100, 200, 30);
      expect(trace.totalDistance()).assertEqual(300);
      expect(trace.straightDistance()).assertEqual(223.61);
      expect(trace.pathEfficiency()).assertEqual(0.745);
      expect(trace.displacementX()).assertEqual(100);
      expect(trace.displacementY()).assertEqual(200);
      const displacement: TouchPoint = trace.displacement();
      expect(displacement.x).assertEqual(100);
      expect(displacement.y).assertEqual(200);
      const single: PointerTrace = new PointerTrace(3);
      single.add(10, 10, 0);
      expect(single.pathEfficiency()).assertEqual(0);
      expect(single.totalDistance()).assertEqual(0);
      expect(single.duration()).assertEqual(0);
      TestLogger.pass(TAG, 'PointerUtil_Trace_008');
    });

    it('PointerUtil_Trace_009', 0, async () => {
      TestLogger.step(TAG, 'average and peak speed of a two segment trace');
      const trace: PointerTrace = new PointerTrace(4);
      trace.add(0, 0, 0);
      trace.add(100, 0, 200);
      trace.add(100, 100, 400);
      expect(trace.totalDistance()).assertEqual(200);
      expect(trace.duration()).assertEqual(400);
      expect(trace.averageSpeed()).assertEqual(500);
      expect(trace.maxSpeed()).assertEqual(500);
      const fast: PointerTrace = new PointerTrace(5);
      fast.add(0, 0, 0);
      fast.add(0, 0, 100);
      fast.add(0, 40, 150);
      expect(fast.maxSpeed()).assertEqual(800);
      expect(fast.averageSpeed()).assertEqual(266.67);
      const instant: PointerTrace = new PointerTrace(6);
      instant.add(5, 5, 800);
      expect(instant.maxSpeed()).assertEqual(0);
      expect(instant.averageSpeed()).assertEqual(0);
      TestLogger.pass(TAG, 'PointerUtil_Trace_009');
    });

    it('PointerUtil_Trace_010', 0, async () => {
      TestLogger.step(TAG, 'slop boundary of nine ten and eleven pixels');
      const below: PointerTrace = buildTraceWithMoved(9, 120);
      const exact: PointerTrace = buildTraceWithMoved(10, 120);
      const above: PointerTrace = buildTraceWithMoved(11, 120);
      expect(below.movedBeyond(TOUCH_SLOP_PX)).assertFalse();
      expect(below.withinSlop(TOUCH_SLOP_PX)).assertTrue();
      expect(exact.movedBeyond(TOUCH_SLOP_PX)).assertFalse();
      expect(exact.withinSlop(TOUCH_SLOP_PX)).assertTrue();
      expect(above.movedBeyond(TOUCH_SLOP_PX)).assertTrue();
      expect(above.withinSlop(TOUCH_SLOP_PX)).assertFalse();
      expect(below.everMovedBeyond(TOUCH_SLOP_PX)).assertFalse();
      expect(above.everMovedBeyond(TOUCH_SLOP_PX)).assertTrue();
      expect(above.everMovedBeyond(50)).assertFalse();
      const custom: PointerTrace = buildTraceWithMoved(30, 120);
      expect(custom.movedBeyond(30)).assertFalse();
      expect(custom.movedBeyond(29)).assertTrue();
      TestLogger.pass(TAG, 'PointerUtil_Trace_010');
    });
    it('PointerUtil_Tap_011', 0, async () => {
      TestLogger.step(TAG, 'tap duration boundary at one hundred and two hundred ms');
      const classifier: GestureClassifier = new GestureClassifier();
      const quick: PointerTrace = buildTraceFor('quick', 0, 0, 80);
      const exact: PointerTrace = buildTraceFor('exact', 1, 0, TAP_MAX_DURATION_MS);
      const late: PointerTrace = buildTraceFor('late', 0, 0, TAP_MAX_DURATION_MS + 1);
      expect(classifier.classify(quick)).assertEqual(GESTURE_TAP);
      expect(classifier.classify(exact)).assertEqual(GESTURE_TAP);
      expect(classifier.classify(late)).assertEqual(GESTURE_NONE);
      expect(classifier.direction(quick)).assertEqual(DIRECTION_NONE);
      expect(classifier.thresholds.isTapDuration(200)).assertTrue();
      expect(classifier.thresholds.isTapDuration(201)).assertFalse();
      expect(classifier.thresholds.isTapDuration(-1)).assertFalse();
      TestLogger.info(TAG, `tap classification quick=${classifier.classify(quick)}`);
      TestLogger.pass(TAG, 'PointerUtil_Tap_011');
    });

    it('PointerUtil_Tap_012', 0, async () => {
      TestLogger.step(TAG, 'movement beyond slop cancels a tap');
      const classifier: GestureClassifier = new GestureClassifier();
      const jitter: PointerTrace = buildTraceFor('jitter', 8, 6, 150);
      const drag: PointerTrace = buildTraceFor('drag', 11, 0, 150);
      const farDrag: PointerTrace = buildTraceFor('far', 60, 0, 150);
      expect(classifier.classify(jitter)).assertEqual(GESTURE_TAP);
      expect(jitter.straightDistance()).assertEqual(10);
      expect(classifier.classify(drag)).assertEqual(GESTURE_NONE);
      expect(classifier.classify(farDrag)).assertEqual(GESTURE_SWIPE);
      expect(classifier.thresholds.withSlop(4).isTapDuration(150)).assertTrue();
      expect(new GestureClassifier(new GestureThresholds(20, 100, 600, 80, 300, 24))
        .classify(jitter)).assertEqual(GESTURE_NONE);
      TestLogger.pass(TAG, 'PointerUtil_Tap_012');
    });

    it('PointerUtil_LongPress_013', 0, async () => {
      TestLogger.step(TAG, 'long press starts exactly at five hundred ms');
      const classifier: GestureClassifier = new GestureClassifier();
      const below: PointerTrace = buildTraceFor('below', 0, 0, LONG_PRESS_MIN_DURATION_MS - 1);
      const exact: PointerTrace = buildTraceFor('exact', 0, 0, LONG_PRESS_MIN_DURATION_MS);
      const hold: PointerTrace = buildTraceFor('hold', 4, 3, 1500);
      expect(classifier.classify(below)).assertEqual(GESTURE_NONE);
      expect(classifier.classify(exact)).assertEqual(GESTURE_LONG_PRESS);
      expect(classifier.classify(hold)).assertEqual(GESTURE_LONG_PRESS);
      expect(classifier.thresholds.isLongPressDuration(499)).assertFalse();
      expect(classifier.thresholds.isLongPressDuration(500)).assertTrue();
      const movedHold: PointerTrace = buildTraceFor('moved', 30, 0, 900);
      expect(classifier.classify(movedHold)).assertEqual(GESTURE_NONE);
      TestLogger.pass(TAG, 'PointerUtil_LongPress_013');
    });

    it('PointerUtil_Swipe_014', 0, async () => {
      TestLogger.step(TAG, 'swipe distance threshold and four directions');
      const classifier: GestureClassifier = new GestureClassifier();
      const below: PointerTrace = buildTraceWithMoved(SWIPE_MIN_DISTANCE_PX - 1, 200);
      const exact: PointerTrace = buildTraceWithMoved(SWIPE_MIN_DISTANCE_PX, 200);
      const above: PointerTrace = buildTraceWithMoved(SWIPE_MIN_DISTANCE_PX + 1, 200);
      expect(classifier.classify(below)).assertEqual(GESTURE_NONE);
      expect(classifier.classify(exact)).assertEqual(GESTURE_SWIPE);
      expect(classifier.classify(above)).assertEqual(GESTURE_SWIPE);
      expect(classifier.direction(buildTraceFor('right', 80, 0, 160))).assertEqual(DIRECTION_RIGHT);
      expect(classifier.direction(buildTraceFor('left', -80, 0, 160))).assertEqual(DIRECTION_LEFT);
      expect(classifier.direction(buildTraceFor('down', 0, 80, 160))).assertEqual(DIRECTION_DOWN);
      expect(classifier.direction(buildTraceFor('up', 0, -80, 160))).assertEqual(DIRECTION_UP);
      expect(classifier.direction(buildTraceFor('diagonal', 80, 70, 160)))
        .assertEqual(DIRECTION_RIGHT);
      TestLogger.pass(TAG, 'PointerUtil_Swipe_014');
    });

    it('PointerUtil_Swipe_015', 0, async () => {
      TestLogger.step(TAG, 'diagonal swipe keeps the dominant axis and speed');
      const classifier: GestureClassifier = new GestureClassifier();
      const diagonal: PointerTrace = buildTraceFor('diagonal', 30, 80, 100);
      expect(classifier.classify(diagonal)).assertEqual(GESTURE_SWIPE);
      expect(classifier.direction(diagonal)).assertEqual(DIRECTION_DOWN);
      expect(diagonal.straightDistance()).assertEqual(85.44);
      expect(diagonal.totalDistance()).assertEqual(85.44);
      expect(diagonal.averageSpeed()).assertEqual(854.4);
      const equalAxis: PointerTrace = buildTraceFor('equal', 40, 40, 100);
      expect(classifier.direction(equalAxis)).assertEqual(DIRECTION_RIGHT);
      const slowDrag: PointerTrace = buildTraceFor('slow', 60, 0, 3000);
      expect(classifier.classify(slowDrag)).assertEqual(GESTURE_SWIPE);
      expect(slowDrag.averageSpeed()).assertEqual(20);
      TestLogger.pass(TAG, 'PointerUtil_Swipe_015');
    });

    it('PointerUtil_DoubleTap_016', 0, async () => {
      TestLogger.step(TAG, 'double tap window and positional tolerance');
      const classifier: GestureClassifier = new GestureClassifier();
      const first: PointerTrace = new PointerTrace(0);
      first.add(300, 400, 1000);
      first.add(301, 400, 1100);
      const close: PointerTrace = new PointerTrace(0);
      close.add(305, 405, 1200);
      close.add(306, 405, 1280);
      expect(classifier.isDoubleTap(first, close)).assertTrue();
      expect(classifier.classifyPair(first, close)).assertEqual(GESTURE_DOUBLE_TAP);
      const far: PointerTrace = new PointerTrace(0);
      far.add(340, 400, 1200);
      far.add(341, 400, 1280);
      expect(classifier.isDoubleTap(first, far)).assertFalse();
      const late: PointerTrace = new PointerTrace(0);
      late.add(300, 400, 1000 + DOUBLE_TAP_WINDOW_MS + 200);
      late.add(301, 400, 1000 + DOUBLE_TAP_WINDOW_MS + 250);
      expect(classifier.isDoubleTap(first, late)).assertFalse();
      expect(classifier.isDoubleTap(first, new PointerTrace(0))).assertFalse();
      TestLogger.pass(TAG, 'PointerUtil_DoubleTap_016');
    });

    it('PointerUtil_Pinch_017', 0, async () => {
      TestLogger.step(TAG, 'pinch in out and scale guard');
      const classifier: GestureClassifier = new GestureClassifier();
      expect(classifier.pinchKind(100, 200)).assertEqual(GESTURE_PINCH_OUT);
      expect(classifier.pinchKind(200, 100)).assertEqual(GESTURE_PINCH_IN);
      expect(classifier.pinchKind(100, 103)).assertEqual(GESTURE_NONE);
      expect(classifier.pinchKind(100, 105)).assertEqual(GESTURE_PINCH_OUT);
      expect(classifier.pinchKind(100, 110)).assertEqual(GESTURE_PINCH_OUT);
      expect(classifier.pinchKind(10, 40)).assertEqual(GESTURE_NONE);
      expect(classifier.pinchKind(40, 10)).assertEqual(GESTURE_NONE);
      expect(classifier.pinchKind(0, 100)).assertEqual(GESTURE_NONE);
      expect(classifier.scaleFactor(100, 250)).assertEqual(2.5);
      expect(classifier.scaleFactor(0, 250)).assertEqual(0);
      expect(classifier.scaleFactor(200, 100)).assertEqual(0.5);
      TestLogger.info(TAG, 'pinch scale matrix validated');
      TestLogger.pass(TAG, 'PointerUtil_Pinch_017');
    });

    it('PointerUtil_Multi_018', 0, async () => {
      TestLogger.step(TAG, 'multi pointer concurrency limit and duplicate rejection');
      const session: MultiPointerSession = new MultiPointerSession();
      for (let index = 0; index < MAX_POINTERS; index++) {
        expect(session.down(index, 100 + index * 10, 200, 1000 + index)).assertTrue();
      }
      expect(session.activeCount()).assertEqual(MAX_POINTERS);
      expect(session.maxConcurrent).assertEqual(MAX_POINTERS);
      expect(session.down(MAX_POINTERS, 500, 500, 1100)).assertFalse();
      expect(session.down(0, 500, 500, 1100)).assertFalse();
      expect(session.rejectedDown).assertEqual(2);
      expect(session.pointerIds().length).assertEqual(MAX_POINTERS);
      expect(session.pointerIds()[0]).assertEqual(0);
      expect(session.traceOf(99) === null).assertTrue();
      expect(session.move(99, 0, 0, 1200)).assertFalse();
      TestLogger.info(TAG, session.describe());
      TestLogger.pass(TAG, 'PointerUtil_Multi_018');
    });

    it('PointerUtil_Multi_019', 0, async () => {
      TestLogger.step(TAG, 'centroid and span of two moving pointers');
      const session: MultiPointerSession = new MultiPointerSession();
      const classifier: GestureClassifier = new GestureClassifier();
      expect(session.down(0, 100, 100, 0)).assertTrue();
      expect(session.down(1, 300, 100, 10)).assertTrue();
      expect(session.activeCount()).assertEqual(2);
      expect(session.initialSpan()).assertEqual(200);
      expect(session.span()).assertEqual(200);
      expect(session.centroid().x).assertEqual(200);
      expect(session.centroid().y).assertEqual(100);
      expect(session.isPinching()).assertTrue();
      session.move(0, 100, 300, 20);
      expect(session.span()).assertEqual(282.84);
      expect(session.centroid().y).assertEqual(200);
      expect(classifier.classifyMulti(session)).assertEqual(GESTURE_PINCH_OUT);
      session.move(1, 300, 300, 30);
      expect(session.span()).assertEqual(200);
      expect(classifier.classifyMulti(session)).assertEqual(GESTURE_NONE);
      expect(session.totalSamples()).assertEqual(4);
      TestLogger.info(TAG, session.describe());
      TestLogger.pass(TAG, 'PointerUtil_Multi_019');
    });

    it('PointerUtil_Multi_020', 0, async () => {
      TestLogger.step(TAG, 'up and cancel retire pointers while keeping traces');
      const session: MultiPointerSession = new MultiPointerSession();
      session.down(0, 100, 100, 0);
      session.down(1, 200, 200, 5);
      expect(session.up(0, 110, 110, 40)).assertTrue();
      expect(session.activeCount()).assertEqual(1);
      expect(session.pointerCount()).assertEqual(2);
      expect(session.up(0, 120, 120, 50)).assertFalse();
      expect(session.move(0, 130, 130, 60)).assertFalse();
      expect(session.cancel(1, 70)).assertTrue();
      expect(session.cancelledCount).assertEqual(1);
      expect(session.activeCount()).assertEqual(0);
      expect(session.cancel(1, 80)).assertFalse();
      expect(session.cancel(9, 90)).assertFalse();
      expect(session.dropFinished()).assertEqual(2);
      expect(session.finished.length).assertEqual(0);
      const trace: PointerTrace | null = session.traceOf(0);
      expect(trace === null).assertFalse();
      TestLogger.info(TAG, session.describe());
      TestLogger.pass(TAG, 'PointerUtil_Multi_020');
    });

    it('PointerUtil_Sample_021', 0, async () => {
      TestLogger.step(TAG, 'time interval down sampling keeps first and last');
      const trace: PointerTrace = new PointerTrace(0);
      for (let index = 0; index <= 6; index++) {
        trace.add(index * 10, 0, index * 10);
      }
      expect(trace.count()).assertEqual(7);
      const removed: number = trace.sampleEvery(20);
      expect(removed).assertEqual(3);
      expect(trace.count()).assertEqual(4);
      expect(trace.beginTime()).assertEqual(0);
      expect(trace.endTime()).assertEqual(60);
      const first: TracePoint | null = trace.firstPoint();
      const last: TracePoint | null = trace.lastPoint();
      expect(first === null).assertFalse();
      expect(last === null).assertFalse();
      if (first !== null && last !== null) {
        expect(first.x).assertEqual(0);
        expect(last.x).assertEqual(60);
      }
      expect(trace.sampleEvery(0)).assertEqual(0);
      expect(new PointerTrace(0).sampleEvery(16)).assertEqual(0);
      TestLogger.info(TAG, trace.describe());
      TestLogger.pass(TAG, 'PointerUtil_Sample_021');
    });

    it('PointerUtil_Sample_022', 0, async () => {
      TestLogger.step(TAG, 'distance sampling and throttle windows');
      const distanceTrace: PointerTrace = new PointerTrace(1);
      distanceTrace.add(0, 0, 0);
      distanceTrace.add(2, 0, 5);
      distanceTrace.add(4, 0, 10);
      distanceTrace.add(6, 0, 15);
      distanceTrace.add(10, 0, 20);
      expect(distanceTrace.sampleByDistance(4)).assertEqual(2);
      expect(distanceTrace.count()).assertEqual(3);
      const throttleTrace: PointerTrace = new PointerTrace(2);
      for (let index = 0; index <= 6; index++) {
        throttleTrace.add(index * 10, 0, index * 10);
      }
      const sampler: TraceSampler = new TraceSampler();
      const throttled: PointerTrace = sampler.throttle(throttleTrace, 20);
      expect(throttled.count()).assertEqual(4);
      expect(throttled.beginTime()).assertEqual(0);
      expect(throttled.endTime()).assertEqual(60);
      const start: TracePoint = new TracePoint(0, 0, 0, 0.5);
      const end: TracePoint = new TracePoint(100, 200, 100, 1);
      const middle: TracePoint = sampler.interpolate(start, end, 0.5);
      expect(middle.x).assertEqual(50);
      expect(middle.y).assertEqual(100);
      expect(middle.timestamp).assertEqual(50);
      expect(middle.pressure).assertEqual(0.75);
      expect(sampler.interpolate(start, end, 2).x).assertEqual(100);
      expect(sampler.interpolate(start, end, -1).x).assertEqual(0);
      expect(sampler.expectedSampleCount(throttleTrace)).assertEqual(5);
      TestLogger.pass(TAG, 'PointerUtil_Sample_022');
    });

    it('PointerUtil_Dedupe_023', 0, async () => {
      TestLogger.step(TAG, 'duplicate samples inside the debounce window are dropped');
      const trace: PointerTrace = new PointerTrace(3);
      trace.add(10, 10, 0);
      trace.add(10, 10, 10);
      trace.add(10, 10, 40);
      trace.add(20, 20, 50);
      expect(trace.count()).assertEqual(4);
      expect(trace.dedupe(DEBOUNCE_WINDOW_MS)).assertEqual(1);
      expect(trace.count()).assertEqual(3);
      expect(trace.dedupe(0)).assertEqual(0);
      expect(new PointerTrace(4).dedupe(32)).assertEqual(0);
      const single: PointerTrace = new PointerTrace(5);
      single.add(0, 0, 0);
      expect(single.dedupe(32)).assertEqual(0);
      const sameTime: PointerTrace = new PointerTrace(6);
      sameTime.add(5, 5, 0);
      sameTime.add(5, 5, 0);
      sameTime.add(5, 5, 0);
      expect(sameTime.dedupe(1)).assertEqual(2);
      TestLogger.info(TAG, `dedupe remainder samples=${sameTime.count()}`);
      TestLogger.pass(TAG, 'PointerUtil_Dedupe_023');
    });

    it('PointerUtil_Debounce_024', 0, async () => {
      TestLogger.step(TAG, 'tap debouncer suppresses repeated presses');
      const baseTime: number = clock.now();
      const debouncer: TapDebouncer = new TapDebouncer(DEBOUNCE_WINDOW_MS, TOUCH_SLOP_PX);
      expect(debouncer.shouldAccept(new TouchPoint(100, 100), baseTime)).assertTrue();
      expect(debouncer.shouldAccept(new TouchPoint(101, 101), baseTime + 10)).assertFalse();
      expect(debouncer.accepted).assertEqual(1);
      expect(debouncer.rejected).assertEqual(1);
      expect(debouncer.shouldAccept(new TouchPoint(101, 101), baseTime + 40)).assertTrue();
      expect(debouncer.shouldAccept(new TouchPoint(200, 200), baseTime + 45)).assertTrue();
      expect(debouncer.accepted).assertEqual(3);
      expect(debouncer.rejected).assertEqual(1);
      expect(clock.advance(50)).assertEqual(baseTime + 50);
      debouncer.reset();
      expect(debouncer.accepted).assertEqual(0);
      expect(debouncer.rejected).assertEqual(0);
      expect(debouncer.shouldAccept(new TouchPoint(0, 0), clock.now())).assertTrue();
      expect(debouncer.describe()).assertContain('window=32');
      TestLogger.pass(TAG, 'PointerUtil_Debounce_024');
    });

    it('PointerUtil_Queue_025', 0, async () => {
      TestLogger.step(TAG, 'dispatch queue accepts known kinds and drops overflow');
      const dispatch: PointerDispatch = new PointerDispatch(3);
      expect(dispatch.enqueue(new PointerSample(POINTER_DOWN, new TouchPoint(1, 1), 0)))
        .assertTrue();
      expect(dispatch.enqueue(new PointerSample('hover', new TouchPoint(1, 1), 5)))
        .assertFalse();
      expect(dispatch.pending()).assertEqual(1);
      expect(dispatch.dropped).assertEqual(1);
      expect(dispatch.enqueue(new PointerSample(POINTER_MOVE, new TouchPoint(2, 2), 10)))
        .assertTrue();
      expect(dispatch.enqueue(new PointerSample(POINTER_UP, new TouchPoint(3, 3), 20)))
        .assertTrue();
      expect(dispatch.enqueue(new PointerSample(POINTER_MOVE, new TouchPoint(4, 4), 30)))
        .assertFalse();
      expect(dispatch.dropped).assertEqual(2);
      expect(dispatch.accepted).assertEqual(3);
      expect(dispatch.flush()).assertEqual(3);
      expect(dispatch.pending()).assertEqual(0);
      expect(dispatch.dispatched).assertEqual(3);
      expect(new PointerDispatch(0).capacity).assertEqual(1);
      TestLogger.info(TAG, dispatch.describe());
      TestLogger.pass(TAG, 'PointerUtil_Queue_025');
    });

    it('PointerUtil_Queue_026', 0, async () => {
      TestLogger.step(TAG, 'coalesce consecutive moves and enqueue a whole trace');
      const dispatch: PointerDispatch = new PointerDispatch();
      dispatch.enqueue(new PointerSample(POINTER_MOVE, new TouchPoint(0, 0), 0));
      dispatch.enqueue(new PointerSample(POINTER_MOVE, new TouchPoint(10, 0), 10));
      dispatch.enqueue(new PointerSample(POINTER_MOVE, new TouchPoint(30, 0), 30));
      dispatch.enqueue(new PointerSample(POINTER_UP, new TouchPoint(40, 0), 40));
      expect(dispatch.pending()).assertEqual(4);
      expect(dispatch.coalesce(DEBOUNCE_WINDOW_MS)).assertEqual(2);
      expect(dispatch.pending()).assertEqual(2);
      const trace: PointerTrace = buildTraceWithMoved(30, 60, 7);
      const queued: number = dispatch.enqueueTrace(trace, POINTER_MOVE);
      expect(queued).assertEqual(3);
      const sample: PointerSample = new PointerSample(POINTER_DOWN, new TouchPoint(5, 5), 99, 2,
       0.6);
      expect(sample.isKnownKind()).assertTrue();
      expect(sample.sameAs(new PointerSample(POINTER_DOWN, new TouchPoint(5, 5), 100, 2)))
        .assertTrue();
      expect(sample.describe()).assertContain('down#2');
      expect(dispatch.coalesce(0)).assertEqual(0);
      TestLogger.pass(TAG, 'PointerUtil_Queue_026');
    });

    it('PointerUtil_Bounds_027', 0, async () => {
      TestLogger.step(TAG, 'clamp reject and classify out of bounds coordinates');
      const guard: BoundsGuard = new BoundsGuard(new Viewport(1000, 2000, PHONE_DENSITY));
      const inside: TouchPoint = guard.apply(new TouchPoint(500, 500));
      expect(inside.x).assertEqual(500);
      expect(guard.insideCount).assertEqual(1);
      expect(guard.clampedCount).assertEqual(0);
      const left: TouchPoint = guard.apply(new TouchPoint(-10, 500));
      expect(left.x).assertEqual(0);
      expect(left.y).assertEqual(500);
      expect(guard.clampedCount).assertEqual(1);
      const corner: TouchPoint = guard.apply(new TouchPoint(1500, 2500));
      expect(corner.x).assertEqual(1000);
      expect(corner.y).assertEqual(2000);
      expect(guard.clampedCount).assertEqual(2);
      expect(guard.accept(new TouchPoint(-1, 0))).assertFalse();
      expect(guard.accept(new TouchPoint(5, 5))).assertTrue();
      expect(guard.rejectedCount).assertEqual(1);
      expect(guard.insideCount).assertEqual(2);
      expect(guard.zone(-1, 100)).assertEqual('left');
      expect(guard.zone(1001, 100)).assertEqual('right');
      expect(guard.zone(100, -1)).assertEqual('top');
      expect(guard.zone(100, 2001)).assertEqual('bottom');
      expect(guard.zone(-1, -1)).assertEqual('corner');
      expect(guard.zone(10, 10)).assertEqual('inside');
      TestLogger.info(TAG, guard.describe());
      TestLogger.pass(TAG, 'PointerUtil_Bounds_027');
    });

    it('PointerUtil_Table_028', 0, async () => {
      TestLogger.step(TAG, 'table driven gesture expectations');
      const classifier: GestureClassifier = new GestureClassifier();
      expect(GESTURE_CASES.length).assertEqual(8);
      for (let index = 0; index < GESTURE_CASES.length; index++) {
        const item: GestureCase = GESTURE_CASES[index];
        const trace: PointerTrace = buildTraceFor(item.name, item.dx, item.dy, item.durationMs);
        const actual: string = classifier.classify(trace);
        TestLogger.info(TAG, `case ${item.name}: expected=${item.expected} actual=${actual}`);
        expect(actual).assertEqual(item.expected);
      }
      TestLogger.pass(TAG, 'PointerUtil_Table_028');
    });

    it('PointerUtil_Table_029', 0, async () => {
      TestLogger.step(TAG, 'table driven threshold boundaries');
      const classifier: GestureClassifier = new GestureClassifier();
      expect(THRESHOLD_CASES.length).assertEqual(7);
      for (let index = 0; index < THRESHOLD_CASES.length; index++) {
        const item: ThresholdCase = THRESHOLD_CASES[index];
        const trace: PointerTrace = buildTraceWithMoved(item.movedPx, item.durationMs);
        const actual: string = classifier.classify(trace);
        TestLogger.info(TAG, `case ${item.label}: moved=${item.movedPx} actual=${actual}`);
        expect(actual).assertEqual(item.expected);
        expect(trace.straightDistance()).assertEqual(item.movedPx);
        expect(trace.duration()).assertEqual(item.durationMs);
      }
      TestLogger.pass(TAG, 'PointerUtil_Table_029');
    });

    it('PointerUtil_Thresholds_030', 0, async () => {
      TestLogger.step(TAG, 'threshold defaults and strictness ordering');
      const defaults: GestureThresholds = GestureThresholds.defaults();
      expect(defaults.slopPx).assertEqual(TOUCH_SLOP_PX);
      expect(defaults.tapMaxMs).assertEqual(TAP_MAX_DURATION_MS);
      expect(defaults.longPressMinMs).assertEqual(LONG_PRESS_MIN_DURATION_MS);
      expect(defaults.swipeMinPx).assertEqual(SWIPE_MIN_DISTANCE_PX);
      expect(defaults.doubleTapWindowMs).assertEqual(DOUBLE_TAP_WINDOW_MS);
      expect(defaults.doubleTapSlopPx).assertEqual(DOUBLE_TAP_SLOP_PX);
      const loose: GestureThresholds = new GestureThresholds(14, 250, 450, 40, 350, 30);
      expect(defaults.isStricterThan(loose)).assertTrue();
      expect(loose.isStricterThan(defaults)).assertFalse();
      expect(defaults.isStricterThan(defaults)).assertTrue();
      expect(defaults.withSlop(4).slopPx).assertEqual(4);
      expect(defaults.withSlop(4).tapMaxMs).assertEqual(TAP_MAX_DURATION_MS);
      expect(defaults.describe()).assertContain('swipe=50');
      TestLogger.pass(TAG, 'PointerUtil_Thresholds_030');
    });

    it('PointerUtil_Edge_031', 0, async () => {
      TestLogger.step(TAG, 'empty trace truncation and clone isolation');
      const empty: PointerTrace = new PointerTrace(0);
      expect(empty.firstPoint() === null).assertTrue();
      expect(empty.lastPoint() === null).assertTrue();
      expect(empty.pointAt(-1) === null).assertTrue();
      expect(empty.pointAt(0) === null).assertTrue();
      expect(new GestureClassifier().classify(empty)).assertEqual(GESTURE_NONE);
      expect(new GestureClassifier().direction(empty)).assertEqual(DIRECTION_NONE);
      const long: PointerTrace = new PointerTrace(1);
      for (let index = 0; index < MAX_TRACE_POINTS; index++) {
        long.add(index, index, index);
      }
      expect(long.count()).assertEqual(MAX_TRACE_POINTS);
      expect(long.addSample(new TracePoint(0, 0, MAX_TRACE_POINTS))).assertFalse();
      expect(long.truncated).assertEqual(1);
      expect(long.count()).assertEqual(MAX_TRACE_POINTS);
      const copy: PointerTrace = long.clone();
      expect(copy.count()).assertEqual(long.count());
      copy.add(1, 1, MAX_TRACE_POINTS + 1);
      expect(copy.count()).assertEqual(MAX_TRACE_POINTS);
      const guarded: PointerTrace = new PointerTrace(2);
      guarded.add(-10, -10, 0);
      guarded.add(2000, 4000, 10);
      guarded.add(50, 50, 20);
      expect(guarded.outOfBoundsCount(new Viewport(1000, 2000))).assertEqual(2);
      expect(guarded.clampToViewport(new Viewport(1000, 2000))).assertEqual(2);
      expect(guarded.outOfBoundsCount(new Viewport(1000, 2000))).assertEqual(0);
      expect(guarded.peakPressure()).assertEqual(1);
      TestLogger.pass(TAG, 'PointerUtil_Edge_031');
    });

    it('PointerUtil_UI_032', 0, async () => {
      TestLogger.step(TAG, 'touch the address bar through the UI driver');
      TestLogger.caseBegin(TAG, 'PointerUtil_UI_032');
      const exists: boolean = await componentByIdExists(getDriver(), ID_INPUT_URL);
      expect(exists).assertTrue();
      expect(TIMEOUT_COMPONENT >= DELAY_TOUCH_EVENT).assertTrue();
      await tapAt(getDriver(), 200, 200);
      await serializedDelay(getDriver(), DELAY_TOUCH_EVENT);
      expect(await componentByIdExists(getDriver(), ID_INPUT_URL)).assertTrue();
      TestLogger.pass(TAG, 'PointerUtil_UI_032');
    });

    it('PointerUtil_UI_033', 0, async () => {
      TestLogger.step(TAG, 'swipe gesture keeps the navigation controls reachable');
      await swipeUp(getDriver(), 500, 1200, 500, 400);
      await serializedDelay(getDriver(), DELAY_TOUCH_EVENT);
      const backCount: number = await countById(getDriver(), ID_NAV_BACK);
      expect(backCount <= TOLERANCE_COMPONENT_COUNT).assertTrue();
      expect(await componentByIdExists(getDriver(), ID_NAV_HOME)).assertTrue();
      TestLogger.info(TAG, `navigation controls after swipe, back=${backCount}`);
      TestLogger.pass(TAG, 'PointerUtil_UI_033');
    });
  });
}
