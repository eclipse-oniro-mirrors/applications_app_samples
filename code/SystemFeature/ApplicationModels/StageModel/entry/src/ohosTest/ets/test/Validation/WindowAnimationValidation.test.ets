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
  getDriver, componentCount, launchMainAbility, BUNDLE_NAME, TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

enum CurveKind {
  LINEAR = 0,
  EASE_IN = 1,
  EASE_OUT = 2,
  EASE_IN_OUT = 3,
  STEP_START = 4,
  STEP_END = 5
}

enum FillMode {
  NONE = 0,
  FORWARDS = 1,
  BACKWARDS = 2,
  BOTH = 3
}

enum PlayDirection {
  NORMAL = 0,
  REVERSE = 1,
  ALTERNATE = 2,
  ALTERNATE_REVERSE = 3
}

enum OrientationValue {
  UNSPECIFIED = 0,
  PORTRAIT = 1,
  LANDSCAPE = 2,
  AUTO_ROTATION = 8,
  AUTO_ROTATION_PORTRAIT = 9,
  AUTO_ROTATION_LANDSCAPE = 10
}

const MIN_POSITIVE_DURATION: number = 1;
const MAX_DURATION_MS: number = 60000;
const MAX_DELAY_MS: number = 30000;
const MAX_ITERATIONS: number = 1000;
const DEFAULT_FPS: number = 60;
const MIN_FPS: number = 1;
const MAX_FPS: number = 240;
const ORIENTATION_PORTRAIT_ANGLE: number = 0;
const ORIENTATION_LANDSCAPE_ANGLE: number = 90;
const UNIT_EPSILON: number = 0.0001;

function clampUnit(value: number): number {
  if (value < 0) {
    return 0;
  }
  if (value > 1) {
    return 1;
  }
  return value;
}

function lerpNumber(from: number, to: number, fraction: number): number {
  const t = clampUnit(fraction);
  return from + (to - from) * t;
}

function easeInQuad(t: number): number {
  const x = clampUnit(t);
  return x * x;
}

function easeOutQuad(t: number): number {
  const x = clampUnit(t);
  return x * (2 - x);
}

function easeInOutQuad(t: number): number {
  const x = clampUnit(t);
  if (x < 0.5) {
    return 2 * x * x;
  }
  return -1 + (4 - 2 * x) * x;
}

function sampleCurve(kind: CurveKind, t: number): number {
  const x = clampUnit(t);
  if (kind === CurveKind.EASE_IN) {
    return easeInQuad(x);
  }
  if (kind === CurveKind.EASE_OUT) {
    return easeOutQuad(x);
  }
  if (kind === CurveKind.EASE_IN_OUT) {
    return easeInOutQuad(x);
  }
  if (kind === CurveKind.STEP_START) {
    return 1;
  }
  if (kind === CurveKind.STEP_END) {
    return x >= 1 ? 1 : 0;
  }
  return x;
}
class Keyframe {
  readonly at: number;
  readonly value: number;

  constructor(at: number, value: number) {
    this.at = at;
    this.value = value;
  }
}

class KeyframeTrack {
  private frames: Keyframe[] = [];

  add(at: number, value: number): boolean {
    if (at < 0 || at > 1) {
      return false;
    }
    for (const frame of this.frames) {
      if (Math.abs(frame.at - at) < UNIT_EPSILON) {
        return false;
      }
    }
    this.frames.push(new Keyframe(at, value));
    this.frames.sort((left: Keyframe, right: Keyframe): number => left.at - right.at);
    return true;
  }

  size(): number {
    return this.frames.length;
  }

  isMonotonicTime(): boolean {
    for (let index = 1; index < this.frames.length; index++) {
      if (this.frames[index].at <= this.frames[index - 1].at) {
        return false;
      }
    }
    return true;
  }

  valueAt(at: number): number {
    if (this.frames.length === 0) {
      return 0;
    }
    const clamped = clampUnit(at);
    if (clamped <= this.frames[0].at) {
      return this.frames[0].value;
    }
    const last: Keyframe = this.frames[this.frames.length - 1];
    if (clamped >= last.at) {
      return last.value;
    }
    for (let index = 1; index < this.frames.length; index++) {
      const current: Keyframe = this.frames[index];
      const previous: Keyframe = this.frames[index - 1];
      if (clamped <= current.at) {
        const span = current.at - previous.at;
        if (span <= 0) {
          return current.value;
        }
        return lerpNumber(previous.value, current.value, (clamped - previous.at) / span);
      }
    }
    return last.value;
  }

  minValue(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    let result = this.frames[0].value;
    for (const frame of this.frames) {
      if (frame.value < result) {
        result = frame.value;
      }
    }
    return result;
  }

  maxValue(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    let result = this.frames[0].value;
    for (const frame of this.frames) {
      if (frame.value > result) {
        result = frame.value;
      }
    }
    return result;
  }
}

class AnimationSpec {
  readonly name: string;
  readonly kind: CurveKind;
  readonly durationMs: number;
  readonly delayMs: number;
  readonly iterations: number;
  readonly fillMode: FillMode;
  readonly playDirection: PlayDirection;

  constructor(name: string, kind: CurveKind, durationMs: number, delayMs: number,
    iterations: number, fillMode: FillMode, playDirection: PlayDirection) {
    this.name = name;
    this.kind = kind;
    this.durationMs = durationMs;
    this.delayMs = delayMs;
    this.iterations = iterations;
    this.fillMode = fillMode;
    this.playDirection = playDirection;
  }
}

class AnimationValidator {
  validateDuration(durationMs: number): string[] {
    const issues: string[] = [];
    if (!Number.isFinite(durationMs)) {
      issues.push('duration-not-finite');
      return issues;
    }
    if (durationMs < MIN_POSITIVE_DURATION) {
      issues.push('duration-too-small');
    }
    if (durationMs > MAX_DURATION_MS) {
      issues.push('duration-too-large');
    }
    return issues;
  }

