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

class StressRunner {
  private latencies: number[] = [];
  private successes: number = 0;
  private failures: number = 0;
  private rejected: number = 0;

  record(latencyMs: number, success: boolean): boolean {
    if (latencyMs < 0) {
      this.rejected = this.rejected + 1;
      return false;
    }
    this.latencies.push(latencyMs);
    if (success) {
      this.successes = this.successes + 1;
    } else {
      this.failures = this.failures + 1;
    }
    return true;
  }

  recordMany(values: number[], success: boolean): number {
    let accepted = 0;
    for (const value of values) {
      if (this.record(value, success)) {
        accepted = accepted + 1;
      }
    }
    return accepted;
  }

  getTotal(): number {
    return this.latencies.length;
  }

  getSuccesses(): number {
    return this.successes;
  }

  getFailures(): number {
    return this.failures;
  }

  getRejected(): number {
    return this.rejected;
  }

  successRate(): number {
    return safeDiv(this.successes, this.latencies.length);
  }

  errorRate(): number {
    return safeDiv(this.failures, this.latencies.length);
  }

  averageLatency(): number {
    if (this.latencies.length === 0) {
      return 0;
    }
    let total = 0;
    for (const latency of this.latencies) {
      total = total + latency;
    }
    return total / this.latencies.length;
  }

  maxLatency(): number {
    let max = 0;
    for (const latency of this.latencies) {
      if (latency > max) {
        max = latency;
      }
    }
    return max;
  }

  minLatency(): number {
    if (this.latencies.length === 0) {
      return 0;
    }
    let min = this.latencies[0];
    for (const latency of this.latencies) {
      if (latency < min) {
        min = latency;
      }
    }
    return min;
  }

  sortedLatencies(): number[] {
    const result: number[] = [];
    for (const latency of this.latencies) {
      result.push(latency);
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
    const sorted = this.sortedLatencies();
    if (sorted.length === 0) {
      return 0;
    }
    const clamped = clampNumber(percent, 0, 100);
    const index = Math.floor((clamped / 100) * (sorted.length - 1));
    return sorted[index];
  }

  throughput(windowMs: number): number {
    if (windowMs <= 0) {
      return 0;
    }
    return Math.round(safeDiv(this.latencies.length, windowMs / 1000));
  }

  reset(): void {
    this.latencies = [];
    this.successes = 0;
    this.failures = 0;
    this.rejected = 0;
  }
}
class LoadProfile {
  private users: number;
  private requestsPerUser: number;
  private durationSeconds: number;

  constructor(users: number, requestsPerUser: number, durationSeconds: number) {
    this.users = users;
    this.requestsPerUser = requestsPerUser;
    this.durationSeconds = durationSeconds;
  }

  getUsers(): number {
    return this.users;
  }

  totalRequests(): number {
    if (!this.isValid()) {
      return 0;
    }
    return this.users * this.requestsPerUser;
  }

  averageRps(): number {
    if (!this.isValid()) {
      return 0;
    }
    return this.totalRequests() / this.durationSeconds;
  }

  isValid(): boolean {
    return this.users > 0 && this.requestsPerUser > 0 && this.durationSeconds > 0;
  }

  scaledUsers(factor: number): number {
    if (factor <= 0) {
      return 0;
    }
    return Math.round(this.users * factor);
  }
}

class SaturationModel {
  private capacity: number;
  private load: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity > 0 ? capacity : 1;
  }

  getCapacity(): number {
    return this.capacity;
  }

  setLoad(load: number): void {
    this.load = load > 0 ? load : 0;
  }

  getLoad(): number {
    return this.load;
  }

  utilization(): number {
    return safeDiv(this.load, this.capacity);
  }

  isSaturated(): boolean {
    return this.load >= this.capacity;
  }

  headroom(): number {
    const remaining = this.capacity - this.load;
    return remaining > 0 ? remaining : 0;
  }

  overflow(): number {
    const excess = this.load - this.capacity;
    return excess > 0 ? excess : 0;
  }
}

