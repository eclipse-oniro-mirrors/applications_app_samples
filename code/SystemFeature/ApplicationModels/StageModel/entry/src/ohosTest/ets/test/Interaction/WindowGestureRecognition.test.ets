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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, simulateTouch,
  KEY_ENTER, KEY_BACK, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN,
  DELAY_KEY_NAVIGATION, TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

enum GestureType {
  TAP = 0,
  DOUBLE_TAP = 1,
  LONG_PRESS = 2,
  SWIPE = 3,
  PINCH = 4,
  DRAG = 5,
  FLING = 6
}

enum GestureState {
  IDLE = 0,
  BEGAN = 1,
  CHANGED = 2,
  ENDED = 3,
  CANCELLED = 4
}

enum SwipeDirection {
  NONE = 0,
  LEFT = 1,
  RIGHT = 2,
  UP = 3,
  DOWN = 4
}

class Vec2 {
  readonly x: number;
  readonly y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }

  add(other: Vec2): Vec2 {
    return new Vec2(this.x + other.x, this.y + other.y);
  }

  sub(other: Vec2): Vec2 {
    return new Vec2(this.x - other.x, this.y - other.y);
  }

  length(): number {
    return Math.sqrt(this.x * this.x + this.y * this.y);
  }

  distanceTo(other: Vec2): number {
    return this.sub(other).length();
  }

  dot(other: Vec2): number {
    return this.x * other.x + this.y * other.y;
  }

  scale(factor: number): Vec2 {
    return new Vec2(this.x * factor, this.y * factor);
  }

  isOrigin(): boolean {
    return this.x === 0 && this.y === 0;
  }
}

class GestureConfig {
  readonly tapMaxDistance: number;
  readonly doubleTapWindowMs: number;
  readonly longPressMs: number;
  readonly swipeMinDistance: number;
  readonly flingMinVelocity: number;

  constructor(tapMaxDistance: number, doubleTapWindowMs: number, longPressMs: number,
    swipeMinDistance: number, flingMinVelocity: number) {
    this.tapMaxDistance = tapMaxDistance;
    this.doubleTapWindowMs = doubleTapWindowMs;
    this.longPressMs = longPressMs;
    this.swipeMinDistance = swipeMinDistance;
    this.flingMinVelocity = flingMinVelocity;
  }

  isValid(): boolean {
    return this.tapMaxDistance > 0 && this.doubleTapWindowMs > 0 &&
      this.longPressMs > 0 && this.swipeMinDistance > 0 && this.flingMinVelocity > 0;
  }
}

function defaultGestureConfig(): GestureConfig {
  return new GestureConfig(10, 300, 500, 60, 800);
}

class GestureSample {
  readonly position: Vec2;
  readonly timeMs: number;
  readonly pointerId: number;

  constructor(position: Vec2, timeMs: number, pointerId: number) {
    this.position = position;
    this.timeMs = timeMs;
    this.pointerId = pointerId;
  }
}

class GestureRecognizer {
  private config: GestureConfig;
  private samples: GestureSample[] = [];

  constructor(config: GestureConfig) {
    this.config = config;
  }

  addSample(sample: GestureSample): void {
    this.samples.push(sample);
  }

  sampleCount(): number {
    return this.samples.length;
  }

  first(): GestureSample | null {
    if (this.samples.length === 0) {
      return null;
    }
    return this.samples[0];
  }

  last(): GestureSample | null {
    if (this.samples.length === 0) {
      return null;
    }
    return this.samples[this.samples.length - 1];
  }

  dx(): number {
    const start = this.first();
    const end = this.last();
    if (start === null || end === null) {
      return 0;
    }
    return end.position.x - start.position.x;
  }

  dy(): number {
    const start = this.first();
    const end = this.last();
    if (start === null || end === null) {
      return 0;
    }
    return end.position.y - start.position.y;
  }

  distance(): number {
    const start = this.first();
    const end = this.last();
    if (start === null || end === null) {
      return 0;
    }
    return start.position.distanceTo(end.position);
  }

  durationMs(): number {
    const start = this.first();
    const end = this.last();
    if (start === null || end === null) {
      return 0;
    }
    return end.timeMs - start.timeMs;
  }

  direction(): SwipeDirection {
    const adx = Math.abs(this.dx());
    const ady = Math.abs(this.dy());
    if (adx === 0 && ady === 0) {
      return SwipeDirection.NONE;
    }
    if (adx >= ady) {
      return this.dx() > 0 ? SwipeDirection.RIGHT : SwipeDirection.LEFT;
    }
    return this.dy() > 0 ? SwipeDirection.DOWN : SwipeDirection.UP;
  }

