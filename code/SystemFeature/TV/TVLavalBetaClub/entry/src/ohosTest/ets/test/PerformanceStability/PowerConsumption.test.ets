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

const MODE_ACTIVE: string = 'active';

const MODE_IDLE: string = 'idle';

const MODE_STANDBY: string = 'standby';

const ACTIVE_WATTS: number = 80;

const IDLE_WATTS: number = 20;

const STANDBY_WATTS: number = 2;

const MS_PER_HOUR: number = 3600000;

const MAX_STANDBY_DRAIN_PERCENT: number = 2;

interface PowerProfile {
  activeWatts: number;
  idleWatts: number;
  standbyWatts: number;
}

interface PowerReading {
  mode: string;
  durationMs: number;
  energyMwh: number;
}

// Computes energy consumption from power and duration
class PowerCalculator {
  public static wattsFor(mode: string, profile: PowerProfile): number {
    if (mode === MODE_ACTIVE) {
      return profile.activeWatts;
    }
    if (mode === MODE_IDLE) {
      return profile.idleWatts;
    }
    if (mode === MODE_STANDBY) {
      return profile.standbyWatts;
    }
    return 0;
  }

  public static energyMwh(watts: number, durationMs: number): number {
    if (watts <= 0 || durationMs <= 0) {
      return 0;
    }
    return watts * durationMs / MS_PER_HOUR;
  }

  public static mwhToWh(mwh: number): number {
    return mwh / 1000;
  }

  public static isModeKnown(mode: string): boolean {
    return mode === MODE_ACTIVE || mode === MODE_IDLE || mode === MODE_STANDBY;
  }
}

// Accumulates energy across workload modes
class PowerSession {
  private readings: PowerReading[] = [];
  private readonly profile: PowerProfile;

  constructor(profile: PowerProfile) {
    this.profile = profile;
  }

  public record(mode: string, durationMs: number): boolean {
    if (!PowerCalculator.isModeKnown(mode) || durationMs <= 0) {
      return false;
    }
    const watts = PowerCalculator.wattsFor(mode, this.profile);
    this.readings.push({
      mode: mode,
      durationMs: durationMs,
      energyMwh: PowerCalculator.energyMwh(watts, durationMs)
    });
    return true;
  }

  public totalEnergyMwh(): number {
    let total: number = 0;
    for (let i = 0; i < this.readings.length; i++) {
      total += this.readings[i].energyMwh;
    }
    return total;
  }

  public energyFor(mode: string): number {
    let total: number = 0;
    for (let i = 0; i < this.readings.length; i++) {
      if (this.readings[i].mode === mode) {
        total += this.readings[i].energyMwh;
      }
    }
    return total;
  }

  public durationFor(mode: string): number {
    let total: number = 0;
    for (let i = 0; i < this.readings.length; i++) {
      if (this.readings[i].mode === mode) {
        total += this.readings[i].durationMs;
      }
    }
    return total;
  }

  public count(): number {
    return this.readings.length;
  }

  public averageWatts(): number {
    if (this.readings.length === 0) {
      return 0;
    }
    const totalDuration = this.totalDuration();
    if (totalDuration <= 0) {
      return 0;
    }
    return this.totalEnergyMwh() * MS_PER_HOUR / totalDuration;
  }

  public totalDuration(): number {
    let total: number = 0;
    for (let i = 0; i < this.readings.length; i++) {
      total += this.readings[i].durationMs;
    }
    return total;
  }

  public reset(): void {
    this.readings = [];
  }
}

// Checks energy usage against a budget
class PowerBudget {
  private readonly limitMwh: number;

  constructor(limitMwh: number) {
    this.limitMwh = limitMwh;
  }

  public isWithin(usedMwh: number): boolean {
    return usedMwh <= this.limitMwh;
  }

  public remaining(usedMwh: number): number {
    const remaining = this.limitMwh - usedMwh;
    return remaining < 0 ? 0 : remaining;
  }

  public usagePercent(usedMwh: number): number {
    return this.limitMwh <= 0 ? 0 : usedMwh * 100 / this.limitMwh;
  }

  public getLimit(): number {
    return this.limitMwh;
  }

  public isOverBudget(usedMwh: number): boolean {
    return usedMwh > this.limitMwh;
  }
}

// Analyzes standby drain against a percentage threshold
class StandbyAnalyzer {
  private samples: number[] = [];

  public add(drainPercent: number): boolean {
    if (drainPercent < 0) {
      return false;
    }
    this.samples.push(drainPercent);
    return true;
  }

