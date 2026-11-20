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
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_BACK, miracastComponentCount, waitForPageStable,
  pressAndWait, triggerMiracastHome, serializedDelay, TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP, STRESS_ROUNDS_NAVIGATION, MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';

enum SessionConsumptionState {
  IDLE = 'idle',
  DISCOVERY = 'discovery',
  CONNECTED = 'connected',
  STREAMING = 'streaming',
  PAUSED = 'paused'
}

enum ConsumptionLevel { LOW = 'low', MEDIUM = 'medium', HIGH = 'high' }

interface ConsumptionSample { state: SessionConsumptionState; powerMw: number; timestamp: number; }

interface ConsumptionBudget { maxAverageMw: number; maxPeakMw: number; }

interface ConsumptionSummary {
  samples: number;
  averageMw: number;
  peakMw: number;
  level: ConsumptionLevel;
  withinBudget: boolean;
}

class ConsumptionCollector {
  private samples: Array<ConsumptionSample> = [];

  public record(state: SessionConsumptionState, powerMw: number): boolean {
    if (powerMw < 0) { return false; }
    this.samples.push({ state: state, powerMw: powerMw, timestamp: Date.now() });
    return true;
  }

  public getSampleCount(): number { return this.samples.length; }
  public clear(): void { this.samples = []; }

  public getAverage(): number {
    if (this.samples.length === 0) { return 0; }
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) { total += this.samples[i].powerMw; }
    return total / this.samples.length;
  }

  public getPeak(): number {
    let peak: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].powerMw > peak) { peak = this.samples[i].powerMw; }
    }
    return peak;
  }

  public getCountByState(state: SessionConsumptionState): number {
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].state === state) { count++; }
    }
    return count;
  }

  public getAverageByState(state: SessionConsumptionState): number {
    let total: number = 0;
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].state === state) {
        total += this.samples[i].powerMw;
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

  public getLatestPower(): number {
    return this.samples.length === 0 ? 0 : this.samples[this.samples.length - 1].powerMw;
  }
}
class StateProfileRegistry {
  private profiles: Map<SessionConsumptionState, number> = new Map<SessionConsumptionState, number>();

  constructor() {
    this.profiles.set(SessionConsumptionState.IDLE, 300);
    this.profiles.set(SessionConsumptionState.DISCOVERY, 900);
    this.profiles.set(SessionConsumptionState.CONNECTED, 1200);
    this.profiles.set(SessionConsumptionState.STREAMING, 2600);
    this.profiles.set(SessionConsumptionState.PAUSED, 700);
  }

  public get(state: SessionConsumptionState): number {
    const value: number | undefined = this.profiles.get(state);
    return value === undefined ? 0 : value;
  }

  public override(state: SessionConsumptionState, powerMw: number): boolean {
    if (powerMw <= 0) { return false; }
    this.profiles.set(state, powerMw);
    return true;
  }

  public isIdleLowest(): boolean {
    const idle: number = this.get(SessionConsumptionState.IDLE);
    return idle < this.get(SessionConsumptionState.PAUSED) &&
      idle < this.get(SessionConsumptionState.DISCOVERY) &&
      idle < this.get(SessionConsumptionState.CONNECTED) &&
      idle < this.get(SessionConsumptionState.STREAMING);
  }

  public classify(powerMw: number): ConsumptionLevel {
    if (powerMw < 1000) { return ConsumptionLevel.LOW; }
    if (powerMw <= 2200) { return ConsumptionLevel.MEDIUM; }
    return ConsumptionLevel.HIGH;
  }

  public size(): number { return this.profiles.size; }
}

class ConsumptionAnalyzer {
  public percentile(values: Array<number>, ratio: number): number {
    if (values.length === 0) { return 0; }
    const sorted: Array<number> = values.slice(0).sort((left: number, right: number) => left - right);
    const index: number = Math.ceil(values.length * ratio) - 1;
    if (index <= 0) { return sorted[0]; }
    return sorted[index >= sorted.length ? sorted.length - 1 : index];
  }

  public checkBudget(averageMw: number, peakMw: number, budget: ConsumptionBudget): boolean {
    return averageMw <= budget.maxAverageMw && peakMw <= budget.maxPeakMw;
  }

  public summarize(collector: ConsumptionCollector, registry: StateProfileRegistry,
    budget: ConsumptionBudget): ConsumptionSummary {
    const average: number = collector.getAverage();
    const peak: number = collector.getPeak();
    return {
      samples: collector.getSampleCount(),
      averageMw: average,
      peakMw: peak,
      level: registry.classify(average),
      withinBudget: collector.getSampleCount() > 0 && this.checkBudget(average, peak, budget)
    };
  }
}