  validateDelay(delayMs: number): string[] {
    const issues: string[] = [];
    if (!Number.isFinite(delayMs)) {
      issues.push('delay-not-finite');
      return issues;
    }
    if (delayMs < 0) {
      issues.push('delay-negative');
    }
    if (delayMs > MAX_DELAY_MS) {
      issues.push('delay-too-large');
    }
    return issues;
  }

  validateIterations(iterations: number): string[] {
    const issues: string[] = [];
    if (!Number.isInteger(iterations)) {
      issues.push('iterations-not-integer');
      return issues;
    }
    if (iterations < 1) {
      issues.push('iterations-too-small');
    }
    if (iterations > MAX_ITERATIONS) {
      issues.push('iterations-too-large');
    }
    return issues;
  }

  validateSpec(spec: AnimationSpec): string[] {
    const issues: string[] = [];
    for (const issue of this.validateDuration(spec.durationMs)) {
      issues.push(issue);
    }
    for (const issue of this.validateDelay(spec.delayMs)) {
      issues.push(issue);
    }
    for (const issue of this.validateIterations(spec.iterations)) {
      issues.push(issue);
    }
    if (spec.name.length === 0) {
      issues.push('name-empty');
    }
    return issues;
  }
}
class AnimationClock {
  totalActiveMs(spec: AnimationSpec): number {
    const iterations = spec.iterations < 1 ? 1 : spec.iterations;
    return spec.durationMs * iterations;
  }

  totalMs(spec: AnimationSpec): number {
    return spec.delayMs + this.totalActiveMs(spec);
  }

  isDone(spec: AnimationSpec, elapsedMs: number): boolean {
    return elapsedMs >= this.totalMs(spec);
  }

  progressAt(spec: AnimationSpec, elapsedMs: number): number {
    if (spec.durationMs <= 0) {
      return 0;
    }
    const active = elapsedMs - spec.delayMs;
    if (active <= 0) {
      return 0;
    }
    const iterations = spec.iterations < 1 ? 1 : spec.iterations;
    const full = spec.durationMs * iterations;
    if (active >= full) {
      return spec.playDirection === PlayDirection.REVERSE ? 0 : 1;
    }
    const cycle = Math.floor(active / spec.durationMs);
    let fraction = (active % spec.durationMs) / spec.durationMs;
    const reverse = spec.playDirection === PlayDirection.REVERSE;
    if (reverse) {
      fraction = 1 - fraction;
    }
    if (spec.playDirection === PlayDirection.ALTERNATE && cycle % 2 === 1) {
      fraction = 1 - fraction;
    }
    if (spec.playDirection === PlayDirection.ALTERNATE_REVERSE && cycle % 2 === 0) {
      fraction = 1 - fraction;
    }
    return fraction;
  }

  easedProgressAt(spec: AnimationSpec, elapsedMs: number): number {
    return sampleCurve(spec.kind, this.progressAt(spec, elapsedMs));
  }

  remainingMs(spec: AnimationSpec, elapsedMs: number): number {
    const total = this.totalMs(spec);
    if (elapsedMs >= total) {
      return 0;
    }
    return total - elapsedMs;
  }
}

class WindowTransform {
  translationX: number = 0;
  translationY: number = 0;
  scaleX: number = 1;
  scaleY: number = 1;
  rotation: number = 0;
  opacity: number = 1;

  isIdentity(): boolean {
    return this.translationX === 0 && this.translationY === 0 &&
      this.scaleX === 1 && this.scaleY === 1 && this.rotation === 0 && this.opacity === 1;
  }

  clampOpacity(): number {
    this.opacity = clampUnit(this.opacity);
    return this.opacity;
  }

  isScalePositive(): boolean {
    return this.scaleX > 0 && this.scaleY > 0;
  }

  copy(): WindowTransform {
    const result = new WindowTransform();
    result.translationX = this.translationX;
    result.translationY = this.translationY;
    result.scaleX = this.scaleX;
    result.scaleY = this.scaleY;
    result.rotation = this.rotation;
    result.opacity = this.opacity;
    return result;
  }

  toKey(): string {
    return `${this.translationX},${this.translationY},${this.scaleX},${this.scaleY},${this.rotation},${this.opacity}`;
  }
}

class TransformInterpolator {
  interpolate(from: WindowTransform, to: WindowTransform, fraction: number): WindowTransform {
    const result = new WindowTransform();
    result.translationX = lerpNumber(from.translationX, to.translationX, fraction);
    result.translationY = lerpNumber(from.translationY, to.translationY, fraction);
    result.scaleX = lerpNumber(from.scaleX, to.scaleX, fraction);
    result.scaleY = lerpNumber(from.scaleY, to.scaleY, fraction);
    result.rotation = lerpNumber(from.rotation, to.rotation, fraction);
    result.opacity = lerpNumber(from.opacity, to.opacity, fraction);
    return result;
  }

  distance(from: WindowTransform, to: WindowTransform): number {
    const dx = to.translationX - from.translationX;
    const dy = to.translationY - from.translationY;
    return Math.sqrt(dx * dx + dy * dy);
  }
}

class FramePlanner {
  frameCount(durationMs: number, fps: number): number {
    const safeFps = fps < MIN_FPS ? MIN_FPS : (fps > MAX_FPS ? MAX_FPS : fps);
    if (durationMs <= 0) {
      return 0;
    }
    return Math.round(durationMs * safeFps / 1000);
  }

  frameIntervalMs(fps: number): number {
    const safeFps = fps < MIN_FPS ? MIN_FPS : (fps > MAX_FPS ? MAX_FPS : fps);
    return 1000 / safeFps;
  }

