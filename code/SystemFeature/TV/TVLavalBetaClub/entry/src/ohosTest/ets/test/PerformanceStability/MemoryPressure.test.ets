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

const LEVEL_NORMAL: string = 'normal';

const LEVEL_WARNING: string = 'warning';

const LEVEL_CRITICAL: string = 'critical';

const LEVEL_EMERGENCY: string = 'emergency';

const WARNING_PERCENT: number = 70;

const CRITICAL_PERCENT: number = 85;

const EMERGENCY_PERCENT: number = 95;

const MAX_SNAPSHOTS: number = 64;

interface MemorySnapshot {
  usedKb: number;
  limitKb: number;
  timestamp: number;
}

// Classifies memory usage and selects mitigation actions
class MemoryGuard {
  public static percentOf(snapshot: MemorySnapshot): number {
    if (snapshot.limitKb <= 0 || snapshot.usedKb < 0) {
      return 0;
    }
    const percent = snapshot.usedKb * 100 / snapshot.limitKb;
    return percent > 100 ? 100 : percent;
  }

  public static levelOf(snapshot: MemorySnapshot): string {
    const percent = MemoryGuard.percentOf(snapshot);
    if (percent >= EMERGENCY_PERCENT) {
      return LEVEL_EMERGENCY;
    }
    if (percent >= CRITICAL_PERCENT) {
      return LEVEL_CRITICAL;
    }
    if (percent >= WARNING_PERCENT) {
      return LEVEL_WARNING;
    }
    return LEVEL_NORMAL;
  }

  public static shouldReleaseCaches(level: string): boolean {
    return level === LEVEL_CRITICAL || level === LEVEL_EMERGENCY;
  }

  public static shouldDropThumbnails(level: string): boolean {
    return level === LEVEL_EMERGENCY;
  }

  public static shouldRestartPage(level: string): boolean {
    return level === LEVEL_EMERGENCY;
  }

  public static isLevelKnown(level: string): boolean {
    return level === LEVEL_NORMAL || level === LEVEL_WARNING ||
      level === LEVEL_CRITICAL || level === LEVEL_EMERGENCY;
  }

  public static reclaimTargetKb(snapshot: MemorySnapshot): number {
    const percent = MemoryGuard.percentOf(snapshot);
    if (percent < CRITICAL_PERCENT) {
      return 0;
    }
    const targetKb = snapshot.limitKb * WARNING_PERCENT / 100;
    const reclaim = snapshot.usedKb - targetKb;
    return reclaim > 0 ? reclaim : 0;
  }
}

// Records memory samples and detects leaks
class MemoryTrend {
  private samples: MemorySnapshot[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public add(snapshot: MemorySnapshot): boolean {
    if (snapshot.usedKb < 0 || snapshot.limitKb <= 0 || this.capacity <= 0) {
      return false;
    }
    if (this.samples.length >= this.capacity) {
      this.samples.shift();
    }
    this.samples.push({
      usedKb: snapshot.usedKb,
      limitKb: snapshot.limitKb,
      timestamp: snapshot.timestamp
    });
    return true;
  }

  public count(): number {
    return this.samples.length;
  }

  public growthKb(): number {
    if (this.samples.length < 2) {
      return 0;
    }
    return this.samples[this.samples.length - 1].usedKb - this.samples[0].usedKb;
  }

  public peakKb(): number {
    let peak: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].usedKb > peak) {
        peak = this.samples[i].usedKb;
      }
    }
    return peak;
  }

  public averageKb(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      total += this.samples[i].usedKb;
    }
    return total / this.samples.length;
  }

  public latest(): MemorySnapshot | undefined {
    return this.samples.length === 0 ? undefined : this.samples[this.samples.length - 1];
  }

  public countAtOrAbove(limitKb: number): number {
    return this.samples.filter((sample: MemorySnapshot) => sample.usedKb >= limitKb).length;
  }

  public isGrowing(thresholdKb: number): boolean {
    return this.growthKb() > thresholdKb;
  }

  public clear(): void {
    this.samples = [];
  }
}

// Aggregates memory checks for performance reports
class PressureReport {
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

// Applies a sequence of mitigation steps under pressure
class MitigationRunner {
  private releasedKb: number = 0;
  private steps: string[] = [];

  public apply(snapshot: MemorySnapshot): number {
    const level = MemoryGuard.levelOf(snapshot);
    this.steps.push(level);
    let released: number = 0;
    if (MemoryGuard.shouldReleaseCaches(level)) {
      released += Math.round(snapshot.usedKb * 0.1);
      this.steps.push('releaseCaches');
    }
    if (MemoryGuard.shouldDropThumbnails(level)) {
      released += Math.round(snapshot.usedKb * 0.05);
      this.steps.push('dropThumbnails');
    }
    this.releasedKb += released;
    return released;
  }

  public getReleased(): number {
    return this.releasedKb;
  }

  public getSteps(): string[] {
    return [...this.steps];
  }

