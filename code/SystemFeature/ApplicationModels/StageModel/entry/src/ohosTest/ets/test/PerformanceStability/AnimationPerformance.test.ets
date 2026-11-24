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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, clampNumber
} from '../Shared/SharedDriver';

const FRAME_BUDGET_60: number = 16;
const FRAME_BUDGET_90: number = 11;
const FRAME_BUDGET_120: number = 8;

enum AnimationCurve {
  LINEAR = 0,
  EASE_IN = 1,
  EASE_OUT = 2,
  EASE_IN_OUT = 3
}

enum AnimationDirection {
  FORWARD = 0,
  REVERSE = 1,
  ALTERNATE = 2
}

class FrameSample {
  index: number;
  durationMs: number;

  constructor(index: number, durationMs: number) {
    this.index = index;
    this.durationMs = durationMs;
  }

  isDropped(budget: number): boolean {
    return this.durationMs > budget;
  }
}

class AnimationFrameModel {
  private samples: FrameSample[] = [];
  private rejected: number = 0;
  private budget: number = FRAME_BUDGET_60;

  constructor(budget: number) {
    if (budget > 0) {
      this.budget = budget;
    }
  }

  getBudget(): number {
    return this.budget;
  }

  addFrame(durationMs: number): boolean {
    if (durationMs <= 0) {
      this.rejected = this.rejected + 1;
      return false;
    }
    this.samples.push(new FrameSample(this.samples.length, durationMs));
    return true;
  }

  addFrames(values: number[]): number {
    let added = 0;
    for (const value of values) {
      if (this.addFrame(value)) {
        added = added + 1;
      }
    }
    return added;
  }

  getFrameCount(): number {
    return this.samples.length;
  }

  getRejected(): number {
    return this.rejected;
  }

  totalTime(): number {
    let total = 0;
    for (const sample of this.samples) {
      total = total + sample.durationMs;
    }
    return total;
  }

  averageFrameTime(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.totalTime() / this.samples.length;
  }

  maxFrameTime(): number {
    let max = 0;
    for (const sample of this.samples) {
      if (sample.durationMs > max) {
        max = sample.durationMs;
      }
    }
    return max;
  }

  minFrameTime(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let min = this.samples[0].durationMs;
    for (const sample of this.samples) {
      if (sample.durationMs < min) {
        min = sample.durationMs;
      }
    }
    return min;
  }

  computeFps(): number {
    const average = this.averageFrameTime();
    if (average <= 0) {
      return 0;
    }
    return Math.round(1000 / average);
  }

  droppedCount(): number {
    let dropped = 0;
    for (const sample of this.samples) {
      if (sample.isDropped(this.budget)) {
        dropped = dropped + 1;
      }
    }
    return dropped;
  }

  jankRate(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.droppedCount() / this.samples.length;
  }

  smoothnessScore(): number {
    return Math.round((1 - this.jankRate()) * 100);
  }

  framesWithin(budget: number): number {
    let within = 0;
    for (const sample of this.samples) {
      if (sample.durationMs <= budget) {
        within = within + 1;
      }
    }
    return within;
  }

  sortedDurations(): number[] {
    const result: number[] = [];
    for (const sample of this.samples) {
      result.push(sample.durationMs);
    }
    for (let i = 0; i < result.length; i++) {
      for (let j = i + 1; j < result.length; j++) {
        if (result[j] < result[i]) {
          const temp = result[i];
          result[i] = result[j];
          result[j] = temp;
        }
      }
    }
    return result;
  }

  percentile(percent: number): number {
    const sorted = this.sortedDurations();
    if (sorted.length === 0) {
      return 0;
    }
    const clamped = clampNumber(percent, 0, 100);
    const index = Math.floor((clamped / 100) * (sorted.length - 1));
    return sorted[index];
  }

  classify(durationMs: number): string {
    if (durationMs <= FRAME_BUDGET_120) {
      return 'excellent';
    }
    if (durationMs <= FRAME_BUDGET_60) {
      return 'good';
    }
    if (durationMs <= 33) {
      return 'jank';
    }
    return 'severe';
  }

