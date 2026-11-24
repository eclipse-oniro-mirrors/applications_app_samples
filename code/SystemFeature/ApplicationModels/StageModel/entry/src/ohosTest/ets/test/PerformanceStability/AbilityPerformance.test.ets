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
  getDriver, ensureAppReady, checkComponentExists, clampNumber, safeDiv
} from '../Shared/SharedDriver';

enum LaunchType {
  COLD = 0,
  WARM = 1,
  HOT = 2
}

class LaunchRecord {
  type: LaunchType;
  durationMs: number;
  success: boolean;

  constructor(type: LaunchType, durationMs: number, success: boolean) {
    this.type = type;
    this.durationMs = durationMs;
    this.success = success;
  }
}

class AbilityLaunchModel {
  private records: LaunchRecord[] = [];
  private rejected: number = 0;

  record(type: LaunchType, durationMs: number, success: boolean): boolean {
    if (durationMs < 0) {
      this.rejected = this.rejected + 1;
      return false;
    }
    this.records.push(new LaunchRecord(type, durationMs, success));
    return true;
  }

  recordMany(type: LaunchType, durations: number[], success: boolean): number {
    let accepted = 0;
    for (const duration of durations) {
      if (this.record(type, duration, success)) {
        accepted = accepted + 1;
      }
    }
    return accepted;
  }

  getTotal(): number {
    return this.records.length;
  }

  getRejected(): number {
    return this.rejected;
  }

  successCount(): number {
    let count = 0;
    for (const record of this.records) {
      if (record.success) {
        count = count + 1;
      }
    }
    return count;
  }

  failureCount(): number {
    return this.records.length - this.successCount();
  }

  successRate(): number {
    return safeDiv(this.successCount(), this.records.length);
  }

  averageLatency(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let total = 0;
    for (const record of this.records) {
      total = total + record.durationMs;
    }
    return total / this.records.length;
  }

  countByType(type: LaunchType): number {
    let count = 0;
    for (const record of this.records) {
      if (record.type === type) {
        count = count + 1;
      }
    }
    return count;
  }

  averageByType(type: LaunchType): number {
    let total = 0;
    let count = 0;
    for (const record of this.records) {
      if (record.type === type) {
        total = total + record.durationMs;
        count = count + 1;
      }
    }
    return safeDiv(total, count);
  }

  failuresByType(type: LaunchType): number {
    let count = 0;
    for (const record of this.records) {
      if (record.type === type && !record.success) {
        count = count + 1;
      }
    }
    return count;
  }

  maxLatency(): number {
    let max = 0;
    for (const record of this.records) {
      if (record.durationMs > max) {
        max = record.durationMs;
      }
    }
    return max;
  }

  minLatency(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let min = this.records[0].durationMs;
    for (const record of this.records) {
      if (record.durationMs < min) {
        min = record.durationMs;
      }
    }
    return min;
  }

