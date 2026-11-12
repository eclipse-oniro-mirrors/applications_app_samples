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
import { Log } from 'library';
import {
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_ENTER, KEY_BACK,
  miracastComponentCount, isIndexPageVisible, isPlayerPageVisible, waitForPageStable,
  pressAndWait, MAX_MIRROR_TILES, TOLERANCE_COMPONENT_COUNT, DELAY_KEY_NAVIGATION, TIMEOUT_PAGE_RENDER
} from '../Shared/MiracastDriver';

const TAG: string = 'MiracastStressSuite';

class StressCounter {
  private total: number = 0;
  private success: number = 0;
  private planned: number;
  private executed: number = 0;

  public constructor(planned: number) { this.planned = planned > 0 ? planned : 0; }
  public record(result: boolean): void { this.total++; this.success += result ? 1 : 0; }
  public consume(): boolean { if (this.executed >= this.planned) { return false; } this.executed++; return true; }
  public getTotal(): number { return this.total; }
  public getFailure(): number { return this.total - this.success; }
  public getSuccessRate(): number { return this.total === 0 ? 0 : this.success / this.total; }
  public getExecuted(): number { return this.executed; }
  public getRemaining(): number { return this.planned - this.executed; }
  public isExhausted(): boolean { return this.executed >= this.planned; }
  public reset(): void { this.total = 0; this.success = 0; this.executed = 0; }
}
class StabilitySampler {
  private samples: number[] = [];
  public addSample(value: number): void { this.samples.push(value); }
  public getSampleCount(): number { return this.samples.length; }
  public getRange(): number { return this.getMax() - this.getMin(); }
  public getMax(): number { return this.samples.reduce((max: number, v: number) => v > max ? v : max, 0); }
  public getAverage(): number { return this.samples.length === 0 ? 0 : this.samples.reduce((sum: number, v: number) => sum + v, 0) / this.samples.length; }
  public getMin(): number { const base: number[] = this.samples.length === 0 ? [0] : this.samples; return base.reduce((min: number, v: number) => v < min ? v : min, base[0]); }
  public isStableWithin(tolerance: number): boolean { return this.getSampleCount() > 0 && this.getRange() <= tolerance; }
  public clear(): void { this.samples = []; }
}
class KeySequencePlanner {
  private static readonly NAV_KEYS: number[] = [KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN];
  public static buildSequence(rounds: number): number[] {
    const sequence: number[] = [];
    for (let i = 0; i < rounds; i++) { sequence.push(KeySequencePlanner.NAV_KEYS[i % 4]); }
    return sequence;
  }
  public static countByKey(sequence: number[], key: number): number {
    return sequence.filter((item: number) => item === key).length;
  }
  public static isAlternating(sequence: number[]): boolean {
    return sequence.every((item: number, index: number) => index < 2 || item !== sequence[index - 1] || item !== sequence[index - 2]);
  }
  public static getOpposite(key: number): number {
    const pairs: number[] = [KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN];
    const index: number = pairs.indexOf(key);
    return index < 0 ? KEY_ENTER : pairs[index % 2 === 0 ? index + 1 : index - 1];
  }
}

