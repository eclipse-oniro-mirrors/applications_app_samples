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

const LEVEL_IDLE: string = 'idle';

const LEVEL_NORMAL: string = 'normal';

const LEVEL_BUSY: string = 'busy';

const LEVEL_SATURATED: string = 'saturated';

const WARN_LOAD: number = 60;

const BUSY_LOAD: number = 80;

const SATURATED_LOAD: number = 95;

const MAX_CORES: number = 16;

const MAX_SAMPLES: number = 120;

interface CoreSample {
  core: number;
  load: number;
  timestamp: number;
}

// Collects per-core load samples and computes profile statistics
class CpuProfile {
  private samples: CoreSample[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public add(core: number, load: number, now: number): boolean {
    if (core < 0 || core >= MAX_CORES || load < 0 || load > 100 || this.capacity <= 0) {
      return false;
    }
    if (this.samples.length >= this.capacity) {
      this.samples.shift();
    }
    this.samples.push({ core: core, load: load, timestamp: now });
    return true;
  }

  public count(): number {
    return this.samples.length;
  }

  public averageLoad(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      total += this.samples[i].load;
    }
    return total / this.samples.length;
  }

  public peakLoad(): number {
    let peak: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].load > peak) {
        peak = this.samples[i].load;
      }
    }
    return peak;
  }

  public perCoreAverage(core: number): number {
    let total: number = 0;
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].core === core) {
        total += this.samples[i].load;
        count++;
      }
    }
    return count === 0 ? 0 : total / count;
  }

  public hottestCore(): number {
    let hottest: number = -1;
    let peak: number = -1;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].load > peak) {
        peak = this.samples[i].load;
        hottest = this.samples[i].core;
      }
    }
    return hottest;
  }

  public countAbove(threshold: number): number {
    return this.samples.filter((sample: CoreSample) => sample.load >= threshold).length;
  }

  public isSustainedHigh(): boolean {
    return this.averageLoad() >= BUSY_LOAD;
  }

  public clear(): void {
    this.samples = [];
  }
}

// Maps load levels to mitigation actions
class CpuGovernor {
  public static levelOf(load: number): string {
    if (load >= SATURATED_LOAD) {
      return LEVEL_SATURATED;
    }
    if (load >= BUSY_LOAD) {
      return LEVEL_BUSY;
    }
    if (load >= WARN_LOAD) {
      return LEVEL_NORMAL;
    }
    return LEVEL_IDLE;
  }

  public static shouldThrottleAnimation(level: string): boolean {
    return level === LEVEL_BUSY || level === LEVEL_SATURATED;
  }

  public static shouldThrottleLogs(level: string): boolean {
    return level === LEVEL_SATURATED;
  }

  public static allowsThumbnailDecode(level: string): boolean {
    return level !== LEVEL_SATURATED;
  }

  public static isLevelKnown(level: string): boolean {
    return level === LEVEL_IDLE || level === LEVEL_NORMAL ||
      level === LEVEL_BUSY || level === LEVEL_SATURATED;
  }
}

