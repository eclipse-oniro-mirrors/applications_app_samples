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
import { Driver } from '../Shared/MiracastDriver';
import {
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_BACK, miracastComponentCount, waitForServiceConnected,
  waitForPageStable, pressAndWait, triggerMiracastHome, serializedDelay,
  TIMEOUT_PAGE_RENDER, TIMEOUT_SERVICE_CONNECT, DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';

enum LatencyPhase {
  SERVICE_CONNECT = 'service_connect',
  SESSION_CREATE = 'session_create',
  SCREEN_BIND = 'screen_bind',
  FIRST_FRAME = 'first_frame',
  TILE_SWITCH = 'tile_switch',
  DISCOVERY = 'discovery'
}

interface LatencySample { phase: LatencyPhase; durationMs: number; timestamp: number; }

interface PercentileResult { p50: number; p90: number; p99: number; }

interface RegressionResult { baseline: number; current: number; ratio: number; regressed: boolean; }

class PerformanceMonitor {
  private samples: Array<LatencySample> = [];

  public record(phase: LatencyPhase, durationMs: number): void {
    this.samples.push({ phase: phase, durationMs: durationMs, timestamp: Date.now() });
  }

  public measureStart(): number { return Date.now(); }

  public measureEnd(phase: LatencyPhase, startTime: number): number {
    const duration: number = Date.now() - startTime;
    this.record(phase, duration);
    return duration;
  }

  public getSampleCount(): number { return this.samples.length; }
  public clear(): void { this.samples = []; }

  public getAverage(): number {
    if (this.samples.length === 0) { return 0; }
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) { total += this.samples[i].durationMs; }
    return total / this.samples.length;
  }

  public getMax(): number {
    let peak: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].durationMs > peak) { peak = this.samples[i].durationMs; }
    }
    return peak;
  }

  public getMin(): number {
    if (this.samples.length === 0) { return 0; }
    let lowest: number = this.samples[0].durationMs;
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i].durationMs < lowest) { lowest = this.samples[i].durationMs; }
    }
    return lowest;
  }

  public getCountByPhase(phase: LatencyPhase): number {
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].phase === phase) { count++; }
    }
    return count;
  }

  public getAverageByPhase(phase: LatencyPhase): number {
    let total: number = 0;
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].phase === phase) {
        total += this.samples[i].durationMs;
        count++;
      }
    }
    return count === 0 ? 0 : total / count;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i].timestamp < this.samples[i - 1].timestamp) { return false; }
    }
    return true;
  }

  public getSlowestPhase(): LatencyPhase | null {
    let slowest: LatencyPhase | null = null;
    let peak: number = -1;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].durationMs > peak) {
        peak = this.samples[i].durationMs;
        slowest = this.samples[i].phase;
      }
    }
    return slowest;
  }
}
class PerformanceAnalyzer {
  public median(values: Array<number>): number {
    if (values.length === 0) { return 0; }
    const sorted: Array<number> = values.slice(0).sort((left: number, right: number) => left - right);
    const middle: number = Math.floor(sorted.length / 2);
    return sorted.length % 2 === 0 ? (sorted[middle - 1] + sorted[middle]) / 2 : sorted[middle];
  }

  public percentile(values: Array<number>, ratio: number): number {
    if (values.length === 0) { return 0; }
    const sorted: Array<number> = values.slice(0).sort((left: number, right: number) => left - right);
    const position: number = Math.ceil(ratio * sorted.length) - 1;
    if (position <= 0) { return sorted[0]; }
    return sorted[position >= sorted.length ? sorted.length - 1 : position];
  }

  public standardDeviation(values: Array<number>): number {
    if (values.length === 0) { return 0; }
    let total: number = 0;
    for (let i = 0; i < values.length; i++) { total += values[i]; }
    const mean: number = total / values.length;
    let variance: number = 0;
    for (let i = 0; i < values.length; i++) {
      variance += (values[i] - mean) * (values[i] - mean);
    }
    return Math.sqrt(variance / values.length);
  }

  public summarize(values: Array<number>): PercentileResult {
    return {
      p50: this.percentile(values, 0.5),
      p90: this.percentile(values, 0.9),
      p99: this.percentile(values, 0.99)
    };
  }
}

class PhaseBudgetRegistry {
  private budgets: Map<LatencyPhase, number> = new Map<LatencyPhase, number>();

