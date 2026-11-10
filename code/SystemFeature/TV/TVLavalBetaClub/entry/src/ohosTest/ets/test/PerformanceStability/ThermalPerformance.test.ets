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

const THERMAL_NORMAL: string = 'normal';

const THERMAL_WARM: string = 'warm';

const THERMAL_HOT: string = 'hot';

const THERMAL_CRITICAL: string = 'critical';

const WARM_THRESHOLD: number = 55;

const HOT_THRESHOLD: number = 70;

const CRITICAL_THRESHOLD: number = 85;

const MIN_TEMPERATURE: number = 0;

const MAX_TEMPERATURE: number = 120;

interface ThermalSample {
  temperature: number;
  timestamp: number;
}

// Classifies temperature and selects mitigation actions
class ThermalGovernor {
  public static classify(temperature: number): string {
    if (temperature >= CRITICAL_THRESHOLD) {
      return THERMAL_CRITICAL;
    }
    if (temperature >= HOT_THRESHOLD) {
      return THERMAL_HOT;
    }
    if (temperature >= WARM_THRESHOLD) {
      return THERMAL_WARM;
    }
    return THERMAL_NORMAL;
  }

  public static isTemperatureValid(temperature: number): boolean {
    return temperature >= MIN_TEMPERATURE && temperature <= MAX_TEMPERATURE;
  }

  public static actionFor(state: string): string {
    if (state === THERMAL_CRITICAL) {
      return 'stopHeavyTasks';
    }
    if (state === THERMAL_HOT) {
      return 'reduceAnimation';
    }
    if (state === THERMAL_WARM) {
      return 'monitor';
    }
    return 'none';
  }

  public static allowsVideoPlayback(state: string): boolean {
    return state !== THERMAL_CRITICAL;
  }

  public static allowsUpload(state: string): boolean {
    return state === THERMAL_NORMAL || state === THERMAL_WARM;
  }

  public static shouldNotifyUser(state: string): boolean {
    return state === THERMAL_HOT || state === THERMAL_CRITICAL;
  }
}

// Keeps a bounded history of thermal samples
class ThermalHistory {
  private samples: ThermalSample[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public add(temperature: number, now: number): boolean {
    if (!ThermalGovernor.isTemperatureValid(temperature) || this.capacity <= 0) {
      return false;
    }
    if (this.samples.length >= this.capacity) {
      this.samples.shift();
    }
    this.samples.push({ temperature: temperature, timestamp: now });
    return true;
  }

  public count(): number {
    return this.samples.length;
  }

  public max(): number {
    let max: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].temperature > max) {
        max = this.samples[i].temperature;
      }
    }
    return max;
  }

  public average(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      total += this.samples[i].temperature;
    }
    return total / this.samples.length;
  }

  public latest(): ThermalSample | undefined {
    return this.samples.length === 0 ? undefined : this.samples[this.samples.length - 1];
  }

  public countAbove(threshold: number): number {
    return this.samples.filter((sample: ThermalSample) =>
      sample.temperature >= threshold).length;
  }

  public clear(): void {
    this.samples = [];
  }
}

// Tracks transitions between thermal states
class ThermalTransitionTracker {
  private transitions: number = 0;
  private worstState: string = THERMAL_NORMAL;

  public record(state: string): void {
    const rank = ThermalTransitionTracker.rankOf(state);
    if (rank > ThermalTransitionTracker.rankOf(this.worstState)) {
      this.worstState = state;
    }
    this.transitions++;
  }

  public static rankOf(state: string): number {
    if (state === THERMAL_CRITICAL) {
      return 3;
    }
    if (state === THERMAL_HOT) {
      return 2;
    }
    if (state === THERMAL_WARM) {
      return 1;
    }
    return 0;
  }

  public getTransitions(): number {
    return this.transitions;
  }

  public getWorstState(): string {
    return this.worstState;
  }

  public hasReachedHot(): boolean {
    return ThermalTransitionTracker.rankOf(this.worstState) >= 2;
  }

  public reset(): void {
    this.transitions = 0;
    this.worstState = THERMAL_NORMAL;
  }
}

