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

const STATE_ACTIVE: string = 'active';

const STATE_IDLE: string = 'idle';

const STATE_STANDBY: string = 'standby';

const STATE_OFF: string = 'off';

const MAX_CPU_PERCENT: number = 100;

const THROTTLE_TEMPERATURE: number = 80;

const MAX_TEMPERATURE: number = 95;

const BATTERY_CAPACITY_MAH: number = 5000;

const MS_PER_HOUR: number = 3600000;

interface PowerTransition {
  from: string;
  to: string;
  allowed: boolean;
}

// Models allowed power state transitions
class PowerGovernor {
  private state: string = STATE_ACTIVE;
  private transitionCount: number = 0;

  public static readonly ALLOWED: string[][] = [
    [STATE_ACTIVE, STATE_IDLE],
    [STATE_IDLE, STATE_ACTIVE],
    [STATE_IDLE, STATE_STANDBY],
    [STATE_STANDBY, STATE_ACTIVE],
    [STATE_ACTIVE, STATE_OFF],
    [STATE_STANDBY, STATE_OFF]
  ];

  public static canTransition(from: string, to: string): boolean {
    for (let i = 0; i < PowerGovernor.ALLOWED.length; i++) {
      if (PowerGovernor.ALLOWED[i][0] === from && PowerGovernor.ALLOWED[i][1] === to) {
        return true;
      }
    }
    return false;
  }

  public transition(to: string): boolean {
    if (!PowerGovernor.canTransition(this.state, to)) {
      return false;
    }
    this.state = to;
    this.transitionCount++;
    return true;
  }

  public getState(): string {
    return this.state;
  }

  public getTransitionCount(): number {
    return this.transitionCount;
  }

  public isActive(): boolean {
    return this.state === STATE_ACTIVE;
  }

  public isOff(): boolean {
    return this.state === STATE_OFF;
  }

  public reset(): void {
    this.state = STATE_ACTIVE;
    this.transitionCount = 0;
  }
}

// Simulates CPU load and frequency scaling
class CpuLoadModel {
  private readonly coreCount: number;
  private loads: number[] = [];

  constructor(coreCount: number) {
    this.coreCount = coreCount;
  }

  public setLoad(coreIndex: number, percent: number): boolean {
    if (coreIndex < 0 || coreIndex >= this.coreCount) {
      return false;
    }
    const normalized = percent < 0 ? 0 : (percent > MAX_CPU_PERCENT ? MAX_CPU_PERCENT : percent);
    this.loads[coreIndex] = normalized;
    return true;
  }

  public getLoad(coreIndex: number): number {
    if (coreIndex < 0 || coreIndex >= this.coreCount) {
      return 0;
    }
    const value = this.loads[coreIndex];
    return value === undefined ? 0 : value;
  }

  public averageLoad(): number {
    if (this.loads.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.loads.length; i++) {
      total += this.loads[i];
    }
    return total / this.loads.length;
  }

  public maxLoad(): number {
    let max: number = 0;
    for (let i = 0; i < this.loads.length; i++) {
      if (this.loads[i] > max) {
        max = this.loads[i];
      }
    }
    return max;
  }

  public frequencyMhz(baseMhz: number): number {
    const load = this.averageLoad();
    if (load <= 0) {
      return Math.round(baseMhz * 0.3);
    }
    if (load >= 90) {
      return baseMhz;
    }
    return Math.round(baseMhz * (0.3 + load * 0.7 / 100));
  }

  public isOverloaded(threshold: number): boolean {
    return this.maxLoad() > threshold;
  }

  public getCoreCount(): number {
    return this.coreCount;
  }
}

// Models temperature rise and throttling behavior
class ThermalModel {
  private temperature: number = 40;
  private throttleEvents: number = 0;
  private history: number[] = [];

  public heat(delta: number): number {
    this.temperature += delta;
    if (this.temperature > MAX_TEMPERATURE) {
      this.temperature = MAX_TEMPERATURE;
    }
    if (this.temperature >= THROTTLE_TEMPERATURE) {
      this.throttleEvents++;
    }
    this.history.push(this.temperature);
    return this.temperature;
  }