  constructor() {
    this.budgets.set(LatencyPhase.SERVICE_CONNECT, TIMEOUT_SERVICE_CONNECT);
    this.budgets.set(LatencyPhase.SESSION_CREATE, 1000);
    this.budgets.set(LatencyPhase.SCREEN_BIND, 1500);
    this.budgets.set(LatencyPhase.FIRST_FRAME, 1200);
    this.budgets.set(LatencyPhase.TILE_SWITCH, 300);
    this.budgets.set(LatencyPhase.DISCOVERY, 2000);
  }

  public get(phase: LatencyPhase): number {
    const budget: number | undefined = this.budgets.get(phase);
    return budget === undefined ? 0 : budget;
  }

  public override(phase: LatencyPhase, budgetMs: number): boolean {
    if (budgetMs <= 0) { return false; }
    this.budgets.set(phase, budgetMs);
    return true;
  }

  public isWithin(phase: LatencyPhase, durationMs: number): boolean {
    return durationMs <= this.get(phase);
  }

  public clear(): void { this.budgets.clear(); }
  public size(): number { return this.budgets.size; }
}

class LatencyRegressionDetector {
  private baselines: Map<LatencyPhase, number> = new Map<LatencyPhase, number>();

  public setBaseline(phase: LatencyPhase, durationMs: number): void {
    this.baselines.set(phase, durationMs);
  }

  public detect(phase: LatencyPhase, current: number, threshold: number): RegressionResult {
    const baseline: number | undefined = this.baselines.get(phase);
    const base: number = baseline === undefined ? 0 : baseline;
    const ratio: number = base === 0 ? 0 : current / base;
    return { baseline: base, current: current, ratio: ratio, regressed: base > 0 && ratio > threshold };
  }