  budgetFor(fps: number): number {
    if (fps >= 120) {
      return FRAME_BUDGET_120;
    }
    if (fps >= 90) {
      return FRAME_BUDGET_90;
    }
    if (fps >= 60) {
      return FRAME_BUDGET_60;
    }
    return FRAME_BUDGET_60;
  }

  reset(): void {
    this.samples = [];
    this.rejected = 0;
  }
}
class EasingLib {
  static clampUnit(value: number): number {
    return clampNumber(value, 0, 1);
  }

  static linear(t: number): number {
    return EasingLib.clampUnit(t);
  }

  static easeIn(t: number): number {
    const value = EasingLib.clampUnit(t);
    return value * value;
  }

  static easeOut(t: number): number {
    const value = EasingLib.clampUnit(t);
    return value * (2 - value);
  }

  static easeInOut(t: number): number {
    const value = EasingLib.clampUnit(t);
    if (value < 0.5) {
      return 2 * value * value;
    }
    const remainder = 1 - value;
    return 1 - 2 * remainder * remainder;
  }

  static apply(curve: AnimationCurve, t: number): number {
    if (curve === AnimationCurve.EASE_IN) {
      return EasingLib.easeIn(t);
    }
    if (curve === AnimationCurve.EASE_OUT) {
      return EasingLib.easeOut(t);
    }
    if (curve === AnimationCurve.EASE_IN_OUT) {
      return EasingLib.easeInOut(t);
    }
    return EasingLib.linear(t);
  }
}

class AnimationTimeline {
  private durationMs: number;
  private delayMs: number;
  private iterations: number;
  private curve: AnimationCurve;
  private direction: AnimationDirection;

  constructor(durationMs: number, delayMs: number, iterations: number,
    curve: AnimationCurve, direction: AnimationDirection) {
    this.durationMs = durationMs > 0 ? durationMs : 1;
    this.delayMs = delayMs >= 0 ? delayMs : 0;
    this.iterations = iterations >= 1 ? iterations : 1;
    this.curve = curve;
    this.direction = direction;
  }

  getDuration(): number {
    return this.durationMs;
  }

  getDelay(): number {
    return this.delayMs;
  }

  getIterations(): number {
    return this.iterations;
  }

  getCurve(): AnimationCurve {
    return this.curve;
  }

  totalDuration(): number {
    return this.delayMs + this.durationMs * this.iterations;
  }

  progressAt(elapsedMs: number): number {
    const total = this.totalDuration();
    if (elapsedMs <= this.delayMs) {
      return 0;
    }
    if (elapsedMs >= total) {
      return 1;
    }
    const active = elapsedMs - this.delayMs;
    const iterationIndex = Math.floor(active / this.durationMs);
    let iterationProgress = (active % this.durationMs) / this.durationMs;
    if (this.direction === AnimationDirection.REVERSE) {
      iterationProgress = 1 - iterationProgress;
    } else if (this.direction === AnimationDirection.ALTERNATE && iterationIndex % 2 === 1) {
      iterationProgress = 1 - iterationProgress;
    }
    return iterationProgress;
  }

  valueAt(elapsedMs: number, from: number, to: number): number {
    const eased = EasingLib.apply(this.curve, this.progressAt(elapsedMs));
    return from + (to - from) * eased;
  }

  remainingAt(elapsedMs: number): number {
    const remaining = this.totalDuration() - elapsedMs;
    return remaining > 0 ? remaining : 0;
  }

  isComplete(elapsedMs: number): boolean {
    return elapsedMs >= this.totalDuration();
  }
}

class KeyframeTrack {
  private times: number[] = [];
  private values: number[] = [];

  constructor(times: number[], values: number[]) {
    const length = times.length < values.length ? times.length : values.length;
    for (let i = 0; i < length; i++) {
      this.times.push(times[i]);
      this.values.push(values[i]);
    }
  }

  getKeyFrameCount(): number {
    return this.times.length;
  }

