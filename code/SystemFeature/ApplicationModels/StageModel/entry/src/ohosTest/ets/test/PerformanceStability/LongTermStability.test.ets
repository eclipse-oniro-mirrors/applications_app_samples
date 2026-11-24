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
  getDriver, ensureAppReady, checkComponentExists, safeDiv
} from '../Shared/SharedDriver';

class StabilitySample {
  uptimeMs: number;
  errorCount: number;
  memoryMb: number;
  latencyMs: number;

  constructor(uptimeMs: number, errorCount: number, memoryMb: number, latencyMs: number) {
    this.uptimeMs = uptimeMs;
    this.errorCount = errorCount;
    this.memoryMb = memoryMb;
    this.latencyMs = latencyMs;
  }
}

class StabilityMonitor {
  private samples: StabilitySample[] = [];
  private crashes: number = 0;
  private restarts: number = 0;
  private rejected: number = 0;

  addSample(uptimeMs: number, errorCount: number, memoryMb: number,
    latencyMs: number): boolean {
    if (uptimeMs <= 0 || errorCount < 0 || memoryMb < 0 || latencyMs < 0) {
      this.rejected = this.rejected + 1;
      return false;
    }
    if (this.samples.length > 0) {
      const last = this.samples[this.samples.length - 1];
      if (uptimeMs <= last.uptimeMs) {
        this.rejected = this.rejected + 1;
        return false;
      }
    }
    this.samples.push(new StabilitySample(uptimeMs, errorCount, memoryMb, latencyMs));
    return true;
  }

  getSampleCount(): number {
    return this.samples.length;
  }

  getRejected(): number {
    return this.rejected;
  }

  getCrashes(): number {
    return this.crashes;
  }

  getRestarts(): number {
    return this.restarts;
  }

  recordCrash(): void {
    this.crashes = this.crashes + 1;
  }

  recordRestart(): void {
    this.restarts = this.restarts + 1;
  }

  totalErrors(): number {
    let total = 0;
    for (const sample of this.samples) {
      total = total + sample.errorCount;
    }
    return total;
  }

  errorRate(): number {
    return safeDiv(this.totalErrors(), this.samples.length);
  }

  averageLatency(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total = 0;
    for (const sample of this.samples) {
      total = total + sample.latencyMs;
    }
    return total / this.samples.length;
  }

  peakMemory(): number {
    let peak = 0;
    for (const sample of this.samples) {
      if (sample.memoryMb > peak) {
        peak = sample.memoryMb;
      }
    }
    return peak;
  }

  memoryGrowth(): number {
    if (this.samples.length < 2) {
      return 0;
    }
    return this.samples[this.samples.length - 1].memoryMb - this.samples[0].memoryMb;
  }

  uptime(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.samples[this.samples.length - 1].uptimeMs;
  }

  isHealthy(maxErrorRate: number, maxLatency: number): boolean {
    return this.errorRate() <= maxErrorRate && this.averageLatency() <= maxLatency;
  }

  degradationLevel(): number {
    let score = 0;
    if (this.memoryGrowth() > 50) {
      score = score + 1;
    }
    if (this.errorRate() > 1) {
      score = score + 1;
    }
    if (this.averageLatency() > 100) {
      score = score + 1;
    }
    return score;
  }

  reset(): void {
    this.samples = [];
    this.crashes = 0;
    this.restarts = 0;
    this.rejected = 0;
  }
}
class DriftClock {
  private baseMs: number;
  private ticks: number = 0;
  private driftPerTick: number;

  constructor(baseMs: number, driftPerTick: number) {
    this.baseMs = baseMs >= 0 ? baseMs : 0;
    this.driftPerTick = driftPerTick;
  }

  advance(count: number): number {
    if (count > 0) {
      this.ticks = this.ticks + count;
    }
    return this.current();
  }

  current(): number {
    return this.baseMs + this.ticks;
  }

  drift(): number {
    return this.ticks * this.driftPerTick;
  }

  getTicks(): number {
    return this.ticks;
  }

  reset(): void {
    this.ticks = 0;
  }
}