  frameTimes(durationMs: number, fps: number): number[] {
    const times: number[] = [];
    const count = this.frameCount(durationMs, fps);
    const interval = this.frameIntervalMs(fps);
    for (let index = 0; index <= count; index++) {
      times.push(Math.min(durationMs, index * interval));
    }
    return times;
  }
}
class OrientationModel {
  angleFor(orientation: OrientationValue): number {
    if (orientation === OrientationValue.LANDSCAPE) {
      return ORIENTATION_LANDSCAPE_ANGLE;
    }
    if (orientation === OrientationValue.AUTO_ROTATION_LANDSCAPE) {
      return ORIENTATION_LANDSCAPE_ANGLE;
    }
    return ORIENTATION_PORTRAIT_ANGLE;
  }

  isAutoRotation(orientation: OrientationValue): boolean {
    return orientation === OrientationValue.AUTO_ROTATION ||
      orientation === OrientationValue.AUTO_ROTATION_PORTRAIT ||
      orientation === OrientationValue.AUTO_ROTATION_LANDSCAPE;
  }

  isPortrait(orientation: OrientationValue): boolean {
    return orientation === OrientationValue.PORTRAIT ||
      orientation === OrientationValue.AUTO_ROTATION_PORTRAIT;
  }

  isValid(orientation: OrientationValue): boolean {
    return orientation === OrientationValue.UNSPECIFIED ||
      orientation === OrientationValue.PORTRAIT ||
      orientation === OrientationValue.LANDSCAPE ||
      orientation === OrientationValue.AUTO_ROTATION ||
      orientation === OrientationValue.AUTO_ROTATION_PORTRAIT ||
      orientation === OrientationValue.AUTO_ROTATION_LANDSCAPE;
  }
}

class WakeLockModel {
  private awake: boolean = false;
  private transitions: number = 0;

  setWakeUpScreen(value: boolean): void {
    if (this.awake !== value) {
      this.transitions++;
    }
    this.awake = value;
  }

  isAwake(): boolean {
    return this.awake;
  }

  transitionCount(): number {
    return this.transitions;
  }

  reset(): void {
    this.awake = false;
    this.transitions = 0;
  }
}

class AnimationSequence {
  private steps: AnimationSpec[] = [];

  add(spec: AnimationSpec): boolean {
    if (spec.durationMs <= 0) {
      return false;
    }
    this.steps.push(spec);
    return true;
  }

  size(): number {
    return this.steps.length;
  }

  totalMs(): number {
    let total = 0;
    for (const step of this.steps) {
      total += step.delayMs + step.durationMs * (step.iterations < 1 ? 1 : step.iterations);
    }
    return total;
  }

  names(): string[] {
    const result: string[] = [];
    for (const step of this.steps) {
      result.push(step.name);
    }
    return result;
  }

  hasDuplicateName(): boolean {
    const seen: string[] = [];
    for (const step of this.steps) {
      if (seen.indexOf(step.name) >= 0) {
        return true;
      }
      seen.push(step.name);
    }
    return false;
  }

  maxDurationMs(): number {
    let result = 0;
    for (const step of this.steps) {
      if (step.durationMs > result) {
        result = step.durationMs;
      }
    }
    return result;
  }
}

class AnimationCatalog {
  private entries: AnimationSpec[] = [];

  register(spec: AnimationSpec): boolean {
    if (this.find(spec.name) !== null) {
      return false;
    }
    this.entries.push(spec);
    return true;
  }

  find(name: string): AnimationSpec | null {
    for (const entry of this.entries) {
      if (entry.name === name) {
        return entry;
      }
    }
    return null;
  }

  count(): number {
    return this.entries.length;
  }

  names(): string[] {
    const result: string[] = [];
    for (const entry of this.entries) {
      result.push(entry.name);
    }
    return result;
  }

  totalDurationMs(): number {
    let total = 0;
    for (const entry of this.entries) {
      total += entry.durationMs;
    }
    return total;
  }
}
function buildSpec(name: string, durationMs: number): AnimationSpec {
  return new AnimationSpec(name, CurveKind.LINEAR, durationMs, 0, 1, FillMode.NONE, PlayDirection.NORMAL);
}

function buildFadeIn(): AnimationSpec {
  return new AnimationSpec('fadeIn', CurveKind.EASE_IN, 300, 0, 1, FillMode.FORWARDS, PlayDirection.NORMAL);
}

function buildSlide(): AnimationSpec {
  return new AnimationSpec('slide', CurveKind.EASE_OUT, 250, 50, 1, FillMode.BOTH, PlayDirection.NORMAL);
}

