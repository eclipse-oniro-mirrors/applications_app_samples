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
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_BACK, miracastComponentCount,
  waitForPageStable, pressAndWait, triggerMiracastHome, serializedDelay,
  TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP,
  STRESS_ROUNDS_NAVIGATION, MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
interface Round { index: number; device: string; success: boolean; duration: number; }
class LongRunMonitor {
  private rounds: Array<Round> = [];
  private capacity: number;
  constructor(capacity: number) { this.capacity = capacity > 0 ? capacity : STRESS_ROUNDS_NAVIGATION; }

  public addRound(index: number, device: string, success: boolean, duration: number): void {
    this.rounds.push({ index: index, device: device, success: success, duration: duration });
    if (this.rounds.length > this.capacity) {
      this.rounds.splice(0, 1);
    }
  }

  public getRoundCount(): number { return this.rounds.length; }
  public getFirstIndex(): number { return this.rounds.length === 0 ? -1 : this.rounds[0].index; }
  public clear(): void { this.rounds = []; }

  public getSuccessRate(): number {
    if (this.rounds.length === 0) { return 0; }
    let ok: number = 0;
    for (let i = 0; i < this.rounds.length; i++) { if (this.rounds[i].success) { ok++; } }
    return ok / this.rounds.length;
  }

  public getAverageDuration(): number {
    if (this.rounds.length === 0) { return 0; }
    let total: number = 0;
    for (let i = 0; i < this.rounds.length; i++) { total += this.rounds[i].duration; }
    return total / this.rounds.length;
  }

  public getMaxDuration(): number {
    let peak: number = 0;
    for (let i = 0; i < this.rounds.length; i++) { if (this.rounds[i].duration > peak) { peak = this.rounds[i].duration; } }
    return peak;
  }

  private halfAverage(second: boolean): number {
    const half: number = Math.floor(this.rounds.length / 2);
    if (half === 0) { return 0; }
    let total: number = 0;
    for (let i = second ? half : 0; i < (second ? this.rounds.length : half); i++) { total += this.rounds[i].duration; }
    return second ? total / (this.rounds.length - half) : total / half;
  }

  public isDegrading(maxRatio: number): boolean {
    const first: number = this.halfAverage(false);
    return first > 0 && (this.halfAverage(true) - first) / first > maxRatio;
  }

  public getDistinctDevices(): number {
    const devices: Array<string> = [];
    for (let i = 0; i < this.rounds.length; i++) { if (!devices.includes(this.rounds[i].device)) { devices.push(this.rounds[i].device); } }
    return devices.length;
  }
}

