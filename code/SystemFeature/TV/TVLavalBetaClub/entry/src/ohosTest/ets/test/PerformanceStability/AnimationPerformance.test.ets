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

const TARGET_FPS: number = 60;

const FRAME_BUDGET_MS: number = 1000 / TARGET_FPS;

const JANK_THRESHOLD_MS: number = 32;

const MAX_ANIMATION_MS: number = 5000;

const CURVE_LINEAR: string = 'linear';

const CURVE_EASE_IN: string = 'easeIn';

const CURVE_EASE_OUT: string = 'easeOut';

const CURVE_EASE_IN_OUT: string = 'easeInOut';

interface AnimationSpec {
  durationMs: number;
  delayMs: number;
  iterations: number;
  curve: string;
}

interface FrameSample {
  index: number;
  intervalMs: number;
}

// Samples normalized easing curves
class EasingCurve {
  public static sample(curve: string, progress: number): number {
    const t = progress < 0 ? 0 : (progress > 1 ? 1 : progress);
    if (curve === CURVE_EASE_IN) {
      return t * t;
    }
    if (curve === CURVE_EASE_OUT) {
      return 1 - (1 - t) * (1 - t);
    }
    if (curve === CURVE_EASE_IN_OUT) {
      return t < 0.5 ? 2 * t * t : 1 - 2 * (1 - t) * (1 - t);
    }
    return t;
  }

  public static isKnown(curve: string): boolean {
    return curve === CURVE_LINEAR || curve === CURVE_EASE_IN ||
      curve === CURVE_EASE_OUT || curve === CURVE_EASE_IN_OUT;
  }

  public static isMonotonic(curve: string): boolean {
    let previous = 0;
    for (let i = 0; i <= 10; i++) {
      const value = EasingCurve.sample(curve, i / 10);
      if (value < previous) {
        return false;
      }
      previous = value;
    }
    return true;
  }
}

// Validates animation specs before they are applied
class AnimationValidator {
  public static isDurationValid(durationMs: number): boolean {
    return durationMs > 0 && durationMs <= MAX_ANIMATION_MS;
  }

  public static isDelayValid(delayMs: number): boolean {
    return delayMs >= 0 && delayMs <= MAX_ANIMATION_MS;
  }

  public static isSpecValid(spec: AnimationSpec): boolean {
    return AnimationValidator.isDurationValid(spec.durationMs) &&
      AnimationValidator.isDelayValid(spec.delayMs) &&
      spec.iterations >= 1 && EasingCurve.isKnown(spec.curve);
  }

  public static totalDuration(spec: AnimationSpec): number {
    return spec.delayMs + spec.durationMs * spec.iterations;
  }

  public static frameCount(spec: AnimationSpec, fps: number): number {
    if (fps <= 0) {
      return 0;
    }
    return Math.round(spec.durationMs * fps / 1000);
  }
}

// Compares frame intervals against the 60fps budget
class FrameBudgetAnalyzer {
  private samples: FrameSample[] = [];

  public add(index: number, intervalMs: number): void {
    this.samples.push({ index: index, intervalMs: intervalMs });
  }

  public count(): number {
    return this.samples.length;
  }

  public droppedFrames(): number {
    let dropped: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].intervalMs > FRAME_BUDGET_MS * 1.5) {
        dropped++;
      }
    }
    return dropped;
  }

  public jankFrames(): number {
    let janky: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].intervalMs > JANK_THRESHOLD_MS) {
        janky++;
      }
    }
    return janky;
  }

  public longestFrame(): number {
    let longest: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].intervalMs > longest) {
        longest = this.samples[i].intervalMs;
      }
    }
    return longest;
  }

  public averageInterval(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      total += this.samples[i].intervalMs;
    }
    return total / this.samples.length;
  }

  public jankRatio(): number {
    return this.samples.length === 0 ? 0 : this.jankFrames() * 100 / this.samples.length;
  }

  public isSmooth(maxJankRatio: number): boolean {
    return this.jankRatio() <= maxJankRatio;
  }

  public reset(): void {
    this.samples = [];
  }
}

// Computes keyframe positions for a duration and frame rate
class AnimationTimeline {
  public static totalFrames(durationMs: number, fps: number): number {
    if (durationMs <= 0 || fps <= 0) {
      return 0;
    }
    return Math.round(durationMs * fps / 1000);
  }

  public static progressAt(elapsedMs: number, durationMs: number): number {
    if (durationMs <= 0) {
      return 0;
    }
    if (elapsedMs <= 0) {
      return 0;
    }
    if (elapsedMs >= durationMs) {
      return 1;
    }
    return elapsedMs / durationMs;
  }

  public static frameTime(frameIndex: number, fps: number): number {
    if (fps <= 0 || frameIndex < 0) {
      return 0;
    }
    return Math.round(frameIndex * 1000 / fps);
  }