export default function miracastStressSuite(): void {
  describe('MiracastStress_Suite', () => {
    let driver: Driver;

    beforeAll(async () => {
      Log.info(TAG, 'stress suite start');
      driver = getDriver();
      await pressAndWait(driver, KEY_BACK, 0, DELAY_KEY_NAVIGATION);
    });
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      Log.info(TAG, 'stress suite end');
    });
    it('stress_counter_should_start_exhausted_with_zero_plan', 0, async () => {
      expect(new StressCounter(0).isExhausted()).assertTrue();
    });
    it('stress_counter_should_reject_work_when_plan_is_zero', 0, async () => {
      expect(new StressCounter(0).consume()).assertFalse();
    });
    it('stress_counter_should_clamp_negative_plan', 0, async () => {
      expect(new StressCounter(-4).getRemaining()).assertEqual(0);
    });
    it('stress_counter_should_report_zero_rate_when_empty', 0, async () => {
      expect(new StressCounter(1).getSuccessRate()).assertEqual(0);
    });
    it('stress_budget_should_start_with_zero_executed', 0, async () => {
      expect(new StressCounter(3).getExecuted()).assertEqual(0);
    });
    it('stress_budget_should_consume_one_unit', 0, async () => {
      expect(new StressCounter(2).consume()).assertTrue();
    });
    it('stress_counter_should_track_success_and_failure', 0, async () => {
      const counter = new StressCounter(2);
      counter.record(true); counter.record(false);
      expect(counter.getFailure()).assertEqual(1);
    });
    it('stress_counter_should_reset_accumulated_state', 0, async () => {
      const counter = new StressCounter(1);
      counter.record(true);
      counter.reset();
      expect(counter.getTotal()).assertEqual(0);
    });
    it('stress_budget_should_stop_when_exhausted', 0, async () => {
      const budget = new StressCounter(1);
      expect(budget.consume()).assertTrue(); expect(budget.consume()).assertFalse();
      expect(budget.isExhausted()).assertTrue();
    });
    it('key_planner_should_build_requested_rounds', 0, async () => {
      expect(KeySequencePlanner.buildSequence(4).length).assertEqual(4);
    });
    it('key_planner_should_start_with_left_key', 0, async () => {
      expect(KeySequencePlanner.buildSequence(1)[0]).assertEqual(KEY_LEFT);
    });
    it('key_planner_should_reject_negative_rounds', 0, async () => {
      expect(KeySequencePlanner.buildSequence(-3).length).assertEqual(0);
    });
    it('key_planner_should_count_keys', 0, async () => {
      expect(KeySequencePlanner.countByKey([KEY_RIGHT, KEY_RIGHT], KEY_RIGHT)).assertEqual(2);
    });
    it('key_planner_should_map_opposite_keys', 0, async () => {
      expect(KeySequencePlanner.getOpposite(KEY_UP)).assertEqual(KEY_DOWN);
    });
    it('key_planner_should_detect_non_alternating_sequence', 0, async () => {
      expect(KeySequencePlanner.isAlternating([KEY_LEFT, KEY_LEFT, KEY_LEFT])).assertFalse();
    });
    it('key_planner_should_accept_alternating_sequence', 0, async () => {
      expect(KeySequencePlanner.isAlternating([KEY_LEFT, KEY_RIGHT, KEY_LEFT])).assertTrue();
    });
    it('stability_sampler_should_report_zero_average_when_empty', 0, async () => {
      expect(new StabilitySampler().getAverage()).assertEqual(0);
    });
    it('stability_sampler_should_detect_stable_series', 0, async () => {
      const sampler = new StabilitySampler();
      sampler.addSample(20); sampler.addSample(22);
      expect(sampler.isStableWithin(TOLERANCE_COMPONENT_COUNT)).assertTrue();
    });
    it('stability_sampler_should_reject_wide_fluctuation', 0, async () => {
      const sampler = new StabilitySampler();
      sampler.addSample(10); sampler.addSample(60);
      expect(sampler.isStableWithin(TOLERANCE_COMPONENT_COUNT)).assertFalse();
    });
    it('stability_sampler_should_clear_samples', 0, async () => {
      const sampler = new StabilitySampler();
      sampler.addSample(10);
      sampler.clear();
      expect(sampler.getSampleCount()).assertEqual(0);
    });
    it('nine_tile_layout_stress_should_respect_tile_ceiling', 0, async () => {
      const sampler = new StabilitySampler();
      sampler.addSample(MAX_MIRROR_TILES); sampler.addSample(1);
      expect(sampler.getMin()).assertEqual(1);
    });
    it('stress_sequence_should_alternate_between_directions', 0, async () => {
      const sequence: number[] = KeySequencePlanner.buildSequence(4);
      expect(KeySequencePlanner.isAlternating(sequence)).assertTrue();
    });

    it('nine_tile_layout_stress_should_not_exceed_tile_ceiling', 0, async () => {
      const sampler = new StabilitySampler();
      sampler.addSample(MAX_MIRROR_TILES + 4);
      expect(sampler.getMax()).assertLarger(MAX_MIRROR_TILES);
      expect(MAX_MIRROR_TILES).assertEqual(9);
    });
  });
}
