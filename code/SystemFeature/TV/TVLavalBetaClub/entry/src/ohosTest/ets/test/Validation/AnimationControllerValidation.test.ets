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

const STATE_IDLE: string = 'idle';

const STATE_RUNNING: string = 'running';

const STATE_PAUSED: string = 'paused';

const STATE_FINISHED: string = 'finished';

const DEFAULT_DURATION: number = 300;

const MAX_DURATION: number = 5000;

const MIN_DURATION: number = 1;

const DEFAULT_ITERATIONS: number = 1;

const MAX_ITERATIONS: number = 10;

const CURVE_LINEAR: string = 'linear';

interface AnimationSpec {
  from: number;
  to: number;
  durationMs: number;
  iterations: number;
  curve: string;
}

// Validates animation specifications
class AnimationSpecValidator {
  public static isDurationValid(durationMs: number): boolean {
    return durationMs >= MIN_DURATION && durationMs <= MAX_DURATION;
  }

  public static isIterationsValid(iterations: number): boolean {
    return iterations >= 1 && iterations <= MAX_ITERATIONS &&
      Math.floor(iterations) === iterations;
  }

  public static isCurveValid(curve: string): boolean {
    return curve === CURVE_LINEAR || curve === 'easeIn' ||
      curve === 'easeOut' || curve === 'easeInOut';
  }

  public static validate(spec: AnimationSpec): string[] {
    const issues: string[] = [];
    if (!AnimationSpecValidator.isDurationValid(spec.durationMs)) {
      issues.push('duration');
    }
    if (!AnimationSpecValidator.isIterationsValid(spec.iterations)) {
      issues.push('iterations');
    }
    if (!AnimationSpecValidator.isCurveValid(spec.curve)) {
      issues.push('curve');
    }
    if (spec.from === spec.to) {
      issues.push('range');
    }
    return issues;
  }

  public static isValid(spec: AnimationSpec): boolean {
    return AnimationSpecValidator.validate(spec).length === 0;
  }

  public static valueAt(spec: AnimationSpec, progress: number): number {
    const clamped = progress < 0 ? 0 : (progress > 1 ? 1 : progress);
    let eased = clamped;
    if (spec.curve === 'easeIn') {
      eased = clamped * clamped;
    } else if (spec.curve === 'easeOut') {
      eased = 1 - (1 - clamped) * (1 - clamped);
    } else if (spec.curve === 'easeInOut') {
      eased = clamped < 0.5 ? 2 * clamped * clamped :
        1 - 2 * (1 - clamped) * (1 - clamped);
    }
    return spec.from + (spec.to - spec.from) * eased;
  }
}

// Drives animation playback state
class AnimationController {
  private spec: AnimationSpec;
  private state: string = STATE_IDLE;
  private progress: number = 0;
  private frames: number = 0;

  constructor(spec: AnimationSpec) {
    this.spec = {
      from: spec.from,
      to: spec.to,
      durationMs: spec.durationMs,
      iterations: spec.iterations,
      curve: spec.curve
    };
  }

  public play(): boolean {
    if (this.state === STATE_RUNNING) {
      return false;
    }
    if (!AnimationSpecValidator.isValid(this.spec)) {
      return false;
    }
    this.state = STATE_RUNNING;
    return true;
  }

  public pause(): boolean {
    if (this.state !== STATE_RUNNING) {
      return false;
    }
    this.state = STATE_PAUSED;
    return true;
  }

  public resume(): boolean {
    if (this.state !== STATE_PAUSED) {
      return false;
    }
    this.state = STATE_RUNNING;
    return true;
  }

  public stop(): boolean {
    if (this.state === STATE_IDLE) {
      return false;
    }
    this.state = STATE_IDLE;
    this.progress = 0;
    return true;
  }

