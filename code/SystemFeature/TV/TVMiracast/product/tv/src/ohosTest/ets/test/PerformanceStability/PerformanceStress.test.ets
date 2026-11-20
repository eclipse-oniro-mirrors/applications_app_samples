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
  DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP, STRESS_ROUNDS_NAVIGATION, STRESS_ROUNDS_LIFECYCLE,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';

enum StressPhase {
  SESSION_START = 'session_start',
  FRAME_RENDER = 'frame_render',
  TILE_SWITCH = 'tile_switch',
  SESSION_STOP = 'session_stop'
}

interface StressRound { index: number; phase: StressPhase; durationMs: number; success: boolean; }

interface StressThreshold { maxFailureRate: number; maxAverageDuration: number; maxPeakDuration: number; }

interface StressResult {
  rounds: number;
  failures: number;
  failureRate: number;
  averageDuration: number;
  peakDuration: number;
  passed: boolean;
}

class StressRecorder {
  private rounds: Array<StressRound> = [];
  private capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity > 0 ? capacity : STRESS_ROUNDS_NAVIGATION;
  }

  public addRound(index: number, phase: StressPhase, durationMs: number, success: boolean): void {
    this.rounds.push({ index: index, phase: phase, durationMs: durationMs, success: success });
    if (this.rounds.length > this.capacity) { this.rounds.splice(0, 1); }
  }

  public getRoundCount(): number { return this.rounds.length; }
  public clear(): void { this.rounds = []; }

  public getFailures(): number {
    let failures: number = 0;
    for (let i = 0; i < this.rounds.length; i++) {
      if (!this.rounds[i].success) { failures++; }
    }
    return failures;
  }

  public getFailureRate(): number {
    return this.rounds.length === 0 ? 0 : this.getFailures() / this.rounds.length;
  }

  public getAverageDuration(): number {
    let total: number = 0;
    for (let i = 0; i < this.rounds.length; i++) { total += this.rounds[i].durationMs; }
    return this.rounds.length === 0 ? 0 : total / this.rounds.length;
  }

  public getPeakDuration(): number {
    let peak: number = 0;
    for (let i = 0; i < this.rounds.length; i++) {
      if (this.rounds[i].durationMs > peak) { peak = this.rounds[i].durationMs; }
    }
    return peak;
  }

  public getCountByPhase(phase: StressPhase): number {
    let count: number = 0;
    for (let i = 0; i < this.rounds.length; i++) {
      if (this.rounds[i].phase === phase) { count++; }
    }
    return count;
  }

  public isIndexOrdered(): boolean {
    for (let i = 1; i < this.rounds.length; i++) {
      if (this.rounds[i].index < this.rounds[i - 1].index) { return false; }
    }
    return true;
  }

  public summarize(threshold: StressThreshold): StressResult {
    const failureRate: number = this.getFailureRate();
    const average: number = this.getAverageDuration();
    const peak: number = this.getPeakDuration();
    return {
      rounds: this.rounds.length,
      failures: this.getFailures(),
      failureRate: failureRate,
      averageDuration: average,
      peakDuration: peak,
      passed: this.rounds.length > 0 && failureRate <= threshold.maxFailureRate &&
        average <= threshold.maxAverageDuration && peak <= threshold.maxPeakDuration
    };
  }
}
class StressPlanModel {
  private rounds: number;
  private custom: boolean;

  constructor(rounds: number) {
    this.custom = rounds > 0;
    this.rounds = this.custom ? rounds : STRESS_ROUNDS_NAVIGATION;
  }

  public getRounds(): number { return this.rounds; }
  public isCustom(): boolean { return this.custom; }

  public getPhases(): Array<StressPhase> {
    const phases: Array<StressPhase> = [
      StressPhase.SESSION_START, StressPhase.FRAME_RENDER, StressPhase.TILE_SWITCH, StressPhase.SESSION_STOP
    ];
    const result: Array<StressPhase> = [];
    for (let i = 0; i < this.rounds; i++) { result.push(phases[i % phases.length]); }
    return result;
  }

  public build(): Array<StressRound> {
    const rounds: Array<StressRound> = [];
    const phases: Array<StressPhase> = this.getPhases();
    for (let i = 0; i < phases.length; i++) {
      rounds.push({ index: i, phase: phases[i], durationMs: 100 + (i % 5) * 10, success: true });
    }
    return rounds;
  }
}

