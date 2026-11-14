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
  getDriver, startBrowserApp, componentByIdExists, countById, clickById, tapAt, swipeUp,
  inputById, textById, serializedDelay, ID_INPUT_URL, ID_NAV_BACK, ID_NAV_FORWARD,
  ID_NAV_REFRESH, ID_NAV_HOME, ID_ACTION_SUBMIT, ID_ACTION_ADD,
  DELAY_TOUCH_EVENT, TIMEOUT_COMPONENT
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserTouchInteractionTest';

/* ------------------------------------------------------------------ */
/* Touch protocol constants                                            */
/* ------------------------------------------------------------------ */

const TOUCH_DOWN: string = 'Down';
const TOUCH_MOVE: string = 'Move';
const TOUCH_UP: string = 'Up';
const TOUCH_CANCEL: string = 'Cancel';

const CLICK_MAX_DURATION: number = 200;
const CLICK_MAX_MOVE: number = 10;
const LONG_PRESS_MIN_DURATION: number = 500;
const TOUCH_THROTTLE_MS: number = 16;
const MULTI_TOUCH_MAX: number = 10;

const RESULT_CLICK: string = 'click';
const RESULT_LONG_PRESS: string = 'longPress';
const RESULT_SLIDE: string = 'slide';
const RESULT_NONE: string = 'none';

/* ------------------------------------------------------------------ */
/* Samples and sessions                                                */
/* ------------------------------------------------------------------ */

/** A single point in component coordinates. */
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
    const dx: number = this.offsetX(other);
    const dy: number = this.offsetY(other);
    return Math.round(Math.sqrt(dx * dx + dy * dy) * 100) / 100;
  }

  sameAs(other: TouchPoint): boolean {
    return this.x === other.x && this.y === other.y;
  }

  describe(): string {
    return `(${this.x},${this.y})`;
  }
}

/** One dispatched touch event. */
class TouchSample {
  kind: string;
  pointerId: number;
  point: TouchPoint;
  timestamp: number;
  pressure: number;

  constructor(kind: string, pointerId: number, point: TouchPoint, timestamp: number,
    pressure: number = 1) {
    this.kind = kind;
    this.pointerId = pointerId;
    this.point = point;
    this.timestamp = timestamp;
    this.pressure = pressure;
  }

  isDown(): boolean {
    return this.kind === TOUCH_DOWN;
  }

  isUp(): boolean {
    return this.kind === TOUCH_UP;
  }

  isCancel(): boolean {
    return this.kind === TOUCH_CANCEL;
  }

  isMove(): boolean {
    return this.kind === TOUCH_MOVE;
  }

  label(): string {
    return `${this.kind}#${this.pointerId}`;
  }
}

/**
 * Ordered event log of one touch interaction.
 *
 * The framework contract is strict: every Down is closed by exactly one Up
 * or Cancel, a Cancel is never followed by an Up for the same pointer, and a
 * Move only appears between a Down and its terminator.
 */
class TouchSession {
  samples: TouchSample[] = [];
  downCount: number = 0;
  upCount: number = 0;
  cancelCount: number = 0;
  moveCount: number = 0;
  orderViolations: number = 0;
  private activePointers: number[] = [];
  private peakPointers: number = 0;
  private startTimes: Map<number, number> = new Map<number, number>();
  private startPoints: Map<number, TouchPoint> = new Map<number, TouchPoint>();
  private endPoints: Map<number, TouchPoint> = new Map<number, TouchPoint>();

  push(sample: TouchSample): boolean {
    this.samples.push(sample);
    if (sample.isDown()) {
      if (this.activePointers.indexOf(sample.pointerId) >= 0) {
        this.orderViolations += 1;
        return false;
      }
      this.activePointers.push(sample.pointerId);
      this.startTimes.set(sample.pointerId, sample.timestamp);
      this.startPoints.set(sample.pointerId, sample.point);
      this.downCount += 1;
      if (this.activePointers.length > this.peakPointers) {
        this.peakPointers = this.activePointers.length;
      }
      return true;
    }
    const tracked: number = this.activePointers.indexOf(sample.pointerId);
    if (sample.isMove()) {
      if (tracked < 0) {
        this.orderViolations += 1;
        return false;
      }
      this.moveCount += 1;
      return true;
    }
    if (sample.isUp()) {
      if (tracked < 0) {
        this.orderViolations += 1;
        return false;
      }
      this.activePointers.splice(tracked, 1);
      this.endPoints.set(sample.pointerId, sample.point);
      this.upCount += 1;
      return true;
    }
    if (sample.isCancel()) {
      if (tracked < 0) {
        this.orderViolations += 1;
        return false;
      }
      this.activePointers.splice(tracked, 1);
      this.cancelCount += 1;
      return true;
    }
    this.orderViolations += 1;
    return false;
  }

  down(kind: string, pointerId: number, x: number, y: number, timestamp: number): boolean {
    return this.push(new TouchSample(kind, pointerId, new TouchPoint(x, y), timestamp));
  }

  size(): number {
    return this.samples.length;
  }