  public cool(delta: number): number {
    this.temperature -= delta;
    if (this.temperature < 30) {
      this.temperature = 30;
    }
    this.history.push(this.temperature);
    return this.temperature;
  }

  public getTemperature(): number {
    return this.temperature;
  }

  public isThrottling(): boolean {
    return this.temperature >= THROTTLE_TEMPERATURE;
  }

  public getThrottleEvents(): number {
    return this.throttleEvents;
  }

  public maxObserved(): number {
    let max: number = 0;
    for (let i = 0; i < this.history.length; i++) {
      if (this.history[i] > max) {
        max = this.history[i];
      }
    }
    return max;
  }

  public reset(): void {
    this.temperature = 40;
    this.throttleEvents = 0;
    this.history = [];
  }
}

// Estimates battery drain for a workload
class BatteryDrainModel {
  private readonly capacityMah: number;
  private consumedMah: number = 0;

  constructor(capacityMah: number) {
    this.capacityMah = capacityMah;
  }

  public consume(currentMa: number, durationMs: number): number {
    if (currentMa <= 0 || durationMs <= 0) {
      return this.consumedMah;
    }
    const mAh = currentMa * durationMs / MS_PER_HOUR;
    this.consumedMah += mAh;
    return this.consumedMah;
  }

  public getConsumed(): number {
    return this.consumedMah;
  }

  public getCapacity(): number {
    return this.capacityMah;
  }

  public percentConsumed(): number {
    return this.capacityMah <= 0 ? 0 : this.consumedMah * 100 / this.capacityMah;
  }

  public remainingPercent(): number {
    const remaining = 100 - this.percentConsumed();
    return remaining < 0 ? 0 : remaining;
  }

  public hoursRemaining(currentMa: number): number {
    if (currentMa <= 0) {
      return 0;
    }
    return this.capacityMah / currentMa;
  }

  public reset(): void {
    this.consumedMah = 0;
  }
}