  public tick(delta: number): number {
    if (this.state !== STATE_RUNNING || delta <= 0) {
      return this.progress;
    }
    this.frames++;
    this.progress += delta / this.spec.durationMs;
    if (this.progress >= 1) {
      this.progress = 1;
      this.state = STATE_FINISHED;
    }
    return this.progress;
  }

  public getValue(): number {
    return AnimationSpecValidator.valueAt(this.spec, this.progress);
  }

  public getState(): string {
    return this.state;
  }

  public getProgress(): number {
    return this.progress;
  }

  public getFrameCount(): number {
    return this.frames;
  }

  public isFinished(): boolean {
    return this.state === STATE_FINISHED;
  }

  public getSpec(): AnimationSpec {
    return {
      from: this.spec.from,
      to: this.spec.to,
      durationMs: this.spec.durationMs,
      iterations: this.spec.iterations,
      curve: this.spec.curve
    };
  }

  public reset(): void {
    this.state = STATE_IDLE;
    this.progress = 0;
    this.frames = 0;
  }
}

// Schedules frames at a fixed interval and aggregates frame timing
class FrameScheduler {
  private readonly frameIntervalMs: number;
  private scheduled: number = 0;
  private skipped: number = 0;

  constructor(frameIntervalMs: number) {
    this.frameIntervalMs = frameIntervalMs;
  }

  public schedule(now: number): boolean {
    if (this.frameIntervalMs <= 0) {
      return false;
    }
    this.scheduled++;
    return true;
  }

  public skip(): void {
    this.skipped++;
  }

  public getScheduled(): number {
    return this.scheduled;
  }

  public getSkipped(): number {
    return this.skipped;
  }

  public framesFor(durationMs: number): number {
    if (durationMs <= 0 || this.frameIntervalMs <= 0) {
      return 0;
    }
    return Math.ceil(durationMs / this.frameIntervalMs);
  }

  public reset(): void {
    this.scheduled = 0;
    this.skipped = 0;
  }
}