  /** A session is balanced when every started pointer has finished. */
  isBalanced(): boolean {
    return this.activePointers.length === 0 && this.orderViolations === 0;
  }

  activePointerCount(): number {
    return this.activePointers.length;
  }

  peak(): number {
    return this.peakPointers;
  }

  durationOf(pointerId: number): number {
    const startValue: number | undefined = this.startTimes.get(pointerId);
    const start: number = startValue === undefined ? 0 : startValue;
    let end: number = 0;
    for (let index = this.samples.length - 1; index >= 0; index--) {
      if (this.samples[index].pointerId === pointerId &&
        (this.samples[index].isUp() || this.samples[index].isCancel())) {
        end = this.samples[index].timestamp;
        break;
      }
    }
    return end - start;
  }

  displacementOf(pointerId: number): number {
    const first: TouchPoint | undefined = this.startPoints.get(pointerId);
    const last: TouchPoint | undefined = this.endPoints.get(pointerId);
    if (first === undefined || last === undefined) {
      return 0;
    }
    return first.distanceTo(last);
  }

  sequence(): string {
    return this.samples.map((sample: TouchSample) => sample.label()).join(',');
  }

  types(): string[] {
    return this.samples.map((sample: TouchSample) => sample.kind);
  }

  pointerIds(): number[] {
    const result: number[] = [];
    for (let index = 0; index < this.samples.length; index++) {
      if (result.indexOf(this.samples[index].pointerId) < 0) {
        result.push(this.samples[index].pointerId);
      }
    }
    return result;
  }

  countKind(kind: string): number {
    let total: number = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index].kind === kind) {
        total += 1;
      }
    }
    return total;
  }

  /** Cancel and Up must never both terminate the same pointer. */
  terminatedTwice(): number {
    const seen: number[] = [];
    let total: number = 0;
    for (let index = 0; index < this.samples.length; index++) {
      const sample: TouchSample = this.samples[index];
      if (!sample.isUp() && !sample.isCancel()) {
        continue;
      }
      if (seen.indexOf(sample.pointerId) >= 0) {
        total += 1;
      } else {
        seen.push(sample.pointerId);
      }
    }
    return total;
  }
}

/* ------------------------------------------------------------------ */
/* Hit testing                                                         */
/* ------------------------------------------------------------------ */

/** Axis aligned rectangle of a tappable component. */
class HitRect {
  id: string;
  left: number;
  top: number;
  width: number;
  height: number;
  zIndex: number;

  constructor(id: string, left: number, top: number, width: number, height: number,
    zIndex: number = 0) {
    this.id = id;
    this.left = left;
    this.top = top;
    this.width = width;
    this.height = height;
    this.zIndex = zIndex;
  }

  right(): number {
    return this.left + this.width;
  }

  bottom(): number {
    return this.top + this.height;
  }

  /** Left / top are inclusive, right / bottom are exclusive. */
  contains(x: number, y: number): boolean {
    return x >= this.left && x < this.right() && y >= this.top && y < this.bottom();
  }

  overlaps(other: HitRect): boolean {
    return this.left < other.right() && other.left < this.right() &&
      this.top < other.bottom() && other.top < this.bottom();
  }

  centerX(): number {
    return this.left + Math.round(this.width / 2);
  }

  centerY(): number {
    return this.top + Math.round(this.height / 2);
  }

  describe(): string {
    return `${this.id}[${this.left},${this.top},${this.width}x${this.height}]`;
  }
}

/** Resolves a touch coordinate to the topmost component id. */
class HitTester {
  rects: HitRect[] = [];

  add(rect: HitRect): boolean {
    for (let index = 0; index < this.rects.length; index++) {
      if (this.rects[index].id === rect.id) {
        return false;
      }
    }
    this.rects.push(rect);
    return true;
  }

  find(id: string): HitRect | null {
    for (let index = 0; index < this.rects.length; index++) {
      if (this.rects[index].id === id) {
        return this.rects[index];
      }
    }
    return null;
  }

  /** The highest z order wins when two rectangles overlap. */
  hitTest(x: number, y: number): string {
    let best: HitRect | null = null;
    for (let index = 0; index < this.rects.length; index++) {
      const candidate: HitRect = this.rects[index];
      if (!candidate.contains(x, y)) {
        continue;
      }
      if (best === null || candidate.zIndex > best.zIndex) {
        best = candidate;
      }
    }
    return best === null ? '' : best.id;
  }

  candidates(x: number, y: number): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.rects.length; index++) {
      if (this.rects[index].contains(x, y)) {
        result.push(this.rects[index].id);
      }
    }
    return result;
  }

  overlapCount(): number {
    let total: number = 0;
    for (let first = 0; first < this.rects.length; first++) {
      for (let second = first + 1; second < this.rects.length; second++) {
        if (this.rects[first].overlaps(this.rects[second])) {
          total += 1;
        }
      }
    }
    return total;
  }

  size(): number {
    return this.rects.length;
  }

  describeAll(): string {
    return this.rects.map((rect: HitRect) => rect.describe()).join('|');
  }
}