export default function thermalPerformanceTest() {
  describe('ThermalPerformance_Test', () => {

    it('governor_should_classify_normal', 0, () => {
      expect(ThermalGovernor.classify(MIN_TEMPERATURE)).assertEqual(THERMAL_NORMAL);
      expect(ThermalGovernor.classify(40)).assertEqual(THERMAL_NORMAL);
      expect(ThermalGovernor.classify(WARM_THRESHOLD - 1)).assertEqual(THERMAL_NORMAL);
      expect(ThermalGovernor.allowsUpload(THERMAL_NORMAL)).assertTrue();
      expect(ThermalGovernor.shouldNotifyUser(THERMAL_NORMAL)).assertFalse();
    });

    it('governor_should_classify_warm', 0, () => {
      expect(ThermalGovernor.classify(WARM_THRESHOLD)).assertEqual(THERMAL_WARM);
      expect(ThermalGovernor.classify(HOT_THRESHOLD - 1)).assertEqual(THERMAL_WARM);
      expect(ThermalGovernor.actionFor(THERMAL_WARM)).assertEqual('monitor');
      expect(ThermalGovernor.allowsUpload(THERMAL_WARM)).assertTrue();
      expect(ThermalGovernor.shouldNotifyUser(THERMAL_WARM)).assertFalse();
    });

    it('governor_should_classify_hot', 0, () => {
      expect(ThermalGovernor.classify(HOT_THRESHOLD)).assertEqual(THERMAL_HOT);
      expect(ThermalGovernor.actionFor(THERMAL_HOT)).assertEqual('reduceAnimation');
      expect(ThermalGovernor.allowsUpload(THERMAL_HOT)).assertFalse();
      expect(ThermalGovernor.allowsVideoPlayback(THERMAL_HOT)).assertTrue();
      expect(ThermalGovernor.shouldNotifyUser(THERMAL_HOT)).assertTrue();
    });

    it('governor_should_classify_critical', 0, () => {
      expect(ThermalGovernor.classify(CRITICAL_THRESHOLD)).assertEqual(THERMAL_CRITICAL);
      expect(ThermalGovernor.classify(MAX_TEMPERATURE)).assertEqual(THERMAL_CRITICAL);
      expect(ThermalGovernor.actionFor(THERMAL_CRITICAL)).assertEqual('stopHeavyTasks');
      expect(ThermalGovernor.allowsVideoPlayback(THERMAL_CRITICAL)).assertFalse();
      expect(ThermalGovernor.shouldNotifyUser(THERMAL_CRITICAL)).assertTrue();
    });

    it('governor_should_validate_temperature', 0, () => {
      expect(ThermalGovernor.isTemperatureValid(MIN_TEMPERATURE)).assertTrue();
      expect(ThermalGovernor.isTemperatureValid(MAX_TEMPERATURE)).assertTrue();
      expect(ThermalGovernor.isTemperatureValid(MIN_TEMPERATURE - 1)).assertFalse();
      expect(ThermalGovernor.isTemperatureValid(MAX_TEMPERATURE + 1)).assertFalse();
      expect(ThermalGovernor.actionFor('unknown')).assertEqual('none');
    });

    it('history_should_track_samples', 0, () => {
      const history = new ThermalHistory(5);
      expect(history.add(40, 1)).assertTrue();
      expect(history.add(75, 2)).assertTrue();
      expect(history.add(60, 3)).assertTrue();
      expect(history.count()).assertEqual(3);
      expect(history.max()).assertEqual(75);
      expect(history.average()).assertClose(58.333, 0.01);
      expect((history.latest() as ThermalSample).temperature).assertEqual(60);
    });

    it('history_should_be_bounded', 0, () => {
      const history = new ThermalHistory(2);
      history.add(40, 1);
      history.add(50, 2);
      history.add(60, 3);
      expect(history.count()).assertEqual(2);
      expect((history.latest() as ThermalSample).temperature).assertEqual(60);
      history.clear();
      expect(history.count()).assertEqual(0);
      expect(history.max()).assertEqual(0);
      expect(history.average()).assertEqual(0);
    });

    it('history_should_reject_invalid_samples', 0, () => {
      const history = new ThermalHistory(5);
      expect(history.add(-1, 1)).assertFalse();
      expect(history.add(MAX_TEMPERATURE + 1, 1)).assertFalse();
      expect(history.count()).assertEqual(0);
      const zero = new ThermalHistory(0);
      expect(zero.add(45, 1)).assertFalse();
      expect(zero.latest() === undefined).assertTrue();
    });

    it('history_should_count_hot_samples', 0, () => {
      const history = new ThermalHistory(10);
      history.add(40, 1);
      history.add(70, 2);
      history.add(85, 3);
      history.add(90, 4);
      expect(history.countAbove(HOT_THRESHOLD)).assertEqual(3);
      expect(history.countAbove(CRITICAL_THRESHOLD)).assertEqual(2);
      expect(history.countAbove(120)).assertEqual(0);
    });

    it('tracker_should_record_worst_state', 0, () => {
      const tracker = new ThermalTransitionTracker();
      tracker.record(ThermalGovernor.classify(40));
      tracker.record(ThermalGovernor.classify(75));
      tracker.record(ThermalGovernor.classify(60));
      expect(tracker.getTransitions()).assertEqual(3);
      expect(tracker.getWorstState()).assertEqual(THERMAL_HOT);
      expect(tracker.hasReachedHot()).assertTrue();
      tracker.reset();
      expect(tracker.getWorstState()).assertEqual(THERMAL_NORMAL);
      expect(tracker.hasReachedHot()).assertFalse();
    });

    it('thermal_flow_should_mitigate_heat', 0, () => {
      const history = new ThermalHistory(10);
      const tracker = new ThermalTransitionTracker();
      const temperatures: number[] = [40, 58, 72, 88];
      for (let i = 0; i < temperatures.length; i++) {
        history.add(temperatures[i], i);
        tracker.record(ThermalGovernor.classify(temperatures[i]));
      }
      expect(tracker.getWorstState()).assertEqual(THERMAL_CRITICAL);
      expect(history.max()).assertEqual(88);
      expect(ThermalGovernor.allowsVideoPlayback(tracker.getWorstState())).assertFalse();
      expect(ThermalGovernor.actionFor(tracker.getWorstState())).assertEqual('stopHeavyTasks');
      expect(history.countAbove(HOT_THRESHOLD)).assertEqual(2);
    });

    it('thermal_constants_should_be_stable', 0, () => {
      expect(WARM_THRESHOLD).assertEqual(55);
      expect(HOT_THRESHOLD).assertEqual(70);
      expect(CRITICAL_THRESHOLD).assertEqual(85);
      expect(MIN_TEMPERATURE).assertEqual(0);
      expect(MAX_TEMPERATURE).assertEqual(120);
    });
  });
}