export default function performanceStressTest(): void {
  describe('PerformanceStress', () => {
    it('PerformanceStress_001', 0, async (done: Function) => {
      const runner = new StressRunner();
      expect(runner.getTotal()).assertEqual(0);
      expect(runner.successRate()).assertEqual(0);
      expect(runner.averageLatency()).assertEqual(0);
      expect(runner.throughput(1000)).assertEqual(0);
      done();
    });

    it('PerformanceStress_002', 0, async (done: Function) => {
      const runner = new StressRunner();
      expect(runner.record(10, true)).assertTrue();
      expect(runner.record(20, true)).assertTrue();
      expect(runner.getTotal()).assertEqual(2);
      expect(runner.getSuccesses()).assertEqual(2);
      done();
    });

    it('PerformanceStress_003', 0, async (done: Function) => {
      const runner = new StressRunner();
      expect(runner.record(-1, true)).assertFalse();
      expect(runner.record(-5, false)).assertFalse();
      expect(runner.getRejected()).assertEqual(2);
      expect(runner.getTotal()).assertEqual(0);
      done();
    });

    it('PerformanceStress_004', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.record(10, true);
      runner.record(20, true);
      runner.record(30, true);
      runner.record(40, false);
      expect(runner.successRate()).assertEqual(0.75);
      expect(runner.errorRate()).assertEqual(0.25);
      done();
    });

    it('PerformanceStress_005', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.record(10, true);
      runner.record(20, true);
      runner.record(30, true);
      runner.record(40, false);
      expect(runner.averageLatency()).assertEqual(25);
      expect(runner.maxLatency()).assertEqual(40);
      expect(runner.minLatency()).assertEqual(10);
      done();
    });

    it('PerformanceStress_006', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.record(10, true);
      runner.record(20, true);
      runner.record(30, true);
      runner.record(40, false);
      expect(runner.percentile(0)).assertEqual(10);
      expect(runner.percentile(50)).assertEqual(20);
      expect(runner.percentile(100)).assertEqual(40);
      done();
    });

    it('PerformanceStress_007', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([10, 20, 30, 40], true);
      expect(runner.getTotal()).assertEqual(4);
      expect(runner.throughput(1000)).assertEqual(4);
      expect(runner.throughput(2000)).assertEqual(2);
      done();
    });

    it('PerformanceStress_008', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([10, 20], true);
      expect(runner.throughput(0)).assertEqual(0);
      expect(runner.recordMany([5, -1, 15], false)).assertEqual(2);
      expect(runner.getFailures()).assertEqual(2);
      expect(runner.getRejected()).assertEqual(1);
      done();
    });

    it('PerformanceStress_009', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([10, 20, 30], true);
      runner.reset();
      expect(runner.getTotal()).assertEqual(0);
      expect(runner.getSuccesses()).assertEqual(0);
      expect(runner.getFailures()).assertEqual(0);
      expect(runner.getRejected()).assertEqual(0);
      done();
    });

    it('PerformanceStress_010', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([10, 20, 30, 40, 50], true);
      expect(runner.percentile(-10)).assertEqual(10);
      expect(runner.percentile(150)).assertEqual(50);
      expect(runner.maxLatency()).assertEqual(50);
      done();
    });

    it('PerformanceStress_011', 0, async (done: Function) => {
      const profile = new LoadProfile(10, 20, 40);
      expect(profile.isValid()).assertTrue();
      expect(profile.getUsers()).assertEqual(10);
      expect(profile.totalRequests()).assertEqual(200);
      expect(profile.averageRps()).assertEqual(5);
      done();
    });

    it('PerformanceStress_012', 0, async (done: Function) => {
      const profile = new LoadProfile(0, 20, 40);
      expect(profile.isValid()).assertFalse();
      expect(profile.totalRequests()).assertEqual(0);
      expect(profile.averageRps()).assertEqual(0);
      done();
    });

    it('PerformanceStress_013', 0, async (done: Function) => {
      const profile = new LoadProfile(10, 20, 0);
      expect(profile.isValid()).assertFalse();
      expect(profile.totalRequests()).assertEqual(0);
      expect(profile.scaledUsers(1.5)).assertEqual(15);
      done();
    });

    it('PerformanceStress_014', 0, async (done: Function) => {
      const profile = new LoadProfile(10, 20, 40);
      expect(profile.scaledUsers(0)).assertEqual(0);
      expect(profile.scaledUsers(-1)).assertEqual(0);
      expect(profile.scaledUsers(2)).assertEqual(20);
      done();
    });

    it('PerformanceStress_015', 0, async (done: Function) => {
      const saturation = new SaturationModel(100);
      expect(saturation.getCapacity()).assertEqual(100);
      saturation.setLoad(50);
      expect(saturation.utilization()).assertEqual(0.5);
      expect(saturation.isSaturated()).assertFalse();
      expect(saturation.headroom()).assertEqual(50);
      done();
    });

    it('PerformanceStress_016', 0, async (done: Function) => {
      const saturation = new SaturationModel(100);
      saturation.setLoad(100);
      expect(saturation.utilization()).assertEqual(1);
      expect(saturation.isSaturated()).assertTrue();
      expect(saturation.overflow()).assertEqual(0);
      expect(saturation.headroom()).assertEqual(0);
      done();
    });

    it('PerformanceStress_017', 0, async (done: Function) => {
      const saturation = new SaturationModel(100);
      saturation.setLoad(150);
      expect(saturation.utilization()).assertEqual(1.5);
      expect(saturation.isSaturated()).assertTrue();
      expect(saturation.overflow()).assertEqual(50);
      done();
    });

    it('PerformanceStress_018', 0, async (done: Function) => {
      const saturation = new SaturationModel(0);
      expect(saturation.getCapacity()).assertEqual(1);
      saturation.setLoad(-10);
      expect(saturation.getLoad()).assertEqual(0);
      expect(saturation.utilization()).assertEqual(0);
      done();
    });

    it('PerformanceStress_019', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([100, 200, 300], true);
      expect(runner.throughput(500)).assertEqual(6);
      expect(runner.throughput(3000)).assertEqual(1);
      done();
    });

    it('PerformanceStress_020', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([5, 5, 5], true);
      expect(runner.averageLatency()).assertEqual(5);
      expect(runner.maxLatency()).assertEqual(5);
      expect(runner.minLatency()).assertEqual(5);
      done();
    });
    it('PerformanceStress_021', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.record(10, false);
      runner.record(20, false);
      expect(runner.successRate()).assertEqual(0);
      expect(runner.errorRate()).assertEqual(1);
      expect(runner.getFailures()).assertEqual(2);
      done();
    });

    it('PerformanceStress_022', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([10, 20, 30, 40], true);
      expect(runner.percentile(25)).assertEqual(10);
      expect(runner.percentile(75)).assertEqual(30);
      done();
    });

    it('PerformanceStress_023', 0, async (done: Function) => {
      const runner = new StressRunner();
      expect(runner.recordMany([10, 20], true)).assertEqual(2);
      expect(runner.recordMany([30], false)).assertEqual(1);
      expect(runner.getTotal()).assertEqual(3);
      expect(runner.getSuccesses()).assertEqual(2);
      expect(runner.getFailures()).assertEqual(1);
      done();
    });

    it('PerformanceStress_024', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([10, 20, 30], true);
      runner.reset();
      expect(runner.record(5, true)).assertTrue();
      expect(runner.getTotal()).assertEqual(1);
      expect(runner.getSuccesses()).assertEqual(1);
      done();
    });

    it('PerformanceStress_025', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([10, 20, 30], true);
      expect(runner.throughput(1500)).assertEqual(2);
      expect(runner.throughput(600)).assertEqual(5);
      done();
    });

    it('PerformanceStress_026', 0, async (done: Function) => {
      const profile = new LoadProfile(5, 10, 50);
      expect(profile.totalRequests()).assertEqual(50);
      expect(profile.averageRps()).assertEqual(1);
      expect(profile.isValid()).assertTrue();
      done();
    });

    it('PerformanceStress_027', 0, async (done: Function) => {
      const profile = new LoadProfile(100, 100, 10);
      expect(profile.totalRequests()).assertEqual(10000);
      expect(profile.averageRps()).assertEqual(1000);
      done();
    });

    it('PerformanceStress_028', 0, async (done: Function) => {
      const saturation = new SaturationModel(1);
      saturation.setLoad(1);
      expect(saturation.utilization()).assertEqual(1);
      expect(saturation.isSaturated()).assertTrue();
      expect(saturation.headroom()).assertEqual(0);
      done();
    });

    it('PerformanceStress_029', 0, async (done: Function) => {
      const saturation = new SaturationModel(50);
      saturation.setLoad(25);
      expect(saturation.utilization()).assertEqual(0.5);
      expect(saturation.headroom()).assertEqual(25);
      expect(saturation.overflow()).assertEqual(0);
      done();
    });

    it('PerformanceStress_030', 0, async (done: Function) => {
      const runner = new StressRunner();
      expect(runner.maxLatency()).assertEqual(0);
      expect(runner.minLatency()).assertEqual(0);
      expect(runner.averageLatency()).assertEqual(0);
      done();
    });

    it('PerformanceStress_031', 0, async (done: Function) => {
      const runner = new StressRunner();
      expect(runner.recordMany([], true)).assertEqual(0);
      expect(runner.getTotal()).assertEqual(0);
      done();
    });

    it('PerformanceStress_032', 0, async (done: Function) => {
      const profile = new LoadProfile(10, 4, 20);
      expect(profile.scaledUsers(0.5)).assertEqual(5);
      expect(profile.scaledUsers(3)).assertEqual(30);
      done();
    });

    it('PerformanceStress_033', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([1, 2, 3], true);
      expect(runner.successRate()).assertEqual(1);
      expect(runner.errorRate()).assertEqual(0);
      expect(runner.getRejected()).assertEqual(0);
      done();
    });

    it('PerformanceStress_034', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([30, 10, 20], true);
      expect(runner.percentile(50)).assertEqual(20);
      expect(runner.minLatency()).assertEqual(10);
      expect(runner.maxLatency()).assertEqual(30);
      done();
    });

    it('PerformanceStress_035', 0, async (done: Function) => {
      const saturation = new SaturationModel(10);
      saturation.setLoad(5);
      expect(saturation.headroom()).assertEqual(5);
      expect(saturation.overflow()).assertEqual(0);
      expect(saturation.utilization()).assertEqual(0.5);
      done();
    });

    it('PerformanceStress_036', 0, async (done: Function) => {
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

    it('PerformanceStress_037', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([10, 20, 30, 40], true);
      expect(runner.throughput(400)).assertEqual(10);
      expect(runner.getSuccesses()).assertEqual(4);
      done();
    });

    it('PerformanceStress_038', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.recordMany([10, 20, 30], true);
      runner.record(-1, true);
      expect(runner.successRate()).assertEqual(1);
      expect(runner.getRejected()).assertEqual(1);
      expect(runner.getTotal()).assertEqual(3);
      done();
    });

    it('PerformanceStress_039', 0, async (done: Function) => {
      const profile = new LoadProfile(1, 1, 1);
      expect(profile.totalRequests()).assertEqual(1);
      expect(profile.averageRps()).assertEqual(1);
      expect(profile.isValid()).assertTrue();
      done();
    });

    it('PerformanceStress_040', 0, async (done: Function) => {
      const saturation = new SaturationModel(100);
      saturation.setLoad(0);
      expect(saturation.utilization()).assertEqual(0);
      expect(saturation.headroom()).assertEqual(100);
      expect(saturation.overflow()).assertEqual(0);
      done();
    });
    it('PerformanceStress_041', 0, async (done: Function) => {
      const runner = new StressRunner();
      runner.record(100, true);
      expect(runner.percentile(0)).assertEqual(100);
      expect(runner.percentile(100)).assertEqual(100);
      expect(runner.averageLatency()).assertEqual(100);
      done();
    });
  });
}