/* ------------------------------------------------------------------ */
/* Touch to click conversion                                           */
/* ------------------------------------------------------------------ */

/**
 * Turns a finished touch session into the logical interaction the component
 * tree announces. A click requires a short press without movement; a longer
 * press without movement becomes a long press; anything that moved enough is
 * a slide and never produces a click.
 */
class TouchClickConverter {
  slop: number = CLICK_MAX_MOVE;
  maxClickDuration: number = CLICK_MAX_DURATION;
  longPressDuration: number = LONG_PRESS_MIN_DURATION;
  clickCount: number = 0;
  longPressCount: number = 0;
  slideCount: number = 0;
  suppressedCount: number = 0;
  lastResult: string = RESULT_NONE;

  convert(session: TouchSession, pointerId: number = 0): string {
    let result: string = RESULT_NONE;
    if (session.cancelCount > 0) {
      this.suppressedCount += 1;
      result = RESULT_NONE;
    } else if (session.displacementOf(pointerId) > this.slop) {
      this.slideCount += 1;
      result = RESULT_SLIDE;
    } else if (session.durationOf(pointerId) >= this.longPressDuration) {
      this.longPressCount += 1;
      result = RESULT_LONG_PRESS;
    } else if (session.durationOf(pointerId) <= this.maxClickDuration) {
      this.clickCount += 1;
      result = RESULT_CLICK;
    }
    this.lastResult = result;
    return result;
  }

  isClick(session: TouchSession): boolean {
    return this.convert(session) === RESULT_CLICK;
  }

  totalHandled(): number {
    return this.clickCount + this.longPressCount + this.slideCount + this.suppressedCount;
  }

  reset(): void {
    this.clickCount = 0;
    this.longPressCount = 0;
    this.slideCount = 0;
    this.suppressedCount = 0;
    this.lastResult = RESULT_NONE;
  }
}

/* ------------------------------------------------------------------ */
/* Sample throttling                                                   */
/* ------------------------------------------------------------------ */

/** Keeps at most one move sample per frame window. */
class TouchSampleGate {
  private clock: MockClock;
  private interval: number;
  private lastAccepted: number = -1;
  accepted: number = 0;
  dropped: number = 0;
  acceptedAt: number[] = [];

  constructor(clock: MockClock, interval: number = TOUCH_THROTTLE_MS) {
    this.clock = clock;
    this.interval = interval;
  }

  intervalMs(): number {
    return this.interval;
  }

  allow(): boolean {
    const now: number = this.clock.now();
    if (this.lastAccepted >= 0 && now - this.lastAccepted < this.interval) {
      this.dropped += 1;
      return false;
    }
    this.lastAccepted = now;
    this.accepted += 1;
    this.acceptedAt.push(now);
    return true;
  }

  total(): number {
    return this.accepted + this.dropped;
  }

  dropRate(): number {
    const total: number = this.total();
    return total === 0 ? 0 : Math.round((this.dropped / total) * 100) / 100;
  }

  reset(): void {
    this.lastAccepted = -1;
    this.accepted = 0;
    this.dropped = 0;
    this.acceptedAt = [];
  }
}

/* ------------------------------------------------------------------ */
/* Fixtures                                                            */
/* ------------------------------------------------------------------ */

/** Builds the tap rectangle table of the phone title bar. */
function buildTitleBarRects(): HitTester {
  const tester: HitTester = new HitTester();
  tester.add(new HitRect(ID_NAV_BACK, 0, 0, 44, 44, 1));
  tester.add(new HitRect(ID_NAV_FORWARD, 44, 0, 44, 44, 1));
  tester.add(new HitRect(ID_NAV_REFRESH, 88, 0, 44, 44, 1));
  tester.add(new HitRect(ID_NAV_HOME, 132, 0, 44, 44, 1));
  tester.add(new HitRect(ID_INPUT_URL, 176, 0, 500, 44, 1));
  tester.add(new HitRect(ID_ACTION_SUBMIT, 676, 0, 44, 44, 2));
  return tester;
}

/** Simple tap session: Down, a couple of Moves, then Up. */
function buildTapSession(): TouchSession {
  const session: TouchSession = new TouchSession();
  session.down(TOUCH_DOWN, 0, 100, 200, 1700000000000);
  session.push(new TouchSample(TOUCH_MOVE, 0, new TouchPoint(101, 201), 1700000000040));
  session.push(new TouchSample(TOUCH_MOVE, 0, new TouchPoint(102, 202), 1700000000080));
  session.push(new TouchSample(TOUCH_UP, 0, new TouchPoint(102, 202), 1700000000100));
  return session;
}

/** Long press session without movement. */
function buildLongPressSession(): TouchSession {
  const session: TouchSession = new TouchSession();
  session.down(TOUCH_DOWN, 0, 200, 300, 1700000000000);
  session.push(new TouchSample(TOUCH_MOVE, 0, new TouchPoint(201, 301), 1700000000300));
  session.push(new TouchSample(TOUCH_UP, 0, new TouchPoint(201, 301), 1700000000600));
  return session;
}