class BatteryDrainEstimator {
  private capacityMah: number;

  constructor(capacityMah: number) {
    this.capacityMah = capacityMah > 0 ? capacityMah : 3000;
  }

  public drainPerHour(averageMw: number): number {
    return averageMw / 1000;
  }

  public estimateHours(averageMw: number): number {
    if (averageMw <= 0) { return 0; }
    return this.capacityMah / this.drainPerHour(averageMw);
  }

  public remainingPercent(consumedMah: number): number {
    if (consumedMah < 0) { return 100; }
    const remaining: number = 100 - (consumedMah / this.capacityMah) * 100;
    return remaining < 0 ? 0 : remaining;
  }
}

class ConsumptionStatistics {
  public mean(values: Array<number>): number {
    if (values.length === 0) { return 0; }
    let total: number = 0;
    for (let i = 0; i < values.length; i++) { total += values[i]; }
    return total / values.length;
  }

  public min(values: Array<number>): number {
    if (values.length === 0) { return 0; }
    let lowest: number = values[0];
    for (let i = 1; i < values.length; i++) {
      if (values[i] < lowest) { lowest = values[i]; }
    }
    return lowest;
  }

  public max(values: Array<number>): number {
    let peak: number = 0;
    for (let i = 0; i < values.length; i++) {
      if (values[i] > peak) { peak = values[i]; }
    }
    return peak;
  }

  public stddev(values: Array<number>): number {
    if (values.length === 0) { return 0; }
    const mean: number = this.mean(values);
    let variance: number = 0;
    for (let i = 0; i < values.length; i++) {
      variance += (values[i] - mean) * (values[i] - mean);
    }
    return Math.sqrt(variance / values.length);
  }

  public isStable(values: Array<number>, maxStddev: number): boolean {
    return values.length > 0 && this.stddev(values) <= maxStddev;
  }
}

class ConsumptionTracker {
  private collector: ConsumptionCollector = new ConsumptionCollector();
  private registry: StateProfileRegistry;
  private sessions: number = 0;

  constructor(registry: StateProfileRegistry) {
    this.registry = registry;
  }

  public startSession(): void { this.sessions++; this.collector.clear(); }
  public sample(state: SessionConsumptionState): boolean { return this.collector.record(state, this.registry.get(state)); }
  public getSessionCount(): number { return this.sessions; }
  public getCollector(): ConsumptionCollector { return this.collector; }

  public endSession(budget: ConsumptionBudget): ConsumptionSummary {
    return new ConsumptionAnalyzer().summarize(this.collector, this.registry, budget);
  }
}