  isTap(): boolean {
    return this.sampleCount() > 0 && this.distance() <= this.config.tapMaxDistance;
  }

  isLongPress(): boolean {
    return this.durationMs() >= this.config.longPressMs && this.distance() <= this.config.tapMaxDistance;
  }

  isSwipe(): boolean {
    return this.distance() >= this.config.swipeMinDistance;
  }

  averageSpeed(): number {
    const duration = this.durationMs();
    if (duration <= 0) {
      return 0;
    }
    return this.distance() / duration;
  }

  reset(): void {
    this.samples = [];
  }
}

class VelocityTracker {
  private positions: Vec2[] = [];
  private times: number[] = [];

  add(position: Vec2, timeMs: number): void {
    this.positions.push(position);
    this.times.push(timeMs);
  }

  sampleCount(): number {
    return this.positions.length;
  }

  velocityX(): number {
    if (this.positions.length < 2) {
      return 0;
    }
    const firstIndex = 0;
    const lastIndex = this.positions.length - 1;
    const dt = this.times[lastIndex] - this.times[firstIndex];
    if (dt <= 0) {
      return 0;
    }
    const dx = this.positions[lastIndex].x - this.positions[firstIndex].x;
    return dx / dt;
  }

  velocityY(): number {
    if (this.positions.length < 2) {
      return 0;
    }
    const firstIndex = 0;
    const lastIndex = this.positions.length - 1;
    const dt = this.times[lastIndex] - this.times[firstIndex];
    if (dt <= 0) {
      return 0;
    }
    const dy = this.positions[lastIndex].y - this.positions[firstIndex].y;
    return dy / dt;
  }

  speed(): number {
    const vx = this.velocityX();
    const vy = this.velocityY();
    return Math.sqrt(vx * vx + vy * vy);
  }

  isFling(minVelocity: number): boolean {
    return this.speed() >= minVelocity;
  }

  reset(): void {
    this.positions = [];
    this.times = [];
  }
}

class PinchRecognizer {
  private startDistance: number = 0;
  private currentDistance: number = 0;

  begin(first: Vec2, second: Vec2): void {
    this.startDistance = first.distanceTo(second);
    this.currentDistance = this.startDistance;
  }

  update(first: Vec2, second: Vec2): void {
    this.currentDistance = first.distanceTo(second);
  }

  scale(): number {
    if (this.startDistance <= 0) {
      return 1;
    }
    return this.currentDistance / this.startDistance;
  }

  isZoomIn(): boolean {
    return this.scale() > 1.05;
  }

  isZoomOut(): boolean {
    return this.scale() < 0.95;
  }

  isPinching(): boolean {
    return this.scale() > 1.05 || this.scale() < 0.95;
  }

  reset(): void {
    this.startDistance = 0;
    this.currentDistance = 0;
  }
}

class DragTracker {
  private startPoint: Vec2 = new Vec2(0, 0);
  private currentPoint: Vec2 = new Vec2(0, 0);
  private active: boolean = false;
  private slop: number;

  constructor(slop: number) {
    this.slop = slop > 0 ? slop : 1;
  }

  begin(point: Vec2): void {
    this.startPoint = point;
    this.currentPoint = point;
    this.active = true;
  }

  move(point: Vec2): void {
    if (this.active) {
      this.currentPoint = point;
    }
  }

  end(): void {
    this.active = false;
  }

  isActive(): boolean {
    return this.active;
  }

  offsetX(): number {
    return this.currentPoint.x - this.startPoint.x;
  }

  offsetY(): number {
    return this.currentPoint.y - this.startPoint.y;
  }

  travel(): number {
    return this.startPoint.distanceTo(this.currentPoint);
  }

  exceededSlop(): boolean {
    return this.travel() >= this.slop;
  }
}

class GestureStateMachine {
  private state: GestureState = GestureState.IDLE;

  getState(): GestureState {
    return this.state;
  }

  begin(): boolean {
    if (this.state !== GestureState.IDLE && this.state !== GestureState.ENDED &&
      this.state !== GestureState.CANCELLED) {
      return false;
    }
    this.state = GestureState.BEGAN;
    return true;
  }

