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

const MAX_BLUR: number = 40;

const MAX_SHADOW_RADIUS: number = 24;

const MIN_OPACITY: number = 0;

const MAX_OPACITY: number = 1;

const MIN_SCALE: number = 0.8;

const MAX_SCALE: number = 1.2;

const PULSE_DURATION_MS: number = 600;

interface EffectSpec {
  opacity: number;
  blur: number;
  shadowRadius: number;
  scale: number;
}

// Validates visual effect parameters
class EffectValidator {
  public static isOpacityValid(opacity: number): boolean {
    return opacity >= MIN_OPACITY && opacity <= MAX_OPACITY;
  }

  public static isBlurValid(blur: number): boolean {
    return blur >= 0 && blur <= MAX_BLUR;
  }

  public static isShadowValid(radius: number): boolean {
    return radius >= 0 && radius <= MAX_SHADOW_RADIUS;
  }

  public static isScaleValid(scale: number): boolean {
    return scale >= MIN_SCALE && scale <= MAX_SCALE;
  }

  public static validate(spec: EffectSpec): string[] {
    const issues: string[] = [];
    if (!EffectValidator.isOpacityValid(spec.opacity)) {
      issues.push('opacity');
    }
    if (!EffectValidator.isBlurValid(spec.blur)) {
      issues.push('blur');
    }
    if (!EffectValidator.isShadowValid(spec.shadowRadius)) {
      issues.push('shadow');
    }
    if (!EffectValidator.isScaleValid(spec.scale)) {
      issues.push('scale');
    }
    return issues;
  }

  public static isValid(spec: EffectSpec): boolean {
    return EffectValidator.validate(spec).length === 0;
  }
}

// Applies effects and computes animated intermediate values
class EffectAnimator {
  private current: EffectSpec;
  private start: EffectSpec;
  private target: EffectSpec;
  private progress: number = 1;

  constructor(initial: EffectSpec) {
    this.current = EffectAnimator.copy(initial);
    this.start = EffectAnimator.copy(initial);
    this.target = EffectAnimator.copy(initial);
  }

  public setTarget(spec: EffectSpec): boolean {
    if (!EffectValidator.isValid(spec)) {
      return false;
    }
    this.start = EffectAnimator.copy(this.current);
    this.target = EffectAnimator.copy(spec);
    this.progress = 0;
    return true;
  }

  public step(delta: number): EffectSpec {
    this.progress += delta;
    if (this.progress > 1) {
      this.progress = 1;
    }
    if (this.progress < 0) {
      this.progress = 0;
    }
    this.current = {
      opacity: EffectAnimator.lerp(this.start.opacity, this.target.opacity, this.progress),
      blur: EffectAnimator.lerp(this.start.blur, this.target.blur, this.progress),
      shadowRadius: EffectAnimator.lerp(this.start.shadowRadius, this.target.shadowRadius, this.progress),
      scale: EffectAnimator.lerp(this.start.scale, this.target.scale, this.progress)
    };
    return EffectAnimator.copy(this.current);
  }

  public currentSpec(): EffectSpec {
    return EffectAnimator.copy(this.current);
  }

  public getProgress(): number {
    return this.progress;
  }

  public isSettled(): boolean {
    return this.progress >= 1;
  }

  public static lerp(from: number, to: number, t: number): number {
    const clamped = t < 0 ? 0 : (t > 1 ? 1 : t);
    return from + (to - from) * clamped;
  }

  public static copy(spec: EffectSpec): EffectSpec {
    return {
      opacity: spec.opacity,
      blur: spec.blur,
      shadowRadius: spec.shadowRadius,
      scale: spec.scale
    };
  }
}

// Computes pulse frames for attention effects
class PulseGenerator {
  public static frames(count: number, minOpacity: number, maxOpacity: number): number[] {
    const frames: number[] = [];
    if (count <= 0) {
      return frames;
    }
    for (let i = 0; i <= count; i++) {
      const phase = Math.sin(i * Math.PI / count);
      frames.push(minOpacity + (maxOpacity - minOpacity) * phase);
    }
    return frames;
  }