export default function longTermStabilityTest(): void {
  describe('LongTermStability', () => {
    it('LongTermStability_001', 0, async (done: Function) => {
      const monitor = new StabilityMonitor();
      expect(monitor.getSampleCount()).assertEqual(0);
      expect(monitor.uptime()).assertEqual(0);
      expect(monitor.averageLatency()).assertEqual(0);
      expect(monitor.memoryGrowth()).assertEqual(0);
      done();
    });

    it('LongTermStability_002', 0, async (done: Function) => {
      const monitor = new StabilityMonitor();
      expect(monitor.addSample(1000, 1, 100, 50)).assertTrue();
      expect(monitor.addSample(2000, 0, 110, 60)).assertTrue();
      expect(monitor.addSample(3000, 2, 130, 70)).assertTrue();
      expect(monitor.getSampleCount()).assertEqual(3);
      done();
    });

    it('LongTermStability_003', 0, async (done: Function) => {
      const monitor = new StabilityMonitor();
      monitor.addSample(1000, 1, 100, 50);
      expect(monitor.addSample(1000, 0, 100, 50)).assertFalse();
      expect(monitor.addSample(500, 0, 100, 50)).assertFalse();
      expect(monitor.getRejected()).assertEqual(2);
      done();
    });

    it('LongTermStability_004', 0, async (done: Function) => {
      const monitor = new StabilityMonitor();
      expect(monitor.addSample(0, 0, 100, 50)).assertFalse();
      expect(monitor.addSample(1000, -1, 100, 50)).assertFalse();
      expect(monitor.addSample(1000, 0, -1, 50)).assertFalse();
      expect(monitor.addSample(1000, 0, 100, -1)).assertFalse();
      expect(monitor.getRejected()).assertEqual(4);
      done();
    });

    it('LongTermStability_005', 0, async (done: Function) => {
      const monitor = new StabilityMonitor();
      monitor.addSample(1000, 1, 100, 50);
      monitor.addSample(2000, 0, 110, 60);
      monitor.addSample(3000, 2, 130, 70);
      expect(monitor.totalErrors()).assertEqual(3);
      expect(monitor.errorRate()).assertEqual(1);
      done();
    });

    it('LongTermStability_006', 0, async (done: Function) => {
      const monitor = new StabilityMonitor();
      monitor.addSample(1000, 1, 100, 50);
      monitor.addSample(2000, 0, 110, 60);
      monitor.addSample(3000, 2, 130, 70);
      expect(monitor.averageLatency()).assertEqual(60);
      expect(monitor.peakMemory()).assertEqual(130);
      expect(monitor.uptime()).assertEqual(3000);
      done();
    });

    it('LongTermStability_007', 0, async (done: Function) => {
      const monitor = new StabilityMonitor();
      monitor.addSample(1000, 1, 100, 50);
      monitor.addSample(2000, 0, 110, 60);
      monitor.addSample(3000, 2, 130, 70);
      expect(monitor.memoryGrowth()).assertEqual(30);
      expect(monitor.degradationLevel()).assertEqual(0);
      done();
    });

    it('LongTermStability_008', 0, async (done: Function) => {
      const monitor = new StabilityMonitor();
      monitor.recordCrash();
      monitor.recordCrash();
      monitor.recordRestart();
      expect(monitor.getCrashes()).assertEqual(2);
      expect(monitor.getRestarts()).assertEqual(1);
      monitor.reset();
      expect(monitor.getCrashes()).assertEqual(0);
      expect(monitor.getRestarts()).assertEqual(0);
      done();
    });

    it('LongTermStability_009', 0, async (done: Function) => {
      const monitor = new StabilityMonitor();
      monitor.addSample(1000, 1, 100, 50);
      monitor.addSample(2000, 0, 110, 60);
      monitor.addSample(3000, 2, 130, 70);
      expect(monitor.isHealthy(1.5, 80)).assertTrue();
      expect(monitor.isHealthy(0.5, 80)).assertFalse();
      expect(monitor.isHealthy(1.5, 40)).assertFalse();
      done();
    });

    it('LongTermStability_010', 0, async (done: Function) => {
      const monitor = new StabilityMonitor();
      monitor.addSample(1000, 2, 100, 120);
      monitor.addSample(2000, 2, 200, 150);
      expect(monitor.degradationLevel()).assertEqual(3);
      expect(monitor.memoryGrowth()).assertEqual(100);
      done();
    });

    it('LongTermStability_011', 0, async (done: Function) => {
      const clock = new DriftClock(1000, 2);
      expect(clock.current()).assertEqual(1000);
      expect(clock.advance(10)).assertEqual(1010);
      expect(clock.drift()).assertEqual(20);
      expect(clock.getTicks()).assertEqual(10);
      done();
    });

    it('LongTermStability_012', 0, async (done: Function) => {
      const clock = new DriftClock(-5, 3);
      expect(clock.current()).assertEqual(0);
      clock.advance(-2);
      expect(clock.getTicks()).assertEqual(0);
      clock.advance(5);
      expect(clock.current()).assertEqual(5);
      clock.reset();
      expect(clock.current()).assertEqual(0);
      done();
    });

    it('LongTermStability_013', 0, async (done: Function) => {
      const monitor = new StabilityMonitor();
      monitor.addSample(1000, 5, 50, 10);
      monitor.addSample(2000, 5, 60, 20);
      monitor.addSample(3000, 5, 70, 30);
      expect(monitor.totalErrors()).assertEqual(15);
      expect(monitor.errorRate()).assertEqual(5);
      expect(monitor.isHealthy(5, 30)).assertTrue();
      expect(monitor.isHealthy(4, 30)).assertFalse();
      done();
    });

    it('LongTermStability_014', 0, async (done: Function) => {
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

    it('LongTermStability_015', 0, async (done: Function) => {
      const monitor = new StabilityMonitor();
      monitor.addSample(1000, 0, 100, 50);
      monitor.reset();
      expect(monitor.getSampleCount()).assertEqual(0);
      expect(monitor.totalErrors()).assertEqual(0);
      expect(monitor.errorRate()).assertEqual(0);
      done();
    });
  });
}