// Aggregates CPU checks for reports
class CpuReport {
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

export default function cpuLoadProfileTest() {
  describe('CpuLoadProfile_Test', () => {

    it('profile_should_add_samples', 0, () => {
      const profile = new CpuProfile(MAX_SAMPLES);
      expect(profile.add(0, 40, 100)).assertTrue();
      expect(profile.add(1, 60, 100)).assertTrue();
      expect(profile.count()).assertEqual(2);
    });

    it('profile_should_reject_invalid_samples', 0, () => {
      const profile = new CpuProfile(MAX_SAMPLES);
      expect(profile.add(-1, 40, 0)).assertFalse();
      expect(profile.add(MAX_CORES, 40, 0)).assertFalse();
      expect(profile.add(0, -1, 0)).assertFalse();
      expect(profile.add(0, 101, 0)).assertFalse();
      expect(profile.count()).assertEqual(0);
      const zero = new CpuProfile(0);
      expect(zero.add(0, 10, 0)).assertFalse();
    });

    it('profile_should_compute_average_and_peak', 0, () => {
      const profile = new CpuProfile(MAX_SAMPLES);
      profile.add(0, 20, 0);
      profile.add(1, 40, 0);
      profile.add(2, 60, 0);
      expect(profile.averageLoad()).assertEqual(40);
      expect(profile.peakLoad()).assertEqual(60);
      expect(profile.countAbove(WARN_LOAD)).assertEqual(1);
      expect(profile.countAbove(100)).assertEqual(0);
    });

    it('profile_should_compute_per_core_average', 0, () => {
      const profile = new CpuProfile(MAX_SAMPLES);
      profile.add(0, 20, 0);
      profile.add(0, 40, 1);
      profile.add(1, 80, 2);
      expect(profile.perCoreAverage(0)).assertEqual(30);
      expect(profile.perCoreAverage(1)).assertEqual(80);
      expect(profile.perCoreAverage(2)).assertEqual(0);
      expect(profile.hottestCore()).assertEqual(1);
    });

    it('profile_should_detect_sustained_high', 0, () => {
      const profile = new CpuProfile(MAX_SAMPLES);
      profile.add(0, 85, 0);
      profile.add(1, 90, 1);
      expect(profile.isSustainedHigh()).assertTrue();
      profile.clear();
      expect(profile.count()).assertEqual(0);
      expect(profile.averageLoad()).assertEqual(0);
      expect(profile.hottestCore()).assertEqual(-1);
    });

    it('profile_should_be_bounded', 0, () => {
      const profile = new CpuProfile(2);
      profile.add(0, 10, 0);
      profile.add(1, 20, 1);
      profile.add(2, 30, 2);
      expect(profile.count()).assertEqual(2);
      expect(profile.perCoreAverage(0)).assertEqual(0);
      expect(profile.peakLoad()).assertEqual(30);
    });

    it('governor_should_classify_levels', 0, () => {
      expect(CpuGovernor.levelOf(0)).assertEqual(LEVEL_IDLE);
      expect(CpuGovernor.levelOf(WARN_LOAD)).assertEqual(LEVEL_NORMAL);
      expect(CpuGovernor.levelOf(BUSY_LOAD)).assertEqual(LEVEL_BUSY);
      expect(CpuGovernor.levelOf(SATURATED_LOAD)).assertEqual(LEVEL_SATURATED);
      expect(CpuGovernor.levelOf(100)).assertEqual(LEVEL_SATURATED);
      expect(CpuGovernor.isLevelKnown(LEVEL_IDLE)).assertTrue();
      expect(CpuGovernor.isLevelKnown('unknown')).assertFalse();
    });

    it('governor_should_select_actions', 0, () => {
      expect(CpuGovernor.shouldThrottleAnimation(LEVEL_BUSY)).assertTrue();
      expect(CpuGovernor.shouldThrottleAnimation(LEVEL_NORMAL)).assertFalse();
      expect(CpuGovernor.shouldThrottleLogs(LEVEL_SATURATED)).assertTrue();
      expect(CpuGovernor.shouldThrottleLogs(LEVEL_BUSY)).assertFalse();
      expect(CpuGovernor.allowsThumbnailDecode(LEVEL_BUSY)).assertTrue();
      expect(CpuGovernor.allowsThumbnailDecode(LEVEL_SATURATED)).assertFalse();
    });

    it('report_should_aggregate_cpu_checks', 0, () => {
      const report = new CpuReport();
      report.check('average', true);
      report.check('peak', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('sustained', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['sustained']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('cpu_flow_should_stay_idle', 0, () => {
      const profile = new CpuProfile(MAX_SAMPLES);
      const report = new CpuReport();
      for (let core = 0; core < 4; core++) {
        profile.add(core, 20, core);
      }
      const level = CpuGovernor.levelOf(profile.averageLoad());
      report.check('idle', level === LEVEL_IDLE);
      report.check('noThrottle', !CpuGovernor.shouldThrottleAnimation(level));
      report.check('decode', CpuGovernor.allowsThumbnailDecode(level));
      expect(report.isPassed()).assertTrue();
      expect(profile.peakLoad()).assertEqual(20);
    });

    it('cpu_flow_should_throttle_when_busy', 0, () => {
      const profile = new CpuProfile(MAX_SAMPLES);
      const report = new CpuReport();
      for (let core = 0; core < 4; core++) {
        profile.add(core, 90, core);
      }
      const level = CpuGovernor.levelOf(profile.peakLoad());
      report.check('busy', level === LEVEL_BUSY);
      report.check('throttle', CpuGovernor.shouldThrottleAnimation(level));
      report.check('logs', !CpuGovernor.shouldThrottleLogs(level));
      expect(report.isPassed()).assertTrue();
      expect(profile.isSustainedHigh()).assertTrue();
      expect(profile.hottestCore()).assertEqual(0);
    });

    it('cpu_constants_should_be_stable', 0, () => {
      expect(LEVEL_IDLE).assertEqual('idle');
      expect(LEVEL_NORMAL).assertEqual('normal');
      expect(LEVEL_BUSY).assertEqual('busy');
      expect(LEVEL_SATURATED).assertEqual('saturated');
      expect(WARN_LOAD).assertEqual(60);
      expect(BUSY_LOAD).assertEqual(80);
      expect(SATURATED_LOAD).assertEqual(95);
      expect(MAX_CORES).assertEqual(16);
      expect(MAX_SAMPLES).assertEqual(120);
    });
  });
}