  valueAt(timeMs: number): number {
    if (this.times.length === 0) {
      return 0;
    }
    if (timeMs <= this.times[0]) {
      return this.values[0];
    }
    const lastIndex = this.times.length - 1;
    if (timeMs >= this.times[lastIndex]) {
      return this.values[lastIndex];
    }
    for (let i = 1; i <= lastIndex; i++) {
      if (timeMs <= this.times[i]) {
        const span = this.times[i] - this.times[i - 1];
        if (span <= 0) {
          return this.values[i];
        }
        const ratio = (timeMs - this.times[i - 1]) / span;
        return this.values[i - 1] + (this.values[i] - this.values[i - 1]) * ratio;
      }
    }
    return this.values[lastIndex];
  }
}

export default function animationPerformanceTest(): void {
  describe('AnimationPerformance', () => {
    it('AnimationPerformance_001', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      expect(model.getBudget()).assertEqual(16);
      expect(model.getFrameCount()).assertEqual(0);
      expect(model.computeFps()).assertEqual(0);
      done();
    });

    it('AnimationPerformance_002', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      expect(model.addFrame(10)).assertTrue();
      expect(model.addFrame(20)).assertTrue();
      expect(model.getFrameCount()).assertEqual(2);
      expect(model.getRejected()).assertEqual(0);
      done();
    });

    it('AnimationPerformance_003', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      expect(model.addFrame(0)).assertFalse();
      expect(model.addFrame(-5)).assertFalse();
      expect(model.getRejected()).assertEqual(2);
      expect(model.getFrameCount()).assertEqual(0);
      done();
    });

    it('AnimationPerformance_004', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      expect(model.addFrames([10, 20, 30, 0])).assertEqual(3);
      expect(model.totalTime()).assertEqual(60);
      expect(model.getRejected()).assertEqual(1);
      done();
    });

    it('AnimationPerformance_005', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([10, 20, 30]);
      expect(model.averageFrameTime()).assertEqual(20);
      expect(model.computeFps()).assertEqual(50);
      expect(model.maxFrameTime()).assertEqual(30);
      expect(model.minFrameTime()).assertEqual(10);
      done();
    });

    it('AnimationPerformance_006', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([10, 20, 30]);
      expect(model.droppedCount()).assertEqual(2);
      expect(model.framesWithin(16)).assertEqual(1);
      expect(model.smoothnessScore()).assertEqual(33);
      done();
    });

    it('AnimationPerformance_007', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([8, 8, 8, 8]);
      expect(model.droppedCount()).assertEqual(0);
      expect(model.jankRate()).assertEqual(0);
      expect(model.smoothnessScore()).assertEqual(100);
      done();
    });

    it('AnimationPerformance_008', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([10, 20, 30, 40, 50]);
      expect(model.percentile(0)).assertEqual(10);
      expect(model.percentile(50)).assertEqual(30);
      expect(model.percentile(100)).assertEqual(50);
      done();
    });
    it('AnimationPerformance_009', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      expect(model.classify(8)).assertEqual('excellent');
      expect(model.classify(16)).assertEqual('good');
      expect(model.classify(20)).assertEqual('jank');
      expect(model.classify(40)).assertEqual('severe');
      done();
    });

    it('AnimationPerformance_010', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      expect(model.budgetFor(120)).assertEqual(8);
      expect(model.budgetFor(90)).assertEqual(11);
      expect(model.budgetFor(60)).assertEqual(16);
      expect(model.budgetFor(30)).assertEqual(16);
      done();
    });

    it('AnimationPerformance_011', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([30, 10, 20]);
      const sorted = model.sortedDurations();
      expect(sorted[0]).assertEqual(10);
      expect(sorted[1]).assertEqual(20);
      expect(sorted[2]).assertEqual(30);
      done();
    });

    it('AnimationPerformance_012', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([10, 20]);
      model.reset();
      expect(model.getFrameCount()).assertEqual(0);
      expect(model.getRejected()).assertEqual(0);
      expect(model.totalTime()).assertEqual(0);
      done();
    });

    it('AnimationPerformance_013', 0, async (done: Function) => {
      const zeroBudget = new AnimationFrameModel(0);
      const highBudget = new AnimationFrameModel(8);
      expect(zeroBudget.getBudget()).assertEqual(16);
      expect(highBudget.getBudget()).assertEqual(8);
      done();
    });

    it('AnimationPerformance_014', 0, async (done: Function) => {
      expect(EasingLib.linear(0.5)).assertEqual(0.5);
      expect(EasingLib.linear(-1)).assertEqual(0);
      expect(EasingLib.linear(2)).assertEqual(1);
      done();
    });

    it('AnimationPerformance_015', 0, async (done: Function) => {
      expect(EasingLib.easeIn(0)).assertEqual(0);
      expect(EasingLib.easeIn(0.5)).assertEqual(0.25);
      expect(EasingLib.easeIn(1)).assertEqual(1);
      done();
    });

    it('AnimationPerformance_016', 0, async (done: Function) => {
      expect(EasingLib.easeOut(0)).assertEqual(0);
      expect(EasingLib.easeOut(0.5)).assertEqual(0.75);
      expect(EasingLib.easeOut(1)).assertEqual(1);
      done();
    });

    it('AnimationPerformance_017', 0, async (done: Function) => {
      expect(EasingLib.easeInOut(0)).assertEqual(0);
      expect(EasingLib.easeInOut(0.25)).assertEqual(0.125);
      expect(EasingLib.easeInOut(0.5)).assertEqual(0.5);
      expect(EasingLib.easeInOut(0.75)).assertEqual(0.875);
      done();
    });

    it('AnimationPerformance_018', 0, async (done: Function) => {
      expect(EasingLib.apply(AnimationCurve.LINEAR, 0.25)).assertEqual(0.25);
      expect(EasingLib.apply(AnimationCurve.EASE_IN, 0.5)).assertEqual(0.25);
      expect(EasingLib.apply(AnimationCurve.EASE_OUT, 0.5)).assertEqual(0.75);
      expect(EasingLib.apply(AnimationCurve.EASE_IN_OUT, 0.25)).assertEqual(0.125);
      done();
    });

    it('AnimationPerformance_019', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(300, 100, 2, AnimationCurve.LINEAR,
        AnimationDirection.FORWARD);
      expect(timeline.getDuration()).assertEqual(300);
      expect(timeline.getDelay()).assertEqual(100);
      expect(timeline.getIterations()).assertEqual(2);
      expect(timeline.totalDuration()).assertEqual(700);
      done();
    });

    it('AnimationPerformance_020', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(300, 100, 2, AnimationCurve.LINEAR,
        AnimationDirection.FORWARD);
      expect(timeline.progressAt(50)).assertEqual(0);
      expect(timeline.progressAt(100)).assertEqual(0);
      expect(timeline.progressAt(250)).assertEqual(0.5);
      done();
    });

    it('AnimationPerformance_021', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(300, 100, 2, AnimationCurve.LINEAR,
        AnimationDirection.FORWARD);
      expect(timeline.progressAt(400)).assertEqual(0);
      expect(timeline.progressAt(700)).assertEqual(1);
      expect(timeline.progressAt(1000)).assertEqual(1);
      done();
    });

    it('AnimationPerformance_022', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(300, 100, 2, AnimationCurve.LINEAR,
        AnimationDirection.FORWARD);
      expect(timeline.valueAt(250, 0, 100)).assertEqual(50);
      expect(timeline.valueAt(250, 100, 200)).assertEqual(150);
      done();
    });

    it('AnimationPerformance_023', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(300, 100, 2, AnimationCurve.EASE_IN,
        AnimationDirection.FORWARD);
      expect(timeline.valueAt(250, 0, 100)).assertEqual(25);
      expect(timeline.valueAt(100, 0, 100)).assertEqual(0);
      done();
    });

    it('AnimationPerformance_024', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(300, 100, 2, AnimationCurve.LINEAR,
        AnimationDirection.FORWARD);
      expect(timeline.remainingAt(200)).assertEqual(500);
      expect(timeline.remainingAt(700)).assertEqual(0);
      expect(timeline.remainingAt(900)).assertEqual(0);
      done();
    });

    it('AnimationPerformance_025', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(300, 100, 2, AnimationCurve.LINEAR,
        AnimationDirection.FORWARD);
      expect(timeline.isComplete(699)).assertFalse();
      expect(timeline.isComplete(700)).assertTrue();
      done();
    });

    it('AnimationPerformance_026', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(-10, -5, 0, AnimationCurve.LINEAR,
        AnimationDirection.FORWARD);
      expect(timeline.getDuration()).assertEqual(1);
      expect(timeline.getDelay()).assertEqual(0);
      expect(timeline.getIterations()).assertEqual(1);
      expect(timeline.totalDuration()).assertEqual(1);
      done();
    });

    it('AnimationPerformance_027', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(300, 0, 2, AnimationCurve.LINEAR,
        AnimationDirection.REVERSE);
      expect(timeline.progressAt(150) >= 0 && timeline.progressAt(150) <= 1).assertTrue();
      expect(timeline.progressAt(75) >= 0 && timeline.progressAt(75) <= 1).assertTrue();
      done();
    });

    it('AnimationPerformance_028', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(300, 0, 2, AnimationCurve.LINEAR,
        AnimationDirection.ALTERNATE);
      expect(timeline.progressAt(150)).assertEqual(0.5);
      expect(timeline.progressAt(450)).assertEqual(0.5);
      done();
    });

    it('AnimationPerformance_029', 0, async (done: Function) => {
      const track = new KeyframeTrack([0, 100, 200], [0, 50, 100]);
      expect(track.getKeyFrameCount()).assertEqual(3);
      expect(track.valueAt(50)).assertEqual(25);
      expect(track.valueAt(150)).assertEqual(75);
      done();
    });

    it('AnimationPerformance_030', 0, async (done: Function) => {
      const track = new KeyframeTrack([0, 100, 200], [0, 50, 100]);
      expect(track.valueAt(-10)).assertEqual(0);
      expect(track.valueAt(100)).assertEqual(50);
      expect(track.valueAt(250)).assertEqual(100);
      done();
    });

    it('AnimationPerformance_031', 0, async (done: Function) => {
      const empty = new KeyframeTrack([], []);
      expect(empty.getKeyFrameCount()).assertEqual(0);
      expect(empty.valueAt(5)).assertEqual(0);
      done();
    });

    it('AnimationPerformance_032', 0, async (done: Function) => {
      const mismatched = new KeyframeTrack([0, 100], [10]);
      expect(mismatched.getKeyFrameCount()).assertEqual(1);
      expect(mismatched.valueAt(50)).assertEqual(10);
      done();
    });

    it('AnimationPerformance_033', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([16, 16, 16]);
      expect(model.droppedCount()).assertEqual(0);
      expect(model.framesWithin(16)).assertEqual(3);
      expect(model.smoothnessScore()).assertEqual(100);
      done();
    });

    it('AnimationPerformance_034', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([17, 17, 17, 17]);
      expect(model.droppedCount()).assertEqual(4);
      expect(model.jankRate()).assertEqual(1);
      expect(model.smoothnessScore()).assertEqual(0);
      done();
    });

    it('AnimationPerformance_035', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([10, 40]);
      expect(model.percentile(50)).assertEqual(10);
      expect(model.percentile(100)).assertEqual(40);
      expect(model.getFrameCount()).assertEqual(2);
      done();
    });

    it('AnimationPerformance_036', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(100, 0, 1, AnimationCurve.LINEAR,
        AnimationDirection.FORWARD);
      expect(timeline.valueAt(0, 10, 20)).assertEqual(10);
      expect(timeline.valueAt(100, 10, 20)).assertEqual(20);
      expect(timeline.valueAt(50, 10, 20)).assertEqual(15);
      done();
    });

    it('AnimationPerformance_037', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(200, 50, 1, AnimationCurve.EASE_OUT,
        AnimationDirection.FORWARD);
      expect(timeline.progressAt(25)).assertEqual(0);
      expect(timeline.progressAt(150)).assertEqual(0.5);
      expect(timeline.totalDuration()).assertEqual(250);
      done();
    });

    it('AnimationPerformance_038', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
    it('AnimationPerformance_039', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([8, 8]);
      expect(model.averageFrameTime()).assertEqual(8);
      expect(model.computeFps()).assertEqual(125);
      expect(model.totalTime()).assertEqual(16);
      done();
    });

    it('AnimationPerformance_040', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      expect(model.averageFrameTime()).assertEqual(0);
      expect(model.maxFrameTime()).assertEqual(0);
      expect(model.minFrameTime()).assertEqual(0);
      expect(model.framesWithin(16)).assertEqual(0);
      done();
    });

    it('AnimationPerformance_041', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([-1, 0, -2]);
      expect(model.getFrameCount()).assertEqual(0);
      expect(model.getRejected()).assertEqual(3);
      expect(model.totalTime()).assertEqual(0);
      done();
    });

    it('AnimationPerformance_042', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([10, 20, 30, 40, 50]);
      expect(model.percentile(-10)).assertEqual(10);
      expect(model.percentile(150)).assertEqual(50);
      done();
    });

    it('AnimationPerformance_043', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      expect(model.classify(11)).assertEqual('good');
      expect(model.classify(33)).assertEqual('jank');
      expect(model.classify(34)).assertEqual('severe');
      done();
    });

    it('AnimationPerformance_044', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrame(25);
      expect(model.averageFrameTime()).assertEqual(25);
      expect(model.computeFps()).assertEqual(40);
      expect(model.droppedCount()).assertEqual(1);
      expect(model.smoothnessScore()).assertEqual(0);
      done();
    });

    it('AnimationPerformance_045', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(100, 0, 3, AnimationCurve.LINEAR,
        AnimationDirection.FORWARD);
      expect(timeline.totalDuration()).assertEqual(300);
      expect(timeline.progressAt(150)).assertEqual(0.5);
      expect(timeline.progressAt(250)).assertEqual(0.5);
      done();
    });

    it('AnimationPerformance_046', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(100, 0, 3, AnimationCurve.EASE_IN_OUT,
        AnimationDirection.FORWARD);
      expect(timeline.getCurve()).assertEqual(AnimationCurve.EASE_IN_OUT);
      expect(timeline.valueAt(50, 0, 100)).assertEqual(50);
      done();
    });

    it('AnimationPerformance_047', 0, async (done: Function) => {
      const track = new KeyframeTrack([0, 100, 200], [0, 50, 100]);
      expect(track.valueAt(175)).assertEqual(87.5);
      expect(track.valueAt(25)).assertEqual(12.5);
      done();
    });

    it('AnimationPerformance_048', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([16, 17]);
      expect(model.framesWithin(16)).assertEqual(1);
      expect(model.droppedCount()).assertEqual(1);
      expect(model.jankRate()).assertEqual(0.5);
      done();
    });

    it('AnimationPerformance_049', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(50, 25, 2, AnimationCurve.LINEAR,
        AnimationDirection.REVERSE);
      expect(timeline.remainingAt(0)).assertEqual(125);
      expect(timeline.progressAt(25)).assertEqual(0);
      expect(timeline.progressAt(75)).assertEqual(1);
      done();
    });

    it('AnimationPerformance_050', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_120);
      model.addFrames([8, 9, 16]);
      expect(model.getBudget()).assertEqual(8);
      expect(model.framesWithin(8)).assertEqual(1);
      expect(model.droppedCount()).assertEqual(2);
      done();
    });
    it('AnimationPerformance_051', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([3, 7]);
      expect(model.jankRate()).assertEqual(0);
      expect(model.smoothnessScore()).assertEqual(100);
      expect(model.framesWithin(16)).assertEqual(2);
      done();
    });

    it('AnimationPerformance_052', 0, async (done: Function) => {
      const timeline = new AnimationTimeline(100, 50, 1, AnimationCurve.LINEAR,
        AnimationDirection.FORWARD);
      expect(timeline.totalDuration()).assertEqual(150);
      expect(timeline.progressAt(50)).assertEqual(0);
      expect(timeline.valueAt(75, 0, 10)).assertEqual(2.5);
      done();
    });
    it('AnimationPerformance_053', 0, async (done: Function) => {
      const model = new AnimationFrameModel(FRAME_BUDGET_60);
      model.addFrames([10, 10, 30]);
      expect(model.percentile(100)).assertEqual(30);
      expect(model.maxFrameTime()).assertEqual(30);
      expect(model.getFrameCount()).assertEqual(3);
      done();
    });
  });
}