  public static keyframes(durationMs: number, count: number): number[] {
    const frames: number[] = [];
    if (count <= 0) {
      return frames;
    }
    for (let i = 0; i <= count; i++) {
      frames.push(Math.round(durationMs * i / count));
    }
    return frames;
  }
}

// Records animation runs and summarizes their smoothness
class AnimationSession {
  private runs: number = 0;
  private jankyRuns: number = 0;
  private totalDropped: number = 0;

  public record(droppedFrames: number, smooth: boolean): void {
    this.runs++;
    this.totalDropped += droppedFrames;
    if (!smooth) {
      this.jankyRuns++;
    }
  }

  public getRuns(): number {
    return this.runs;
  }

  public getJankyRuns(): number {
    return this.jankyRuns;
  }

  public getTotalDropped(): number {
    return this.totalDropped;
  }

  public getSmoothRate(): number {
    if (this.runs === 0) {
      return 0;
    }
    return (this.runs - this.jankyRuns) * 100 / this.runs;
  }

  public isStable(minSmoothRate: number): boolean {
    return this.getSmoothRate() >= minSmoothRate;
  }

  public reset(): void {
    this.runs = 0;
    this.jankyRuns = 0;
    this.totalDropped = 0;
  }
}

export default function animationPerformanceTest() {
  describe('AnimationPerformance_Test', () => {

    it('easing_linear_should_be_identity', 0, () => {
      expect(EasingCurve.sample(CURVE_LINEAR, 0)).assertEqual(0);
      expect(EasingCurve.sample(CURVE_LINEAR, 0.5)).assertEqual(0.5);
      expect(EasingCurve.sample(CURVE_LINEAR, 1)).assertEqual(1);
      expect(EasingCurve.sample(CURVE_LINEAR, -1)).assertEqual(0);
      expect(EasingCurve.sample(CURVE_LINEAR, 2)).assertEqual(1);
    });

    it('easing_curves_should_start_and_end_correctly', 0, () => {
      const curves: string[] = [CURVE_EASE_IN, CURVE_EASE_OUT, CURVE_EASE_IN_OUT];
      for (let i = 0; i < curves.length; i++) {
        expect(EasingCurve.sample(curves[i], 0)).assertEqual(0);
        expect(EasingCurve.sample(curves[i], 1)).assertEqual(1);
        expect(EasingCurve.isKnown(curves[i])).assertTrue();
        expect(EasingCurve.isMonotonic(curves[i])).assertTrue();
      }
      expect(EasingCurve.isKnown('bounce')).assertFalse();
    });

    it('easing_ease_in_and_out_should_differ', 0, () => {
      expect(EasingCurve.sample(CURVE_EASE_IN, 0.5)).assertEqual(0.25);
      expect(EasingCurve.sample(CURVE_EASE_OUT, 0.5)).assertEqual(0.75);
      expect(EasingCurve.sample(CURVE_EASE_IN_OUT, 0.5)).assertEqual(0.5);
      expect(EasingCurve.sample(CURVE_EASE_IN, 0.5))
        .assertLess(EasingCurve.sample(CURVE_EASE_OUT, 0.5));
    });

    it('validator_should_check_spec_fields', 0, () => {
      expect(AnimationValidator.isDurationValid(300)).assertTrue();
      expect(AnimationValidator.isDurationValid(0)).assertFalse();
      expect(AnimationValidator.isDurationValid(-1)).assertFalse();
      expect(AnimationValidator.isDurationValid(MAX_ANIMATION_MS + 1)).assertFalse();
      expect(AnimationValidator.isDelayValid(0)).assertTrue();
      expect(AnimationValidator.isDelayValid(-1)).assertFalse();
      expect(AnimationValidator.isDelayValid(MAX_ANIMATION_MS + 1)).assertFalse();
    });

    it('validator_should_accept_valid_spec', 0, () => {
      const spec: AnimationSpec = { durationMs: 300, delayMs: 0, iterations: 1, curve: CURVE_LINEAR };
      expect(AnimationValidator.isSpecValid(spec)).assertTrue();
      spec.iterations = 0;
      expect(AnimationValidator.isSpecValid(spec)).assertFalse();
      spec.iterations = 2;
      spec.curve = 'bounce';
      expect(AnimationValidator.isSpecValid(spec)).assertFalse();
      spec.curve = CURVE_EASE_IN_OUT;
      expect(AnimationValidator.isSpecValid(spec)).assertTrue();
    });

    it('validator_should_compute_total_duration', 0, () => {
      const spec: AnimationSpec = {
        durationMs: 200, delayMs: 100, iterations: 3, curve: CURVE_EASE_OUT
      };
      expect(AnimationValidator.totalDuration(spec)).assertEqual(700);
      expect(AnimationValidator.frameCount(spec, TARGET_FPS)).assertEqual(12);
      expect(AnimationValidator.frameCount(spec, 0)).assertEqual(0);
    });

    it('budget_analyzer_should_count_dropped_frames', 0, () => {
      const analyzer = new FrameBudgetAnalyzer();
      analyzer.add(0, 16);
      analyzer.add(1, 17);
      analyzer.add(2, 40);
      analyzer.add(3, 100);
      expect(analyzer.count()).assertEqual(4);
      expect(analyzer.longestFrame()).assertEqual(100);
      expect(analyzer.droppedFrames()).assertEqual(2);
      expect(analyzer.jankFrames()).assertEqual(2);
      expect(analyzer.averageInterval()).assertEqual(43.25);
      expect(analyzer.jankRatio()).assertEqual(50);
    });

    it('budget_analyzer_should_detect_smooth_run', 0, () => {
      const analyzer = new FrameBudgetAnalyzer();
      for (let i = 0; i < 10; i++) {
        analyzer.add(i, 16);
      }
      expect(analyzer.jankFrames()).assertEqual(0);
      expect(analyzer.jankRatio()).assertEqual(0);
      expect(analyzer.isSmooth(5)).assertTrue();
      expect(analyzer.isSmooth(0)).assertTrue();
      analyzer.reset();
      expect(analyzer.count()).assertEqual(0);
      expect(analyzer.averageInterval()).assertEqual(0);
    });

    it('budget_analyzer_should_flag_janky_run', 0, () => {
      const analyzer = new FrameBudgetAnalyzer();
      analyzer.add(0, 16);
      analyzer.add(1, 16);
      analyzer.add(2, 50);
      analyzer.add(3, 16);
      expect(analyzer.jankRatio()).assertEqual(25);
      expect(analyzer.isSmooth(10)).assertFalse();
      expect(analyzer.isSmooth(30)).assertTrue();
    });

    it('timeline_should_compute_frames_and_progress', 0, () => {
      expect(AnimationTimeline.totalFrames(1000, TARGET_FPS)).assertEqual(60);
      expect(AnimationTimeline.totalFrames(0, TARGET_FPS)).assertEqual(0);
      expect(AnimationTimeline.totalFrames(1000, 0)).assertEqual(0);
      expect(AnimationTimeline.progressAt(500, 1000)).assertEqual(0.5);
      expect(AnimationTimeline.progressAt(-1, 1000)).assertEqual(0);
      expect(AnimationTimeline.progressAt(2000, 1000)).assertEqual(1);
      expect(AnimationTimeline.progressAt(100, 0)).assertEqual(0);
    });

    it('timeline_should_build_keyframes', 0, () => {
      expect(AnimationTimeline.keyframes(1000, 4)).assertDeepEquals([0, 250, 500, 750, 1000]);
      expect(AnimationTimeline.keyframes(1000, 0).length).assertEqual(0);
      expect(AnimationTimeline.keyframes(0, 4).length).assertEqual(5);
      expect(AnimationTimeline.frameTime(0, TARGET_FPS)).assertEqual(0);
      expect(AnimationTimeline.frameTime(30, TARGET_FPS)).assertEqual(500);
      expect(AnimationTimeline.frameTime(-1, TARGET_FPS)).assertEqual(0);
    });

    it('session_should_aggregate_runs', 0, () => {
      const session = new AnimationSession();
      session.record(0, true);
      session.record(2, false);
      session.record(0, true);
      expect(session.getRuns()).assertEqual(3);
      expect(session.getJankyRuns()).assertEqual(1);
      expect(session.getTotalDropped()).assertEqual(2);
      expect(session.getSmoothRate()).assertLarger(66);
      expect(session.isStable(60)).assertTrue();
      session.reset();
      expect(session.getRuns()).assertEqual(0);
      expect(session.getSmoothRate()).assertEqual(0);
    });

    it('animation_flow_should_stay_within_budget', 0, () => {
      const spec: AnimationSpec = { durationMs: 500, delayMs: 0, iterations: 1, curve: CURVE_EASE_IN_OUT };
      const analyzer = new FrameBudgetAnalyzer();
      const session = new AnimationSession();
      const frames = AnimationValidator.frameCount(spec, TARGET_FPS);
      expect(frames).assertEqual(30);
      for (let i = 0; i < frames; i++) {
        analyzer.add(i, 16);
      }
      const progress = AnimationTimeline.progressAt(spec.durationMs, spec.durationMs);
      expect(progress).assertEqual(1);
      expect(EasingCurve.sample(spec.curve, progress)).assertEqual(1);
      session.record(analyzer.droppedFrames(), analyzer.isSmooth(5));
      expect(session.getSmoothRate()).assertEqual(100);
      expect(analyzer.longestFrame()).assertLess(JANK_THRESHOLD_MS);
    });

    it('animation_constants_should_be_stable', 0, () => {
      expect(TARGET_FPS).assertEqual(60);
      expect(Math.round(FRAME_BUDGET_MS * 100) / 100).assertEqual(16.67);
      expect(JANK_THRESHOLD_MS).assertEqual(32);
      expect(MAX_ANIMATION_MS).assertEqual(5000);
      expect(CURVE_LINEAR).assertEqual('linear');
    });
  });
}