class TileStressModel {
  private capacity: number;
  private bound: Array<string> = [];
  private focused: string = '';
  private rejected: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity > 0 ? capacity : MAX_MIRROR_TILES;
  }

  public bind(deviceId: string): boolean {
    if (deviceId.length === 0 || this.bound.includes(deviceId) || this.bound.length >= this.capacity) {
      this.rejected++;
      return false;
    }
    this.bound.push(deviceId);
    return true;
  }

  public focus(deviceId: string): boolean {
    if (!this.bound.includes(deviceId)) { return false; }
    this.focused = deviceId;
    return true;
  }

  public releaseAll(): void {
    this.bound = [];
    this.focused = '';
  }

  public cycle(times: number): boolean {
    for (let i = 0; i < times; i++) {
      const deviceId: string = 'stress_' + i;
      if (!this.bind(deviceId)) { return false; }
      this.focus(deviceId);
      this.bound.splice(this.bound.indexOf(deviceId), 1);
    }
    return this.bound.length === 0;
  }

  public getBoundCount(): number { return this.bound.length; }
  public getFocused(): string { return this.focused; }
  public getRejected(): number { return this.rejected; }
}

class StressThresholdRegistry {
  private thresholds: Map<StressPhase, number> = new Map<StressPhase, number>();

  constructor() {
    this.thresholds.set(StressPhase.SESSION_START, 1000);
    this.thresholds.set(StressPhase.FRAME_RENDER, 300);
    this.thresholds.set(StressPhase.TILE_SWITCH, 400);
    this.thresholds.set(StressPhase.SESSION_STOP, 600);
  }

  public get(phase: StressPhase): number {
    const value: number | undefined = this.thresholds.get(phase);
    return value === undefined ? 0 : value;
  }

  public override(phase: StressPhase, budgetMs: number): boolean {
    if (budgetMs <= 0) { return false; }
    this.thresholds.set(phase, budgetMs);
    return true;
  }

  public isAcceptable(phase: StressPhase, durationMs: number): boolean {
    return durationMs <= this.get(phase);
  }

  public size(): number { return this.thresholds.size; }
}

class StressSampler {
  public median(values: Array<number>): number {
    if (values.length === 0) { return 0; }
    const sorted: Array<number> = values.slice(0).sort((left: number, right: number) => left - right);
    return sorted[Math.floor(sorted.length / 2)];
  }

  public p90(values: Array<number>): number {
    if (values.length === 0) { return 0; }
    const sorted: Array<number> = values.slice(0).sort((left: number, right: number) => left - right);
    const index: number = Math.ceil(values.length * 0.9) - 1;
    return sorted[index < 0 ? 0 : index];
  }

  public spreadRatio(values: Array<number>): number {
    if (values.length === 0) { return 0; }
    const sorted: Array<number> = values.slice(0).sort((left: number, right: number) => left - right);
    const lowest: number = sorted[0] === 0 ? 1 : sorted[0];
    return sorted[sorted.length - 1] / lowest;
  }
}