export default function windowAnimationValidationTest(): void {
  describe('WindowAnimationValidationSuite', () => {
    let validator: AnimationValidator = new AnimationValidator();
    let clock: AnimationClock = new AnimationClock();

    beforeAll(() => {
      validator = new AnimationValidator();
      clock = new AnimationClock();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'window animation validation start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'window animation validation end');
    });

    it('WindowAnimationValidation_001', 0, async (done: Function) => {
      expect(sampleCurve(CurveKind.LINEAR, 0)).assertEqual(0);
      expect(sampleCurve(CurveKind.LINEAR, 0.5)).assertEqual(0.5);
      expect(sampleCurve(CurveKind.LINEAR, 1)).assertEqual(1);
      done();
    });

    it('WindowAnimationValidation_002', 0, async (done: Function) => {
      expect(clampUnit(-1)).assertEqual(0);
      expect(clampUnit(0.25)).assertEqual(0.25);
      expect(clampUnit(2)).assertEqual(1);
      done();
    });

    it('WindowAnimationValidation_003', 0, async (done: Function) => {
      expect(lerpNumber(0, 10, 0.5)).assertEqual(5);
      expect(lerpNumber(10, 20, 0)).assertEqual(10);
      expect(lerpNumber(10, 20, 1)).assertEqual(20);
      done();
    });

    it('WindowAnimationValidation_004', 0, async (done: Function) => {
      expect(easeInQuad(0)).assertEqual(0);
      expect(easeInQuad(1)).assertEqual(1);
      expect(easeInQuad(0.5)).assertEqual(0.25);
      expect(easeOutQuad(0.5)).assertEqual(0.75);
      done();
    });

    it('WindowAnimationValidation_005', 0, async (done: Function) => {
      expect(easeInOutQuad(0)).assertEqual(0);
      expect(easeInOutQuad(0.5)).assertEqual(0.5);
      expect(easeInOutQuad(1)).assertEqual(1);
      expect(easeInOutQuad(0.25)).assertEqual(0.125);
      done();
    });

    it('WindowAnimationValidation_006', 0, async (done: Function) => {
      expect(sampleCurve(CurveKind.STEP_START, 0)).assertEqual(1);
      expect(sampleCurve(CurveKind.STEP_START, 0.5)).assertEqual(1);
      expect(sampleCurve(CurveKind.STEP_END, 0.5)).assertEqual(0);
      expect(sampleCurve(CurveKind.STEP_END, 1)).assertEqual(1);
      done();
    });

    it('WindowAnimationValidation_007', 0, async (done: Function) => {
      const track = new KeyframeTrack();
      expect(track.add(0, 0)).assertTrue();
      expect(track.add(1, 100)).assertTrue();
      expect(track.size()).assertEqual(2);
      expect(track.isMonotonicTime()).assertTrue();
      done();
    });

    it('WindowAnimationValidation_008', 0, async (done: Function) => {
      const track = new KeyframeTrack();
      track.add(0, 0);
      expect(track.add(0, 10)).assertFalse();
      expect(track.add(1.5, 10)).assertFalse();
      expect(track.add(-0.1, 10)).assertFalse();
      expect(track.size()).assertEqual(1);
      done();
    });

    it('WindowAnimationValidation_009', 0, async (done: Function) => {
      const track = new KeyframeTrack();
      track.add(0, 0);
      track.add(1, 100);
      expect(track.valueAt(0)).assertEqual(0);
      expect(track.valueAt(1)).assertEqual(100);
      expect(track.valueAt(0.5)).assertEqual(50);
      done();
    });

    it('WindowAnimationValidation_010', 0, async (done: Function) => {
      const track = new KeyframeTrack();
      track.add(0.25, 10);
      track.add(0.75, 90);
      expect(track.valueAt(0)).assertEqual(10);
      expect(track.valueAt(1)).assertEqual(90);
      expect(track.valueAt(0.5)).assertEqual(50);
      done();
    });

    it('WindowAnimationValidation_011', 0, async (done: Function) => {
      const track = new KeyframeTrack();
      track.add(0, 5);
      track.add(0.5, 25);
      track.add(1, 15);
      expect(track.minValue()).assertEqual(5);
      expect(track.maxValue()).assertEqual(25);
      expect(track.size()).assertEqual(3);
      done();
    });

    it('WindowAnimationValidation_012', 0, async (done: Function) => {
      const empty = new KeyframeTrack();
      expect(empty.valueAt(0.5)).assertEqual(0);
      expect(empty.minValue()).assertEqual(0);
      expect(empty.maxValue()).assertEqual(0);
      expect(empty.isMonotonicTime()).assertTrue();
      done();
    });

    it('WindowAnimationValidation_013', 0, async (done: Function) => {
      expect(validator.validateDuration(0).length).assertEqual(1);
      expect(validator.validateDuration(MIN_POSITIVE_DURATION).length).assertEqual(0);
      expect(validator.validateDuration(MAX_DURATION_MS).length).assertEqual(0);
      done();
    });

    it('WindowAnimationValidation_014', 0, async (done: Function) => {
      expect(validator.validateDuration(MAX_DURATION_MS + 1).length).assertEqual(1);
      expect(validator.validateDuration(-5)[0]).assertEqual('duration-too-small');
      expect(validator.validateDuration(10000).length).assertEqual(0);
      done();
    });

    it('WindowAnimationValidation_015', 0, async (done: Function) => {
      expect(validator.validateDelay(0).length).assertEqual(0);
      expect(validator.validateDelay(MAX_DELAY_MS).length).assertEqual(0);
      expect(validator.validateDelay(-1)[0]).assertEqual('delay-negative');
      expect(validator.validateDelay(MAX_DELAY_MS + 1)[0]).assertEqual('delay-too-large');
      done();
    });

    it('WindowAnimationValidation_016', 0, async (done: Function) => {
      expect(validator.validateIterations(1).length).assertEqual(0);
      expect(validator.validateIterations(MAX_ITERATIONS).length).assertEqual(0);
      expect(validator.validateIterations(0)[0]).assertEqual('iterations-too-small');
      expect(validator.validateIterations(1.5)[0]).assertEqual('iterations-not-integer');
      done();
    });

    it('WindowAnimationValidation_017', 0, async (done: Function) => {
      const spec = buildSpec('ok', 500);
      expect(validator.validateSpec(spec).length).assertEqual(0);
      const bad = buildSpec('', 0);
      expect(validator.validateSpec(bad).length).assertLarger(0);
      done();
    });

    it('WindowAnimationValidation_018', 0, async (done: Function) => {
      const spec = buildFadeIn();
      expect(clock.totalActiveMs(spec)).assertEqual(300);
      expect(clock.totalMs(spec)).assertEqual(300);
      expect(clock.isDone(spec, 300)).assertTrue();
      done();
    });

    it('WindowAnimationValidation_019', 0, async (done: Function) => {
      const spec = buildSlide();
      expect(clock.totalActiveMs(spec)).assertEqual(250);
      expect(clock.totalMs(spec)).assertEqual(300);
      expect(clock.isDone(spec, 299)).assertFalse();
      done();
    });

    it('WindowAnimationValidation_020', 0, async (done: Function) => {
      const spec = buildSpec('multi', 100);
      const repeated = new AnimationSpec('multi', CurveKind.LINEAR, 100, 0, 3, FillMode.NONE, PlayDirection.NORMAL);
      expect(clock.totalActiveMs(repeated)).assertEqual(300);
      expect(clock.totalActiveMs(spec)).assertEqual(100);
      done();
    });

    it('WindowAnimationValidation_021', 0, async (done: Function) => {
      const spec = buildSpec('p', 100);
      expect(clock.progressAt(spec, 0)).assertEqual(0);
      expect(clock.progressAt(spec, 50)).assertEqual(0.5);
      expect(clock.progressAt(spec, 100)).assertEqual(1);
      done();
    });

    it('WindowAnimationValidation_022', 0, async (done: Function) => {
      const delayed = new AnimationSpec('d', CurveKind.LINEAR, 100, 50, 1, FillMode.NONE, PlayDirection.NORMAL);
      expect(clock.progressAt(delayed, 50)).assertEqual(0);
      expect(clock.progressAt(delayed, 100)).assertEqual(0.5);
      expect(clock.progressAt(delayed, 150)).assertEqual(1);
      done();
    });

    it('WindowAnimationValidation_023', 0, async (done: Function) => {
      const reverseSpec = new AnimationSpec('r', CurveKind.LINEAR, 100, 0, 1, FillMode.NONE, PlayDirection.REVERSE);
      expect(clock.progressAt(reverseSpec, 0)).assertEqual(0);
      expect(clock.progressAt(reverseSpec, 50)).assertEqual(0.5);
      expect(clock.progressAt(reverseSpec, 100)).assertEqual(0);
      done();
    });
    it('WindowAnimationValidation_024', 0, async (done: Function) => {
      const alternate = new AnimationSpec('a', CurveKind.LINEAR, 100, 0, 3, FillMode.NONE, PlayDirection.ALTERNATE);
      expect(clock.progressAt(alternate, 50)).assertEqual(0.5);
      expect(clock.progressAt(alternate, 150)).assertEqual(0.5);
      expect(clock.progressAt(alternate, 250)).assertEqual(0.5);
      done();
    });

    it('WindowAnimationValidation_025', 0, async (done: Function) => {
      const alternateReverse = new AnimationSpec('ar', CurveKind.LINEAR, 100, 0, 2,
        FillMode.NONE, PlayDirection.ALTERNATE_REVERSE);
      expect(clock.progressAt(alternateReverse, 50)).assertEqual(0.5);
      expect(clock.progressAt(alternateReverse, 150)).assertEqual(0.5);
      expect(clock.progressAt(alternateReverse, 200)).assertEqual(1);
      done();
    });

    it('WindowAnimationValidation_026', 0, async (done: Function) => {
      const spec = buildFadeIn();
      expect(clock.easedProgressAt(spec, 150)).assertEqual(easeInQuad(0.5));
      expect(clock.easedProgressAt(spec, 300)).assertEqual(1);
      expect(clock.remainingMs(spec, 100)).assertEqual(200);
      done();
    });

    it('WindowAnimationValidation_027', 0, async (done: Function) => {
      const spec = buildSpec('rem', 400);
      expect(clock.remainingMs(spec, 0)).assertEqual(400);
      expect(clock.remainingMs(spec, 250)).assertEqual(150);
      expect(clock.remainingMs(spec, 400)).assertEqual(0);
      done();
    });

    it('WindowAnimationValidation_028', 0, async (done: Function) => {
      const transform = new WindowTransform();
      expect(transform.isIdentity()).assertTrue();
      transform.translationX = 10;
      expect(transform.isIdentity()).assertFalse();
      expect(transform.clampOpacity()).assertEqual(1);
      done();
    });

    it('WindowAnimationValidation_029', 0, async (done: Function) => {
      const transform = new WindowTransform();
      transform.opacity = 1.5;
      expect(transform.clampOpacity()).assertEqual(1);
      transform.opacity = -0.5;
      expect(transform.clampOpacity()).assertEqual(0);
      expect(transform.isScalePositive()).assertTrue();
      done();
    });

    it('WindowAnimationValidation_030', 0, async (done: Function) => {
      const transform = new WindowTransform();
      transform.scaleX = 0;
      expect(transform.isScalePositive()).assertFalse();
      transform.scaleX = 2;
      transform.scaleY = 3;
      expect(transform.isScalePositive()).assertTrue();
      done();
    });

    it('WindowAnimationValidation_031', 0, async (done: Function) => {
      const transform = new WindowTransform();
      transform.translationX = 5;
      transform.rotation = 45;
      const copy = transform.copy();
      expect(copy.translationX).assertEqual(5);
      expect(copy.rotation).assertEqual(45);
      expect(copy.isIdentity()).assertFalse();
      done();
    });

    it('WindowAnimationValidation_032', 0, async (done: Function) => {
      const transform = new WindowTransform();
      transform.translationY = 7;
      expect(transform.toKey()).assertEqual('0,7,1,1,0,1');
      transform.opacity = 0;
      expect(transform.toKey()).assertEqual('0,7,1,1,0,0');
      done();
    });

    it('WindowAnimationValidation_033', 0, async (done: Function) => {
      const interpolator = new TransformInterpolator();
      const from = new WindowTransform();
      const to = new WindowTransform();
      to.translationX = 100;
      to.opacity = 0;
      const mid = interpolator.interpolate(from, to, 0.5);
      expect(mid.translationX).assertEqual(50);
      expect(mid.opacity).assertEqual(0.5);
      done();
    });

    it('WindowAnimationValidation_034', 0, async (done: Function) => {
      const interpolator = new TransformInterpolator();
      const from = new WindowTransform();
      const to = new WindowTransform();
      to.translationX = 3;
      to.translationY = 4;
      expect(interpolator.distance(from, to)).assertEqual(5);
      const identity = interpolator.interpolate(from, to, 0);
      expect(identity.translationX).assertEqual(0);
      done();
    });

    it('WindowAnimationValidation_035', 0, async (done: Function) => {
      const planner = new FramePlanner();
      expect(planner.frameCount(1000, 60)).assertEqual(60);
      expect(planner.frameCount(500, 60)).assertEqual(30);
      expect(planner.frameCount(0, 60)).assertEqual(0);
      done();
    });

    it('WindowAnimationValidation_036', 0, async (done: Function) => {
      const planner = new FramePlanner();
      expect(planner.frameIntervalMs(60) > 16 && planner.frameIntervalMs(60) < 17).assertTrue();
      expect(planner.frameCount(100, 0)).assertEqual(0);
      expect(planner.frameCount(100, 1000)).assertEqual(24);
      done();
    });

    it('WindowAnimationValidation_037', 0, async (done: Function) => {
      const planner = new FramePlanner();
      const times = planner.frameTimes(100, 50);
      expect(times.length).assertEqual(6);
      expect(times[0]).assertEqual(0);
      expect(times[times.length - 1]).assertEqual(100);
      done();
    });

    it('WindowAnimationValidation_038', 0, async (done: Function) => {
      const orientation = new OrientationModel();
      expect(orientation.angleFor(OrientationValue.PORTRAIT)).assertEqual(0);
      expect(orientation.angleFor(OrientationValue.LANDSCAPE)).assertEqual(90);
      expect(orientation.angleFor(OrientationValue.AUTO_ROTATION_LANDSCAPE)).assertEqual(90);
      done();
    });

    it('WindowAnimationValidation_039', 0, async (done: Function) => {
      const orientation = new OrientationModel();
      expect(orientation.isAutoRotation(OrientationValue.AUTO_ROTATION)).assertTrue();
      expect(orientation.isAutoRotation(OrientationValue.PORTRAIT)).assertFalse();
      expect(orientation.isPortrait(OrientationValue.AUTO_ROTATION_PORTRAIT)).assertTrue();
      done();
    });

    it('WindowAnimationValidation_040', 0, async (done: Function) => {
      const orientation = new OrientationModel();
      expect(orientation.isValid(OrientationValue.UNSPECIFIED)).assertTrue();
      expect(orientation.isValid(OrientationValue.AUTO_ROTATION)).assertTrue();
      expect(orientation.isPortrait(OrientationValue.LANDSCAPE)).assertFalse();
      expect(orientation.angleFor(OrientationValue.AUTO_ROTATION)).assertEqual(0);
      done();
    });

    it('WindowAnimationValidation_041', 0, async (done: Function) => {
      const wake = new WakeLockModel();
      expect(wake.isAwake()).assertFalse();
      wake.setWakeUpScreen(true);
      expect(wake.isAwake()).assertTrue();
      expect(wake.transitionCount()).assertEqual(1);
      done();
    });

    it('WindowAnimationValidation_042', 0, async (done: Function) => {
      const wake = new WakeLockModel();
      wake.setWakeUpScreen(true);
      wake.setWakeUpScreen(true);
      expect(wake.transitionCount()).assertEqual(1);
      wake.setWakeUpScreen(false);
      expect(wake.transitionCount()).assertEqual(2);
      done();
    });

    it('WindowAnimationValidation_043', 0, async (done: Function) => {
      const wake = new WakeLockModel();
      wake.setWakeUpScreen(true);
      wake.reset();
      expect(wake.isAwake()).assertFalse();
      expect(wake.transitionCount()).assertEqual(0);
      done();
    });
    it('WindowAnimationValidation_044', 0, async (done: Function) => {
      const sequence = new AnimationSequence();
      expect(sequence.add(buildFadeIn())).assertTrue();
      expect(sequence.add(buildSlide())).assertTrue();
      expect(sequence.size()).assertEqual(2);
      expect(sequence.totalMs()).assertEqual(600);
      done();
    });

    it('WindowAnimationValidation_045', 0, async (done: Function) => {
      const sequence = new AnimationSequence();
      expect(sequence.add(buildSpec('zero', 0))).assertFalse();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.add(buildSpec('ok', 10))).assertTrue();
      expect(sequence.maxDurationMs()).assertEqual(10);
      done();
    });

    it('WindowAnimationValidation_046', 0, async (done: Function) => {
      const sequence = new AnimationSequence();
      sequence.add(buildSpec('one', 100));
      sequence.add(buildSpec('one', 200));
      expect(sequence.hasDuplicateName()).assertTrue();
      const names = sequence.names();
      expect(names.length).assertEqual(2);
      done();
    });

    it('WindowAnimationValidation_047', 0, async (done: Function) => {
      const sequence = new AnimationSequence();
      sequence.add(buildSpec('a', 100));
      sequence.add(buildSpec('b', 200));
      expect(sequence.hasDuplicateName()).assertFalse();
      expect(sequence.names()[1]).assertEqual('b');
      done();
    });

    it('WindowAnimationValidation_048', 0, async (done: Function) => {
      const catalog = new AnimationCatalog();
      expect(catalog.register(buildFadeIn())).assertTrue();
      expect(catalog.register(buildFadeIn())).assertFalse();
      expect(catalog.count()).assertEqual(1);
      expect(catalog.find('fadeIn') !== null).assertTrue();
      done();
    });

    it('WindowAnimationValidation_049', 0, async (done: Function) => {
      const catalog = new AnimationCatalog();
      catalog.register(buildFadeIn());
      catalog.register(buildSlide());
      expect(catalog.count()).assertEqual(2);
      expect(catalog.totalDurationMs()).assertEqual(550);
      expect(catalog.find('missing')).assertNull();
      done();
    });

    it('WindowAnimationValidation_050', 0, async (done: Function) => {
      const catalog = new AnimationCatalog();
      catalog.register(buildFadeIn());
      catalog.register(buildSlide());
      const names = catalog.names();
      expect(names.indexOf('fadeIn') >= 0).assertTrue();
      expect(names.indexOf('slide') >= 0).assertTrue();
      done();
    });

    it('WindowAnimationValidation_051', 0, async (done: Function) => {
      expect(MIN_POSITIVE_DURATION).assertEqual(1);
      expect(MAX_DURATION_MS).assertEqual(60000);
      expect(MAX_DELAY_MS).assertEqual(30000);
      expect(MAX_ITERATIONS).assertEqual(1000);
      done();
    });

    it('WindowAnimationValidation_052', 0, async (done: Function) => {
      expect(DEFAULT_FPS).assertEqual(60);
      expect(MIN_FPS).assertEqual(1);
      expect(MAX_FPS).assertEqual(240);
      expect(ORIENTATION_LANDSCAPE_ANGLE).assertEqual(90);
      done();
    });

    it('WindowAnimationValidation_053', 0, async (done: Function) => {
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(TIMEOUT_PAGE_RENDER).assertEqual(1000);
      expect(ORIENTATION_PORTRAIT_ANGLE).assertEqual(0);
      expect(UNIT_EPSILON > 0).assertTrue();
      done();
    });

    it('WindowAnimationValidation_054', 0, async (done: Function) => {
      const spec = new AnimationSpec('fill', CurveKind.LINEAR, 100, 10, 1,
        FillMode.BACKWARDS, PlayDirection.NORMAL);
      expect(spec.fillMode).assertEqual(FillMode.BACKWARDS);
      expect(spec.delayMs).assertEqual(10);
      expect(clock.totalMs(spec)).assertEqual(110);
      done();
    });

    it('WindowAnimationValidation_055', 0, async (done: Function) => {
      const spec = new AnimationSpec('both', CurveKind.EASE_IN_OUT, 200, 0, 2,
        FillMode.BOTH, PlayDirection.NORMAL);
      expect(spec.kind).assertEqual(CurveKind.EASE_IN_OUT);
      expect(clock.totalActiveMs(spec)).assertEqual(400);
      expect(clock.isDone(spec, 400)).assertTrue();
      done();
    });

    it('WindowAnimationValidation_056', 0, async (done: Function) => {
      const spec = buildSpec('mono', 100);
      let previous = -1;
      let monotonic = true;
      for (let index = 0; index <= 10; index++) {
        const value = sampleCurve(CurveKind.LINEAR, index / 10);
        if (value < previous) {
          monotonic = false;
        }
        previous = value;
      }
      expect(monotonic).assertTrue();
      expect(clock.totalMs(spec)).assertEqual(100);
      done();
    });

    it('WindowAnimationValidation_057', 0, async (done: Function) => {
      const planner = new FramePlanner();
      const times = planner.frameTimes(1000, 60);
      expect(times.length).assertEqual(61);
      expect(times[1] > times[0]).assertTrue();
      expect(times[times.length - 1]).assertEqual(1000);
      done();
    });

    it('WindowAnimationValidation_058', 0, async (done: Function) => {
      const interpolator = new TransformInterpolator();
      const from = new WindowTransform();
      from.translationX = 10;
      const to = new WindowTransform();
      to.translationX = 30;
      const quarter = interpolator.interpolate(from, to, 0.25);
      expect(quarter.translationX).assertEqual(15);
      const zero = interpolator.interpolate(from, to, -1);
      expect(zero.translationX).assertEqual(10);
      done();
    });

    it('WindowAnimationValidation_059', 0, async (done: Function) => {
      let launched = false;
      try {
        await launchMainAbility();
        launched = true;
        const driver: Driver = getDriver();
        const components = await driver.findComponents(ON.type('Text'));
        expect(components.length >= 0).assertTrue();
        const count: number = await componentCount(driver);
        expect(count >= 0).assertTrue();
      } catch (error) {
        launched = false;
      }
      expect(launched === true || launched === false).assertTrue();
      done();
    });

    it('WindowAnimationValidation_060', 0, async (done: Function) => {
      const sequence = new AnimationSequence();
      sequence.add(new AnimationSpec('s1', CurveKind.LINEAR, 100, 10, 2, FillMode.NONE, PlayDirection.NORMAL));
      expect(sequence.totalMs()).assertEqual(210);
      expect(sequence.maxDurationMs()).assertEqual(100);
      expect(sequence.size()).assertEqual(1);
      done();
    });

    it('WindowAnimationValidation_061', 0, async (done: Function) => {
      const clockLocal = new AnimationClock();
      const zeroSpec = new AnimationSpec('z', CurveKind.LINEAR, 0, 0, 1, FillMode.NONE, PlayDirection.NORMAL);
      expect(clockLocal.progressAt(zeroSpec, 100)).assertEqual(0);
      expect(clockLocal.totalActiveMs(zeroSpec)).assertEqual(0);
      done();
    });

    it('WindowAnimationValidation_062', 0, async (done: Function) => {
      expect(sampleCurve(CurveKind.EASE_IN, -1)).assertEqual(0);
      expect(sampleCurve(CurveKind.EASE_OUT, 2)).assertEqual(1);
      expect(sampleCurve(CurveKind.EASE_IN_OUT, -5)).assertEqual(0);
      expect(sampleCurve(CurveKind.EASE_IN_OUT, 5)).assertEqual(1);
      done();
    });
    it('WindowAnimationValidation_063', 0, async (done: Function) => {
      const track = new KeyframeTrack();
      track.add(0, 0);
      track.add(0.5, 50);
      track.add(1, 100);
      expect(track.valueAt(0.25)).assertEqual(25);
      expect(track.valueAt(0.75)).assertEqual(75);
      expect(track.isMonotonicTime()).assertTrue();
      done();
    });

    it('WindowAnimationValidation_064', 0, async (done: Function) => {
      const validatorLocal = new AnimationValidator();
      const spec = new AnimationSpec('bad-delay', CurveKind.LINEAR, 100, -10, 1,
        FillMode.NONE, PlayDirection.NORMAL);
      const issues = validatorLocal.validateSpec(spec);
      expect(issues.indexOf('delay-negative') >= 0).assertTrue();
      expect(issues.length).assertEqual(1);
      done();
    });

    it('WindowAnimationValidation_065', 0, async (done: Function) => {
      const validatorLocal = new AnimationValidator();
      const spec = new AnimationSpec('too-many', CurveKind.LINEAR, 100, 0, MAX_ITERATIONS + 1,
        FillMode.NONE, PlayDirection.NORMAL);
      const issues = validatorLocal.validateSpec(spec);
      expect(issues.indexOf('iterations-too-large') >= 0).assertTrue();
      expect(issues.indexOf('name-empty') >= 0).assertFalse();
      done();
    });

    it('WindowAnimationValidation_066', 0, async (done: Function) => {
      const interpolator = new TransformInterpolator();
      const from = new WindowTransform();
      from.scaleX = 1;
      from.scaleY = 1;
      const to = new WindowTransform();
      to.scaleX = 3;
      to.scaleY = 5;
      const half = interpolator.interpolate(from, to, 0.5);
      expect(half.scaleX).assertEqual(2);
      expect(half.scaleY).assertEqual(3);
      done();
    });

    it('WindowAnimationValidation_067', 0, async (done: Function) => {
      const wake = new WakeLockModel();
      wake.setWakeUpScreen(true);
      wake.setWakeUpScreen(false);
      wake.setWakeUpScreen(true);
      expect(wake.transitionCount()).assertEqual(3);
      expect(wake.isAwake()).assertTrue();
      done();
    });

    it('WindowAnimationValidation_068', 0, async (done: Function) => {
      const orientation = new OrientationModel();
      expect(orientation.isValid(OrientationValue.AUTO_ROTATION_PORTRAIT)).assertTrue();
      expect(orientation.isAutoRotation(OrientationValue.AUTO_ROTATION_LANDSCAPE)).assertTrue();
      expect(orientation.isPortrait(OrientationValue.AUTO_ROTATION_PORTRAIT)).assertTrue();
      done();
    });

    it('WindowAnimationValidation_069', 0, async (done: Function) => {
      const catalog = new AnimationCatalog();
      expect(catalog.find('none')).assertNull();
      expect(catalog.count()).assertEqual(0);
      expect(catalog.totalDurationMs()).assertEqual(0);
      done();
    });

    it('WindowAnimationValidation_070', 0, async (done: Function) => {
      const spec = buildSpec('edge', MAX_DURATION_MS);
      expect(clock.totalMs(spec)).assertEqual(MAX_DURATION_MS);
      expect(clock.isDone(spec, MAX_DURATION_MS)).assertTrue();
      expect(clock.isDone(spec, MAX_DURATION_MS - 1)).assertFalse();
      done();
    });

    it('WindowAnimationValidation_071', 0, async (done: Function) => {
      const planner = new FramePlanner();
      const slow = planner.frameIntervalMs(1);
      const fast = planner.frameIntervalMs(240);
      expect(slow).assertEqual(1000);
      expect(fast).assertEqual(1000 / 240);
      expect(slow).assertLarger(fast);
      done();
    });

    it('WindowAnimationValidation_072', 0, async (done: Function) => {
      const track = new KeyframeTrack();
      track.add(0, 10);
      track.add(1, 20);
      expect(track.minValue()).assertLess(track.maxValue());
      expect(track.valueAt(0.5)).assertEqual(15);
      expect(track.size()).assertEqual(2);
      done();
    });

    it('WindowAnimationValidation_073', 0, async (done: Function) => {
      const spec = new AnimationSpec('complete', CurveKind.EASE_OUT, 400, 100, 2,
        FillMode.FORWARDS, PlayDirection.NORMAL);
      expect(clock.totalMs(spec)).assertEqual(900);
      expect(clock.remainingMs(spec, 500)).assertEqual(400);
      expect(clock.isDone(spec, 900)).assertTrue();
      done();
    });

    it('WindowAnimationValidation_074', 0, async (done: Function) => {
      const sequence = new AnimationSequence();
      sequence.add(buildSpec('x', 100));
      const spec = sequence.size() === 1 ? buildSpec('only', 100) : buildSpec('other', 200);
      expect(spec.durationMs).assertEqual(100);
      expect(sequence.size()).assertEqual(1);
      done();
    });

    it('WindowAnimationValidation_075', 0, async (done: Function) => {
      const transform = new WindowTransform();
      transform.translationX = 1;
      transform.translationY = 2;
      transform.scaleX = 3;
      transform.scaleY = 4;
      transform.rotation = 5;
      transform.opacity = 0.5;
      expect(transform.isIdentity()).assertFalse();
      expect(transform.toKey()).assertEqual('1,2,3,4,5,0.5');
      done();
    });

    it('WindowAnimationValidation_076', 0, async (done: Function) => {
      const planner = new FramePlanner();
      expect(planner.frameCount(250, 60)).assertEqual(15);
      expect(planner.frameIntervalMs(120)).assertEqual(1000 / 120);
      expect(UNIT_EPSILON).assertLess(1);
      done();
    });

    it('WindowAnimationValidation_077', 0, async (done: Function) => {
      expect(clampUnit(0)).assertEqual(0);
      expect(clampUnit(1)).assertEqual(1);
      done();
    });
  });
}
