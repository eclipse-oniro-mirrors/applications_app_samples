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

const MIN_ACCEPTABLE_FPS: number = 45;

const JANK_FRAME_MS: number = 32;

const MAX_SAMPLES: number = 300;

interface FrameSample {
  index: number;
  renderMs: number;
}

// Computes FPS statistics from frame render times
class FpsAnalyzer {
  private samples: FrameSample[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public add(index: number, renderMs: number): boolean {
    if (renderMs < 0 || this.samples.length >= this.capacity) {
      return false;
    }
    this.samples.push({ index: index, renderMs: renderMs });
    return true;
  }

  public count(): number {
    return this.samples.length;
  }

  public averageRenderMs(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      total += this.samples[i].renderMs;
    }
    return total / this.samples.length;
  }

  public averageFps(): number {
    const average = this.averageRenderMs();
    return average <= 0 ? 0 : 1000 / average;
  }

  public maxRenderMs(): number {
    let max: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].renderMs > max) {
        max = this.samples[i].renderMs;
      }
    }
    return max;
  }

  public minFps(): number {
    const max = this.maxRenderMs();
    return max <= 0 ? 0 : 1000 / max;
  }

  public jankFrames(): number {
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].renderMs > JANK_FRAME_MS) {
        count++;
      }
    }
    return count;
  }

  public jankRate(): number {
    return this.samples.length === 0 ? 0 : this.jankFrames() * 100 / this.samples.length;
  }

  public percentileRenderMs(percentile: number): number {
    if (this.samples.length === 0) {
      return 0;
    }
    const sorted = this.samples.map((sample: FrameSample) => sample.renderMs);
    sorted.sort((left: number, right: number) => left - right);
    const clamped = percentile < 0 ? 0 : (percentile > 100 ? 100 : percentile);
    const index = Math.min(sorted.length - 1,
      Math.floor(clamped / 100 * sorted.length));
    return sorted[index];
  }

  public isSmooth(): boolean {
    return this.averageFps() >= MIN_ACCEPTABLE_FPS && this.jankRate() <= 5;
  }

  public reset(): void {
    this.samples = [];
  }
}

// Defines FPS thresholds for each page type
class FpsThresholds {
  public static targetFor(page: string): number {
    if (page === 'home' || page === 'list') {
      return TARGET_FPS;
    }
    if (page === 'detail') {
      return MIN_ACCEPTABLE_FPS;
    }
    return TARGET_FPS;
  }

  public static isBelowThreshold(fps: number, page: string): boolean {
    return fps < FpsThresholds.targetFor(page);
  }

  public static worstCase(): number {
    return MIN_ACCEPTABLE_FPS;
  }
}

// Produces a pass/fail FPS report
class FpsReport {
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