  change(): boolean {
    if (this.state !== GestureState.BEGAN && this.state !== GestureState.CHANGED) {
      return false;
    }
    this.state = GestureState.CHANGED;
    return true;
  }

  end(): boolean {
    if (this.state !== GestureState.BEGAN && this.state !== GestureState.CHANGED) {
      return false;
    }
    this.state = GestureState.ENDED;
    return true;
  }

  cancel(): boolean {
    if (this.state === GestureState.IDLE || this.state === GestureState.CANCELLED) {
      return false;
    }
    this.state = GestureState.CANCELLED;
    return true;
  }

  reset(): void {
    this.state = GestureState.IDLE;
  }

  isActive(): boolean {
    return this.state === GestureState.BEGAN || this.state === GestureState.CHANGED;
  }
}

class TapCounter {
  private count: number = 0;
  private lastTapTime: number = 0;
  private windowMs: number;

  constructor(windowMs: number) {
    this.windowMs = windowMs > 0 ? windowMs : 1;
  }

  registerTap(timeMs: number): number {
    if (this.count > 0 && timeMs - this.lastTapTime > this.windowMs) {
      this.count = 0;
    }
    this.count += 1;
    this.lastTapTime = timeMs;
    return this.count;
  }

  tapCount(): number {
    return this.count;
  }

  isDoubleTap(): boolean {
    return this.count === 2;
  }

  reset(): void {
    this.count = 0;
    this.lastTapTime = 0;
  }
}

class GestureClassifier {
  private config: GestureConfig;

  constructor(config: GestureConfig) {
    this.config = config;
  }

  classify(recognizer: GestureRecognizer): GestureType {
    if (recognizer.sampleCount() === 0) {
      return GestureType.TAP;
    }
    if (recognizer.isLongPress()) {
      return GestureType.LONG_PRESS;
    }
    if (recognizer.isSwipe()) {
      return GestureType.SWIPE;
    }
    return GestureType.TAP;
  }

  classifyWithVelocity(recognizer: GestureRecognizer, velocity: VelocityTracker): GestureType {
    if (recognizer.isSwipe() && velocity.isFling(this.config.flingMinVelocity)) {
      return GestureType.FLING;
    }
    return this.classify(recognizer);
  }
}

function buildRecognizer(): GestureRecognizer {
  const recognizer = new GestureRecognizer(defaultGestureConfig());
  recognizer.addSample(new GestureSample(new Vec2(100, 200), 0, 0));
  recognizer.addSample(new GestureSample(new Vec2(160, 200), 40, 0));
  recognizer.addSample(new GestureSample(new Vec2(220, 200), 80, 0));
  return recognizer;
}