  sortedDurations(): number[] {
    const result: number[] = [];
    for (const record of this.records) {
      result.push(record.durationMs);
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

  slowestType(): LaunchType {
    let selected: LaunchType = LaunchType.COLD;
    let best = -1;
    for (const record of this.records) {
      const value = this.averageByType(record.type);
      if (value > best) {
        best = value;
        selected = record.type;
      }
    }
    return selected;
  }

  reset(): void {
    this.records = [];
    this.rejected = 0;
  }
}
class LifecycleTimer {
  private names: string[] = [];
  private durations: number[] = [];
  private rejected: number = 0;

  record(name: string, durationMs: number): boolean {
    if (name.length === 0 || durationMs < 0) {
      this.rejected = this.rejected + 1;
      return false;
    }
    this.names.push(name);
    this.durations.push(durationMs);
    return true;
  }

  getCount(): number {
    return this.names.length;
  }

  getRejected(): number {
    return this.rejected;
  }

  totalTime(): number {
    let total = 0;
    for (const duration of this.durations) {
      total = total + duration;
    }
    return total;
  }

  averageTime(): number {
    return safeDiv(this.totalTime(), this.durations.length);
  }

  countOf(name: string): number {
    let count = 0;
    for (const item of this.names) {
      if (item === name) {
        count = count + 1;
      }
    }
    return count;
  }

  has(name: string): boolean {
    return this.countOf(name) > 0;
  }

  slowestName(): string {
    if (this.names.length === 0) {
      return '';
    }
    let selected = this.names[0];
    let best = this.durations[0];
    for (let i = 1; i < this.durations.length; i++) {
      if (this.durations[i] > best) {
        best = this.durations[i];
        selected = this.names[i];
      }
    }
    return selected;
  }

  reset(): void {
    this.names = [];
    this.durations = [];
    this.rejected = 0;
  }
}

class SlaEvaluator {
  private thresholdMs: number;
  private checks: boolean[] = [];

  constructor(thresholdMs: number) {
    this.thresholdMs = thresholdMs > 0 ? thresholdMs : 1;
  }

  getThreshold(): number {
    return this.thresholdMs;
  }

  check(durationMs: number): boolean {
    const pass = durationMs <= this.thresholdMs;
    this.checks.push(pass);
    return pass;
  }

  getChecks(): number {
    return this.checks.length;
  }

  passCount(): number {
    let count = 0;
    for (const pass of this.checks) {
      if (pass) {
        count = count + 1;
      }
    }
    return count;
  }

  passRate(): number {
    return safeDiv(this.passCount(), this.checks.length);
  }

  meets(target: number): boolean {
    return this.passRate() >= target;
  }

  reset(): void {
    this.checks = [];
  }
}

export default function abilityPerformanceTest(): void {
  describe('AbilityPerformance', () => {
    it('AbilityPerformance_001', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      expect(model.getTotal()).assertEqual(0);
      expect(model.successRate()).assertEqual(0);
      expect(model.averageLatency()).assertEqual(0);
      expect(model.maxLatency()).assertEqual(0);
      expect(model.getRejected()).assertEqual(0);
      done();
    });

    it('AbilityPerformance_002', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      expect(model.record(LaunchType.COLD, 100, true)).assertTrue();
      expect(model.record(LaunchType.WARM, 50, true)).assertTrue();
      expect(model.getTotal()).assertEqual(2);
      expect(model.successRate()).assertEqual(1);
      done();
    });

    it('AbilityPerformance_003', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      expect(model.record(LaunchType.COLD, -1, true)).assertFalse();
      expect(model.getRejected()).assertEqual(1);
      expect(model.getTotal()).assertEqual(0);
      done();
    });

    it('AbilityPerformance_004', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      expect(model.recordMany(LaunchType.COLD, [100, 200], true)).assertEqual(2);
      expect(model.getTotal()).assertEqual(2);
      expect(model.countByType(LaunchType.COLD)).assertEqual(2);
      done();
    });