// Summarizes power performance checks
class PowerPerformanceReport {
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
    return this.isPassed() ? 'efficient' : 'inefficient';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function powerPerformanceTest() {
  describe('PowerPerformance_Test', () => {

    it('governor_should_start_active', 0, () => {
      const governor = new PowerGovernor();
      expect(governor.getState()).assertEqual(STATE_ACTIVE);
      expect(governor.isActive()).assertTrue();
      expect(governor.isOff()).assertFalse();
      expect(governor.getTransitionCount()).assertEqual(0);
    });

    it('governor_should_allow_valid_transitions', 0, () => {
      const governor = new PowerGovernor();
      expect(governor.transition(STATE_IDLE)).assertTrue();
      expect(governor.getState()).assertEqual(STATE_IDLE);
      expect(governor.transition(STATE_STANDBY)).assertTrue();
      expect(governor.transition(STATE_ACTIVE)).assertTrue();
      expect(governor.getTransitionCount()).assertEqual(3);
    });

    it('governor_should_reject_invalid_transitions', 0, () => {
      const governor = new PowerGovernor();
      expect(governor.transition(STATE_STANDBY)).assertFalse();
      expect(governor.transition(STATE_OFF)).assertTrue();
      expect(governor.isOff()).assertTrue();
      expect(governor.transition(STATE_ACTIVE)).assertFalse();
      expect(governor.getTransitionCount()).assertEqual(1);
      governor.reset();
      expect(governor.isActive()).assertTrue();
      expect(governor.getTransitionCount()).assertEqual(0);
    });

    it('governor_should_validate_transition_table', 0, () => {
      expect(PowerGovernor.canTransition(STATE_ACTIVE, STATE_IDLE)).assertTrue();
      expect(PowerGovernor.canTransition(STATE_IDLE, STATE_ACTIVE)).assertTrue();
      expect(PowerGovernor.canTransition(STATE_STANDBY, STATE_OFF)).assertTrue();
      expect(PowerGovernor.canTransition(STATE_OFF, STATE_ACTIVE)).assertFalse();
      expect(PowerGovernor.canTransition('unknown', STATE_ACTIVE)).assertFalse();
      expect(PowerGovernor.ALLOWED.length).assertEqual(6);
    });

    it('cpu_model_should_track_core_loads', 0, () => {
      const model = new CpuLoadModel(4);
      expect(model.getCoreCount()).assertEqual(4);
      expect(model.setLoad(0, 50)).assertTrue();
      expect(model.setLoad(1, 100)).assertTrue();
      expect(model.setLoad(2, 150)).assertTrue();
      expect(model.getLoad(2)).assertEqual(100);
      expect(model.setLoad(-1, 50)).assertFalse();
      expect(model.setLoad(4, 50)).assertFalse();
      expect(model.getLoad(3)).assertEqual(0);
    });

    it('cpu_model_should_compute_average_and_max', 0, () => {
      const model = new CpuLoadModel(4);
      model.setLoad(0, 20);
      model.setLoad(1, 60);
      model.setLoad(2, 40);
      model.setLoad(3, 80);
      expect(model.averageLoad()).assertEqual(50);
      expect(model.maxLoad()).assertEqual(80);
      expect(model.isOverloaded(70)).assertTrue();
      expect(model.isOverloaded(90)).assertFalse();
    });

    it('cpu_model_should_scale_frequency', 0, () => {
      const model = new CpuLoadModel(2);
      expect(model.frequencyMhz(2000)).assertEqual(600);
      model.setLoad(0, 50);
      model.setLoad(1, 50);
      expect(model.frequencyMhz(2000)).assertEqual(1300);
      model.setLoad(0, 100);
      model.setLoad(1, 100);
      expect(model.frequencyMhz(2000)).assertEqual(2000);
    });

    it('cpu_model_should_clamp_negative_load', 0, () => {
      const model = new CpuLoadModel(1);
      model.setLoad(0, -20);
      expect(model.getLoad(0)).assertEqual(0);
      expect(model.averageLoad()).assertEqual(0);
      expect(model.isOverloaded(0)).assertFalse();
      expect(model.frequencyMhz(1000)).assertEqual(300);
    });

    it('thermal_model_should_rise_and_throttle', 0, () => {
      const thermal = new ThermalModel();
      expect(thermal.getTemperature()).assertEqual(40);
      expect(thermal.isThrottling()).assertFalse();
      thermal.heat(30);
      expect(thermal.getTemperature()).assertEqual(70);
      expect(thermal.isThrottling()).assertFalse();
      thermal.heat(15);
      expect(thermal.getTemperature()).assertEqual(85);
      expect(thermal.isThrottling()).assertTrue();
      expect(thermal.getThrottleEvents()).assertEqual(1);
    });

    it('thermal_model_should_clamp_temperature', 0, () => {
      const thermal = new ThermalModel();
      thermal.heat(100);
      expect(thermal.getTemperature()).assertEqual(MAX_TEMPERATURE);
      thermal.cool(200);
      expect(thermal.getTemperature()).assertEqual(30);
      expect(thermal.maxObserved()).assertEqual(MAX_TEMPERATURE);
      thermal.reset();
      expect(thermal.getTemperature()).assertEqual(40);
      expect(thermal.getThrottleEvents()).assertEqual(0);
    });

    it('thermal_model_should_count_each_throttle', 0, () => {
      const thermal = new ThermalModel();
      thermal.heat(40);
      thermal.heat(5);
      thermal.heat(5);
      expect(thermal.getThrottleEvents()).assertEqual(3);
      expect(thermal.isThrottling()).assertTrue();
      expect(thermal.maxObserved()).assertEqual(90);
    });

    it('battery_model_should_consume_charge', 0, () => {
      const battery = new BatteryDrainModel(BATTERY_CAPACITY_MAH);
      expect(battery.getCapacity()).assertEqual(BATTERY_CAPACITY_MAH);
      battery.consume(1000, MS_PER_HOUR);
      expect(battery.getConsumed()).assertEqual(1000);
      expect(battery.percentConsumed()).assertEqual(20);
      expect(battery.remainingPercent()).assertEqual(80);
    });

    it('battery_model_should_ignore_invalid_consumption', 0, () => {
      const battery = new BatteryDrainModel(BATTERY_CAPACITY_MAH);
      expect(battery.consume(0, MS_PER_HOUR)).assertEqual(0);
      expect(battery.consume(-100, MS_PER_HOUR)).assertEqual(0);
      expect(battery.consume(500, 0)).assertEqual(0);
      expect(battery.percentConsumed()).assertEqual(0);
      battery.consume(6000, MS_PER_HOUR);
      expect(battery.remainingPercent()).assertEqual(0);
    });

    it('battery_model_should_estimate_runtime', 0, () => {
      const battery = new BatteryDrainModel(BATTERY_CAPACITY_MAH);
      expect(battery.hoursRemaining(1000)).assertEqual(5);
      expect(battery.hoursRemaining(500)).assertEqual(10);
      expect(battery.hoursRemaining(0)).assertEqual(0);
      battery.consume(2500, MS_PER_HOUR);
      expect(battery.percentConsumed()).assertEqual(50);
      battery.reset();
      expect(battery.getConsumed()).assertEqual(0);
    });

    it('report_should_aggregate_power_checks', 0, () => {
      const report = new PowerPerformanceReport();
      report.check('temperature', true);
      report.check('battery', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      expect(report.summary()).assertEqual('efficient');
      report.check('cpu', false);
      expect(report.isPassed()).assertFalse();
      expect(report.summary()).assertEqual('inefficient');
      expect(report.failures()).assertDeepEquals(['cpu']);
      report.reset();
      expect(report.count()).assertEqual(0);
      expect(report.isPassed()).assertFalse();
    });

    it('power_flow_should_stay_efficient', 0, () => {
      const governor = new PowerGovernor();
      const cpu = new CpuLoadModel(4);
      const thermal = new ThermalModel();
      const battery = new BatteryDrainModel(BATTERY_CAPACITY_MAH);
      const report = new PowerPerformanceReport();
      governor.transition(STATE_IDLE);
      thermal.heat(20);
      cpu.setLoad(0, 40);
      cpu.setLoad(1, 50);
      battery.consume(500, MS_PER_HOUR);
      report.check('state', governor.getState() === STATE_IDLE);
      report.check('temperature', !thermal.isThrottling());
      report.check('cpu', !cpu.isOverloaded(90));
      report.check('battery', battery.percentConsumed() <= 15);
      expect(report.failures().length).assertEqual(0);
      expect(report.isPassed()).assertTrue();
      expect(thermal.getTemperature()).assertEqual(60);
      expect(cpu.averageLoad()).assertEqual(45);
    });

    it('thermal_throttle_should_degrade_cpu_goal', 0, () => {
      const thermal = new ThermalModel();
      const cpu = new CpuLoadModel(2);
      thermal.heat(45);
      expect(thermal.isThrottling()).assertTrue();
      cpu.setLoad(0, 100);
      cpu.setLoad(1, 100);
      const targetFrequency = thermal.isThrottling() ? 1200 : 2000;
      expect(targetFrequency).assertEqual(1200);
      expect(cpu.frequencyMhz(2000)).assertEqual(2000);
      expect(cpu.isOverloaded(90)).assertTrue();
    });

    it('battery_should_survive_full_hour', 0, () => {
      const battery = new BatteryDrainModel(BATTERY_CAPACITY_MAH);
      battery.consume(250, MS_PER_HOUR);
      expect(battery.getConsumed()).assertEqual(250);
      expect(battery.remainingPercent()).assertEqual(95);
      battery.consume(250, MS_PER_HOUR);
      expect(battery.remainingPercent()).assertEqual(90);
      expect(battery.hoursRemaining(500)).assertEqual(10);
      expect(battery.percentConsumed()).assertEqual(10);
    });

    it('power_performance_constants_should_be_stable', 0, () => {
      expect(STATE_ACTIVE).assertEqual('active');
      expect(STATE_IDLE).assertEqual('idle');
      expect(STATE_STANDBY).assertEqual('standby');
      expect(STATE_OFF).assertEqual('off');
      expect(MAX_CPU_PERCENT).assertEqual(100);
      expect(THROTTLE_TEMPERATURE).assertEqual(80);
      expect(MAX_TEMPERATURE).assertEqual(95);
      expect(BATTERY_CAPACITY_MAH).assertEqual(5000);
    });
  });
}