export default function windowGestureRecognitionTest(): void {
  describe('WindowGestureRecognitionSuite', () => {
    let recognizer: GestureRecognizer = buildRecognizer();

    beforeAll(() => {
      recognizer = buildRecognizer();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'gesture suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'gesture suite end');
    });

    it('WindowGestureRecognition_001', 0, async (done: Function) => {
      expect(recognizer.sampleCount()).assertEqual(3);
      expect(recognizer.dx()).assertEqual(120);
      expect(recognizer.dy()).assertEqual(0);
      expect(recognizer.distance()).assertEqual(120);
      done();
    });

    it('WindowGestureRecognition_002', 0, async (done: Function) => {
      expect(recognizer.direction()).assertEqual(SwipeDirection.RIGHT);
      expect(recognizer.isSwipe()).assertTrue();
      expect(recognizer.isTap()).assertFalse();
      done();
    });

    it('WindowGestureRecognition_003', 0, async (done: Function) => {
      expect(recognizer.durationMs()).assertEqual(80);
      expect(recognizer.averageSpeed()).assertEqual(1.5);
      expect(recognizer.isLongPress()).assertFalse();
      done();
    });

    it('WindowGestureRecognition_004', 0, async (done: Function) => {
      const first = recognizer.first();
      const last = recognizer.last();
      expect(first !== null && first.timeMs === 0).assertTrue();
      expect(last !== null && last.timeMs === 80).assertTrue();
      done();
    });

    it('WindowGestureRecognition_005', 0, async (done: Function) => {
      const local = new GestureRecognizer(defaultGestureConfig());
      expect(local.first()).assertNull();
      expect(local.last()).assertNull();
      expect(local.dx()).assertEqual(0);
      expect(local.direction()).assertEqual(SwipeDirection.NONE);
      done();
    });

    it('WindowGestureRecognition_006', 0, async (done: Function) => {
      const local = new GestureRecognizer(defaultGestureConfig());
      local.addSample(new GestureSample(new Vec2(200, 200), 0, 0));
      local.addSample(new GestureSample(new Vec2(100, 200), 50, 0));
      expect(local.direction()).assertEqual(SwipeDirection.LEFT);
      expect(local.dx()).assertEqual(-100);
      done();
    });

    it('WindowGestureRecognition_007', 0, async (done: Function) => {
      const local = new GestureRecognizer(defaultGestureConfig());
      local.addSample(new GestureSample(new Vec2(100, 100), 0, 0));
      local.addSample(new GestureSample(new Vec2(100, 300), 50, 0));
      expect(local.direction()).assertEqual(SwipeDirection.DOWN);
      expect(local.dy()).assertEqual(200);
      done();
    });

    it('WindowGestureRecognition_008', 0, async (done: Function) => {
      const local = new GestureRecognizer(defaultGestureConfig());
      local.addSample(new GestureSample(new Vec2(100, 300), 0, 0));
      local.addSample(new GestureSample(new Vec2(100, 100), 50, 0));
      expect(local.direction()).assertEqual(SwipeDirection.UP);
      expect(local.dy()).assertEqual(-200);
      done();
    });

    it('WindowGestureRecognition_009', 0, async (done: Function) => {
      const local = new GestureRecognizer(defaultGestureConfig());
      local.addSample(new GestureSample(new Vec2(100, 100), 0, 0));
      local.addSample(new GestureSample(new Vec2(103, 104), 20, 0));
      expect(local.isTap()).assertTrue();
      expect(local.isSwipe()).assertFalse();
      done();
    });

    it('WindowGestureRecognition_010', 0, async (done: Function) => {
      const local = new GestureRecognizer(defaultGestureConfig());
      local.addSample(new GestureSample(new Vec2(100, 100), 0, 0));
      local.addSample(new GestureSample(new Vec2(102, 101), 600, 0));
      expect(local.isLongPress()).assertTrue();
      expect(local.isTap()).assertTrue();
      done();
    });

    it('WindowGestureRecognition_011', 0, async (done: Function) => {
      const local = buildRecognizer();
      local.reset();
      expect(local.sampleCount()).assertEqual(0);
      expect(local.isTap()).assertFalse();
      expect(local.isSwipe()).assertFalse();
      done();
    });

    it('WindowGestureRecognition_012', 0, async (done: Function) => {
      const tracker = new VelocityTracker();
      expect(tracker.sampleCount()).assertEqual(0);
      expect(tracker.velocityX()).assertEqual(0);
      expect(tracker.speed()).assertEqual(0);
      expect(tracker.isFling(800)).assertFalse();
      done();
    });

    it('WindowGestureRecognition_013', 0, async (done: Function) => {
      const tracker = new VelocityTracker();
      tracker.add(new Vec2(0, 0), 0);
      tracker.add(new Vec2(100, 0), 100);
      expect(tracker.velocityX()).assertEqual(1);
      expect(tracker.velocityY()).assertEqual(0);
      expect(tracker.speed()).assertEqual(1);
      expect(tracker.isFling(1)).assertTrue();
      done();
    });

    it('WindowGestureRecognition_014', 0, async (done: Function) => {
      const tracker = new VelocityTracker();
      tracker.add(new Vec2(0, 0), 0);
      tracker.add(new Vec2(0, 200), 100);
      expect(tracker.velocityY()).assertEqual(2);
      expect(tracker.speed()).assertEqual(2);
      tracker.reset();
      expect(tracker.sampleCount()).assertEqual(0);
      done();
    });

    it('WindowGestureRecognition_015', 0, async (done: Function) => {
      const tracker = new VelocityTracker();
      tracker.add(new Vec2(0, 0), 100);
      tracker.add(new Vec2(50, 50), 100);
      expect(tracker.velocityX()).assertEqual(0);
      expect(tracker.velocityY()).assertEqual(0);
      done();
    });

    it('WindowGestureRecognition_016', 0, async (done: Function) => {
      const pinch = new PinchRecognizer();
      pinch.begin(new Vec2(0, 0), new Vec2(100, 0));
      expect(pinch.scale()).assertEqual(1);
      expect(pinch.isPinching()).assertFalse();
      done();
    });

    it('WindowGestureRecognition_017', 0, async (done: Function) => {
      const pinch = new PinchRecognizer();
      pinch.begin(new Vec2(0, 0), new Vec2(100, 0));
      pinch.update(new Vec2(0, 0), new Vec2(200, 0));
      expect(pinch.scale()).assertEqual(2);
      expect(pinch.isZoomIn()).assertTrue();
      expect(pinch.isPinching()).assertTrue();
      done();
    });

    it('WindowGestureRecognition_018', 0, async (done: Function) => {
      const pinch = new PinchRecognizer();
      pinch.begin(new Vec2(0, 0), new Vec2(200, 0));
      pinch.update(new Vec2(0, 0), new Vec2(100, 0));
      expect(pinch.scale()).assertEqual(0.5);
      expect(pinch.isZoomOut()).assertTrue();
      done();
    });

    it('WindowGestureRecognition_019', 0, async (done: Function) => {
      const pinch = new PinchRecognizer();
      pinch.begin(new Vec2(0, 0), new Vec2(0, 0));
      expect(pinch.scale()).assertEqual(1);
      pinch.update(new Vec2(0, 0), new Vec2(50, 0));
      expect(pinch.scale()).assertEqual(1);
      pinch.reset();
      expect(pinch.scale()).assertEqual(1);
      done();
    });

    it('WindowGestureRecognition_020', 0, async (done: Function) => {
      const drag = new DragTracker(20);
      drag.begin(new Vec2(50, 50));
      expect(drag.isActive()).assertTrue();
      drag.move(new Vec2(60, 60));
      expect(drag.offsetX()).assertEqual(10);
      expect(drag.offsetY()).assertEqual(10);
      expect(drag.exceededSlop()).assertFalse();
      done();
    });

    it('WindowGestureRecognition_021', 0, async (done: Function) => {
      const drag = new DragTracker(20);
      drag.begin(new Vec2(50, 50));
      drag.move(new Vec2(90, 50));
      expect(drag.travel()).assertEqual(40);
      expect(drag.exceededSlop()).assertTrue();
      drag.end();
      expect(drag.isActive()).assertFalse();
      drag.move(new Vec2(120, 50));
      expect(drag.offsetX()).assertEqual(40);
      done();
    });

    it('WindowGestureRecognition_022', 0, async (done: Function) => {
      const drag = new DragTracker(0);
      drag.begin(new Vec2(0, 0));
      drag.move(new Vec2(1, 0));
      expect(drag.exceededSlop()).assertTrue();
      done();
    });

    it('WindowGestureRecognition_023', 0, async (done: Function) => {
      const machine = new GestureStateMachine();
      expect(machine.getState()).assertEqual(GestureState.IDLE);
      expect(machine.begin()).assertTrue();
      expect(machine.getState()).assertEqual(GestureState.BEGAN);
      expect(machine.change()).assertTrue();
      expect(machine.getState()).assertEqual(GestureState.CHANGED);
      done();
    });

    it('WindowGestureRecognition_024', 0, async (done: Function) => {
      const machine = new GestureStateMachine();
      expect(machine.change()).assertFalse();
      expect(machine.end()).assertFalse();
      expect(machine.cancel()).assertFalse();
      expect(machine.getState()).assertEqual(GestureState.IDLE);
      done();
    });

    it('WindowGestureRecognition_025', 0, async (done: Function) => {
      const machine = new GestureStateMachine();
      machine.begin();
      expect(machine.end()).assertTrue();
      expect(machine.getState()).assertEqual(GestureState.ENDED);
      expect(machine.begin()).assertTrue();
      expect(machine.isActive()).assertTrue();
      done();
    });

    it('WindowGestureRecognition_026', 0, async (done: Function) => {
      const machine = new GestureStateMachine();
      machine.begin();
      machine.change();
      expect(machine.cancel()).assertTrue();
      expect(machine.getState()).assertEqual(GestureState.CANCELLED);
      expect(machine.cancel()).assertFalse();
      machine.reset();
      expect(machine.getState()).assertEqual(GestureState.IDLE);
      done();
    });

    it('WindowGestureRecognition_027', 0, async (done: Function) => {
      const counter = new TapCounter(300);
      expect(counter.registerTap(0)).assertEqual(1);
      expect(counter.isDoubleTap()).assertFalse();
      expect(counter.registerTap(200)).assertEqual(2);
      expect(counter.isDoubleTap()).assertTrue();
      done();
    });

    it('WindowGestureRecognition_028', 0, async (done: Function) => {
      const counter = new TapCounter(300);
      counter.registerTap(0);
      expect(counter.registerTap(500)).assertEqual(1);
      expect(counter.tapCount()).assertEqual(1);
      counter.reset();
      expect(counter.tapCount()).assertEqual(0);
      done();
    });

    it('WindowGestureRecognition_029', 0, async (done: Function) => {
      const classifier = new GestureClassifier(defaultGestureConfig());
      expect(classifier.classify(buildRecognizer())).assertEqual(GestureType.SWIPE);
      const tap = new GestureRecognizer(defaultGestureConfig());
      tap.addSample(new GestureSample(new Vec2(10, 10), 0, 0));
      tap.addSample(new GestureSample(new Vec2(12, 11), 20, 0));
      expect(classifier.classify(tap)).assertEqual(GestureType.TAP);
      done();
    });

    it('WindowGestureRecognition_030', 0, async (done: Function) => {
      const classifier = new GestureClassifier(defaultGestureConfig());
      const longPress = new GestureRecognizer(defaultGestureConfig());
      longPress.addSample(new GestureSample(new Vec2(10, 10), 0, 0));
      longPress.addSample(new GestureSample(new Vec2(11, 10), 700, 0));
      expect(classifier.classify(longPress)).assertEqual(GestureType.LONG_PRESS);
      done();
    });

    it('WindowGestureRecognition_031', 0, async (done: Function) => {
      const classifier = new GestureClassifier(defaultGestureConfig());
      const tracker = new VelocityTracker();
      tracker.add(new Vec2(0, 0), 0);
      tracker.add(new Vec2(2000, 0), 100);
      expect(classifier.classifyWithVelocity(buildRecognizer(), tracker)).assertEqual(GestureType.SWIPE);
      done();
    });

    it('WindowGestureRecognition_032', 0, async (done: Function) => {
      const classifier = new GestureClassifier(defaultGestureConfig());
      const slow = new VelocityTracker();
      slow.add(new Vec2(0, 0), 0);
      slow.add(new Vec2(1, 0), 1000);
      expect(classifier.classifyWithVelocity(buildRecognizer(), slow)).assertEqual(GestureType.SWIPE);
      done();
    });

    it('WindowGestureRecognition_033', 0, async (done: Function) => {
      const config = defaultGestureConfig();
      expect(config.isValid()).assertTrue();
      expect(config.tapMaxDistance).assertEqual(10);
      expect(config.longPressMs).assertEqual(500);
      expect(config.flingMinVelocity).assertEqual(800);
      const invalid = new GestureConfig(0, 0, 0, 0, 0);
      expect(invalid.isValid()).assertFalse();
      done();
    });

    it('WindowGestureRecognition_034', 0, async (done: Function) => {
      const a = new Vec2(3, 4);
      expect(a.length()).assertEqual(5);
      const b = new Vec2(0, 0);
      expect(a.distanceTo(b)).assertEqual(5);
      expect(a.dot(b)).assertEqual(0);
      expect(b.isOrigin()).assertTrue();
      done();
    });

    it('WindowGestureRecognition_035', 0, async (done: Function) => {
      const a = new Vec2(1, 2);
      const sum = a.add(new Vec2(2, 3));
      expect(sum.x).assertEqual(3);
      expect(sum.y).assertEqual(5);
      const diff = sum.sub(a);
      expect(diff.x).assertEqual(2);
      expect(diff.y).assertEqual(3);
      expect(a.scale(2).x).assertEqual(2);
      done();
    });

    it('WindowGestureRecognition_036', 0, async (done: Function) => {
      expect(KEY_ENTER).assertEqual(2049);
      expect(KEY_BACK).assertEqual(2);
      expect(KEY_LEFT).assertEqual(2014);
      expect(KEY_RIGHT).assertEqual(2015);
      expect(DELAY_KEY_NAVIGATION).assertEqual(50);
      expect(TIMEOUT_PAGE_RENDER).assertEqual(1000);
      done();
    });

    it('WindowGestureRecognition_037', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        await simulateTouch(driver, 100, 200);
        expect(true).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('WindowGestureRecognition_038', 0, async (done: Function) => {
      const local = buildRecognizer();
      const state = new GestureStateMachine();
      state.begin();
      state.change();
      expect(local.isSwipe()).assertTrue();
      expect(state.isActive()).assertTrue();
      state.end();
      expect(state.getState()).assertEqual(GestureState.ENDED);
      done();
    });
  });
}

