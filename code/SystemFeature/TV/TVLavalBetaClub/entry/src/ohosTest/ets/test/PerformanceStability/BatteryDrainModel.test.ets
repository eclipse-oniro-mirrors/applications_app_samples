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

const MAX_SAMPLES: number = 64;

const MIN_PERCENT: number = 0;

const MAX_PERCENT: number = 100;

const MS_PER_HOUR: number = 3600000;

const ALERT_RATE: number = 8;

const CRITICAL_RATE: number = 15;

interface DrainSample {
  percent: number;
  timestamp: number;
}

// Estimates battery drain rate from periodic samples
class BatteryDrainModel {
  private samples: DrainSample[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public add(percent: number, now: number): boolean {
    if (percent < MIN_PERCENT || percent > MAX_PERCENT || now < 0 || this.capacity <= 0) {
      return false;
    }
    if (this.samples.length >= this.capacity) {
      this.samples.shift();
    }
    this.samples.push({ percent: percent, timestamp: now });
    return true;
  }

  public count(): number {
    return this.samples.length;
  }

  public latest(): DrainSample | undefined {
    return this.samples.length === 0 ? undefined : this.samples[this.samples.length - 1];
  }

  public drainPercent(): number {
    if (this.samples.length < 2) {
      return 0;
    }
    const first = this.samples[0].percent;
    const last = this.samples[this.samples.length - 1].percent;
    const drain = first - last;
    return drain < 0 ? 0 : drain;
  }

  public elapsedMs(): number {
    if (this.samples.length < 2) {
      return 0;
    }
    return this.samples[this.samples.length - 1].timestamp - this.samples[0].timestamp;
  }

  public ratePercentPerHour(): number {
    const elapsed = this.elapsedMs();
    if (elapsed <= 0) {
      return 0;
    }
    return this.drainPercent() * MS_PER_HOUR / elapsed;
  }

  public isAlert(): boolean {
    return this.ratePercentPerHour() >= ALERT_RATE;
  }

  public isCritical(): boolean {
    return this.ratePercentPerHour() >= CRITICAL_RATE;
  }

  public hoursRemaining(): number {
    const latest = this.latest();
    const rate = this.ratePercentPerHour();
    if (latest === undefined || rate <= 0) {
      return 0;
    }
    return latest.percent / rate;
  }

  public isMonotonicDown(): boolean {
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i].percent > this.samples[i - 1].percent) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.samples = [];
  }
}

// Classifies drain rates into operational guidance
class DrainAdvisor {
  public static levelOf(rate: number): string {
    if (rate >= CRITICAL_RATE) {
      return 'critical';
    }
    if (rate >= ALERT_RATE) {
      return 'alert';
    }
    return 'normal';
  }

  public static shouldReduceBackground(rate: number): boolean {
    return rate >= ALERT_RATE;
  }

  public static shouldNotifyUser(rate: number): boolean {
    return rate >= CRITICAL_RATE;
  }

  public static isRateAcceptable(rate: number, budget: number): boolean {
    return rate >= 0 && rate <= budget;
  }
}