// Records animation callback invocations
class AnimationCallbackLog {
  private callbacks: string[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public record(name: string): boolean {
    if (name.length === 0 || this.capacity <= 0) {
      return false;
    }
    if (this.callbacks.length >= this.capacity) {
      this.callbacks.shift();
    }
    this.callbacks.push(name);
    return true;
  }

  public countOf(name: string): number {
    return this.callbacks.filter((item: string) => item === name).length;
  }

  public count(): number {
    return this.callbacks.length;
  }

  public latest(): string {
    return this.callbacks.length === 0 ? '' : this.callbacks[this.callbacks.length - 1];
  }

  public clear(): void {
    this.callbacks = [];
  }
}

export default function animationControllerValidationTest() {
  describe('AnimationControllerValidation_Test', () => {

    it('validator_should_accept_valid_spec', 0, () => {
      const spec: AnimationSpec = {
        from: 0, to: 100, durationMs: DEFAULT_DURATION, iterations: 1, curve: CURVE_LINEAR
      };
      expect(AnimationSpecValidator.isValid(spec)).assertTrue();
      expect(AnimationSpecValidator.isDurationValid(DEFAULT_DURATION)).assertTrue();
      expect(AnimationSpecValidator.isIterationsValid(DEFAULT_ITERATIONS)).assertTrue();
      expect(AnimationSpecValidator.isCurveValid(CURVE_LINEAR)).assertTrue();
    });

    it('validator_should_bound_duration', 0, () => {
      expect(AnimationSpecValidator.isDurationValid(MIN_DURATION)).assertTrue();
      expect(AnimationSpecValidator.isDurationValid(MAX_DURATION)).assertTrue();
      expect(AnimationSpecValidator.isDurationValid(0)).assertFalse();
      expect(AnimationSpecValidator.isDurationValid(MAX_DURATION + 1)).assertFalse();
    });

    it('validator_should_bound_iterations', 0, () => {
      expect(AnimationSpecValidator.isIterationsValid(1)).assertTrue();
      expect(AnimationSpecValidator.isIterationsValid(MAX_ITERATIONS)).assertTrue();
      expect(AnimationSpecValidator.isIterationsValid(0)).assertFalse();
      expect(AnimationSpecValidator.isIterationsValid(MAX_ITERATIONS + 1)).assertFalse();
      expect(AnimationSpecValidator.isIterationsValid(1.5)).assertFalse();
    });

    it('validator_should_report_issues', 0, () => {
      const spec: AnimationSpec = {
        from: 0, to: 0, durationMs: 0, iterations: 0, curve: 'bounce'
      };
      const issues = AnimationSpecValidator.validate(spec);
      expect(issues.length).assertEqual(4);
      expect(issues.includes('duration')).assertTrue();
      expect(issues.includes('iterations')).assertTrue();
      expect(issues.includes('curve')).assertTrue();
      expect(issues.includes('range')).assertTrue();
    });

    it('validator_should_interpolate_linear', 0, () => {
      const spec: AnimationSpec = {
        from: 0, to: 100, durationMs: 300, iterations: 1, curve: CURVE_LINEAR
      };
      expect(AnimationSpecValidator.valueAt(spec, 0)).assertEqual(0);
      expect(AnimationSpecValidator.valueAt(spec, 0.5)).assertEqual(50);
      expect(AnimationSpecValidator.valueAt(spec, 1)).assertEqual(100);
      expect(AnimationSpecValidator.valueAt(spec, -1)).assertEqual(0);
      expect(AnimationSpecValidator.valueAt(spec, 2)).assertEqual(100);
    });

    it('validator_should_apply_easing', 0, () => {
      const easeIn: AnimationSpec = {
        from: 0, to: 100, durationMs: 300, iterations: 1, curve: 'easeIn'
      };
      const easeOut: AnimationSpec = {
        from: 0, to: 100, durationMs: 300, iterations: 1, curve: 'easeOut'
      };
      expect(AnimationSpecValidator.valueAt(easeIn, 0.5)).assertEqual(25);
      expect(AnimationSpecValidator.valueAt(easeOut, 0.5)).assertEqual(75);
      expect(AnimationSpecValidator.valueAt(easeIn, 1)).assertEqual(100);
      expect(AnimationSpecValidator.valueAt(easeOut, 0)).assertEqual(0);
    });

    it('controller_should_play_to_finish', 0, () => {
      const controller = new AnimationController({
        from: 0, to: 100, durationMs: 100, iterations: 1, curve: CURVE_LINEAR
      });
      expect(controller.getState()).assertEqual(STATE_IDLE);
      expect(controller.play()).assertTrue();
      expect(controller.getState()).assertEqual(STATE_RUNNING);
      expect(controller.tick(50)).assertEqual(0.5);
      expect(controller.getValue()).assertEqual(50);
      expect(controller.tick(50)).assertEqual(1);
      expect(controller.isFinished()).assertTrue();
      expect(controller.getValue()).assertEqual(100);
    });

    it('controller_should_pause_and_resume', 0, () => {
      const controller = new AnimationController({
        from: 0, to: 10, durationMs: 100, iterations: 1, curve: CURVE_LINEAR
      });
      controller.play();
      controller.tick(20);
      expect(controller.pause()).assertTrue();
      expect(controller.getState()).assertEqual(STATE_PAUSED);
      expect(controller.tick(20)).assertEqual(0.2);
      expect(controller.resume()).assertTrue();
      expect(controller.getState()).assertEqual(STATE_RUNNING);
      expect(controller.pause()).assertTrue();
      expect(controller.pause()).assertFalse();
      expect(controller.resume()).assertTrue();
      expect(controller.resume()).assertFalse();
    });

    it('controller_should_stop_and_reset', 0, () => {
      const controller = new AnimationController({
        from: 0, to: 10, durationMs: 100, iterations: 1, curve: CURVE_LINEAR
      });
      expect(controller.stop()).assertFalse();
      controller.play();
      controller.tick(30);
      expect(controller.stop()).assertTrue();
      expect(controller.getState()).assertEqual(STATE_IDLE);
      expect(controller.getProgress()).assertEqual(0);
      controller.play();
      controller.tick(100);
      expect(controller.isFinished()).assertTrue();
      controller.reset();
      expect(controller.getState()).assertEqual(STATE_IDLE);
      expect(controller.getProgress()).assertEqual(0);
      expect(controller.getFrameCount()).assertEqual(0);
    });

    it('controller_should_reject_invalid_spec', 0, () => {
      const controller = new AnimationController({
        from: 0, to: 0, durationMs: 0, iterations: 0, curve: 'bounce'
      });
      expect(controller.play()).assertFalse();
      expect(controller.getState()).assertEqual(STATE_IDLE);
      expect(controller.tick(10)).assertEqual(0);
    });

    it('controller_should_ignore_ticks_when_not_running', 0, () => {
      const controller = new AnimationController({
        from: 0, to: 10, durationMs: 100, iterations: 1, curve: CURVE_LINEAR
      });
      expect(controller.tick(10)).assertEqual(0);
      controller.play();
      expect(controller.tick(0)).assertEqual(0);
      expect(controller.tick(-5)).assertEqual(0);
      expect(controller.getFrameCount()).assertEqual(0);
      controller.pause();
      expect(controller.tick(10)).assertEqual(0);
    });

    it('scheduler_should_count_frames', 0, () => {
      const scheduler = new FrameScheduler(16);
      expect(scheduler.framesFor(100)).assertEqual(7);
      expect(scheduler.framesFor(0)).assertEqual(0);
      expect(scheduler.schedule(0)).assertTrue();
      scheduler.skip();
      scheduler.schedule(16);
      expect(scheduler.getScheduled()).assertEqual(2);
      expect(scheduler.getSkipped()).assertEqual(1);
      scheduler.reset();
      expect(scheduler.getScheduled()).assertEqual(0);
      const invalid = new FrameScheduler(0);
      expect(invalid.framesFor(100)).assertEqual(0);
      expect(invalid.schedule(0)).assertFalse();
    });

    it('callback_log_should_track_lifecycle', 0, () => {
      const log = new AnimationCallbackLog(3);
      expect(log.record('start')).assertTrue();
      log.record('finish');
      log.record('start');
      expect(log.count()).assertEqual(3);
      expect(log.countOf('start')).assertEqual(2);
      expect(log.latest()).assertEqual('start');
      log.record('cancel');
      expect(log.count()).assertEqual(3);
      expect(log.countOf('finish')).assertEqual(1);
      expect(log.record('')).assertFalse();
      log.clear();
      expect(log.count()).assertEqual(0);
    });

    it('animation_flow_should_notify_start_and_finish', 0, () => {
      const controller = new AnimationController({
        from: 0, to: 1, durationMs: 50, iterations: 1, curve: CURVE_LINEAR
      });
      const log = new AnimationCallbackLog(10);
      if (controller.play()) {
        log.record('start');
      }
      controller.tick(25);
      controller.tick(25);
      if (controller.isFinished()) {
        log.record('finish');
      }
      expect(log.countOf('start')).assertEqual(1);
      expect(log.countOf('finish')).assertEqual(1);
      expect(controller.getValue()).assertEqual(1);
      expect(controller.getFrameCount()).assertEqual(2);
    });

    it('animation_constants_should_be_stable', 0, () => {
      expect(DEFAULT_DURATION).assertEqual(300);
      expect(MAX_DURATION).assertEqual(5000);
      expect(MIN_DURATION).assertEqual(1);
      expect(DEFAULT_ITERATIONS).assertEqual(1);
      expect(MAX_ITERATIONS).assertEqual(10);
      expect(STATE_FINISHED).assertEqual('finished');
    });
  });
}