  public reset(): void {
    this.releasedKb = 0;
    this.steps = [];
  }
}

export default function memoryPressureTest() {
  describe('MemoryPressure_Test', () => {

    it('guard_should_compute_percent', 0, () => {
      expect(MemoryGuard.percentOf({ usedKb: 50, limitKb: 100, timestamp: 0 })).assertEqual(50);
      expect(MemoryGuard.percentOf({ usedKb: 0, limitKb: 100, timestamp: 0 })).assertEqual(0);
      expect(MemoryGuard.percentOf({ usedKb: 120, limitKb: 100, timestamp: 0 })).assertEqual(100);
      expect(MemoryGuard.percentOf({ usedKb: 10, limitKb: 0, timestamp: 0 })).assertEqual(0);
      expect(MemoryGuard.percentOf({ usedKb: -1, limitKb: 100, timestamp: 0 })).assertEqual(0);
    });

    it('guard_should_classify_normal', 0, () => {
      expect(MemoryGuard.levelOf({ usedKb: 0, limitKb: 100, timestamp: 0 })).assertEqual(LEVEL_NORMAL);
      expect(MemoryGuard.levelOf({ usedKb: 69, limitKb: 100, timestamp: 0 })).assertEqual(LEVEL_NORMAL);
      expect(MemoryGuard.shouldReleaseCaches(LEVEL_NORMAL)).assertFalse();
      expect(MemoryGuard.shouldRestartPage(LEVEL_NORMAL)).assertFalse();
    });

    it('guard_should_classify_warning', 0, () => {
      expect(MemoryGuard.levelOf({ usedKb: 70, limitKb: 100, timestamp: 0 })).assertEqual(LEVEL_WARNING);
      expect(MemoryGuard.levelOf({ usedKb: 84, limitKb: 100, timestamp: 0 })).assertEqual(LEVEL_WARNING);
      expect(MemoryGuard.shouldReleaseCaches(LEVEL_WARNING)).assertFalse();
      expect(MemoryGuard.isLevelKnown(LEVEL_WARNING)).assertTrue();
    });

    it('guard_should_classify_critical', 0, () => {
      expect(MemoryGuard.levelOf({ usedKb: 85, limitKb: 100, timestamp: 0 })).assertEqual(LEVEL_CRITICAL);
      expect(MemoryGuard.shouldReleaseCaches(LEVEL_CRITICAL)).assertTrue();
      expect(MemoryGuard.shouldDropThumbnails(LEVEL_CRITICAL)).assertFalse();
      expect(MemoryGuard.shouldRestartPage(LEVEL_CRITICAL)).assertFalse();
    });

    it('guard_should_classify_emergency', 0, () => {
      expect(MemoryGuard.levelOf({ usedKb: 95, limitKb: 100, timestamp: 0 })).assertEqual(LEVEL_EMERGENCY);
      expect(MemoryGuard.levelOf({ usedKb: 100, limitKb: 100, timestamp: 0 })).assertEqual(LEVEL_EMERGENCY);
      expect(MemoryGuard.shouldReleaseCaches(LEVEL_EMERGENCY)).assertTrue();
      expect(MemoryGuard.shouldDropThumbnails(LEVEL_EMERGENCY)).assertTrue();
      expect(MemoryGuard.shouldRestartPage(LEVEL_EMERGENCY)).assertTrue();
    });

    it('guard_should_compute_reclaim_target', 0, () => {
      expect(MemoryGuard.reclaimTargetKb({ usedKb: 500, limitKb: 1000, timestamp: 0 })).assertEqual(0);
      expect(MemoryGuard.reclaimTargetKb({ usedKb: 900, limitKb: 1000, timestamp: 0 }))
        .assertEqual(200);
      expect(MemoryGuard.reclaimTargetKb({ usedKb: 700, limitKb: 1000, timestamp: 0 })).assertEqual(0);
      expect(MemoryGuard.reclaimTargetKb({ usedKb: 1000, limitKb: 1000, timestamp: 0 }))
        .assertEqual(300);
    });

    it('trend_should_track_samples', 0, () => {
      const trend = new MemoryTrend(MAX_SNAPSHOTS);
      expect(trend.add({ usedKb: 1000, limitKb: 2000, timestamp: 1 })).assertTrue();
      trend.add({ usedKb: 1200, limitKb: 2000, timestamp: 2 });
      trend.add({ usedKb: 1500, limitKb: 2000, timestamp: 3 });
      expect(trend.count()).assertEqual(3);
      expect(trend.growthKb()).assertEqual(500);
      expect(trend.peakKb()).assertEqual(1500);
      expect(trend.averageKb()).assertClose(1233.333, 0.01);
    });

    it('trend_should_detect_growth', 0, () => {
      const trend = new MemoryTrend(MAX_SNAPSHOTS);
      trend.add({ usedKb: 1000, limitKb: 2000, timestamp: 1 });
      trend.add({ usedKb: 1100, limitKb: 2000, timestamp: 2 });
      expect(trend.isGrowing(50)).assertTrue();
      expect(trend.isGrowing(100)).assertFalse();
      trend.add({ usedKb: 900, limitKb: 2000, timestamp: 3 });
      expect(trend.growthKb()).assertEqual(-100);
      expect(trend.isGrowing(0)).assertFalse();
    });

    it('trend_should_be_bounded', 0, () => {
      const trend = new MemoryTrend(2);
      trend.add({ usedKb: 100, limitKb: 1000, timestamp: 1 });
      trend.add({ usedKb: 200, limitKb: 1000, timestamp: 2 });
      trend.add({ usedKb: 300, limitKb: 1000, timestamp: 3 });
      expect(trend.count()).assertEqual(2);
      expect((trend.latest() as MemorySnapshot).usedKb).assertEqual(300);
      expect(trend.peakKb()).assertEqual(300);
      trend.clear();
      expect(trend.count()).assertEqual(0);
      expect(trend.growthKb()).assertEqual(0);
    });

    it('trend_should_reject_invalid_samples', 0, () => {
      const trend = new MemoryTrend(MAX_SNAPSHOTS);
      expect(trend.add({ usedKb: -1, limitKb: 1000, timestamp: 1 })).assertFalse();
      expect(trend.add({ usedKb: 100, limitKb: 0, timestamp: 1 })).assertFalse();
      expect(trend.count()).assertEqual(0);
      const zero = new MemoryTrend(0);
      expect(zero.add({ usedKb: 100, limitKb: 1000, timestamp: 1 })).assertFalse();
      expect(zero.latest() === undefined).assertTrue();
    });

    it('trend_should_count_high_samples', 0, () => {
      const trend = new MemoryTrend(MAX_SNAPSHOTS);
      trend.add({ usedKb: 500, limitKb: 1000, timestamp: 1 });
      trend.add({ usedKb: 850, limitKb: 1000, timestamp: 2 });
      trend.add({ usedKb: 950, limitKb: 1000, timestamp: 3 });
      expect(trend.countAtOrAbove(850)).assertEqual(2);
      expect(trend.countAtOrAbove(1000)).assertEqual(0);
      expect(trend.countAtOrAbove(0)).assertEqual(3);
    });

    it('mitigation_should_release_under_pressure', 0, () => {
      const runner = new MitigationRunner();
      const normal = runner.apply({ usedKb: 500, limitKb: 1000, timestamp: 0 });
      expect(normal).assertEqual(0);
      const critical = runner.apply({ usedKb: 900, limitKb: 1000, timestamp: 1 });
      expect(critical).assertEqual(90);
      const emergency = runner.apply({ usedKb: 980, limitKb: 1000, timestamp: 2 });
      expect(emergency).assertEqual(147);
      expect(runner.getReleased()).assertEqual(237);
      expect(runner.getSteps().includes('releaseCaches')).assertTrue();
      expect(runner.getSteps().includes('dropThumbnails')).assertTrue();
    });

    it('mitigation_should_reset', 0, () => {
      const runner = new MitigationRunner();
      runner.apply({ usedKb: 990, limitKb: 1000, timestamp: 0 });
      expect(runner.getReleased()).assertLarger(0);
      runner.reset();
      expect(runner.getReleased()).assertEqual(0);
      expect(runner.getSteps().length).assertEqual(0);
    });

    it('report_should_aggregate_pressure_checks', 0, () => {
      const report = new PressureReport();
      report.check('level', true);
      report.check('growth', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('peak', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['peak']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('pressure_flow_should_stay_healthy', 0, () => {
      const trend = new MemoryTrend(MAX_SNAPSHOTS);
      const report = new PressureReport();
      for (let i = 0; i < 5; i++) {
        trend.add({ usedKb: 500 + i * 20, limitKb: 2000, timestamp: i });
      }
      const latest = trend.latest() as MemorySnapshot;
      report.check('level', MemoryGuard.levelOf(latest) === LEVEL_NORMAL);
      report.check('growth', !trend.isGrowing(200));
      report.check('peak', trend.peakKb() <= 2000);
      expect(report.isPassed()).assertTrue();
      expect(MemoryGuard.reclaimTargetKb(latest)).assertEqual(0);
    });

    it('pressure_flow_should_mitigate_emergency', 0, () => {
      const runner = new MitigationRunner();
      const report = new PressureReport();
      const snapshot: MemorySnapshot = { usedKb: 1980, limitKb: 2000, timestamp: 1 };
      const level = MemoryGuard.levelOf(snapshot);
      const released = runner.apply(snapshot);
      report.check('level', level === LEVEL_EMERGENCY);
      report.check('released', released > 0);
      report.check('restart', MemoryGuard.shouldRestartPage(level));
      expect(report.isPassed()).assertTrue();
      expect(MemoryGuard.reclaimTargetKb(snapshot)).assertEqual(580);
    });

    it('memory_pressure_constants_should_be_stable', 0, () => {
      expect(LEVEL_NORMAL).assertEqual('normal');
      expect(LEVEL_WARNING).assertEqual('warning');
      expect(LEVEL_CRITICAL).assertEqual('critical');
      expect(LEVEL_EMERGENCY).assertEqual('emergency');
      expect(WARNING_PERCENT).assertEqual(70);
      expect(CRITICAL_PERCENT).assertEqual(85);
      expect(EMERGENCY_PERCENT).assertEqual(95);
      expect(MAX_SNAPSHOTS).assertEqual(64);
    });
  });
}