  public static amplitude(frames: number[]): number {
    if (frames.length === 0) {
      return 0;
    }
    let min: number = frames[0];
    let max: number = frames[0];
    for (let i = 1; i < frames.length; i++) {
      if (frames[i] < min) {
        min = frames[i];
      }
      if (frames[i] > max) {
        max = frames[i];
      }
    }
    return max - min;
  }

  public static isMonotonicUp(frames: number[]): boolean {
    for (let i = 1; i < frames.length; i++) {
      if (frames[i] < frames[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public static durationFor(count: number): number {
    return count <= 0 ? 0 : PULSE_DURATION_MS;
  }
}

// Collects effect violations for reporting
class EffectReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function visualEffectsTest() {
  describe('VisualEffects_Test', () => {

    it('validator_should_accept_valid_spec', 0, () => {
      const spec: EffectSpec = { opacity: 0.8, blur: 10, shadowRadius: 8, scale: 1.05 };
      expect(EffectValidator.isValid(spec)).assertTrue();
      expect(EffectValidator.validate(spec).length).assertEqual(0);
    });

    it('validator_should_bound_opacity', 0, () => {
      expect(EffectValidator.isOpacityValid(0)).assertTrue();
      expect(EffectValidator.isOpacityValid(1)).assertTrue();
      expect(EffectValidator.isOpacityValid(-0.1)).assertFalse();
      expect(EffectValidator.isOpacityValid(1.1)).assertFalse();
    });

    it('validator_should_bound_blur_and_shadow', 0, () => {
      expect(EffectValidator.isBlurValid(0)).assertTrue();
      expect(EffectValidator.isBlurValid(MAX_BLUR)).assertTrue();
      expect(EffectValidator.isBlurValid(MAX_BLUR + 1)).assertFalse();
      expect(EffectValidator.isShadowValid(MAX_SHADOW_RADIUS)).assertTrue();
      expect(EffectValidator.isShadowValid(MAX_SHADOW_RADIUS + 1)).assertFalse();
      expect(EffectValidator.isShadowValid(-1)).assertFalse();
    });

    it('validator_should_bound_scale', 0, () => {
      expect(EffectValidator.isScaleValid(MIN_SCALE)).assertTrue();
      expect(EffectValidator.isScaleValid(1)).assertTrue();
      expect(EffectValidator.isScaleValid(MAX_SCALE)).assertTrue();
      expect(EffectValidator.isScaleValid(0.5)).assertFalse();
      expect(EffectValidator.isScaleValid(1.5)).assertFalse();
    });

    it('validator_should_report_all_issues', 0, () => {
      const spec: EffectSpec = { opacity: 2, blur: -1, shadowRadius: 99, scale: 3 };
      const issues = EffectValidator.validate(spec);
      expect(issues.length).assertEqual(4);
      expect(issues.includes('opacity')).assertTrue();
      expect(issues.includes('blur')).assertTrue();
      expect(issues.includes('shadow')).assertTrue();
      expect(issues.includes('scale')).assertTrue();
    });

    it('animator_should_lerp_to_target', 0, () => {
      const animator = new EffectAnimator({ opacity: 0, blur: 0, shadowRadius: 0, scale: 1 });
      expect(animator.getProgress()).assertEqual(1);
      expect(animator.setTarget({ opacity: 1, blur: 20, shadowRadius: 10, scale: 1.1 })).assertTrue();
      expect(animator.getProgress()).assertEqual(0);
      const half = animator.step(0.5);
      expect(half.opacity).assertEqual(0.5);
      expect(half.blur).assertEqual(10);
      expect(animator.isSettled()).assertFalse();
      const done = animator.step(0.5);
      expect(done.opacity).assertEqual(1);
      expect(done.blur).assertEqual(20);
      expect(animator.isSettled()).assertTrue();
    });

    it('animator_should_reject_invalid_target', 0, () => {
      const animator = new EffectAnimator({ opacity: 1, blur: 0, shadowRadius: 0, scale: 1 });
      expect(animator.setTarget({ opacity: 2, blur: 0, shadowRadius: 0, scale: 1 })).assertFalse();
      expect(animator.getProgress()).assertEqual(1);
      expect(animator.currentSpec().opacity).assertEqual(1);
    });

    it('animator_should_clamp_progress', 0, () => {
      const animator = new EffectAnimator({ opacity: 0, blur: 0, shadowRadius: 0, scale: 1 });
      animator.setTarget({ opacity: 1, blur: 0, shadowRadius: 0, scale: 1 });
      const overshoot = animator.step(2);
      expect(overshoot.opacity).assertEqual(1);
      expect(animator.getProgress()).assertEqual(1);
      expect(animator.isSettled()).assertTrue();
    });

    it('animator_should_copy_specs', 0, () => {
      const source: EffectSpec = { opacity: 1, blur: 5, shadowRadius: 5, scale: 1 };
      const copy = EffectAnimator.copy(source);
      copy.blur = 20;
      expect(source.blur).assertEqual(5);
      expect(copy.blur).assertEqual(20);
      expect(EffectAnimator.lerp(0, 10, 0.25)).assertEqual(2.5);
      expect(EffectAnimator.lerp(0, 10, -1)).assertEqual(0);
      expect(EffectAnimator.lerp(0, 10, 2)).assertEqual(10);
    });

    it('pulse_should_generate_frames', 0, () => {
      const frames = PulseGenerator.frames(4, 0.2, 1);
      expect(frames.length).assertEqual(5);
      expect(frames[0]).assertEqual(0.2);
      expect(frames[4]).assertClose(0.2, 0.0001);
      expect(frames[2]).assertEqual(1);
      expect(PulseGenerator.amplitude(frames)).assertClose(0.8, 0.0001);
      expect(PulseGenerator.durationFor(4)).assertEqual(PULSE_DURATION_MS);
    });

    it('pulse_should_handle_invalid_input', 0, () => {
      expect(PulseGenerator.frames(0, 0, 1).length).assertEqual(0);
      expect(PulseGenerator.frames(-1, 0, 1).length).assertEqual(0);
      expect(PulseGenerator.amplitude([])).assertEqual(0);
      expect(PulseGenerator.durationFor(0)).assertEqual(0);
      expect(PulseGenerator.isMonotonicUp([0, 1, 2])).assertTrue();
      expect(PulseGenerator.isMonotonicUp([0, 2, 1])).assertFalse();
    });

    it('report_should_aggregate_effect_checks', 0, () => {
      const report = new EffectReport();
      const spec: EffectSpec = { opacity: 0.9, blur: 8, shadowRadius: 4, scale: 1 };
      report.check('opacity', EffectValidator.isOpacityValid(spec.opacity));
      report.check('blur', EffectValidator.isBlurValid(spec.blur));
      report.check('scale', EffectValidator.isScaleValid(spec.scale));
      expect(report.count()).assertEqual(3);
      expect(report.isPassed()).assertTrue();
      report.check('shadow', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['shadow']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('effect_flow_should_animate_fade_in', 0, () => {
      const animator = new EffectAnimator({ opacity: 0, blur: 20, shadowRadius: 12, scale: 0.9 });
      const report = new EffectReport();
      report.check('initial', EffectValidator.isValid(animator.currentSpec()));
      const target: EffectSpec = { opacity: 1, blur: 0, shadowRadius: 0, scale: 1 };
      expect(animator.setTarget(target)).assertTrue();
      for (let i = 0; i < 4; i++) {
        animator.step(0.25);
      }
      const finalSpec = animator.currentSpec();
      report.check('final', EffectValidator.isValid(finalSpec));
      expect(finalSpec.opacity).assertClose(1, 0.0001);
      expect(finalSpec.blur).assertClose(0, 0.0001);
      expect(animator.isSettled()).assertTrue();
      expect(report.isPassed()).assertTrue();
    });

    it('visual_effect_constants_should_be_stable', 0, () => {
      expect(MAX_BLUR).assertEqual(40);
      expect(MAX_SHADOW_RADIUS).assertEqual(24);
      expect(MIN_OPACITY).assertEqual(0);
      expect(MAX_OPACITY).assertEqual(1);
      expect(MIN_SCALE).assertEqual(0.8);
      expect(MAX_SCALE).assertEqual(1.2);
      expect(PULSE_DURATION_MS).assertEqual(600);
    });
  });
}