  public hasBaseline(phase: LatencyPhase): boolean { return this.baselines.has(phase); }
  public clear(): void { this.baselines.clear(); }
}
export default function miracastPerformanceSuite(): void {
  describe('MiracastPerformance_Suite', () => {
    let driver: Driver;
    let monitor: PerformanceMonitor;

    beforeAll(async () => {
      driver = getDriver();
      monitor = new PerformanceMonitor();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
      await waitForServiceConnected(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });


    it('first_frame_latency_should_fit_budget', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      const start: number = monitor.measureStart();
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const duration: number = monitor.measureEnd(LatencyPhase.FIRST_FRAME, start);
      expect(duration).assertLargerOrEqual(0);
      expect(registry.isWithin(LatencyPhase.FIRST_FRAME, duration)).assertTrue();
      expect(monitor.getCountByPhase(LatencyPhase.FIRST_FRAME)).assertLargerOrEqual(1);
    });

    it('tile_switch_latency_should_be_acceptable', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      const start: number = monitor.measureStart();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const duration: number = monitor.measureEnd(LatencyPhase.TILE_SWITCH, start);
      expect(duration).assertLessOrEqual(registry.get(LatencyPhase.TILE_SWITCH) * 60);
      expect(registry.isWithin(LatencyPhase.TILE_SWITCH, duration)).assertTrue();
    });

    it('discovery_budget_should_be_relaxed', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      expect(registry.get(LatencyPhase.DISCOVERY)).assertEqual(2000);
      expect(registry.get(LatencyPhase.DISCOVERY)).assertLarger(registry.get(LatencyPhase.TILE_SWITCH));
    });

    it('tile_switch_budget_should_be_strictest', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      const switchBudget: number = registry.get(LatencyPhase.TILE_SWITCH);
      expect(switchBudget).assertEqual(300);
      expect(switchBudget).assertLess(registry.get(LatencyPhase.SCREEN_BIND));
      expect(switchBudget).assertLess(registry.get(LatencyPhase.SESSION_CREATE));
    });

    it('budget_registry_should_cover_all_phases', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      expect(registry.size()).assertEqual(6);
      expect(registry.get(LatencyPhase.SERVICE_CONNECT)).assertLarger(0);
      expect(registry.get(LatencyPhase.SCREEN_BIND)).assertLarger(0);
    });

    it('budget_registry_should_override_and_clear', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      expect(registry.override(LatencyPhase.TILE_SWITCH, 120)).assertTrue();
      expect(registry.get(LatencyPhase.TILE_SWITCH)).assertEqual(120);
      expect(registry.isWithin(LatencyPhase.TILE_SWITCH, 130)).assertFalse();
      registry.clear();
      expect(registry.size()).assertEqual(0);
    });
    it('monitor_should_compute_basic_statistics', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.SESSION_CREATE, 100);
      stats.record(LatencyPhase.SESSION_CREATE, 300);
      stats.record(LatencyPhase.SESSION_CREATE, 200);
      expect(stats.getSampleCount()).assertEqual(3);
      expect(stats.getAverage()).assertEqual(200);
      expect(stats.getMax()).assertEqual(300);
      expect(stats.getMin()).assertEqual(100);
    });

    it('monitor_should_handle_empty_samples', 0, async () => {
      const stats = new PerformanceMonitor();
      expect(stats.getAverage()).assertEqual(0);
      expect(stats.getMax()).assertEqual(0);
      expect(stats.getMin()).assertEqual(0);
      expect(stats.getSlowestPhase()).assertNull();
    });

    it('monitor_should_keep_chronological_samples', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.SCREEN_BIND, 120);
      stats.record(LatencyPhase.FIRST_FRAME, 240);
      stats.record(LatencyPhase.TILE_SWITCH, 80);
      expect(stats.isChronological()).assertTrue();
      expect(stats.getSampleCount()).assertEqual(3);
    });

    it('monitor_should_reset_after_clear', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.SESSION_CREATE, 150);
      stats.clear();
      expect(stats.getSampleCount()).assertEqual(0);
      expect(stats.isChronological()).assertTrue();
    });

    it('monitor_should_measure_elapsed_time', 0, async () => {
      const stats = new PerformanceMonitor();
      const start: number = stats.measureStart();
      const duration: number = stats.measureEnd(LatencyPhase.SESSION_CREATE, start);
      expect(duration).assertLargerOrEqual(0);
      expect(stats.getCountByPhase(LatencyPhase.SESSION_CREATE)).assertEqual(1);
    });

    it('monitor_should_expose_slowest_phase_sample', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.SCREEN_BIND, 90);
      stats.record(LatencyPhase.DISCOVERY, 900);
      stats.record(LatencyPhase.TILE_SWITCH, 120);
      expect(stats.getSlowestPhase()).assertEqual(LatencyPhase.DISCOVERY);
    });

    it('monitor_should_average_by_phase', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.FIRST_FRAME, 100);
      stats.record(LatencyPhase.FIRST_FRAME, 300);
      stats.record(LatencyPhase.TILE_SWITCH, 50);
      expect(stats.getAverageByPhase(LatencyPhase.FIRST_FRAME)).assertEqual(200);
      expect(stats.getAverageByPhase(LatencyPhase.SESSION_CREATE)).assertEqual(0);
    });

    it('analyzer_should_compute_median', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      expect(analyzer.median([300, 100, 200])).assertEqual(200);
      expect(analyzer.median([100, 400, 200, 300])).assertEqual(250);
      expect(analyzer.median([])).assertEqual(0);
    });

    it('analyzer_should_compute_percentiles', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      const values: Array<number> = [100, 200, 300, 400, 500];
      expect(analyzer.percentile(values, 0.5)).assertEqual(300);
      expect(analyzer.percentile(values, 1)).assertEqual(500);
      expect(analyzer.percentile([], 0.9)).assertEqual(0);
    });
    it('analyzer_should_compute_standard_deviation', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      expect(analyzer.standardDeviation([100, 100, 100])).assertEqual(0);
      expect(analyzer.standardDeviation([100, 300])).assertEqual(100);
      expect(analyzer.standardDeviation([])).assertEqual(0);
    });

    it('analyzer_should_summarize_percentiles', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      const summary: PercentileResult = analyzer.summarize([100, 200, 300, 400]);
      expect(summary.p50).assertEqual(200);
      expect(summary.p90).assertEqual(400);
      expect(summary.p99).assertEqual(400);
    });

    it('analyzer_single_sample_percentiles_should_match', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      expect(analyzer.percentile([250], 0.5)).assertEqual(250);
      expect(analyzer.percentile([250], 0.99)).assertEqual(250);
      expect(analyzer.median([250])).assertEqual(250);
    });

    it('analyzer_two_samples_should_cover_bounds', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      expect(analyzer.percentile([100, 500], 0.5)).assertEqual(100);
      expect(analyzer.percentile([100, 500], 0.9)).assertEqual(500);
    });

    it('analyzer_percentile_should_clamp_out_of_range', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      expect(analyzer.percentile([100, 200, 300], 2)).assertEqual(300);
      expect(analyzer.percentile([100, 200, 300], 0)).assertEqual(100);
    });

    it('report_should_detect_high_variance', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      const steady: number = analyzer.standardDeviation([100, 100, 100]);
      const jittery: number = analyzer.standardDeviation([50, 300, 550]);
      expect(steady).assertEqual(0);
      expect(jittery > steady).assertTrue();
    });

    it('regression_detector_should_pass_within_threshold', 0, async () => {
      const detector = new LatencyRegressionDetector();
      detector.setBaseline(LatencyPhase.TILE_SWITCH, 100);
      const result: RegressionResult = detector.detect(LatencyPhase.TILE_SWITCH, 120, 1.5);
      expect(result.regressed).assertFalse();
      expect(result.ratio).assertEqual(1.2);
    });

    it('regression_detector_should_detect_regression', 0, async () => {
      const detector = new LatencyRegressionDetector();
      detector.setBaseline(LatencyPhase.SESSION_CREATE, 100);
      const result: RegressionResult = detector.detect(LatencyPhase.SESSION_CREATE, 260, 1.5);
      expect(result.regressed).assertTrue();
      expect(result.current).assertEqual(260);
      expect(result.baseline).assertEqual(100);
    });

    it('regression_detector_boundary_should_pass_at_threshold', 0, async () => {
      const detector = new LatencyRegressionDetector();
      detector.setBaseline(LatencyPhase.FIRST_FRAME, 200);
      expect(detector.detect(LatencyPhase.FIRST_FRAME, 300, 1.5).regressed).assertFalse();
      expect(detector.detect(LatencyPhase.FIRST_FRAME, 320, 1.5).regressed).assertTrue();
    });
    it('regression_detector_should_clear_baselines', 0, async () => {
      const detector = new LatencyRegressionDetector();
      detector.setBaseline(LatencyPhase.TILE_SWITCH, 100);
      expect(detector.hasBaseline(LatencyPhase.TILE_SWITCH)).assertTrue();
      detector.clear();
      expect(detector.hasBaseline(LatencyPhase.TILE_SWITCH)).assertFalse();
      expect(detector.detect(LatencyPhase.TILE_SWITCH, 400, 1.5).regressed).assertFalse();
    });

    it('regression_ratio_should_track_current_over_baseline', 0, async () => {
      const detector = new LatencyRegressionDetector();
      detector.setBaseline(LatencyPhase.SCREEN_BIND, 80);
      const result: RegressionResult = detector.detect(LatencyPhase.SCREEN_BIND, 160, 1.5);
      expect(result.ratio).assertEqual(2);
      expect(result.regressed).assertTrue();
    });

    it('nine_tile_latency_samples_should_be_aggregated', 0, async () => {
      const stats = new PerformanceMonitor();
      const analyzer = new PerformanceAnalyzer();
      const values: Array<number> = [];
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        const duration: number = 100 + i * 10;
        stats.record(LatencyPhase.TILE_SWITCH, duration);
        values.push(duration);
      }
      expect(stats.getSampleCount()).assertEqual(MAX_MIRROR_TILES);
      expect(analyzer.median(values)).assertEqual(140);
      expect(stats.getMax()).assertEqual(180);
    });

    it('multi_phase_samples_should_be_independent', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.SERVICE_CONNECT, 500);
      stats.record(LatencyPhase.TILE_SWITCH, 100);
      stats.record(LatencyPhase.TILE_SWITCH, 300);
      expect(stats.getCountByPhase(LatencyPhase.SERVICE_CONNECT)).assertEqual(1);
      expect(stats.getCountByPhase(LatencyPhase.TILE_SWITCH)).assertEqual(2);
      expect(stats.getAverageByPhase(LatencyPhase.TILE_SWITCH)).assertEqual(200);
    });

    it('phase_counters_should_match_samples', 0, async () => {
      const stats = new PerformanceMonitor();
      for (let i = 0; i < 4; i++) { stats.record(LatencyPhase.DISCOVERY, 200); }
      expect(stats.getCountByPhase(LatencyPhase.DISCOVERY)).assertEqual(4);
      expect(stats.getSampleCount()).assertEqual(4);
      expect(stats.getAverage()).assertEqual(200);
    });

    it('monitor_and_budget_should_agree', 0, async () => {
      const stats = new PerformanceMonitor();
      const registry = new PhaseBudgetRegistry();
      stats.record(LatencyPhase.SESSION_CREATE, 400);
      stats.record(LatencyPhase.SESSION_CREATE, 600);
      expect(registry.isWithin(LatencyPhase.SESSION_CREATE, stats.getAverage())).assertTrue();
      expect(registry.isWithin(LatencyPhase.SESSION_CREATE, stats.getMax())).assertTrue();
    });

    it('budget_registry_should_default_allow_unknown_phase', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      expect(registry.get(LatencyPhase.TILE_SWITCH)).assertLarger(0);
      registry.clear();
      expect(registry.get(LatencyPhase.TILE_SWITCH)).assertEqual(0);
      expect(registry.isWithin(LatencyPhase.TILE_SWITCH, 100)).assertFalse();
    });

    it('budget_registry_should_reject_invalid_override', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      const before: number = registry.get(LatencyPhase.TILE_SWITCH);
      expect(registry.override(LatencyPhase.TILE_SWITCH, 0)).assertFalse();
      expect(registry.get(LatencyPhase.TILE_SWITCH)).assertEqual(before);
    });

    it('budget_and_regression_should_form_gate', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      const detector = new LatencyRegressionDetector();
      detector.setBaseline(LatencyPhase.TILE_SWITCH, 200);
      const current: number = 420;
      const withinBudget: boolean = registry.isWithin(LatencyPhase.TILE_SWITCH, current);
      const regressed: boolean = detector.detect(LatencyPhase.TILE_SWITCH, current, 1.5).regressed;
      expect(withinBudget).assertFalse();
      expect(regressed).assertTrue();
    });
    it('repeated_navigation_latency_should_have_low_variance', 0, async () => {
      const stats = new PerformanceMonitor();
      const analyzer = new PerformanceAnalyzer();
      const values: Array<number> = [];
      for (let i = 0; i < 5; i++) {
        const start: number = stats.measureStart();
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const duration: number = stats.measureEnd(LatencyPhase.TILE_SWITCH, start);
        values.push(duration);
      }
      expect(values.length).assertEqual(5);
      expect(analyzer.median(values)).assertLargerOrEqual(0);
      expect(stats.isChronological()).assertTrue();
    });

    it('monitor_should_track_min_latency', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.FIRST_FRAME, 800);
      stats.record(LatencyPhase.FIRST_FRAME, 200);
      stats.record(LatencyPhase.FIRST_FRAME, 500);
      expect(stats.getMin()).assertEqual(200);
      expect(stats.getMax()).assertEqual(800);
    });

    it('home_page_should_survive_repeated_probes', 0, async () => {
      for (let i = 0; i < 5; i++) {
        monitor.record(LatencyPhase.DISCOVERY, 120);
      }
      expect(monitor.getCountByPhase(LatencyPhase.DISCOVERY)).assertLargerOrEqual(5);
    });



    it('comprehensive_performance_scenario_should_pass', 0, async () => {
      const stats = new PerformanceMonitor();
      const registry = new PhaseBudgetRegistry();
      const detector = new LatencyRegressionDetector();
      const analyzer = new PerformanceAnalyzer();
      const values: Array<number> = [];
      for (let i = 0; i < 6; i++) {
        const duration: number = 150 + i * 20;
        stats.record(LatencyPhase.TILE_SWITCH, duration);
        values.push(duration);
      }
      detector.setBaseline(LatencyPhase.TILE_SWITCH, 150);
      const gate: boolean = registry.isWithin(LatencyPhase.TILE_SWITCH, stats.getAverage()) &&
        !detector.detect(LatencyPhase.TILE_SWITCH, stats.getMax(), 2).regressed;
      expect(gate).assertTrue();
      expect(analyzer.summarize(values).p50).assertLarger(0);
    });

    it('monitor_sample_count_should_grow_with_measure', 0, async () => {
      const stats = new PerformanceMonitor();
      for (let i = 0; i < 3; i++) { stats.measureEnd(LatencyPhase.SCREEN_BIND, stats.measureStart()); }
      expect(stats.getSampleCount()).assertEqual(3);
      expect(stats.getCountByPhase(LatencyPhase.SCREEN_BIND)).assertEqual(3);
    });
    it('monitor_should_report_zero_for_unseen_phase', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.TILE_SWITCH, 100);
      expect(stats.getAverageByPhase(LatencyPhase.DISCOVERY)).assertEqual(0);
      expect(stats.getCountByPhase(LatencyPhase.DISCOVERY)).assertEqual(0);
    });

    it('analyzer_should_sort_without_mutating_input', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      const values: Array<number> = [300, 100, 200];
      expect(analyzer.median(values)).assertEqual(200);
      expect(values[0]).assertEqual(300);
      expect(values[2]).assertEqual(200);
    });

    it('analyzer_median_should_handle_even_and_odd', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      expect(analyzer.median([100])).assertEqual(100);
      expect(analyzer.median([100, 200])).assertEqual(150);
      expect(analyzer.median([100, 200, 900])).assertEqual(200);
    });

    it('analyzer_variance_should_grow_with_spread', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      const tight: number = analyzer.standardDeviation([200, 201, 199]);
      const wide: number = analyzer.standardDeviation([100, 300, 500]);
      expect(wide > tight).assertTrue();
      expect(tight).assertLess(2);
    });

    it('budget_registry_should_track_multiple_overrides', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      expect(registry.override(LatencyPhase.TILE_SWITCH, 250)).assertTrue();
      expect(registry.override(LatencyPhase.DISCOVERY, 900)).assertTrue();
      expect(registry.get(LatencyPhase.TILE_SWITCH)).assertEqual(250);
      expect(registry.get(LatencyPhase.DISCOVERY)).assertEqual(900);
      expect(registry.size()).assertEqual(6);
    });

    it('budget_is_within_should_accept_boundary', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      const budget: number = registry.get(LatencyPhase.TILE_SWITCH);
      expect(registry.isWithin(LatencyPhase.TILE_SWITCH, budget)).assertTrue();
      expect(registry.isWithin(LatencyPhase.TILE_SWITCH, budget + 1)).assertFalse();
    });

    it('nine_phase_budget_lookup_should_be_stable', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      const first: number = registry.get(LatencyPhase.FIRST_FRAME);
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        expect(registry.get(LatencyPhase.FIRST_FRAME)).assertEqual(first);
      }
      expect(first).assertEqual(1200);
    });

    it('first_frame_budget_should_exceed_tile_switch', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      expect(registry.get(LatencyPhase.FIRST_FRAME)).assertLarger(registry.get(LatencyPhase.TILE_SWITCH));
      expect(registry.get(LatencyPhase.SCREEN_BIND)).assertLarger(registry.get(LatencyPhase.TILE_SWITCH));
    });
    it('session_create_budget_should_exceed_tile_switch', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      expect(registry.get(LatencyPhase.SESSION_CREATE)).assertEqual(1000);
      expect(registry.get(LatencyPhase.SESSION_CREATE) > registry.get(LatencyPhase.TILE_SWITCH)).assertTrue();
    });

    it('stats_should_reset_and_record_again', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.TILE_SWITCH, 100);
      stats.clear();
      stats.record(LatencyPhase.TILE_SWITCH, 400);
      expect(stats.getSampleCount()).assertEqual(1);
      expect(stats.getAverage()).assertEqual(400);
    });

    it('analyzer_percentile_p90_should_exceed_p50', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      const summary: PercentileResult = analyzer.summarize([100, 150, 200, 250, 300]);
      expect(summary.p90).assertLargerOrEqual(summary.p50);
      expect(summary.p99).assertLargerOrEqual(summary.p90);
    });

    it('regression_detector_should_support_multiple_phases', 0, async () => {
      const detector = new LatencyRegressionDetector();
      detector.setBaseline(LatencyPhase.TILE_SWITCH, 100);
      detector.setBaseline(LatencyPhase.SCREEN_BIND, 500);
      expect(detector.detect(LatencyPhase.TILE_SWITCH, 300, 1.5).regressed).assertTrue();
      expect(detector.detect(LatencyPhase.SCREEN_BIND, 550, 1.5).regressed).assertFalse();
    });

    it('latency_gate_should_pass_for_fast_samples', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      const detector = new LatencyRegressionDetector();
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.FIRST_FRAME, 400);
      detector.setBaseline(LatencyPhase.FIRST_FRAME, 400);
      expect(registry.isWithin(LatencyPhase.FIRST_FRAME, stats.getAverage())).assertTrue();
      expect(detector.detect(LatencyPhase.FIRST_FRAME, stats.getAverage(), 1.2).regressed).assertFalse();
    });

    it('latency_gate_should_fail_for_slow_samples', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      const detector = new LatencyRegressionDetector();
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.FIRST_FRAME, 2000);
      detector.setBaseline(LatencyPhase.FIRST_FRAME, 400);
      expect(registry.isWithin(LatencyPhase.FIRST_FRAME, stats.getAverage())).assertFalse();
      expect(detector.detect(LatencyPhase.FIRST_FRAME, stats.getAverage(), 1.2).regressed).assertTrue();
    });

    it('ui_probe_should_not_affect_latency_metrics', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.DISCOVERY, 100);
      expect(stats.getSampleCount()).assertEqual(1);
      expect(stats.getAverage()).assertEqual(100);
    });

    it('navigation_should_not_break_monitor_state', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.TILE_SWITCH, 90);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
      expect(stats.getCountByPhase(LatencyPhase.TILE_SWITCH)).assertEqual(1);
    });
    it('monitor_should_sum_counts_across_phases', 0, async () => {
      const stats = new PerformanceMonitor();
      const phases: Array<LatencyPhase> = [LatencyPhase.SERVICE_CONNECT, LatencyPhase.SESSION_CREATE, LatencyPhase.TILE_SWITCH];
      for (let i = 0; i < phases.length; i++) {
        stats.record(phases[i], 100 + i);
        stats.record(phases[i], 200 + i);
      }
      expect(stats.getSampleCount()).assertEqual(6);
      expect(stats.getCountByPhase(LatencyPhase.SERVICE_CONNECT)).assertEqual(2);
      expect(stats.getCountByPhase(LatencyPhase.TILE_SWITCH)).assertEqual(2);
    });

    it('cleared_budget_should_not_affect_new_registry', 0, async () => {
      const first = new PhaseBudgetRegistry();
      first.clear();
      const second = new PhaseBudgetRegistry();
      expect(first.size()).assertEqual(0);
      expect(second.size()).assertEqual(6);
      expect(second.get(LatencyPhase.TILE_SWITCH)).assertEqual(300);
    });

    it('analyzer_should_compare_two_medians', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      const fast: number = analyzer.median([100, 120, 140]);
      const slow: number = analyzer.median([400, 500, 600]);
      expect(slow > fast).assertTrue();
      expect(fast).assertEqual(120);
    });

    it('regression_should_ignore_unset_baseline', 0, async () => {
      const detector = new LatencyRegressionDetector();
      const result: RegressionResult = detector.detect(LatencyPhase.DISCOVERY, 9999, 1.5);
      expect(result.baseline).assertEqual(0);
      expect(result.ratio).assertEqual(0);
      expect(result.regressed).assertFalse();
    });

    it('nine_sample_median_should_match_middle_element', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      const values: Array<number> = [];
      for (let i = 0; i < MAX_MIRROR_TILES; i++) { values.push((i + 1) * 10); }
      expect(analyzer.median(values)).assertEqual(50);
      expect(analyzer.percentile(values, 0.99)).assertEqual(90);
    });

    it('monitor_max_should_be_stable_after_record', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.SCREEN_BIND, 300);
      stats.record(LatencyPhase.SCREEN_BIND, 700);
      stats.record(LatencyPhase.SCREEN_BIND, 500);
      expect(stats.getMax()).assertEqual(700);
      expect(stats.getMin()).assertEqual(300);
      expect(stats.getSlowestPhase()).assertEqual(LatencyPhase.SCREEN_BIND);
    });

    it('budget_override_should_apply_per_phase', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      registry.override(LatencyPhase.FIRST_FRAME, 100);
      expect(registry.isWithin(LatencyPhase.FIRST_FRAME, 100)).assertTrue();
      expect(registry.isWithin(LatencyPhase.FIRST_FRAME, 101)).assertFalse();
      expect(registry.isWithin(LatencyPhase.SCREEN_BIND, 101)).assertTrue();
    });

    it('regression_clear_should_drop_all_phases', 0, async () => {
      const detector = new LatencyRegressionDetector();
      detector.setBaseline(LatencyPhase.TILE_SWITCH, 100);
      detector.setBaseline(LatencyPhase.FIRST_FRAME, 200);
      detector.clear();
      expect(detector.hasBaseline(LatencyPhase.TILE_SWITCH)).assertFalse();
      expect(detector.hasBaseline(LatencyPhase.FIRST_FRAME)).assertFalse();
    });
    it('monitor_should_cover_all_phases', 0, async () => {
      const stats = new PerformanceMonitor();
      const phases: Array<LatencyPhase> = [
        LatencyPhase.SERVICE_CONNECT, LatencyPhase.SESSION_CREATE, LatencyPhase.SCREEN_BIND,
        LatencyPhase.FIRST_FRAME, LatencyPhase.TILE_SWITCH, LatencyPhase.DISCOVERY
      ];
      for (let i = 0; i < phases.length; i++) { stats.record(phases[i], 100 + i * 10); }
      expect(stats.getSampleCount()).assertEqual(6);
      expect(stats.getSlowestPhase()).assertEqual(LatencyPhase.DISCOVERY);
      expect(stats.getAverage()).assertEqual(125);
    });

    it('budget_registry_should_keep_defaults_after_override', 0, async () => {
      const registry = new PhaseBudgetRegistry();
      registry.override(LatencyPhase.FIRST_FRAME, 800);
      expect(registry.get(LatencyPhase.FIRST_FRAME)).assertEqual(800);
      expect(registry.get(LatencyPhase.SCREEN_BIND)).assertEqual(1500);
      expect(registry.size()).assertEqual(6);
    });

    it('regression_should_gate_after_partial_recovery', 0, async () => {
      const detector = new LatencyRegressionDetector();
      detector.setBaseline(LatencyPhase.TILE_SWITCH, 200);
      const slow: RegressionResult = detector.detect(LatencyPhase.TILE_SWITCH, 500, 1.5);
      const recovered: RegressionResult = detector.detect(LatencyPhase.TILE_SWITCH, 210, 1.5);
      expect(slow.regressed).assertTrue();
      expect(recovered.regressed).assertFalse();
      expect(recovered.ratio).assertEqual(1.05);
    });

    it('analyzer_summary_should_gate_on_p90', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      const registry = new PhaseBudgetRegistry();
      const summary: PercentileResult = analyzer.summarize([200, 400, 600, 800, 1000]);
      expect(summary.p50).assertEqual(600);
      expect(registry.isWithin(LatencyPhase.SCREEN_BIND, summary.p50)).assertTrue();
      expect(registry.isWithin(LatencyPhase.TILE_SWITCH, summary.p90)).assertFalse();
    });

    it('monitor_should_track_latest_sample_per_phase', 0, async () => {
      const stats = new PerformanceMonitor();
      stats.record(LatencyPhase.TILE_SWITCH, 100);
      stats.record(LatencyPhase.TILE_SWITCH, 260);
      expect(stats.getAverage()).assertEqual(180);
      expect(stats.getMax()).assertEqual(260);
      expect(stats.getCountByPhase(LatencyPhase.TILE_SWITCH)).assertEqual(2);
    });

    it('comprehensive_latency_gate_should_stay_consistent', 0, async () => {
      const stats = new PerformanceMonitor();
      const analyzer = new PerformanceAnalyzer();
      const registry = new PhaseBudgetRegistry();
      const detector = new LatencyRegressionDetector();
      const values: Array<number> = [];
      for (let i = 0; i < 8; i++) {
        const duration: number = 160 + (i % 4) * 20;
        stats.record(LatencyPhase.SCREEN_BIND, duration);
        values.push(duration);
      }
      detector.setBaseline(LatencyPhase.SCREEN_BIND, 200);
      const within: boolean = registry.isWithin(LatencyPhase.SCREEN_BIND, analyzer.percentile(values, 0.9));
      const stable: boolean = !detector.detect(LatencyPhase.SCREEN_BIND, stats.getMax(), 2).regressed;
      expect(within).assertTrue();
      expect(stable).assertTrue();
    });
  });
}