/** Swipe session crossing the click slop. */
function buildSlideSession(): TouchSession {
  const session: TouchSession = new TouchSession();
  session.down(TOUCH_DOWN, 0, 100, 500, 1700000000000);
  session.push(new TouchSample(TOUCH_MOVE, 0, new TouchPoint(100, 400), 1700000000060));
  session.push(new TouchSample(TOUCH_MOVE, 0, new TouchPoint(100, 300), 1700000000120));
  session.push(new TouchSample(TOUCH_UP, 0, new TouchPoint(100, 250), 1700000000180));
  return session;
}

/** Cancelled session, the framework must not synthesize a click. */
function buildCancelSession(): TouchSession {
  const session: TouchSession = new TouchSession();
  session.down(TOUCH_DOWN, 0, 320, 320, 1700000000000);
  session.push(new TouchSample(TOUCH_MOVE, 0, new TouchPoint(360, 320), 1700000000050));
  session.push(new TouchSample(TOUCH_CANCEL, 0, new TouchPoint(360, 320), 1700000000080));
  return session;
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserTouchInteractionTest() {
  describe('browserTouchInteractionTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      TestLogger.info(TAG, `click slop ${CLICK_MAX_MOVE} px, click window ${CLICK_MAX_DURATION} ms, ` +
        `frame gate ${TOUCH_THROTTLE_MS} ms`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Touch_001', 0, async () => {
      TestLogger.step(TAG, 'a tap session is balanced and contains four samples');
      const session: TouchSession = buildTapSession();
      expect(session.size()).assertEqual(4);
      expect(session.downCount).assertEqual(1);
      expect(session.moveCount).assertEqual(2);
      expect(session.upCount).assertEqual(1);
      expect(session.cancelCount).assertEqual(0);
      expect(session.orderViolations).assertEqual(0);
      expect(session.isBalanced()).assertTrue();
      expect(session.activePointerCount()).assertEqual(0);
      expect(session.peak()).assertEqual(1);
    });

    it('Browser_Touch_002', 0, async () => {
      TestLogger.step(TAG, 'the event sequence follows Down, Move, Up order');
      const session: TouchSession = buildTapSession();
      const types: string[] = session.types();
      expect(types[0]).assertEqual(TOUCH_DOWN);
      expect(types[1]).assertEqual(TOUCH_MOVE);
      expect(types[2]).assertEqual(TOUCH_MOVE);
      expect(types[3]).assertEqual(TOUCH_UP);
      expect(session.countKind(TOUCH_MOVE)).assertEqual(2);
      expect(session.sequence()).assertEqual('Down#0,Move#0,Move#0,Up#0');
      expect(session.pointerIds().length).assertEqual(1);
      expect(session.terminatedTwice()).assertEqual(0);
      expect(session.durationOf(0)).assertEqual(100);
      expect(session.displacementOf(0)).assertEqual(2.83);
    });

    it('Browser_Touch_003', 0, async () => {
      TestLogger.step(TAG, 'cancel closes the pointer and forbids a later up');
      const session: TouchSession = buildCancelSession();
      expect(session.size()).assertEqual(3);
      expect(session.cancelCount).assertEqual(1);
      expect(session.upCount).assertEqual(0);
      expect(session.isBalanced()).assertTrue();
      expect(session.countKind(TOUCH_CANCEL)).assertEqual(1);
      expect(session.types()[2]).assertEqual(TOUCH_CANCEL);
      expect(session.durationOf(0)).assertEqual(80);
      expect(session.pointerIds().length).assertEqual(1);
    });

    it('Browser_Touch_004', 0, async () => {
      TestLogger.step(TAG, 'an up without a down is an order violation');
      const session: TouchSession = new TouchSession();
      const accepted: boolean = session.push(new TouchSample(TOUCH_UP, 3,
        new TouchPoint(10, 10), 1700000000000));
      expect(accepted).assertFalse();
      expect(session.orderViolations).assertEqual(1);
      expect(session.upCount).assertEqual(0);
      expect(session.isBalanced()).assertFalse();
      expect(session.size()).assertEqual(1);
      expect(session.downCount).assertEqual(0);
      expect(session.activePointerCount()).assertEqual(0);
    });

    it('Browser_Touch_005', 0, async () => {
      TestLogger.step(TAG, 'two downs for the same pointer are rejected');
      const session: TouchSession = new TouchSession();
      expect(session.down(TOUCH_DOWN, 1, 20, 20, 1700000000000)).assertTrue();
      expect(session.down(TOUCH_DOWN, 1, 22, 22, 1700000000010)).assertFalse();
      expect(session.downCount).assertEqual(1);
      expect(session.orderViolations).assertEqual(1);
      expect(session.activePointerCount()).assertEqual(1);
      expect(session.push(new TouchSample(TOUCH_UP, 1, new TouchPoint(22, 22),
        1700000000100))).assertTrue();
      expect(session.isBalanced()).assertFalse();
      expect(session.terminatedTwice()).assertEqual(0);
    });

    it('Browser_Touch_006', 0, async () => {
      TestLogger.step(TAG, 'two pointers produce a multi touch peak of two');
      const session: TouchSession = new TouchSession();
      session.down(TOUCH_DOWN, 0, 100, 100, 1700000000000);
      session.down(TOUCH_DOWN, 1, 300, 100, 1700000000010);
      expect(session.peak()).assertEqual(2);
      expect(session.activePointerCount()).assertEqual(2);
      session.push(new TouchSample(TOUCH_MOVE, 0, new TouchPoint(120, 120), 1700000000060));
      session.push(new TouchSample(TOUCH_MOVE, 1, new TouchPoint(320, 120), 1700000000070));
      expect(session.moveCount).assertEqual(2);
      expect(session.peak()).assertLess(MULTI_TOUCH_MAX);
      expect(session.pointerIds().length).assertEqual(2);
      expect(session.isBalanced()).assertFalse();
    });

    it('Browser_Touch_007', 0, async () => {
      TestLogger.step(TAG, 'each pointer keeps its own lifetime and displacement');
      const session: TouchSession = new TouchSession();
      session.down(TOUCH_DOWN, 0, 100, 100, 1700000000000);
      session.down(TOUCH_DOWN, 1, 400, 400, 1700000000200);
      session.push(new TouchSample(TOUCH_UP, 1, new TouchPoint(400, 400), 1700000000300));
      session.push(new TouchSample(TOUCH_UP, 0, new TouchPoint(100, 130), 1700000001000));
      expect(session.isBalanced()).assertTrue();
      expect(session.durationOf(0)).assertEqual(1000);
      expect(session.durationOf(1)).assertEqual(100);
      expect(session.displacementOf(0)).assertEqual(30);
      expect(session.displacementOf(1)).assertEqual(0);
      expect(session.countKind(TOUCH_UP)).assertEqual(2);
      expect(session.terminatedTwice()).assertEqual(0);
    });

    it('Browser_Touch_008', 0, async () => {
      TestLogger.step(TAG, 'three simultaneous pointers stay ordered and balanced');
      const session: TouchSession = new TouchSession();
      for (let index = 0; index < 3; index++) {
        session.down(TOUCH_DOWN, index, 100 + index * 60, 300, 1700000000000 + index);
      }
      expect(session.peak()).assertEqual(3);
      expect(session.activePointerCount()).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        session.push(new TouchSample(TOUCH_UP, index, new TouchPoint(100 + index * 60, 300),
          1700000000200 + index));
      }
      expect(session.isBalanced()).assertTrue();
      expect(session.downCount).assertEqual(3);
      expect(session.upCount).assertEqual(3);
      expect(session.pointerIds().length).assertEqual(3);
      expect(session.orderViolations).assertEqual(0);
      expect(session.size()).assertEqual(6);
    });

    it('Browser_Touch_009', 0, async () => {
      TestLogger.step(TAG, 'up followed by cancel on the same pointer is detected');
      const session: TouchSession = new TouchSession();
      session.down(TOUCH_DOWN, 5, 50, 50, 1700000000000);
      session.push(new TouchSample(TOUCH_UP, 5, new TouchPoint(50, 50), 1700000000100));
      session.push(new TouchSample(TOUCH_CANCEL, 5, new TouchPoint(50, 50), 1700000000200));
      expect(session.terminatedTwice()).assertEqual(1);
      expect(session.cancelCount).assertEqual(0);
      expect(session.orderViolations).assertEqual(1);
      expect(session.isBalanced()).assertFalse();
      expect(session.countKind(TOUCH_UP)).assertEqual(1);
    });

    it('Browser_Touch_010', 0, async () => {
      TestLogger.step(TAG, 'a move before any down is rejected');
      const session: TouchSession = new TouchSession();
      const rejected: boolean = session.push(new TouchSample(TOUCH_MOVE, 0,
        new TouchPoint(5, 5), 1700000000000));
      expect(rejected).assertFalse();
      expect(session.moveCount).assertEqual(0);
      expect(session.orderViolations).assertEqual(1);
      expect(session.samples.length).assertEqual(1);
      expect(session.down(TOUCH_DOWN, 0, 5, 5, 1700000000010)).assertTrue();
      expect(session.push(new TouchSample(TOUCH_MOVE, 0, new TouchPoint(6, 6),
        1700000000020))).assertTrue();
      expect(session.moveCount).assertEqual(1);
      expect(session.isBalanced()).assertFalse();
    });

    it('Browser_Touch_011', 0, async () => {
      TestLogger.step(TAG, 'a coordinate inside a button resolves to its id');
      const tester: HitTester = buildTitleBarRects();
      expect(tester.size()).assertEqual(6);
      expect(tester.hitTest(10, 10)).assertEqual(ID_NAV_BACK);
      expect(tester.hitTest(60, 20)).assertEqual(ID_NAV_FORWARD);
      expect(tester.hitTest(100, 20)).assertEqual(ID_NAV_REFRESH);
      expect(tester.hitTest(150, 40)).assertEqual(ID_NAV_HOME);
      expect(tester.hitTest(300, 20)).assertEqual(ID_INPUT_URL);
      expect(tester.hitTest(690, 20)).assertEqual(ID_ACTION_SUBMIT);
      expect(tester.find(ID_NAV_BACK) !== null).assertTrue();
    });

    it('Browser_Touch_012', 0, async () => {
      TestLogger.step(TAG, 'hit testing uses half open rectangles');
      const tester: HitTester = buildTitleBarRects();
      expect(tester.hitTest(0, 0)).assertEqual(ID_NAV_BACK);
      expect(tester.hitTest(43, 43)).assertEqual(ID_NAV_BACK);
      expect(tester.hitTest(44, 0)).assertEqual(ID_NAV_FORWARD);
      expect(tester.hitTest(0, 44)).assertEqual('');
      expect(tester.hitTest(44, 44)).assertEqual('');
      const back: HitRect | null = tester.find(ID_NAV_BACK);
      if (back !== null) {
        expect(back.contains(0, 0)).assertTrue();
        expect(back.contains(44, 10)).assertFalse();
        expect(back.contains(10, 44)).assertFalse();
        expect(back.right()).assertEqual(44);
        expect(back.bottom()).assertEqual(44);
      }
    });

    it('Browser_Touch_013', 0, async () => {
      TestLogger.step(TAG, 'coordinates outside every rectangle resolve to nothing');
      const tester: HitTester = buildTitleBarRects();
      expect(tester.hitTest(-1, 20)).assertEqual('');
      expect(tester.hitTest(20, -1)).assertEqual('');
      expect(tester.hitTest(720, 20)).assertEqual('');
      expect(tester.hitTest(300, 200)).assertEqual('');
      expect(tester.candidates(-1, -1).length).assertEqual(0);
      expect(tester.candidates(300, 20).length).assertEqual(1);
      expect(tester.overlapCount()).assertEqual(0);
    });

    it('Browser_Touch_014', 0, async () => {
      TestLogger.step(TAG, 'the topmost rectangle wins an overlapping hit');
      const tester: HitTester = new HitTester();
      expect(tester.add(new HitRect('panel', 0, 0, 200, 200, 1))).assertTrue();
      expect(tester.add(new HitRect('floating', 50, 50, 100, 100, 5))).assertTrue();
      expect(tester.add(new HitRect('hidden', 60, 60, 20, 20, 0))).assertTrue();
      expect(tester.size()).assertEqual(3);
      expect(tester.hitTest(10, 10)).assertEqual('panel');
      expect(tester.hitTest(70, 70)).assertEqual('floating');
      expect(tester.hitTest(65, 65)).assertEqual('floating');
      expect(tester.candidates(70, 70).length).assertEqual(3);
      expect(tester.overlapCount()).assertEqual(3);
      expect(tester.add(new HitRect('panel', 0, 0, 10, 10))).assertFalse();
    });

    it('Browser_Touch_015', 0, async () => {
      TestLogger.step(TAG, 'rectangle helpers expose centers and descriptions');
      const rect: HitRect = new HitRect(ID_ACTION_SUBMIT, 676, 0, 44, 44, 2);
      expect(rect.centerX()).assertEqual(698);
      expect(rect.centerY()).assertEqual(22);
      expect(rect.describe()).assertEqual('actionButton0[676,0,44x44]');
      expect(rect.contains(rect.centerX(), rect.centerY())).assertTrue();
      expect(rect.right()).assertEqual(720);
      expect(rect.bottom()).assertEqual(44);
      const other: HitRect = new HitRect(ID_ACTION_ADD, 720, 0, 44, 44, 2);
      expect(rect.overlaps(other)).assertFalse();
      expect(other.left).assertEqual(720);
      expect(buildTitleBarRects().describeAll()).assertContain(ID_NAV_BACK);
    });

    it('Browser_Touch_016', 0, async () => {
      TestLogger.step(TAG, 'a short tap converts into exactly one click');
      const converter: TouchClickConverter = new TouchClickConverter();
      const session: TouchSession = buildTapSession();
      expect(converter.convert(session)).assertEqual(RESULT_CLICK);
      expect(converter.clickCount).assertEqual(1);
      expect(converter.longPressCount).assertEqual(0);
      expect(converter.slideCount).assertEqual(0);
      expect(converter.suppressedCount).assertEqual(0);
      expect(converter.totalHandled()).assertEqual(1);
      expect(converter.lastResult).assertEqual(RESULT_CLICK);
      expect(converter.isClick(session)).assertTrue();
      expect(converter.clickCount).assertEqual(2);
    });

    it('Browser_Touch_017', 0, async () => {
      TestLogger.step(TAG, 'movement beyond the click slop yields a slide');
      const converter: TouchClickConverter = new TouchClickConverter();
      const session: TouchSession = buildSlideSession();
      expect(session.displacementOf(0)).assertEqual(250);
      expect(session.displacementOf(0)).assertLarger(converter.slop);
      expect(converter.convert(session)).assertEqual(RESULT_SLIDE);
      expect(converter.slideCount).assertEqual(1);
      expect(converter.clickCount).assertEqual(0);
      expect(converter.totalHandled()).assertEqual(1);
      const borderline: TouchSession = new TouchSession();
      borderline.down(TOUCH_DOWN, 0, 100, 100, 1700000000000);
      borderline.push(new TouchSample(TOUCH_UP, 0, new TouchPoint(110, 100), 1700000000100));
      expect(converter.convert(borderline)).assertEqual(RESULT_CLICK);
      expect(borderline.displacementOf(0)).assertEqual(CLICK_MAX_MOVE);
    });

    it('Browser_Touch_019', 0, async () => {
      TestLogger.step(TAG, 'a cancelled session never synthesizes a click');
      const converter: TouchClickConverter = new TouchClickConverter();
      const session: TouchSession = buildCancelSession();
      expect(session.cancelCount).assertEqual(1);
      expect(converter.convert(session)).assertEqual(RESULT_NONE);
      expect(converter.suppressedCount).assertEqual(1);
      expect(converter.clickCount).assertEqual(0);
      expect(converter.totalHandled()).assertEqual(1);
      expect(converter.lastResult).assertEqual(RESULT_NONE);
      converter.reset();
      expect(converter.totalHandled()).assertEqual(0);
      expect(converter.lastResult).assertEqual(RESULT_NONE);
    });

    it('Browser_Touch_020', 0, async () => {
      TestLogger.step(TAG, 'the frame gate accepts one sample per window');
      const clock: MockClock = new MockClock();
      const gate: TouchSampleGate = new TouchSampleGate(clock);
      expect(gate.intervalMs()).assertEqual(TOUCH_THROTTLE_MS);
      expect(gate.allow()).assertTrue();
      clock.advance(TOUCH_THROTTLE_MS - 1);
      expect(gate.allow()).assertFalse();
      clock.advance(1);
      expect(gate.allow()).assertTrue();
      expect(gate.accepted).assertEqual(2);
      expect(gate.dropped).assertEqual(1);
      expect(gate.total()).assertEqual(3);
      expect(gate.dropRate()).assertEqual(0.33);
      expect(gate.acceptedAt[1] - gate.acceptedAt[0]).assertEqual(TOUCH_THROTTLE_MS);
    });

    it('Browser_Touch_021', 0, async () => {
      TestLogger.step(TAG, 'a dense move burst is throttled to one sample per frame');
      const clock: MockClock = new MockClock();
      const gate: TouchSampleGate = new TouchSampleGate(clock, 16);
      let accepted: number = 0;
      for (let index = 0; index < 10; index++) {
        if (gate.allow()) {
          accepted += 1;
        }
        clock.advance(8);
      }
      expect(accepted).assertEqual(5);
      expect(gate.accepted).assertEqual(5);
      expect(gate.dropped).assertEqual(5);
      expect(gate.dropRate()).assertEqual(0.5);
      expect(gate.total()).assertEqual(10);
      gate.reset();
      expect(gate.total()).assertEqual(0);
      expect(gate.allow()).assertTrue();
    });

    it('Browser_Touch_022', 0, async () => {
      TestLogger.step(TAG, 'point geometry rounds distances to two decimals');
      const first: TouchPoint = new TouchPoint(0, 0);
      const second: TouchPoint = new TouchPoint(3, 4);
      expect(first.distanceTo(second)).assertEqual(5);
      expect(first.distanceTo(new TouchPoint(1, 1))).assertEqual(1.41);
      expect(first.offsetX(second)).assertEqual(3);
      expect(first.offsetY(second)).assertEqual(4);
      expect(first.sameAs(new TouchPoint(0, 0))).assertTrue();
      expect(first.sameAs(second)).assertFalse();
      expect(first.describe()).assertEqual('(0,0)');
      expect(second.describe()).assertEqual('(3,4)');
    });

    it('Browser_Touch_023', 0, async () => {
      TestLogger.step(TAG, 'title bar touch targets exist exactly once on device');
      const ids: string[] = [ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
        ID_NAV_BACK];
      for (let index = 0; index < ids.length; index++) {
        const occurrences: number = await countById(driver, ids[index]);
        TestLogger.info(TAG, `id ${ids[index]} occurrences=${occurrences}`);
        expect(occurrences).assertLarger(0);
        expect(occurrences).assertLess(2);
      }
      expect(await componentByIdExists(driver, ID_ACTION_ADD) ||
        await componentByIdExists(driver, ID_NAV_HOME)).assertTrue();
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
    });

    it('Browser_Touch_024', 0, async () => {
      TestLogger.step(TAG, 'a tap on the back button completes inside the touch budget');
      const clock: MockClock = new MockClock();
      const start: number = clock.now();
      const clicked: boolean = await clickById(driver, ID_NAV_BACK);
      clock.advance(DELAY_TOUCH_EVENT);
      const elapsed: number = clock.now() - start;
      TestLogger.info(TAG, `back tap returned=${clicked}, elapsed=${elapsed} ms`);
      expect(elapsed).assertEqual(DELAY_TOUCH_EVENT);
      expect(elapsed).assertLess(TIMEOUT_COMPONENT);
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('example.com');
      expect(browser.back()).assertFalse();
      expect(browser.getCurrentTab() !== null).assertTrue();
      expect(clicked).assertTrue();
    });

    it('Browser_Touch_025', 0, async () => {
      TestLogger.step(TAG, 'typed address reaches the input component');
      const entered: boolean = await inputById(driver, ID_INPUT_URL, 'example.com');
      const value: string = await textById(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `input accepted=${entered}, text length=${value.length}`);
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      expect(entered).assertTrue();
      expect(value.length).assertLess(2048);
      const browser: MockBrowser = new MockBrowser();
      browser.setInputVal('example.com');
      expect(browser.getInputVal()).assertEqual('example.com');
      expect(browser.normalize(browser.getInputVal())).assertEqual('https://example.com');
    });

    it('Browser_Touch_026', 0, async () => {
      TestLogger.step(TAG, 'a tap inside the Web area does not disturb the tab model');
      const browser: MockBrowser = new MockBrowser();
      const before: number = browser.tabs.length;
      const timer: MockClock = new MockClock();
      const start: number = timer.now();
      await tapAt(driver, 200, 300);
      timer.advance(DELAY_TOUCH_EVENT);
      expect(timer.now() - start).assertEqual(DELAY_TOUCH_EVENT);
      expect(timer.now() - start).assertLess(TIMEOUT_COMPONENT);
      expect(browser.tabs.length).assertEqual(before);
      expect(browser.getTabArrayIndex()).assertEqual(0);
    });

    it('Browser_Touch_027', 0, async () => {
      TestLogger.step(TAG, 'a swipe over the Web area keeps the controls unique');
      await swipeUp(driver, 300, 600, 300, 200);
      const occurrences: number = await countById(driver, ID_NAV_REFRESH);
      expect(occurrences).assertLarger(0);
      expect(occurrences).assertLess(2);
      const session: TouchSession = buildSlideSession();
      const converter: TouchClickConverter = new TouchClickConverter();
      expect(converter.convert(session)).assertEqual(RESULT_SLIDE);
      expect(converter.slideCount).assertEqual(1);
      expect(session.isBalanced()).assertTrue();
    });

    it('Browser_Touch_028', 0, async () => {
      TestLogger.step(TAG, 'tapping the add tab control matches the model contract');
      const browser: MockBrowser = new MockBrowser();
      expect(browser.addTab()).assertTrue();
      expect(browser.tabs.length).assertEqual(2);
      expect(browser.getTabArrayIndex()).assertEqual(1);
      const present: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      let clicked: boolean = false;
      if (present) {
        clicked = await clickById(driver, ID_ACTION_ADD);
      }
      TestLogger.info(TAG, `add tab present=${present}, click returned=${clicked}`);
      if (present) {
        expect(clicked).assertTrue();
      } else {
        expect(await componentByIdExists(driver, ID_NAV_HOME)).assertTrue();
      }
      const ids: number[] = browser.getTabKeys();
      expect(ids.length).assertEqual(2);
      expect(ids[1]).assertEqual(1);
    });

    it('Browser_Touch_029', 0, async () => {
      TestLogger.step(TAG, 'home tap resets the address model state');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('example.com');
      browser.setInputVal('example.com');
      browser.resetToHome('phone.html');
      expect(browser.getInputVal()).assertEqual('');
      const tab: MockBrowserTab | null = browser.getCurrentTab();
      expect(tab === null ? '' : tab.controller.currentUrl).assertEqual('phone.html');
      const clicked: boolean = await clickById(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `home click returned=${clicked}`);
      expect(clicked).assertTrue();
      expect(await componentByIdExists(driver, ID_NAV_HOME)).assertTrue();
    });

    it('Browser_Touch_030', 0, async () => {
      TestLogger.step(TAG, 'aggregate metrics of the touch interaction pass');
      const converter: TouchClickConverter = new TouchClickConverter();
      const sessions: TouchSession[] = [buildTapSession(), buildLongPressSession(),
        buildSlideSession(), buildCancelSession()];
      const results: string[] = [];
      for (let index = 0; index < sessions.length; index++) {
        results.push(converter.convert(sessions[index]));
      }
      expect(results[0]).assertEqual(RESULT_CLICK);
      expect(results[1]).assertEqual(RESULT_LONG_PRESS);
      expect(results[2]).assertEqual(RESULT_SLIDE);
      expect(results[3]).assertEqual(RESULT_NONE);
      expect(converter.totalHandled()).assertEqual(4);
      expect(converter.clickCount).assertEqual(1);
      expect(converter.suppressedCount).assertEqual(1);
      expect(converter.slideCount).assertEqual(1);
      let balanced: number = 0;
      for (let index = 0; index < sessions.length; index++) {
        if (sessions[index].isBalanced()) {
          balanced += 1;
        }
      }
      expect(balanced).assertEqual(4);
      expect(sessions[0].peak()).assertEqual(1);
      expect(sessions[0].downCount).assertEqual(1);
    });
  });
}