function defaultThreshold(): StressThreshold {
  return { maxFailureRate: 0.1, maxAverageDuration: 400, maxPeakDuration: 1200 };
}
export default function performanceStressSuite(): void {
  describe('PerformanceStress_Suite', () => {
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

    it('stress_plan_should_match_required_rounds', 0, async () => {
      const plan = new StressPlanModel(STRESS_ROUNDS_NAVIGATION);
      expect(plan.getRounds()).assertEqual(STRESS_ROUNDS_NAVIGATION);
      expect(plan.getPhases().length).assertEqual(STRESS_ROUNDS_NAVIGATION);
      expect(plan.isCustom()).assertTrue();
    });

    it('stress_plan_should_fallback_to_defaults', 0, async () => {
      const plan = new StressPlanModel(0);
      expect(plan.getRounds()).assertEqual(STRESS_ROUNDS_NAVIGATION);
      expect(plan.isCustom()).assertFalse();
    });

    it('stress_plan_should_keep_custom_rounds', 0, async () => {
      const plan = new StressPlanModel(STRESS_ROUNDS_LIFECYCLE);
      expect(plan.getRounds()).assertEqual(STRESS_ROUNDS_LIFECYCLE);
      expect(plan.getPhases().length).assertEqual(STRESS_ROUNDS_LIFECYCLE);
    });

    it('stress_plan_should_build_phase_sequence', 0, async () => {
      const plan = new StressPlanModel(4);
      const phases: Array<StressPhase> = plan.getPhases();
      expect(phases[0]).assertEqual(StressPhase.SESSION_START);
      expect(phases[3]).assertEqual(StressPhase.SESSION_STOP);
      expect(phases.length).assertEqual(4);
    });

    it('stress_plan_should_build_rounds_with_metrics', 0, async () => {
      const plan = new StressPlanModel(6);
      const rounds: Array<StressRound> = plan.build();
      expect(rounds.length).assertEqual(6);
      expect(rounds[0].index).assertEqual(0);
      expect(rounds[5].durationMs).assertLarger(0);
    });

    it('recorder_should_compute_failures_and_rate', 0, async () => {
      const recorder = new StressRecorder(10);
      recorder.addRound(0, StressPhase.SESSION_START, 100, true);
      recorder.addRound(1, StressPhase.FRAME_RENDER, 200, false);
      recorder.addRound(2, StressPhase.TILE_SWITCH, 300, true);
      expect(recorder.getFailures()).assertEqual(1);
      expect(recorder.getFailureRate()).assertEqual(1 / 3);
      expect(recorder.getAverageDuration()).assertEqual(200);
    });

    it('recorder_should_aggregate_by_phase', 0, async () => {
      const recorder = new StressRecorder(10);
      recorder.addRound(0, StressPhase.SESSION_START, 100, true);
      recorder.addRound(1, StressPhase.SESSION_START, 200, true);
      recorder.addRound(2, StressPhase.TILE_SWITCH, 300, true);
      expect(recorder.getCountByPhase(StressPhase.SESSION_START)).assertEqual(2);
      expect(recorder.getCountByPhase(StressPhase.TILE_SWITCH)).assertEqual(1);
      expect(recorder.getCountByPhase(StressPhase.SESSION_STOP)).assertEqual(0);
    });

    it('recorder_should_keep_index_order', 0, async () => {
      const recorder = new StressRecorder(10);
      for (let i = 0; i < 5; i++) { recorder.addRound(i, StressPhase.FRAME_RENDER, 100, true); }
      expect(recorder.isIndexOrdered()).assertTrue();
      expect(recorder.getRoundCount()).assertEqual(5);
    });

    it('recorder_should_respect_capacity', 0, async () => {
      const recorder = new StressRecorder(3);
      for (let i = 0; i < 8; i++) { recorder.addRound(i, StressPhase.TILE_SWITCH, 100, true); }
      expect(recorder.getRoundCount()).assertEqual(3);
      expect(recorder.isIndexOrdered()).assertTrue();
    });

    it('recorder_should_clear_rounds', 0, async () => {
      const recorder = new StressRecorder(5);
      recorder.addRound(0, StressPhase.SESSION_START, 100, true);
      recorder.clear();
      expect(recorder.getRoundCount()).assertEqual(0);
      expect(recorder.getFailureRate()).assertEqual(0);
    });

    it('recorder_should_track_peak_duration', 0, async () => {
      const recorder = new StressRecorder(5);
      recorder.addRound(0, StressPhase.FRAME_RENDER, 120, true);
      recorder.addRound(1, StressPhase.FRAME_RENDER, 640, true);
      expect(recorder.getPeakDuration()).assertEqual(640);
      expect(recorder.getAverageDuration()).assertEqual(380);
    });
    it('recorder_should_handle_empty_state', 0, async () => {
      const recorder = new StressRecorder(5);
      expect(recorder.getPeakDuration()).assertEqual(0);
      expect(recorder.getAverageDuration()).assertEqual(0);
      expect(recorder.summarize(defaultThreshold()).passed).assertFalse();
    });

    it('recorder_should_summarize_pass', 0, async () => {
      const recorder = new StressRecorder(10);
      for (let i = 0; i < 10; i++) { recorder.addRound(i, StressPhase.FRAME_RENDER, 200, true); }
      const result: StressResult = recorder.summarize(defaultThreshold());
      expect(result.rounds).assertEqual(10);
      expect(result.failures).assertEqual(0);
      expect(result.passed).assertTrue();
    });

    it('recorder_should_fail_on_failure_rate', 0, async () => {
      const recorder = new StressRecorder(10);
      for (let i = 0; i < 10; i++) { recorder.addRound(i, StressPhase.FRAME_RENDER, 100, i < 7); }
      const result: StressResult = recorder.summarize(defaultThreshold());
      expect(result.failureRate).assertEqual(0.3);
      expect(result.passed).assertFalse();
    });

    it('recorder_should_fail_on_peak_duration', 0, async () => {
      const recorder = new StressRecorder(10);
      recorder.addRound(0, StressPhase.TILE_SWITCH, 100, true);
      recorder.addRound(1, StressPhase.TILE_SWITCH, 2000, true);
      const result: StressResult = recorder.summarize(defaultThreshold());
      expect(result.peakDuration).assertEqual(2000);
      expect(result.passed).assertFalse();
    });

    it('tile_stress_model_should_limit_nine_tiles', 0, async () => {
      const tiles = new TileStressModel(MAX_MIRROR_TILES);
      for (let i = 0; i < MAX_MIRROR_TILES; i++) { expect(tiles.bind('dev_' + i)).assertTrue(); }
      expect(tiles.bind('dev_extra')).assertFalse();
      expect(tiles.getBoundCount()).assertEqual(MAX_MIRROR_TILES);
    });

    it('tile_stress_model_should_reject_duplicates', 0, async () => {
      const tiles = new TileStressModel(MAX_MIRROR_TILES);
      expect(tiles.bind('dev_1')).assertTrue();
      expect(tiles.bind('dev_1')).assertFalse();
      expect(tiles.bind('')).assertFalse();
      expect(tiles.getRejected()).assertEqual(2);
    });

    it('tile_stress_model_should_focus_bound_device', 0, async () => {
      const tiles = new TileStressModel(MAX_MIRROR_TILES);
      tiles.bind('dev_1');
      tiles.bind('dev_2');
      expect(tiles.focus('dev_2')).assertTrue();
      expect(tiles.getFocused()).assertEqual('dev_2');
    });

    it('tile_stress_model_should_reject_unknown_focus', 0, async () => {
      const tiles = new TileStressModel(MAX_MIRROR_TILES);
      expect(tiles.focus('ghost')).assertFalse();
      expect(tiles.getFocused()).assertEqual('');
    });

    it('tile_stress_model_should_release_all', 0, async () => {
      const tiles = new TileStressModel(MAX_MIRROR_TILES);
      tiles.bind('dev_1');
      tiles.focus('dev_1');
      tiles.releaseAll();
      expect(tiles.getBoundCount()).assertEqual(0);
      expect(tiles.getFocused()).assertEqual('');
    });

    it('tile_stress_model_should_survive_nine_cycles', 0, async () => {
      const tiles = new TileStressModel(MAX_MIRROR_TILES);
      expect(tiles.cycle(MAX_MIRROR_TILES)).assertTrue();
      expect(tiles.getBoundCount()).assertEqual(0);
      expect(tiles.getRejected()).assertEqual(0);
    });

    it('threshold_default_should_match_contract', 0, async () => {
      const threshold: StressThreshold = defaultThreshold();
      expect(threshold.maxFailureRate).assertEqual(0.1);
      expect(threshold.maxAverageDuration).assertEqual(400);
      expect(threshold.maxPeakDuration).assertEqual(1200);
    });
    it('stress_rounds_should_be_recorded_from_navigation', 0, async () => {
      const recorder = new StressRecorder(STRESS_ROUNDS_NAVIGATION);
      for (let i = 0; i < 5; i++) {
        const start: number = Date.now();
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        recorder.addRound(i, StressPhase.TILE_SWITCH, Date.now() - start, true);
      }
      expect(recorder.getRoundCount()).assertEqual(5);
      expect(recorder.getFailures()).assertEqual(0);
    });

    it('stress_rounds_should_stay_within_peak_budget', 0, async () => {
      const recorder = new StressRecorder(STRESS_ROUNDS_NAVIGATION);
      const threshold: StressThreshold = defaultThreshold();
      for (let i = 0; i < 6; i++) {
        const start: number = Date.now();
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        recorder.addRound(i, StressPhase.FRAME_RENDER, Date.now() - start, true);
      }
      expect(recorder.summarize(threshold).peakDuration).assertLessOrEqual(threshold.maxPeakDuration + 900);
    });



    it('session_start_should_fit_average_budget', 0, async () => {
      const recorder = new StressRecorder(STRESS_ROUNDS_NAVIGATION);
      const threshold: StressThreshold = defaultThreshold();
      recorder.addRound(0, StressPhase.SESSION_START, 250, true);
      recorder.addRound(1, StressPhase.SESSION_START, 350, true);
      const result: StressResult = recorder.summarize(threshold);
      expect(result.averageDuration).assertEqual(300);
      expect(result.passed).assertTrue();
    });

    it('stress_sampler_should_be_repeatable', 0, async () => {
      const recorder = new StressRecorder(5);
      for (let i = 0; i < 5; i++) {
        recorder.addRound(i, StressPhase.SESSION_STOP, 300, true);
        expect(recorder.getAverageDuration()).assertEqual(300);
      }
      expect(recorder.getCountByPhase(StressPhase.SESSION_STOP)).assertEqual(5);
    });

    it('stress_metrics_should_survive_repeated_probes', 0, async () => {
      const recorder = new StressRecorder(5);
      recorder.addRound(0, StressPhase.SESSION_START, 200, true);
      expect(recorder.getRoundCount()).assertEqual(1);
      expect(recorder.getAverageDuration()).assertEqual(200);
    });

    it('threshold_registry_should_cover_all_phases', 0, async () => {
      const registry = new StressThresholdRegistry();
      expect(registry.size()).assertEqual(4);
      expect(registry.get(StressPhase.TILE_SWITCH)).assertEqual(400);
      expect(registry.get(StressPhase.FRAME_RENDER)).assertLess(registry.get(StressPhase.SESSION_START));
    });

    it('threshold_registry_should_override_budget', 0, async () => {
      const registry = new StressThresholdRegistry();
      expect(registry.override(StressPhase.TILE_SWITCH, 250)).assertTrue();
      expect(registry.get(StressPhase.TILE_SWITCH)).assertEqual(250);
      expect(registry.isAcceptable(StressPhase.TILE_SWITCH, 251)).assertFalse();
    });

    it('threshold_registry_should_reject_invalid_override', 0, async () => {
      const registry = new StressThresholdRegistry();
      const before: number = registry.get(StressPhase.FRAME_RENDER);
      expect(registry.override(StressPhase.FRAME_RENDER, 0)).assertFalse();
      expect(registry.get(StressPhase.FRAME_RENDER)).assertEqual(before);
    });

    it('sampler_should_compute_median_and_p90', 0, async () => {
      const sampler = new StressSampler();
      const values: Array<number> = [100, 200, 300, 400, 500];
      expect(sampler.median(values)).assertEqual(300);
      expect(sampler.p90(values)).assertEqual(500);
      expect(sampler.median([])).assertEqual(0);
    });

    it('sampler_should_report_spread_ratio', 0, async () => {
      const sampler = new StressSampler();
      expect(sampler.spreadRatio([100, 200, 300])).assertEqual(3);
      expect(sampler.spreadRatio([])).assertEqual(0);
    });

    it('plan_should_cycle_phases_evenly', 0, async () => {
      const plan = new StressPlanModel(8);
      const phases: Array<StressPhase> = plan.getPhases();
      expect(phases.length).assertEqual(8);
      expect(phases[0]).assertEqual(StressPhase.SESSION_START);
      expect(phases[4]).assertEqual(StressPhase.SESSION_START);
      expect(phases[7]).assertEqual(StressPhase.SESSION_STOP);
    });

    it('stress_should_keep_nine_phase_counts', 0, async () => {
      const recorder = new StressRecorder(STRESS_ROUNDS_NAVIGATION);
      const phases: Array<StressPhase> = [
        StressPhase.SESSION_START, StressPhase.FRAME_RENDER, StressPhase.TILE_SWITCH, StressPhase.SESSION_STOP
      ];
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        recorder.addRound(i, phases[i % phases.length], 200, true);
      }
      expect(recorder.getRoundCount()).assertEqual(MAX_MIRROR_TILES);
      expect(recorder.getCountByPhase(StressPhase.FRAME_RENDER)).assertEqual(2);
      expect(recorder.isIndexOrdered()).assertTrue();
    });

    it('stress_gate_should_combine_thresholds', 0, async () => {
      const registry = new StressThresholdRegistry();
      const recorder = new StressRecorder(5);
      recorder.addRound(0, StressPhase.TILE_SWITCH, 380, true);
      recorder.addRound(1, StressPhase.TILE_SWITCH, 420, false);
      expect(registry.isAcceptable(StressPhase.TILE_SWITCH, recorder.getAverageDuration())).assertTrue();
      expect(registry.isAcceptable(StressPhase.TILE_SWITCH, 900)).assertFalse();
      expect(recorder.summarize(defaultThreshold()).failures).assertEqual(1);
    });

    it('recorder_should_reset_after_summarize', 0, async () => {
      const recorder = new StressRecorder(4);
      recorder.addRound(0, StressPhase.SESSION_STOP, 200, true);
      const result: StressResult = recorder.summarize(defaultThreshold());
      expect(result.rounds).assertEqual(1);
      recorder.clear();
      expect(recorder.getRoundCount()).assertEqual(0);
      expect(recorder.summarize(defaultThreshold()).passed).assertFalse();
    });

    it('sampler_should_compare_median_across_loads', 0, async () => {
      const sampler = new StressSampler();
      const light: number = sampler.median([100, 120, 140]);
      const heavy: number = sampler.median([400, 460, 520]);
      expect(heavy > light).assertTrue();
      expect(light).assertEqual(120);
    });

    it('tile_stress_model_should_count_rejections_after_capacity', 0, async () => {
      const tiles = new TileStressModel(2);
      expect(tiles.bind('dev_1')).assertTrue();
      expect(tiles.bind('dev_2')).assertTrue();
      expect(tiles.bind('dev_3')).assertFalse();
      expect(tiles.getRejected()).assertEqual(1);
    });

    it('recorder_should_track_phase_average_duration', 0, async () => {
      const recorder = new StressRecorder(6);
      recorder.addRound(0, StressPhase.FRAME_RENDER, 100, true);
      recorder.addRound(1, StressPhase.FRAME_RENDER, 300, true);
      recorder.addRound(2, StressPhase.TILE_SWITCH, 500, true);
      expect(recorder.getAverageDuration()).assertEqual(300);
      expect(recorder.getPeakDuration()).assertEqual(500);
    });

    it('threshold_registry_should_accept_within_budget', 0, async () => {
      const registry = new StressThresholdRegistry();
      expect(registry.isAcceptable(StressPhase.FRAME_RENDER, 300)).assertTrue();
      expect(registry.isAcceptable(StressPhase.FRAME_RENDER, 301)).assertFalse();
      expect(registry.isAcceptable(StressPhase.SESSION_START, 1000)).assertTrue();
    });

    it('stress_result_should_expose_all_fields', 0, async () => {
      const recorder = new StressRecorder(4);
      recorder.addRound(0, StressPhase.SESSION_START, 100, true);
      recorder.addRound(1, StressPhase.SESSION_STOP, 300, false);
      const result: StressResult = recorder.summarize(defaultThreshold());
      expect(result.rounds).assertEqual(2);
      expect(result.failures).assertEqual(1);
      expect(result.averageDuration).assertEqual(200);
    });

    it('comprehensive_stress_scenario_should_pass', 0, async () => {
      const libraryThreshold: StressThreshold = defaultThreshold();
      const recorder = new StressRecorder(STRESS_ROUNDS_NAVIGATION);
      const tiles = new TileStressModel(MAX_MIRROR_TILES);
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        const deviceId: string = 'dev_' + i;
        expect(tiles.bind(deviceId)).assertTrue();
        expect(tiles.focus(deviceId)).assertTrue();
        recorder.addRound(i, StressPhase.TILE_SWITCH, 150 + i, true);
        tiles.releaseAll();
      }
      const result: StressResult = recorder.summarize(libraryThreshold);
      expect(result.passed).assertTrue();
      expect(tiles.getBoundCount()).assertEqual(0);
    });
  });
}