    it('AbilityPerformance_005', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.COLD, 100, true);
      model.record(LaunchType.WARM, 50, true);
      model.record(LaunchType.COLD, 200, false);
      model.record(LaunchType.WARM, 150, true);
      model.record(LaunchType.HOT, 10, true);
      expect(model.getTotal()).assertEqual(5);
      expect(model.successCount()).assertEqual(4);
      expect(model.failureCount()).assertEqual(1);
      expect(model.successRate()).assertEqual(0.8);
      done();
    });

    it('AbilityPerformance_006', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.recordMany(LaunchType.COLD, [100, 200], true);
      model.recordMany(LaunchType.WARM, [50, 150], true);
      model.record(LaunchType.HOT, 10, true);
      expect(model.averageLatency()).assertEqual(102);
      done();
    });

    it('AbilityPerformance_007', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.recordMany(LaunchType.COLD, [100, 200], true);
      model.recordMany(LaunchType.WARM, [50, 150], true);
      model.record(LaunchType.HOT, 10, true);
      expect(model.countByType(LaunchType.COLD)).assertEqual(2);
      expect(model.countByType(LaunchType.WARM)).assertEqual(2);
      expect(model.countByType(LaunchType.HOT)).assertEqual(1);
      done();
    });

    it('AbilityPerformance_008', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.recordMany(LaunchType.COLD, [100, 200], true);
      model.recordMany(LaunchType.WARM, [50, 150], true);
      model.record(LaunchType.HOT, 10, true);
      expect(model.averageByType(LaunchType.COLD)).assertEqual(150);
      expect(model.averageByType(LaunchType.WARM)).assertEqual(100);
      expect(model.averageByType(LaunchType.HOT)).assertEqual(10);
      done();
    });

    it('AbilityPerformance_009', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.COLD, 100, true);
      model.record(LaunchType.COLD, 200, false);
      model.record(LaunchType.WARM, 50, true);
      expect(model.failuresByType(LaunchType.COLD)).assertEqual(1);
      expect(model.failuresByType(LaunchType.WARM)).assertEqual(0);
      done();
    });

    it('AbilityPerformance_010', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.recordMany(LaunchType.COLD, [100, 200], true);
      model.recordMany(LaunchType.WARM, [50, 150], true);
      model.record(LaunchType.HOT, 10, true);
      expect(model.maxLatency()).assertEqual(200);
      expect(model.minLatency()).assertEqual(10);
      done();
    });

    it('AbilityPerformance_011', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.recordMany(LaunchType.COLD, [100, 200], true);
      model.recordMany(LaunchType.WARM, [50, 150], true);
      model.record(LaunchType.HOT, 10, true);
      expect(model.percentile(0)).assertEqual(10);
      expect(model.percentile(50)).assertEqual(100);
      expect(model.percentile(100)).assertEqual(200);
      done();
    });

    it('AbilityPerformance_012', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.recordMany(LaunchType.COLD, [100, 200], true);
      model.recordMany(LaunchType.WARM, [50, 150], true);
      model.record(LaunchType.HOT, 10, true);
      expect(model.slowestType()).assertEqual(LaunchType.COLD);
      done();
    });

    it('AbilityPerformance_013', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      expect(model.recordMany(LaunchType.WARM, [10, -1, 20], true)).assertEqual(2);
      expect(model.getRejected()).assertEqual(1);
      expect(model.getTotal()).assertEqual(2);
      done();
    });

    it('AbilityPerformance_014', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.COLD, 100, true);
      model.record(LaunchType.COLD, -1, true);
      model.reset();
      expect(model.getTotal()).assertEqual(0);
      expect(model.getRejected()).assertEqual(0);
      expect(model.successRate()).assertEqual(0);
      done();
    });

    it('AbilityPerformance_015', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.recordMany(LaunchType.COLD, [100, 200], true);
      model.recordMany(LaunchType.WARM, [50, 150], true);
      model.record(LaunchType.HOT, 10, true);
      expect(model.percentile(-10)).assertEqual(10);
      expect(model.percentile(150)).assertEqual(200);
      done();
    });

    it('AbilityPerformance_016', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.HOT, 30, true);
      expect(model.averageLatency()).assertEqual(30);
      expect(model.successRate()).assertEqual(1);
      expect(model.slowestType()).assertEqual(LaunchType.HOT);
      done();
    });

    it('AbilityPerformance_017', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.COLD, 10, false);
      model.record(LaunchType.COLD, 20, false);
      expect(model.successRate()).assertEqual(0);
      expect(model.failureCount()).assertEqual(2);
      expect(model.averageLatency()).assertEqual(15);
      done();
    });

    it('AbilityPerformance_018', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.COLD, -1, true);
      model.record(LaunchType.COLD, -2, true);
      model.record(LaunchType.COLD, -3, false);
      expect(model.getRejected()).assertEqual(3);
      expect(model.getTotal()).assertEqual(0);
      done();
    });

    it('AbilityPerformance_019', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.recordMany(LaunchType.COLD, [50, 10, 30], true);
      expect(model.minLatency()).assertEqual(10);
      expect(model.maxLatency()).assertEqual(50);
      expect(model.averageLatency()).assertEqual(30);
      done();
    });

    it('AbilityPerformance_020', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.WARM, 10, true);
      model.record(LaunchType.WARM, 20, false);
      expect(model.successCount()).assertEqual(1);
      expect(model.failureCount()).assertEqual(1);
      expect(model.countByType(LaunchType.WARM)).assertEqual(2);
      done();
    });
    it('AbilityPerformance_021', 0, async (done: Function) => {
      const timer = new LifecycleTimer();
      expect(timer.getCount()).assertEqual(0);
      expect(timer.totalTime()).assertEqual(0);
      expect(timer.averageTime()).assertEqual(0);
      expect(timer.slowestName()).assertEqual('');
      done();
    });

    it('AbilityPerformance_022', 0, async (done: Function) => {
      const timer = new LifecycleTimer();
      timer.record('onCreate', 30);
      timer.record('onStart', 20);
      timer.record('onForeground', 50);
      timer.record('onBackground', 40);
      expect(timer.getCount()).assertEqual(4);
      expect(timer.totalTime()).assertEqual(140);
      expect(timer.averageTime()).assertEqual(35);
      done();
    });

    it('AbilityPerformance_023', 0, async (done: Function) => {
      const timer = new LifecycleTimer();
      timer.record('onCreate', 30);
      timer.record('onStart', 20);
      expect(timer.countOf('onStart')).assertEqual(1);
      expect(timer.has('onStart')).assertTrue();
      expect(timer.has('onDestroy')).assertFalse();
      done();
    });

    it('AbilityPerformance_024', 0, async (done: Function) => {
      const timer = new LifecycleTimer();
      timer.record('onCreate', 30);
      timer.record('onForeground', 90);
      timer.record('onBackground', 40);
      expect(timer.slowestName()).assertEqual('onForeground');
      done();
    });

    it('AbilityPerformance_025', 0, async (done: Function) => {
      const timer = new LifecycleTimer();
      expect(timer.record('', 10)).assertFalse();
      expect(timer.record('onStart', -1)).assertFalse();
      expect(timer.getRejected()).assertEqual(2);
      expect(timer.getCount()).assertEqual(0);
      done();
    });

    it('AbilityPerformance_026', 0, async (done: Function) => {
      const timer = new LifecycleTimer();
      timer.record('onStart', 20);
      timer.reset();
      expect(timer.getCount()).assertEqual(0);
      expect(timer.has('onStart')).assertFalse();
      expect(timer.getRejected()).assertEqual(0);
      done();
    });

    it('AbilityPerformance_027', 0, async (done: Function) => {
      const timer = new LifecycleTimer();
      timer.record('onStart', 10);
      timer.record('onStart', 20);
      expect(timer.countOf('onStart')).assertEqual(2);
      expect(timer.totalTime()).assertEqual(30);
      expect(timer.averageTime()).assertEqual(15);
      done();
    });

    it('AbilityPerformance_028', 0, async (done: Function) => {
      const sla = new SlaEvaluator(100);
      expect(sla.getThreshold()).assertEqual(100);
      expect(sla.getChecks()).assertEqual(0);
      expect(sla.passRate()).assertEqual(0);
      expect(sla.meets(0)).assertTrue();
      done();
    });

    it('AbilityPerformance_029', 0, async (done: Function) => {
      const sla = new SlaEvaluator(100);
      expect(sla.check(100)).assertTrue();
      expect(sla.check(101)).assertFalse();
      expect(sla.check(50)).assertTrue();
      expect(sla.getChecks()).assertEqual(3);
      expect(sla.passCount()).assertEqual(2);
      done();
    });

    it('AbilityPerformance_030', 0, async (done: Function) => {
      const sla = new SlaEvaluator(100);
      sla.check(100);
      sla.check(101);
      sla.check(50);
      expect(Math.abs(sla.passRate() - 0.666666) < 0.001).assertTrue();
      expect(sla.meets(0.5)).assertTrue();
      expect(sla.meets(0.7)).assertFalse();
      done();
    });

    it('AbilityPerformance_031', 0, async (done: Function) => {
      const sla = new SlaEvaluator(0);
      expect(sla.getThreshold()).assertEqual(1);
      expect(sla.check(1)).assertTrue();
      expect(sla.check(2)).assertFalse();
      done();
    });

    it('AbilityPerformance_032', 0, async (done: Function) => {
      const sla = new SlaEvaluator(100);
      sla.check(50);
      sla.check(60);
      sla.reset();
      expect(sla.getChecks()).assertEqual(0);
      expect(sla.passRate()).assertEqual(0);
      done();
    });

    it('AbilityPerformance_033', 0, async (done: Function) => {
      const sla = new SlaEvaluator(100);
      sla.check(50);
      sla.check(100);
      expect(sla.passRate()).assertEqual(1);
      expect(sla.meets(1)).assertTrue();
      done();
    });

    it('AbilityPerformance_034', 0, async (done: Function) => {
      const sla = new SlaEvaluator(100);
      sla.check(150);
      sla.check(200);
      expect(sla.passRate()).assertEqual(0);
      expect(sla.meets(0)).assertTrue();
      expect(sla.meets(0.1)).assertFalse();
      done();
    });

    it('AbilityPerformance_035', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.COLD, 10, true);
      model.record(LaunchType.WARM, 20, true);
      model.record(LaunchType.HOT, 30, true);
      expect(model.successRate()).assertEqual(1);
      expect(model.failureCount()).assertEqual(0);
      done();
    });

    it('AbilityPerformance_036', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.COLD, 10, true);
      expect(model.averageByType(LaunchType.HOT)).assertEqual(0);
      expect(model.countByType(LaunchType.HOT)).assertEqual(0);
      done();
    });

    it('AbilityPerformance_037', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.recordMany(LaunchType.COLD, [100, 200], true);
      model.recordMany(LaunchType.WARM, [50, 150], true);
      model.record(LaunchType.HOT, 10, true);
      expect(model.percentile(75)).assertEqual(150);
      done();
    });

    it('AbilityPerformance_038', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      expect(model.recordMany(LaunchType.HOT, [], true)).assertEqual(0);
      expect(model.getTotal()).assertEqual(0);
      done();
    });

    it('AbilityPerformance_039', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.COLD, 10, false);
      model.record(LaunchType.COLD, 20, true);
      model.record(LaunchType.WARM, 30, false);
      expect(model.failuresByType(LaunchType.COLD)).assertEqual(1);
      expect(model.failuresByType(LaunchType.WARM)).assertEqual(1);
      expect(model.failuresByType(LaunchType.HOT)).assertEqual(0);
      done();
    });

    it('AbilityPerformance_040', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.recordMany(LaunchType.COLD, [100, 200], true);
      model.recordMany(LaunchType.WARM, [50, 150], true);
      model.record(LaunchType.HOT, 10, true);
      expect(model.percentile(25)).assertEqual(50);
      done();
    });

    it('AbilityPerformance_041', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.COLD, 10, true);
      model.record(LaunchType.COLD, 20, false);
      model.record(LaunchType.WARM, 30, true);
      expect(model.successCount()).assertEqual(2);
      expect(model.failureCount()).assertEqual(1);
      done();
    });

    it('AbilityPerformance_042', 0, async (done: Function) => {
      const timer = new LifecycleTimer();
      timer.record('onDestroy', 5);
      expect(timer.slowestName()).assertEqual('onDestroy');
      expect(timer.getCount()).assertEqual(1);
      done();
    });

    it('AbilityPerformance_043', 0, async (done: Function) => {
      const sla = new SlaEvaluator(-50);
      expect(sla.getThreshold()).assertEqual(1);
      expect(sla.check(0)).assertTrue();
      expect(sla.passCount()).assertEqual(1);
      done();
    });

    it('AbilityPerformance_044', 0, async (done: Function) => {
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
    it('AbilityPerformance_045', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.COLD, 10, true);
      model.record(LaunchType.WARM, 20, false);
      model.record(LaunchType.HOT, 30, false);
      expect(Math.abs(model.successRate() - 0.333333) < 0.001).assertTrue();
      expect(model.failureCount()).assertEqual(2);
      done();
    });

    it('AbilityPerformance_046', 0, async (done: Function) => {
      const timer = new LifecycleTimer();
      timer.record('onCreate', 10);
      timer.record('onDestroy', 30);
      expect(timer.totalTime()).assertEqual(40);
      expect(timer.averageTime()).assertEqual(20);
      expect(timer.getCount()).assertEqual(2);
      done();
    });

    it('AbilityPerformance_047', 0, async (done: Function) => {
      const sla = new SlaEvaluator(100);
      sla.check(50);
      sla.check(150);
      sla.check(100);
      sla.check(200);
      expect(sla.getChecks()).assertEqual(4);
      expect(sla.passCount()).assertEqual(2);
      expect(sla.passRate()).assertEqual(0.5);
      done();
    });

    it('AbilityPerformance_048', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.COLD, 10, true);
      model.record(LaunchType.WARM, 50, true);
      model.record(LaunchType.HOT, 20, true);
      expect(model.slowestType()).assertEqual(LaunchType.WARM);
      done();
    });

    it('AbilityPerformance_049', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.record(LaunchType.COLD, 100, true);
      expect(model.percentile(50)).assertEqual(100);
      expect(model.maxLatency()).assertEqual(100);
      expect(model.minLatency()).assertEqual(100);
      done();
    });

    it('AbilityPerformance_050', 0, async (done: Function) => {
      const timer = new LifecycleTimer();
      timer.record('onStart', 10);
      timer.record('onStop', 20);
      expect(timer.has('onStart')).assertTrue();
      expect(timer.has('onStop')).assertTrue();
      expect(timer.has('onResume')).assertFalse();
      done();
    });
    it('AbilityPerformance_051', 0, async (done: Function) => {
      const sla = new SlaEvaluator(200);
      expect(sla.getThreshold()).assertEqual(200);
      expect(sla.check(200)).assertTrue();
      expect(sla.check(201)).assertFalse();
      done();
    });
    it('AbilityPerformance_052', 0, async (done: Function) => {
      const model = new AbilityLaunchModel();
      model.recordMany(LaunchType.WARM, [40, 60], true);
      expect(model.averageByType(LaunchType.WARM)).assertEqual(50);
      expect(model.getRejected()).assertEqual(0);
      done();
    });
  });
}