  public count(): number {
    return this.samples.length;
  }

  public average(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      total += this.samples[i];
    }
    return total / this.samples.length;
  }

  public max(): number {
    let max: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i] > max) {
        max = this.samples[i];
      }
    }
    return max;
  }

  public isAcceptable(threshold: number): boolean {
    return this.average() <= threshold;
  }

  public reset(): void {
    this.samples = [];
  }
}

// Produces a pass/fail summary for power checks
class PowerReport {
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

  public summary(): string {
    return this.isPassed() ? 'within-budget' : 'over-budget';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function powerConsumptionTest() {
  describe('PowerConsumption_Test', () => {

    it('calculator_should_map_modes_to_watts', 0, () => {
      const profile: PowerProfile = {
        activeWatts: ACTIVE_WATTS, idleWatts: IDLE_WATTS, standbyWatts: STANDBY_WATTS
      };
      expect(PowerCalculator.wattsFor(MODE_ACTIVE, profile)).assertEqual(ACTIVE_WATTS);
      expect(PowerCalculator.wattsFor(MODE_IDLE, profile)).assertEqual(IDLE_WATTS);
      expect(PowerCalculator.wattsFor(MODE_STANDBY, profile)).assertEqual(STANDBY_WATTS);
      expect(PowerCalculator.wattsFor('unknown', profile)).assertEqual(0);
      expect(PowerCalculator.isModeKnown(MODE_ACTIVE)).assertTrue();
      expect(PowerCalculator.isModeKnown('unknown')).assertFalse();
    });

    it('calculator_should_compute_energy', 0, () => {
      expect(PowerCalculator.energyMwh(80, MS_PER_HOUR)).assertEqual(80);
      expect(PowerCalculator.energyMwh(80, MS_PER_HOUR / 2)).assertEqual(40);
      expect(PowerCalculator.energyMwh(0, MS_PER_HOUR)).assertEqual(0);
      expect(PowerCalculator.energyMwh(80, 0)).assertEqual(0);
      expect(PowerCalculator.mwhToWh(1500)).assertEqual(1.5);
      expect(PowerCalculator.mwhToWh(0)).assertEqual(0);
    });

    it('session_should_accumulate_energy', 0, () => {
      const profile: PowerProfile = {
        activeWatts: ACTIVE_WATTS, idleWatts: IDLE_WATTS, standbyWatts: STANDBY_WATTS
      };
      const session = new PowerSession(profile);
      expect(session.record(MODE_ACTIVE, MS_PER_HOUR)).assertTrue();
      expect(session.record(MODE_IDLE, MS_PER_HOUR)).assertTrue();
      expect(session.count()).assertEqual(2);
      expect(session.totalEnergyMwh()).assertEqual(ACTIVE_WATTS + IDLE_WATTS);
      expect(session.energyFor(MODE_ACTIVE)).assertEqual(ACTIVE_WATTS);
      expect(session.energyFor(MODE_STANDBY)).assertEqual(0);
      expect(session.totalDuration()).assertEqual(MS_PER_HOUR * 2);
    });

    it('session_should_reject_invalid_readings', 0, () => {
      const profile: PowerProfile = {
        activeWatts: ACTIVE_WATTS, idleWatts: IDLE_WATTS, standbyWatts: STANDBY_WATTS
      };
      const session = new PowerSession(profile);
      expect(session.record('unknown', MS_PER_HOUR)).assertFalse();
      expect(session.record(MODE_ACTIVE, 0)).assertFalse();
      expect(session.record(MODE_ACTIVE, -1)).assertFalse();
      expect(session.count()).assertEqual(0);
      expect(session.totalEnergyMwh()).assertEqual(0);
      expect(session.averageWatts()).assertEqual(0);
      expect(session.durationFor(MODE_ACTIVE)).assertEqual(0);
    });

    it('session_should_compute_average_watts', 0, () => {
      const profile: PowerProfile = {
        activeWatts: ACTIVE_WATTS, idleWatts: IDLE_WATTS, standbyWatts: STANDBY_WATTS
      };
      const session = new PowerSession(profile);
      session.record(MODE_ACTIVE, MS_PER_HOUR / 2);
      session.record(MODE_IDLE, MS_PER_HOUR / 2);
      expect(session.averageWatts()).assertEqual((ACTIVE_WATTS + IDLE_WATTS) / 2);
      session.reset();
      expect(session.count()).assertEqual(0);
      expect(session.totalEnergyMwh()).assertEqual(0);
    });

    it('budget_should_track_usage', 0, () => {
      const budget = new PowerBudget(100);
      expect(budget.getLimit()).assertEqual(100);
      expect(budget.isWithin(100)).assertTrue();
      expect(budget.isWithin(101)).assertFalse();
      expect(budget.isOverBudget(101)).assertTrue();
      expect(budget.isOverBudget(100)).assertFalse();
      expect(budget.remaining(100)).assertEqual(0);
      expect(budget.remaining(80)).assertEqual(20);
      expect(budget.remaining(120)).assertEqual(0);
    });

    it('budget_should_compute_usage_percent', 0, () => {
      const budget = new PowerBudget(200);
      expect(budget.usagePercent(100)).assertEqual(50);
      expect(budget.usagePercent(200)).assertEqual(100);
      expect(budget.usagePercent(0)).assertEqual(0);
      const empty = new PowerBudget(0);
      expect(empty.usagePercent(10)).assertEqual(0);
      expect(empty.isWithin(0)).assertTrue();
    });

    it('standby_analyzer_should_track_drain', 0, () => {
      const analyzer = new StandbyAnalyzer();
      expect(analyzer.add(1)).assertTrue();
      expect(analyzer.add(2)).assertTrue();
      expect(analyzer.add(3)).assertTrue();
      expect(analyzer.add(-1)).assertFalse();
      expect(analyzer.count()).assertEqual(3);
      expect(analyzer.average()).assertEqual(2);
      expect(analyzer.max()).assertEqual(3);
      expect(analyzer.isAcceptable(MAX_STANDBY_DRAIN_PERCENT)).assertTrue();
    });

    it('standby_analyzer_should_flag_excess_drain', 0, () => {
      const analyzer = new StandbyAnalyzer();
      analyzer.add(3);
      analyzer.add(4);
      expect(analyzer.average()).assertEqual(3.5);
      expect(analyzer.isAcceptable(MAX_STANDBY_DRAIN_PERCENT)).assertFalse();
      analyzer.reset();
      expect(analyzer.count()).assertEqual(0);
      expect(analyzer.average()).assertEqual(0);
      expect(analyzer.isAcceptable(MAX_STANDBY_DRAIN_PERCENT)).assertTrue();
    });

    it('report_should_aggregate_power_checks', 0, () => {
      const profile: PowerProfile = {
        activeWatts: ACTIVE_WATTS, idleWatts: IDLE_WATTS, standbyWatts: STANDBY_WATTS
      };
      const session = new PowerSession(profile);
      session.record(MODE_ACTIVE, MS_PER_HOUR);
      const budget = new PowerBudget(100);
      const analyzer = new StandbyAnalyzer();
      analyzer.add(1);
      const report = new PowerReport();
      report.check('budget', budget.isWithin(session.totalEnergyMwh()));
      report.check('standby', analyzer.isAcceptable(MAX_STANDBY_DRAIN_PERCENT));
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      expect(report.summary()).assertEqual('within-budget');
      report.check('forced', false);
      expect(report.isPassed()).assertFalse();
      expect(report.summary()).assertEqual('over-budget');
      expect(report.failures()).assertDeepEquals(['forced']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('power_flow_should_stay_within_daily_budget', 0, () => {
      const profile: PowerProfile = {
        activeWatts: ACTIVE_WATTS, idleWatts: IDLE_WATTS, standbyWatts: STANDBY_WATTS
      };
      const session = new PowerSession(profile);
      session.record(MODE_ACTIVE, MS_PER_HOUR);
      session.record(MODE_IDLE, MS_PER_HOUR);
      session.record(MODE_STANDBY, MS_PER_HOUR * 2);
      const total = session.totalEnergyMwh();
      expect(total).assertEqual(ACTIVE_WATTS + IDLE_WATTS + STANDBY_WATTS * 2);
      expect(PowerCalculator.mwhToWh(total)).assertEqual(0.104);
      const budget = new PowerBudget(200);
      expect(budget.isWithin(total)).assertTrue();
      expect(budget.remaining(total)).assertEqual(96);
      expect(budget.usagePercent(total)).assertEqual(52);
    });

    it('power_constants_should_be_stable', 0, () => {
      expect(ACTIVE_WATTS).assertEqual(80);
      expect(IDLE_WATTS).assertEqual(20);
      expect(STANDBY_WATTS).assertEqual(2);
      expect(MS_PER_HOUR).assertEqual(3600000);
      expect(MAX_STANDBY_DRAIN_PERCENT).assertEqual(2);
      expect(MODE_STANDBY).assertEqual('standby');
    });
  });
}