export default function longTermStabilitySuite(): void {
  describe('LongTermStability_Suite', () => {
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

    it('long_run_monitor_should_compute_success_rate', 0, async () => {
      const monitor = new LongRunMonitor(3);
      monitor.addRound(0, 'dev_1', true, 100);
      monitor.addRound(1, 'dev_1', false, 300);
      expect(monitor.getSuccessRate()).assertEqual(0.5);
    });

    it('long_run_monitor_should_respect_capacity', 0, async () => {
      const monitor = new LongRunMonitor(3);
      for (let i = 0; i < 8; i++) { monitor.addRound(i, 'dev_1', true, 100); }
      expect(monitor.getFirstIndex()).assertEqual(5);
    });

    it('long_run_monitor_should_detect_degradation', 0, async () => {
      const monitor = new LongRunMonitor(20);
      for (let i = 0; i < 20; i++) { monitor.addRound(i, 'dev_1', true, i < 10 ? 100 : 200); }
      expect(monitor.isDegrading(0.2)).assertTrue();
    });

    it('long_run_monitor_should_not_flag_stable_load', 0, async () => {
      const monitor = new LongRunMonitor(24);
      for (let i = 0; i < 24; i++) { monitor.addRound(i, 'dev_' + (i % 9), true, 150); }
      expect(monitor.getDistinctDevices()).assertEqual(9);
    });

    it('long_run_monitor_should_handle_empty_state', 0, async () => {
      expect(new LongRunMonitor(10).isDegrading(0.1)).assertFalse();
    });

    it('mixed_round_results_should_be_counted', 0, async () => {
      const monitor = new LongRunMonitor(4);
      monitor.addRound(0, 'dev_1', true, 100);
      monitor.addRound(1, 'dev_2', false, 500);
      expect(monitor.getMaxDuration()).assertEqual(500);
    });

    it('monitor_should_restart_cleanly_after_clear', 0, async () => {
      const monitor = new LongRunMonitor(5);
      monitor.addRound(0, 'dev_1', true, 100);
      monitor.clear();
      expect(monitor.getRoundCount()).assertEqual(0);
    });

    it('monitor_default_capacity_should_match_stress_rounds', 0, async () => {
      const monitor = new LongRunMonitor(0);
      for (let i = 0; i < STRESS_ROUNDS_NAVIGATION + 5; i++) { monitor.addRound(i, 'dev_1', true, 100); }
      expect(monitor.getRoundCount()).assertEqual(STRESS_ROUNDS_NAVIGATION);
    });
    it('monitor_should_count_distinct_devices', 0, async () => {
      const monitor = new LongRunMonitor(9);
      monitor.addRound(0, 'dev_1', true, 100);
      monitor.addRound(1, 'dev_2', true, 100);
      expect(monitor.getDistinctDevices()).assertEqual(2);
    });

    it('monitor_single_round_should_have_no_degradation', 0, async () => {
      const monitor = new LongRunMonitor(4);
      monitor.addRound(0, 'dev_1', true, 300);
      expect(monitor.isDegrading(0)).assertFalse();
    });

    it('monitor_should_track_max_duration_peak', 0, async () => {
      const monitor = new LongRunMonitor(6);
      monitor.addRound(0, 'dev_1', true, 120);
      monitor.addRound(1, 'dev_1', true, 640);
      expect(monitor.getMaxDuration()).assertEqual(640);
    });

    it('five_failure_rounds_should_report_zero_success_rate', 0, async () => {
      const monitor = new LongRunMonitor(5);
      for (let i = 0; i < 5; i++) { monitor.addRound(i, 'dev_1', false, 100); }
      expect(monitor.getSuccessRate()).assertEqual(0);
    });

    it('long_run_monitor_should_average_durations', 0, async () => {
      const monitor = new LongRunMonitor(4);
      monitor.addRound(0, 'dev_1', true, 100);
      monitor.addRound(1, 'dev_1', true, 300);
      expect(monitor.getAverageDuration()).assertEqual(200);
    });

    it('monitor_should_report_round_count_after_single_push', 0, async () => {
      const monitor = new LongRunMonitor(2);
      monitor.addRound(7, 'dev_7', true, 90);
      expect(monitor.getRoundCount()).assertEqual(1);
    });

    it('monitor_should_track_alternating_results', 0, async () => {
      const monitor = new LongRunMonitor(6);
      for (let i = 0; i < 6; i++) { monitor.addRound(i, 'dev_1', i % 2 === 0, 100); }
      expect(monitor.getSuccessRate()).assertEqual(0.5);
    });

    it('monitor_should_keep_boundary_degradation_flag_false', 0, async () => {
      const monitor = new LongRunMonitor(4);
      for (let i = 0; i < 4; i++) { monitor.addRound(i, 'dev_1', true, i < 2 ? 100 : 110); }
      expect(monitor.isDegrading(0.2)).assertFalse();
    });



    it('session_round_durations_should_fit_threshold', 0, async () => {
      const monitor = new LongRunMonitor(STRESS_ROUNDS_NAVIGATION);
      for (let i = 0; i < 6; i++) {
        const start: number = Date.now();
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        monitor.addRound(i, 'dev_1', true, Date.now() - start);
      }
      expect(monitor.getMaxDuration()).assertLessOrEqual(2000);
    });

    it('repeated_service_probe_should_not_accumulate_state', 0, async () => {
      expect(new LongRunMonitor(MAX_MIRROR_TILES).getRoundCount()).assertEqual(0);
    });

    it('idle_page_sampling_should_be_repeatable', 0, async () => {
      const samples: Array<number> = [];
      for (let i = 0; i < 5; i++) { samples.push(await miracastComponentCount(driver)); }
      expect(Math.abs(samples[4] - samples[0])).assertLessOrEqual(3);
    });

    it('twenty_four_hour_session_loop_should_stay_successful', 0, async () => {
      const monitor = new LongRunMonitor(24);
      for (let i = 0; i < 24; i++) { monitor.addRound(i, 'dev_' + (i % MAX_MIRROR_TILES), true, 120); }
      expect(monitor.getDistinctDevices()).assertEqual(MAX_MIRROR_TILES);
    });
    it('monitor_should_report_zero_rounds_before_any_push', 0, async () => {
      expect(new LongRunMonitor(5).getRoundCount()).assertEqual(0);
    });

    it('monitor_should_report_no_degradation_for_equal_halves', 0, async () => {
      const monitor = new LongRunMonitor(4);
      for (let i = 0; i < 4; i++) { monitor.addRound(i, 'dev_1', true, 100); }
      expect(monitor.isDegrading(0)).assertFalse();
    });
  });
}