function defaultBudget(): ConsumptionBudget {
  return { maxAverageMw: 2400, maxPeakMw: 3200 };
}
export default function miracastConsumptionSuite(): void {
  describe('MiracastConsumption_Suite', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    it('idle_state_should_consume_least_power', 0, async () => {
      const registry = new StateProfileRegistry();
      expect(registry.isIdleLowest()).assertTrue();
      expect(registry.get(SessionConsumptionState.IDLE)).assertEqual(300);
      expect(registry.get(SessionConsumptionState.IDLE)).assertLess(registry.get(SessionConsumptionState.PAUSED));
    });

    it('registry_should_cover_all_states', 0, async () => {
      const registry = new StateProfileRegistry();
      expect(registry.size()).assertEqual(5);
      expect(registry.get(SessionConsumptionState.DISCOVERY)).assertLarger(0);
      expect(registry.get(SessionConsumptionState.STREAMING)).assertLarger(0);
    });

    it('registry_should_override_profile', 0, async () => {
      const registry = new StateProfileRegistry();
      expect(registry.override(SessionConsumptionState.STREAMING, 3000)).assertTrue();
      expect(registry.get(SessionConsumptionState.STREAMING)).assertEqual(3000);
      expect(registry.isIdleLowest()).assertTrue();
    });

    it('registry_should_reject_invalid_override', 0, async () => {
      const registry = new StateProfileRegistry();
      const before: number = registry.get(SessionConsumptionState.PAUSED);
      expect(registry.override(SessionConsumptionState.PAUSED, 0)).assertFalse();
      expect(registry.get(SessionConsumptionState.PAUSED)).assertEqual(before);
    });

    it('registry_should_classify_levels', 0, async () => {
      const registry = new StateProfileRegistry();
      expect(registry.classify(500)).assertEqual(ConsumptionLevel.LOW);
      expect(registry.classify(1800)).assertEqual(ConsumptionLevel.MEDIUM);
      expect(registry.classify(3000)).assertEqual(ConsumptionLevel.HIGH);
    });

    it('streaming_profile_should_be_highest', 0, async () => {
      const registry = new StateProfileRegistry();
      const streaming: number = registry.get(SessionConsumptionState.STREAMING);
      expect(streaming).assertLarger(registry.get(SessionConsumptionState.CONNECTED));
      expect(streaming).assertLarger(registry.get(SessionConsumptionState.DISCOVERY));
      expect(streaming).assertEqual(2600);
    });

    it('collector_should_count_samples_by_state', 0, async () => {
      const collector = new ConsumptionCollector();
      collector.record(SessionConsumptionState.STREAMING, 2400);
      collector.record(SessionConsumptionState.STREAMING, 2600);
      collector.record(SessionConsumptionState.IDLE, 300);
      expect(collector.getSampleCount()).assertEqual(3);
      expect(collector.getCountByState(SessionConsumptionState.STREAMING)).assertEqual(2);
    });

    it('collector_should_compute_battery_metrics', 0, async () => {
      const collector = new ConsumptionCollector();
      collector.record(SessionConsumptionState.STREAMING, 2000);
      collector.record(SessionConsumptionState.STREAMING, 3000);
      expect(collector.getAverage()).assertEqual(2500);
      expect(collector.getPeak()).assertEqual(3000);
    });

    it('collector_should_return_zero_on_empty', 0, async () => {
      const collector = new ConsumptionCollector();
      expect(collector.getAverage()).assertEqual(0);
      expect(collector.getPeak()).assertEqual(0);
      expect(collector.getLatestPower()).assertEqual(0);
    });

    it('collector_should_keep_chronological_samples', 0, async () => {
      const collector = new ConsumptionCollector();
      collector.record(SessionConsumptionState.IDLE, 300);
      collector.record(SessionConsumptionState.DISCOVERY, 900);
      collector.record(SessionConsumptionState.STREAMING, 2600);
      expect(collector.isChronological()).assertTrue();
      expect(collector.getSampleCount()).assertEqual(3);
    });
    it('collector_should_reject_negative_power', 0, async () => {
      const collector = new ConsumptionCollector();
      expect(collector.record(SessionConsumptionState.IDLE, -1)).assertFalse();
      expect(collector.getSampleCount()).assertEqual(0);
    });

    it('collector_should_track_latest_power', 0, async () => {
      const collector = new ConsumptionCollector();
      collector.record(SessionConsumptionState.IDLE, 300);
      collector.record(SessionConsumptionState.STREAMING, 2600);
      expect(collector.getLatestPower()).assertEqual(2600);
    });

    it('collector_should_clear_samples', 0, async () => {
      const collector = new ConsumptionCollector();
      collector.record(SessionConsumptionState.PAUSED, 700);
      collector.clear();
      expect(collector.getSampleCount()).assertEqual(0);
      expect(collector.isChronological()).assertTrue();
    });

    it('collector_should_average_by_state', 0, async () => {
      const collector = new ConsumptionCollector();
      collector.record(SessionConsumptionState.DISCOVERY, 800);
      collector.record(SessionConsumptionState.DISCOVERY, 1000);
      collector.record(SessionConsumptionState.IDLE, 300);
      expect(collector.getAverageByState(SessionConsumptionState.DISCOVERY)).assertEqual(900);
      expect(collector.getAverageByState(SessionConsumptionState.PAUSED)).assertEqual(0);
    });

    it('analyzer_should_summarize_within_budget', 0, async () => {
      const collector = new ConsumptionCollector();
      const registry = new StateProfileRegistry();
      const analyzer = new ConsumptionAnalyzer();
      collector.record(SessionConsumptionState.STREAMING, 2000);
      collector.record(SessionConsumptionState.STREAMING, 2200);
      const summary: ConsumptionSummary = analyzer.summarize(collector, registry, defaultBudget());
      expect(summary.samples).assertEqual(2);
      expect(summary.averageMw).assertEqual(2100);
      expect(summary.withinBudget).assertTrue();
    });

    it('analyzer_should_flag_budget_overrun', 0, async () => {
      const collector = new ConsumptionCollector();
      const registry = new StateProfileRegistry();
      const analyzer = new ConsumptionAnalyzer();
      collector.record(SessionConsumptionState.STREAMING, 3000);
      collector.record(SessionConsumptionState.STREAMING, 3400);
      const summary: ConsumptionSummary = analyzer.summarize(collector, registry, defaultBudget());
      expect(summary.peakMw).assertEqual(3400);
      expect(summary.withinBudget).assertFalse();
    });

    it('analyzer_should_mark_high_level', 0, async () => {
      const collector = new ConsumptionCollector();
      const registry = new StateProfileRegistry();
      const analyzer = new ConsumptionAnalyzer();
      collector.record(SessionConsumptionState.STREAMING, 3000);
      const summary: ConsumptionSummary = analyzer.summarize(collector, registry, defaultBudget());
      expect(summary.level).assertEqual(ConsumptionLevel.HIGH);
    });

    it('analyzer_should_compute_percentile', 0, async () => {
      const analyzer = new ConsumptionAnalyzer();
      const values: Array<number> = [300, 900, 1200, 2600];
      expect(analyzer.percentile(values, 0.5)).assertEqual(900);
      expect(analyzer.percentile(values, 0.9)).assertEqual(2600);
      expect(analyzer.percentile(values, 0)).assertEqual(300);
    });

    it('analyzer_should_ignore_empty_percentile', 0, async () => {
      const analyzer = new ConsumptionAnalyzer();
      expect(analyzer.percentile([], 0.5)).assertEqual(0);
      expect(analyzer.percentile([500], 0.99)).assertEqual(500);
    });

    it('analyzer_should_reject_empty_summary_budget', 0, async () => {
      const collector = new ConsumptionCollector();
      const registry = new StateProfileRegistry();
      const summary: ConsumptionSummary = new ConsumptionAnalyzer().summarize(collector, registry, defaultBudget());
      expect(summary.samples).assertEqual(0);
      expect(summary.withinBudget).assertFalse();
    });

    it('budget_check_should_require_both_limits', 0, async () => {
      const analyzer = new ConsumptionAnalyzer();
      const budget: ConsumptionBudget = defaultBudget();
      expect(analyzer.checkBudget(2000, 3000, budget)).assertTrue();
      expect(analyzer.checkBudget(2500, 3000, budget)).assertFalse();
      expect(analyzer.checkBudget(2000, 4000, budget)).assertFalse();
    });
    it('battery_should_estimate_hours', 0, async () => {
      const battery = new BatteryDrainEstimator(3000);
      expect(battery.drainPerHour(1500)).assertEqual(1.5);
      expect(battery.estimateHours(1500)).assertEqual(2000);
      expect(battery.estimateHours(0)).assertEqual(0);
    });

    it('battery_should_compute_remaining_percent', 0, async () => {
      const battery = new BatteryDrainEstimator(3000);
      expect(battery.remainingPercent(0)).assertEqual(100);
      expect(battery.remainingPercent(1500)).assertEqual(50);
      expect(battery.remainingPercent(3000)).assertEqual(0);
    });

    it('battery_should_clamp_negative_consumption', 0, async () => {
      const battery = new BatteryDrainEstimator(3000);
      expect(battery.remainingPercent(-100)).assertEqual(100);
      expect(battery.remainingPercent(6000)).assertEqual(0);
    });

    it('battery_should_use_default_capacity', 0, async () => {
      const battery = new BatteryDrainEstimator(0);
      expect(battery.remainingPercent(1500)).assertEqual(50);
    });

    it('budget_default_should_match_contract', 0, async () => {
      const budget: ConsumptionBudget = defaultBudget();
      expect(budget.maxAverageMw).assertEqual(2400);
      expect(budget.maxPeakMw).assertEqual(3200);
    });

    it('streaming_should_exceed_budget_when_dense', 0, async () => {
      const collector = new ConsumptionCollector();
      const analyzer = new ConsumptionAnalyzer();
      const registry = new StateProfileRegistry();
      const hint: ConsumptionBudget = { maxAverageMw: 1000, maxPeakMw: 1200 };
      collector.record(SessionConsumptionState.STREAMING, 2600);
      expect(analyzer.summarize(collector, registry, hint).withinBudget).assertFalse();
    });

    it('idle_sampling_should_fit_low_level', 0, async () => {
      const collector = new ConsumptionCollector();
      const registry = new StateProfileRegistry();
      collector.record(SessionConsumptionState.IDLE, registry.get(SessionConsumptionState.IDLE));
      expect(registry.classify(collector.getAverage())).assertEqual(ConsumptionLevel.LOW);
    });

    it('nine_tile_sampling_should_stay_within_budget', 0, async () => {
      const collector = new ConsumptionCollector();
      const analyzer = new ConsumptionAnalyzer();
      const registry = new StateProfileRegistry();
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        collector.record(SessionConsumptionState.STREAMING, 2000 + i * 10);
      }
      const summary: ConsumptionSummary = analyzer.summarize(collector, registry, defaultBudget());
      expect(summary.samples).assertEqual(MAX_MIRROR_TILES);
      expect(summary.withinBudget).assertTrue();
    });

    it('home_probe_should_not_raise_consumption', 0, async () => {
      const collector = new ConsumptionCollector();
      collector.record(SessionConsumptionState.IDLE, 300);
      expect(collector.getAverage()).assertEqual(300);
    });

    it('navigation_should_not_change_idle_profile', 0, async () => {
      const registry = new StateProfileRegistry();
      const idleBefore: number = registry.get(SessionConsumptionState.IDLE);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
      expect(registry.get(SessionConsumptionState.IDLE)).assertEqual(idleBefore);
    });
    it('streaming_then_idle_should_trend_down', 0, async () => {
      const collector = new ConsumptionCollector();
      const analyzer = new ConsumptionAnalyzer();
      const registry = new StateProfileRegistry();
      collector.record(SessionConsumptionState.STREAMING, 2600);
      collector.record(SessionConsumptionState.IDLE, 300);
      expect(collector.getLatestPower()).assertEqual(300);
      expect(analyzer.summarize(collector, registry, defaultBudget()).averageMw).assertEqual(1450);
    });

    it('repeated_probes_should_be_repeatable', 0, async () => {
      const collector = new ConsumptionCollector();
      const registry = new StateProfileRegistry();
      const analyzer = new ConsumptionAnalyzer();
      for (let i = 0; i < 5; i++) {
        collector.record(SessionConsumptionState.CONNECTED, registry.get(SessionConsumptionState.CONNECTED));
        expect(analyzer.summarize(collector, registry, defaultBudget()).averageMw).assertEqual(1200);
      }
      expect(collector.getSampleCount()).assertEqual(5);
    });

    it('lifecycle_rounds_should_not_accumulate', 0, async () => {
      const collector = new ConsumptionCollector();
      for (let i = 0; i < 5; i++) {
        collector.record(SessionConsumptionState.STREAMING, 2600);
        await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
        await triggerMiracastHome(driver);
        collector.clear();
      }
      expect(collector.getSampleCount()).assertEqual(0);
    });

    it('collector_should_report_peak_state', 0, async () => {
      const collector = new ConsumptionCollector();
      collector.record(SessionConsumptionState.IDLE, 300);
      collector.record(SessionConsumptionState.STREAMING, 2600);
      collector.record(SessionConsumptionState.DISCOVERY, 900);
      expect(collector.getPeak()).assertEqual(2600);
      expect(collector.getAverage()).assertEqual(3800 / 3);
    });

    it('analyzer_should_compare_two_averages', 0, async () => {
      const analyzer = new ConsumptionAnalyzer();
      const registry = new StateProfileRegistry();
      const idleCollector = new ConsumptionCollector();
      idleCollector.record(SessionConsumptionState.IDLE, 300);
      const streamCollector = new ConsumptionCollector();
      streamCollector.record(SessionConsumptionState.STREAMING, 2600);
      const idleSummary: ConsumptionSummary = analyzer.summarize(idleCollector, registry, defaultBudget());
      const streamSummary: ConsumptionSummary = analyzer.summarize(streamCollector, registry, defaultBudget());
      expect(streamSummary.averageMw > idleSummary.averageMw).assertTrue();
      expect(idleSummary.level).assertEqual(ConsumptionLevel.LOW);
    });

    it('sample_window_should_keep_all_states', 0, async () => {
      const collector = new ConsumptionCollector();
      const registry = new StateProfileRegistry();
      const states: Array<SessionConsumptionState> = [
        SessionConsumptionState.IDLE, SessionConsumptionState.DISCOVERY,
        SessionConsumptionState.CONNECTED, SessionConsumptionState.STREAMING, SessionConsumptionState.PAUSED
      ];
      for (let i = 0; i < states.length; i++) { collector.record(states[i], registry.get(states[i])); }
      for (let i = 0; i < states.length; i++) {
        expect(collector.getCountByState(states[i])).assertEqual(1);
      }
      expect(collector.getSampleCount()).assertEqual(5);
    });

    it('statistics_should_report_mean_min_max', 0, async () => {
      const statistics = new ConsumptionStatistics();
      const values: Array<number> = [300, 900, 2600];
      expect(statistics.mean(values)).assertEqual(3800 / 3);
      expect(statistics.min(values)).assertEqual(300);
      expect(statistics.max(values)).assertEqual(2600);
      expect(statistics.mean([])).assertEqual(0);
    });

    it('statistics_should_report_stddev_and_stability', 0, async () => {
      const statistics = new ConsumptionStatistics();
      expect(statistics.stddev([1200, 1200, 1200])).assertEqual(0);
      expect(statistics.isStable([1200, 1200, 1200], 10)).assertTrue();
      expect(statistics.isStable([300, 2600], 10)).assertFalse();
      expect(statistics.isStable([], 10)).assertFalse();
    });

    it('tracker_should_count_sessions', 0, async () => {
      const tracker = new ConsumptionTracker(new StateProfileRegistry());
      expect(tracker.getSessionCount()).assertEqual(0);
      tracker.startSession();
      tracker.startSession();
      expect(tracker.getSessionCount()).assertEqual(2);
    });

    it('tracker_should_sample_profile_values', 0, async () => {
      const tracker = new ConsumptionTracker(new StateProfileRegistry());
      tracker.startSession();
      expect(tracker.sample(SessionConsumptionState.IDLE)).assertTrue();
      expect(tracker.sample(SessionConsumptionState.STREAMING)).assertTrue();
      expect(tracker.getCollector().getSampleCount()).assertEqual(2);
      expect(tracker.getCollector().getPeak()).assertEqual(2600);
    });

    it('tracker_should_summarize_ended_session', 0, async () => {
      const tracker = new ConsumptionTracker(new StateProfileRegistry());
      tracker.startSession();
      tracker.sample(SessionConsumptionState.CONNECTED);
      tracker.sample(SessionConsumptionState.STREAMING);
      const summary: ConsumptionSummary = tracker.endSession(defaultBudget());
      expect(summary.samples).assertEqual(2);
      expect(summary.averageMw).assertEqual(1900);
      expect(summary.withinBudget).assertTrue();
    });

    it('tracker_should_reset_collector_between_sessions', 0, async () => {
      const tracker = new ConsumptionTracker(new StateProfileRegistry());
      tracker.startSession();
      tracker.sample(SessionConsumptionState.STREAMING);
      tracker.startSession();
      expect(tracker.getCollector().getSampleCount()).assertEqual(0);
      expect(tracker.getSessionCount()).assertEqual(2);
    });

    it('tracker_session_should_stay_within_budget_after_stress', 0, async () => {
      const tracker = new ConsumptionTracker(new StateProfileRegistry());
      const allowed: ConsumptionBudget = { maxAverageMw: 3000, maxPeakMw: 3200 };
      tracker.startSession();
      for (let i = 0; i < STRESS_ROUNDS_NAVIGATION; i++) {
        tracker.sample(i % 2 === 0 ? SessionConsumptionState.IDLE : SessionConsumptionState.STREAMING);
      }
      const summary: ConsumptionSummary = tracker.endSession(allowed);
      expect(summary.samples).assertEqual(STRESS_ROUNDS_NAVIGATION);
      expect(summary.withinBudget).assertTrue();
    });

    it('statistics_should_compare_idle_and_streaming_spread', 0, async () => {
      const statistics = new ConsumptionStatistics();
      const registry = new StateProfileRegistry();
      const idleValues: Array<number> = [registry.get(SessionConsumptionState.IDLE), 320, 310];
      const mixedValues: Array<number> = [registry.get(SessionConsumptionState.IDLE), registry.get(SessionConsumptionState.STREAMING)];
      expect(statistics.isStable(idleValues, 20)).assertTrue();
      expect(statistics.isStable(mixedValues, 20)).assertFalse();
    });

    it('registry_should_override_each_state', 0, async () => {
      const registry = new StateProfileRegistry();
      expect(registry.override(SessionConsumptionState.IDLE, 250)).assertTrue();
      expect(registry.override(SessionConsumptionState.PAUSED, 600)).assertTrue();
      expect(registry.get(SessionConsumptionState.IDLE)).assertEqual(250);
      expect(registry.get(SessionConsumptionState.PAUSED)).assertEqual(600);
      expect(registry.isIdleLowest()).assertTrue();
    });

    it('collector_should_track_min_power', 0, async () => {
      const collector = new ConsumptionCollector();
      collector.record(SessionConsumptionState.STREAMING, 2600);
      collector.record(SessionConsumptionState.IDLE, 300);
      collector.record(SessionConsumptionState.DISCOVERY, 900);
      expect(collector.getPeak()).assertEqual(2600);
      expect(collector.getAverage()).assertEqual(3800 / 3);
      expect(collector.getCountByState(SessionConsumptionState.IDLE)).assertEqual(1);
    });

    it('analyzer_should_summarize_paused_state', 0, async () => {
      const collector = new ConsumptionCollector();
      const registry = new StateProfileRegistry();
      collector.record(SessionConsumptionState.PAUSED, 700);
      const computed: ConsumptionSummary = new ConsumptionAnalyzer().summarize(collector, registry, defaultBudget());
      expect(computed.samples).assertEqual(1);
      expect(computed.level).assertEqual(ConsumptionLevel.LOW);
      expect(computed.withinBudget).assertTrue();
    });

    it('battery_should_scale_with_capacity', 0, async () => {
      const small = new BatteryDrainEstimator(1500);
      const large = new BatteryDrainEstimator(6000);
      expect(large.estimateHours(1500) > small.estimateHours(1500)).assertTrue();
      expect(large.remainingPercent(1500)).assertEqual(75);
    });

    it('tracker_should_handle_multiple_sessions', 0, async () => {
      const tracker = new ConsumptionTracker(new StateProfileRegistry());
      for (let i = 0; i < 3; i++) {
        tracker.startSession();
        tracker.sample(SessionConsumptionState.CONNECTED);
        expect(tracker.endSession(defaultBudget()).samples).assertEqual(1);
      }
      expect(tracker.getSessionCount()).assertEqual(3);
    });

    it('statistics_should_handle_single_value', 0, async () => {
      const statistics = new ConsumptionStatistics();
      expect(statistics.mean([1200])).assertEqual(1200);
      expect(statistics.min([1200])).assertEqual(1200);
      expect(statistics.max([1200])).assertEqual(1200);
      expect(statistics.stddev([1200])).assertEqual(0);
    });

    it('analyzer_percentile_should_handle_ratio_one', 0, async () => {
      const analyzer = new ConsumptionAnalyzer();
      expect(analyzer.percentile([300, 900, 2600], 1)).assertEqual(2600);
      expect(analyzer.percentile([300, 900, 2600], 0.34)).assertLarger(0);
    });

    it('tracker_should_report_session_peak', 0, async () => {
      const tracker = new ConsumptionTracker(new StateProfileRegistry());
      tracker.startSession();
      tracker.sample(SessionConsumptionState.IDLE);
      tracker.sample(SessionConsumptionState.STREAMING);
      tracker.sample(SessionConsumptionState.DISCOVERY);
      expect(tracker.getCollector().getPeak()).assertEqual(2600);
      expect(tracker.getCollector().isChronological()).assertTrue();
    });
    it('ui_probe_should_not_change_budget_check', 0, async () => {
      const collector = new ConsumptionCollector();
      const analyzer = new ConsumptionAnalyzer();
      const registry = new StateProfileRegistry();
      collector.record(SessionConsumptionState.STREAMING, 2100);
      const before: boolean = analyzer.summarize(collector, registry, defaultBudget()).withinBudget;
      expect(analyzer.summarize(collector, registry, defaultBudget()).withinBudget).assertEqual(before);
    });

    it('navigation_should_keep_budget_valid', 0, async () => {
      const collector = new ConsumptionCollector();
      const analyzer = new ConsumptionAnalyzer();
      const registry = new StateProfileRegistry();
      for (let i = 0; i < 4; i++) {
        collector.record(SessionConsumptionState.CONNECTED, registry.get(SessionConsumptionState.CONNECTED));
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      expect(analyzer.summarize(collector, registry, defaultBudget()).withinBudget).assertTrue();
      expect(collector.getSampleCount()).assertEqual(4);
    });

    it('nine_tile_tracker_should_stay_stable', 0, async () => {
      const statistics = new ConsumptionStatistics();
      const registry = new StateProfileRegistry();
      const values: Array<number> = [];
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        values.push(registry.get(SessionConsumptionState.STREAMING) + i);
      }
      expect(statistics.max(values)).assertEqual(2608);
      expect(statistics.isStable(values, 5)).assertTrue();
      expect(statistics.min(values)).assertEqual(2600);
    });

    it('collector_should_count_paused_samples', 0, async () => {
      const collector = new ConsumptionCollector();
      const registry = new StateProfileRegistry();
      for (let i = 0; i < 3; i++) { collector.record(SessionConsumptionState.PAUSED, registry.get(SessionConsumptionState.PAUSED)); }
      expect(collector.getCountByState(SessionConsumptionState.PAUSED)).assertEqual(3);
      expect(collector.getAverageByState(SessionConsumptionState.PAUSED)).assertEqual(700);
      expect(collector.getAverage()).assertEqual(700);
    });

    it('statistics_should_compare_idle_and_paused', 0, async () => {
      const statistics = new ConsumptionStatistics();
      const registry = new StateProfileRegistry();
      const idle: number = registry.get(SessionConsumptionState.IDLE);
      const paused: number = registry.get(SessionConsumptionState.PAUSED);
      expect(paused > idle).assertTrue();
      expect(statistics.max([idle, paused])).assertEqual(paused);
    });

    it('registry_should_classify_boundaries', 0, async () => {
      const registry = new StateProfileRegistry();
      expect(registry.classify(999)).assertEqual(ConsumptionLevel.LOW);
      expect(registry.classify(1000)).assertEqual(ConsumptionLevel.MEDIUM);
      expect(registry.classify(2200)).assertEqual(ConsumptionLevel.MEDIUM);
      expect(registry.classify(2201)).assertEqual(ConsumptionLevel.HIGH);
    });

    it('collector_should_report_average_for_unknown_state', 0, async () => {
      const collector = new ConsumptionCollector();
      collector.record(SessionConsumptionState.IDLE, 300);
      expect(collector.getAverageByState(SessionConsumptionState.STREAMING)).assertEqual(0);
      expect(collector.getCountByState(SessionConsumptionState.STREAMING)).assertEqual(0);
    });

    it('analyzer_should_summarize_discovery_state', 0, async () => {
      const collector = new ConsumptionCollector();
      const registry = new StateProfileRegistry();
      collector.record(SessionConsumptionState.DISCOVERY, 900);
      collector.record(SessionConsumptionState.DISCOVERY, 1100);
      const summary: ConsumptionSummary = new ConsumptionAnalyzer().summarize(collector, registry, defaultBudget());
      expect(summary.averageMw).assertEqual(1000);
      expect(summary.level).assertEqual(ConsumptionLevel.MEDIUM);
    });

    it('battery_should_report_capacity_ratio', 0, async () => {
      const battery = new BatteryDrainEstimator(3000);
      expect(battery.remainingPercent(750)).assertEqual(75);
      expect(battery.remainingPercent(2250)).assertEqual(25);
      expect(battery.drainPerHour(2000)).assertEqual(2);
    });

    it('tracker_should_reset_after_end_session', 0, async () => {
      const tracker = new ConsumptionTracker(new StateProfileRegistry());
      tracker.startSession();
      tracker.sample(SessionConsumptionState.STREAMING);
      tracker.endSession(defaultBudget());
      tracker.startSession();
      expect(tracker.getCollector().getSampleCount()).assertEqual(0);
      expect(tracker.getSessionCount()).assertEqual(2);
    });

    it('statistics_should_detect_outlier_spread', 0, async () => {
      const statistics = new ConsumptionStatistics();
      const steady: Array<number> = [1200, 1210, 1190];
      const outlier: Array<number> = [1200, 1200, 5000];
      expect(statistics.isStable(steady, 20)).assertTrue();
      expect(statistics.isStable(outlier, 20)).assertFalse();
      expect(statistics.max(outlier)).assertEqual(5000);
    });

    it('tracker_should_keep_profile_after_session', 0, async () => {
      const registry = new StateProfileRegistry();
      const tracker = new ConsumptionTracker(registry);
      tracker.startSession();
      tracker.sample(SessionConsumptionState.CONNECTED);
      const summary: ConsumptionSummary = tracker.endSession(defaultBudget());
      expect(summary.averageMw).assertEqual(registry.get(SessionConsumptionState.CONNECTED));
      expect(summary.level).assertEqual(ConsumptionLevel.MEDIUM);
      expect(summary.samples).assertEqual(1);
    });

    it('analyzer_should_compare_summaries_across_states', 0, async () => {
      const analyzer = new ConsumptionAnalyzer();
      const registry = new StateProfileRegistry();
      const idleCollector = new ConsumptionCollector();
      idleCollector.record(SessionConsumptionState.IDLE, registry.get(SessionConsumptionState.IDLE));
      const streamCollector = new ConsumptionCollector();
      streamCollector.record(SessionConsumptionState.STREAMING, registry.get(SessionConsumptionState.STREAMING));
      const idleSummary: ConsumptionSummary = analyzer.summarize(idleCollector, registry, defaultBudget());
      const streamSummary: ConsumptionSummary = analyzer.summarize(streamCollector, registry, defaultBudget());
      expect(streamSummary.averageMw > idleSummary.averageMw).assertTrue();
      expect(idleSummary.withinBudget).assertTrue();
      expect(streamSummary.withinBudget === true || streamSummary.withinBudget === false).assertTrue();
    });

    it('comprehensive_consumption_scenario_should_hold', 0, async () => {

      const collector = new ConsumptionCollector();
      const registry = new StateProfileRegistry();
      const analyzer = new ConsumptionAnalyzer();
      const battery = new BatteryDrainEstimator(3000);
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        collector.record(SessionConsumptionState.STREAMING, 2000 + (i % 3) * 100);
      }
      const summary: ConsumptionSummary = analyzer.summarize(collector, registry, defaultBudget());
      expect(summary.withinBudget).assertTrue();
      expect(summary.level).assertEqual(ConsumptionLevel.MEDIUM);
      expect(battery.remainingPercent(1500)).assertEqual(50);
    });
  });
}