// Aggregates battery checks for reports
class DrainReport {
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

export default function batteryDrainModelTest() {
  describe('BatteryDrainModel_Test', () => {

    it('model_should_add_samples', 0, () => {
      const model = new BatteryDrainModel(MAX_SAMPLES);
      expect(model.add(100, 0)).assertTrue();
      expect(model.add(90, MS_PER_HOUR)).assertTrue();
      expect(model.count()).assertEqual(2);
      expect((model.latest() as DrainSample).percent).assertEqual(90);
    });

    it('model_should_reject_invalid_samples', 0, () => {
      const model = new BatteryDrainModel(MAX_SAMPLES);
      expect(model.add(-1, 0)).assertFalse();
      expect(model.add(MAX_PERCENT + 1, 0)).assertFalse();
      expect(model.add(50, -1)).assertFalse();
      expect(model.count()).assertEqual(0);
      const zero = new BatteryDrainModel(0);
      expect(zero.add(50, 0)).assertFalse();
      expect(zero.latest() === undefined).assertTrue();
    });

    it('model_should_compute_drain_percent', 0, () => {
      const model = new BatteryDrainModel(MAX_SAMPLES);
      model.add(100, 0);
      model.add(95, MS_PER_HOUR / 2);
      model.add(90, MS_PER_HOUR);
      expect(model.drainPercent()).assertEqual(10);
      expect(model.elapsedMs()).assertEqual(MS_PER_HOUR);
      expect(model.isMonotonicDown()).assertTrue();
    });

    it('model_should_ignore_charging', 0, () => {
      const model = new BatteryDrainModel(MAX_SAMPLES);
      model.add(50, 0);
      model.add(60, MS_PER_HOUR);
      expect(model.drainPercent()).assertEqual(0);
      expect(model.ratePercentPerHour()).assertEqual(0);
      expect(model.isMonotonicDown()).assertFalse();
      expect(model.hoursRemaining()).assertEqual(0);
    });

    it('model_should_compute_rate', 0, () => {
      const model = new BatteryDrainModel(MAX_SAMPLES);
      model.add(100, 0);
      model.add(90, MS_PER_HOUR);
      expect(model.ratePercentPerHour()).assertEqual(10);
      expect(model.isAlert()).assertTrue();
      expect(model.isCritical()).assertFalse();
      expect(model.hoursRemaining()).assertEqual(9);
    });

    it('model_should_flag_critical_rate', 0, () => {
      const model = new BatteryDrainModel(MAX_SAMPLES);
      model.add(100, 0);
      model.add(80, MS_PER_HOUR);
      expect(model.ratePercentPerHour()).assertEqual(20);
      expect(model.isCritical()).assertTrue();
      expect(model.hoursRemaining()).assertEqual(4);
      expect(DrainAdvisor.levelOf(model.ratePercentPerHour())).assertEqual('critical');
    });

    it('model_should_be_bounded', 0, () => {
      const model = new BatteryDrainModel(2);
      model.add(100, 0);
      model.add(90, MS_PER_HOUR);
      model.add(80, MS_PER_HOUR * 2);
      expect(model.count()).assertEqual(2);
      expect(model.drainPercent()).assertEqual(10);
      model.reset();
      expect(model.count()).assertEqual(0);
      expect(model.drainPercent()).assertEqual(0);
    });

    it('advisor_should_classify_rates', 0, () => {
      expect(DrainAdvisor.levelOf(0)).assertEqual('normal');
      expect(DrainAdvisor.levelOf(ALERT_RATE)).assertEqual('alert');
      expect(DrainAdvisor.levelOf(CRITICAL_RATE)).assertEqual('critical');
      expect(DrainAdvisor.levelOf(100)).assertEqual('critical');
      expect(DrainAdvisor.shouldReduceBackground(ALERT_RATE)).assertTrue();
      expect(DrainAdvisor.shouldReduceBackground(ALERT_RATE - 1)).assertFalse();
      expect(DrainAdvisor.shouldNotifyUser(CRITICAL_RATE)).assertTrue();
    });

    it('advisor_should_check_budget', 0, () => {
      expect(DrainAdvisor.isRateAcceptable(5, 10)).assertTrue();
      expect(DrainAdvisor.isRateAcceptable(10, 10)).assertTrue();
      expect(DrainAdvisor.isRateAcceptable(11, 10)).assertFalse();
      expect(DrainAdvisor.isRateAcceptable(-1, 10)).assertFalse();
    });

    it('report_should_aggregate_battery_checks', 0, () => {
      const report = new DrainReport();
      report.check('rate', true);
      report.check('remaining', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('alert', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['alert']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('drain_flow_should_warn_on_high_rate', 0, () => {
      const model = new BatteryDrainModel(MAX_SAMPLES);
      const report = new DrainReport();
      model.add(100, 0);
      model.add(88, MS_PER_HOUR);
      const rate = model.ratePercentPerHour();
      report.check('alert', DrainAdvisor.shouldReduceBackground(rate));
      report.check('no-notify-below-critical', !DrainAdvisor.shouldNotifyUser(rate));
      report.check('budget', !DrainAdvisor.isRateAcceptable(rate, 5));
      expect(report.isPassed()).assertTrue();
      expect(model.isAlert()).assertTrue();
      expect(DrainAdvisor.levelOf(rate)).assertEqual('alert');
    });

    it('battery_constants_should_be_stable', 0, () => {
      expect(MAX_SAMPLES).assertEqual(64);
      expect(MIN_PERCENT).assertEqual(0);
      expect(MAX_PERCENT).assertEqual(100);
      expect(MS_PER_HOUR).assertEqual(3600000);
      expect(ALERT_RATE).assertEqual(8);
      expect(CRITICAL_RATE).assertEqual(15);
    });
  });
}