  public summary(): string {
    return this.isPassed() ? 'smooth' : 'janky';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

// Runs repeated frame captures for stability checks
class FrameCaptureLoop {
  private readonly framesPerRound: number;
  private readonly rounds: number;
  private completed: number = 0;

  constructor(framesPerRound: number, rounds: number) {
    this.framesPerRound = framesPerRound;
    this.rounds = rounds;
  }

  public capture(analyzer: FpsAnalyzer, renderMs: number): number {
    let captured: number = 0;
    for (let i = 0; i < this.framesPerRound; i++) {
      if (analyzer.add(this.completed, renderMs)) {
        captured++;
        this.completed++;
      }
    }
    return captured;
  }

  public getCompleted(): number {
    return this.completed;
  }

  public getExpected(): number {
    return this.framesPerRound * this.rounds;
  }

  public isComplete(): boolean {
    return this.completed >= this.getExpected();
  }

  public reset(): void {
    this.completed = 0;
  }
}

export default function fpsStabilityTest() {
  describe('FpsStability_Test', () => {

    it('analyzer_should_accumulate_samples', 0, () => {
      const analyzer = new FpsAnalyzer(MAX_SAMPLES);
      expect(analyzer.add(0, 16)).assertTrue();
      expect(analyzer.add(1, 17)).assertTrue();
      expect(analyzer.count()).assertEqual(2);
      expect(analyzer.averageRenderMs()).assertEqual(16.5);
      expect(analyzer.averageFps()).assertClose(60.606, 0.01);
    });

    it('analyzer_should_reject_invalid_samples', 0, () => {
      const analyzer = new FpsAnalyzer(1);
      expect(analyzer.add(0, -1)).assertFalse();
      expect(analyzer.add(0, 16)).assertTrue();
      expect(analyzer.add(1, 16)).assertFalse();
      expect(analyzer.count()).assertEqual(1);
    });

    it('analyzer_should_report_extremes', 0, () => {
      const analyzer = new FpsAnalyzer(MAX_SAMPLES);
      analyzer.add(0, 10);
      analyzer.add(1, 40);
      analyzer.add(2, 20);
      expect(analyzer.maxRenderMs()).assertEqual(40);
      expect(analyzer.minFps()).assertEqual(25);
      expect(analyzer.averageFps()).assertClose(42.857, 0.01);
    });

    it('analyzer_should_count_jank_frames', 0, () => {
      const analyzer = new FpsAnalyzer(MAX_SAMPLES);
      analyzer.add(0, 16);
      analyzer.add(1, 16);
      analyzer.add(2, JANK_FRAME_MS + 1);
      analyzer.add(3, 16);
      expect(analyzer.jankFrames()).assertEqual(1);
      expect(analyzer.jankRate()).assertEqual(25);
      expect(analyzer.isSmooth()).assertFalse();
    });

    it('analyzer_should_detect_smooth_run', 0, () => {
      const analyzer = new FpsAnalyzer(MAX_SAMPLES);
      for (let i = 0; i < 10; i++) {
        analyzer.add(i, 16);
      }
      expect(analyzer.jankFrames()).assertEqual(0);
      expect(analyzer.jankRate()).assertEqual(0);
      expect(analyzer.isSmooth()).assertTrue();
      expect(analyzer.averageFps()).assertClose(62.5, 0.01);
    });

    it('analyzer_should_compute_percentiles', 0, () => {
      const analyzer = new FpsAnalyzer(MAX_SAMPLES);
      analyzer.add(0, 40);
      analyzer.add(1, 10);
      analyzer.add(2, 20);
      analyzer.add(3, 30);
      expect(analyzer.percentileRenderMs(0)).assertEqual(10);
      expect(analyzer.percentileRenderMs(50)).assertEqual(30);
      expect(analyzer.percentileRenderMs(100)).assertEqual(40);
      expect(analyzer.percentileRenderMs(-1)).assertEqual(10);
    });

    it('analyzer_should_handle_empty', 0, () => {
      const analyzer = new FpsAnalyzer(MAX_SAMPLES);
      expect(analyzer.count()).assertEqual(0);
      expect(analyzer.averageRenderMs()).assertEqual(0);
      expect(analyzer.averageFps()).assertEqual(0);
      expect(analyzer.maxRenderMs()).assertEqual(0);
      expect(analyzer.minFps()).assertEqual(0);
      expect(analyzer.jankRate()).assertEqual(0);
      expect(analyzer.percentileRenderMs(50)).assertEqual(0);
      expect(analyzer.isSmooth()).assertFalse();
    });

    it('thresholds_should_vary_by_page', 0, () => {
      expect(FpsThresholds.targetFor('home')).assertEqual(TARGET_FPS);
      expect(FpsThresholds.targetFor('list')).assertEqual(TARGET_FPS);
      expect(FpsThresholds.targetFor('detail')).assertEqual(MIN_ACCEPTABLE_FPS);
      expect(FpsThresholds.targetFor('unknown')).assertEqual(TARGET_FPS);
      expect(FpsThresholds.isBelowThreshold(50, 'home')).assertTrue();
      expect(FpsThresholds.isBelowThreshold(50, 'detail')).assertFalse();
      expect(FpsThresholds.worstCase()).assertEqual(MIN_ACCEPTABLE_FPS);
    });

    it('report_should_aggregate_fps_checks', 0, () => {
      const report = new FpsReport();
      const analyzer = new FpsAnalyzer(MAX_SAMPLES);
      for (let i = 0; i < 5; i++) {
        analyzer.add(i, 16);
      }
      report.check('smooth', analyzer.isSmooth());
      report.check('jankFree', analyzer.jankFrames() === 0);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      expect(report.summary()).assertEqual('smooth');
      report.check('threshold', false);
      expect(report.summary()).assertEqual('janky');
      expect(report.failures()).assertDeepEquals(['threshold']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('capture_loop_should_fill_analyzer', 0, () => {
      const analyzer = new FpsAnalyzer(MAX_SAMPLES);
      const loop = new FrameCaptureLoop(5, 2);
      expect(loop.getExpected()).assertEqual(10);
      expect(loop.capture(analyzer, 16)).assertEqual(5);
      expect(loop.capture(analyzer, 16)).assertEqual(5);
      expect(loop.getCompleted()).assertEqual(10);
      expect(loop.isComplete()).assertTrue();
      expect(analyzer.count()).assertEqual(10);
      loop.reset();
      expect(loop.isComplete()).assertFalse();
    });

    it('fps_flow_should_validate_home_and_detail', 0, () => {
      const homeAnalyzer = new FpsAnalyzer(MAX_SAMPLES);
      const detailAnalyzer = new FpsAnalyzer(MAX_SAMPLES);
      for (let i = 0; i < 10; i++) {
        homeAnalyzer.add(i, 16);
        detailAnalyzer.add(i, 20);
      }
      expect(homeAnalyzer.isSmooth()).assertTrue();
      expect(detailAnalyzer.isSmooth()).assertTrue();
      expect(homeAnalyzer.averageFps()).assertLarger(detailAnalyzer.averageFps());
      expect(FpsThresholds.isBelowThreshold(detailAnalyzer.averageFps(), 'detail')).assertFalse();
      expect(detailAnalyzer.jankFrames()).assertEqual(0);
    });

    it('fps_constants_should_be_stable', 0, () => {
      expect(TARGET_FPS).assertEqual(60);
      expect(MIN_ACCEPTABLE_FPS).assertEqual(45);
      expect(JANK_FRAME_MS).assertEqual(32);
      expect(MAX_SAMPLES).assertEqual(300);
      expect(TARGET_FPS).assertLarger(MIN_ACCEPTABLE_FPS);
    });
  });
}

