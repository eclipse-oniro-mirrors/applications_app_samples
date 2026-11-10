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

const PHASE_PREPARE: string = 'prepare';

const PHASE_EXECUTE: string = 'execute';

const PHASE_VERIFY: string = 'verify';

const PHASE_CLEANUP: string = 'cleanup';

const DEVICE_LHT16: string = 'LHT16';

const DEVICE_ORIOLE: string = 'oriole';

const LOCALE_ZH: string = 'zh_CN';

const LOCALE_EN: string = 'en_US';

const MAX_MATRIX_SIZE: number = 16;

interface ScenarioPhase {
  name: string;
  order: number;
  critical: boolean;
}

interface MatrixCell {
  device: string;
  locale: string;
}

// Defines a multi-phase advanced scenario
class AdvancedScenario {
  private name: string;
  private phases: ScenarioPhase[] = [];

  constructor(name: string) {
    this.name = name;
  }

  public getName(): string {
    return this.name;
  }

  public addPhase(name: string, order: number, critical: boolean = true): boolean {
    if (name.length === 0 || this.hasPhase(name)) {
      return false;
    }
    this.phases.push({ name: name, order: order, critical: critical });
    return true;
  }

  public hasPhase(name: string): boolean {
    for (let i = 0; i < this.phases.length; i++) {
      if (this.phases[i].name === name) {
        return true;
      }
    }
    return false;
  }

  public sortedPhases(): ScenarioPhase[] {
    return [...this.phases].sort((left: ScenarioPhase, right: ScenarioPhase) =>
      left.order - right.order);
  }

  public size(): number {
    return this.phases.length;
  }

  public criticalCount(): number {
    return this.phases.filter((phase: ScenarioPhase) => phase.critical).length;
  }

  public isOrdered(): boolean {
    for (let i = 1; i < this.phases.length; i++) {
      if (this.phases[i].order < this.phases[i - 1].order) {
        return false;
      }
    }
    return true;
  }
}

// Builds the default advanced scenarios
class AdvancedScenarioCatalog {
  public static createIssueAdvanced(): AdvancedScenario {
    const scenario = new AdvancedScenario('advancedCreateIssue');
    scenario.addPhase(PHASE_PREPARE, 1);
    scenario.addPhase(PHASE_EXECUTE, 2);
    scenario.addPhase(PHASE_VERIFY, 3);
    scenario.addPhase(PHASE_CLEANUP, 4, false);
    return scenario;
  }

  public static offlineRecovery(): AdvancedScenario {
    const scenario = new AdvancedScenario('offlineRecovery');
    scenario.addPhase(PHASE_PREPARE, 1);
    scenario.addPhase(PHASE_EXECUTE, 2);
    scenario.addPhase(PHASE_VERIFY, 3);
    return scenario;
  }

  public static names(): string[] {
    return ['advancedCreateIssue', 'offlineRecovery'];
  }
}

// Executes phases and rolls back when a critical phase fails
class ScenarioRunner {
  private executed: string[] = [];
  private rolledBack: string[] = [];
  private failedPhase: string = '';

  public run(scenario: AdvancedScenario, action: (phase: string) => boolean): boolean {
    const phases = scenario.sortedPhases();
    for (let i = 0; i < phases.length; i++) {
      const success = action(phases[i].name);
      if (!success) {
        if (phases[i].critical) {
          this.failedPhase = phases[i].name;
          this.rollback();
          return false;
        }
        continue;
      }
      this.executed.push(phases[i].name);
    }
    return true;
  }

  public rollback(): number {
    const count = this.executed.length;
    for (let i = this.executed.length - 1; i >= 0; i--) {
      this.rolledBack.push(this.executed[i]);
    }
    this.executed = [];
    return count;
  }

  public getExecuted(): string[] {
    return [...this.executed];
  }

  public getRolledBack(): string[] {
    return [...this.rolledBack];
  }

  public getFailedPhase(): string {
    return this.failedPhase;
  }

  public hasFailed(): boolean {
    return this.failedPhase.length > 0;
  }

  public reset(): void {
    this.executed = [];
    this.rolledBack = [];
    this.failedPhase = '';
  }
}

// Builds the device × locale test matrix
class ScenarioMatrix {
  public static build(devices: string[], locales: string[]): MatrixCell[] {
    const cells: MatrixCell[] = [];
    for (let i = 0; i < devices.length; i++) {
      for (let j = 0; j < locales.length; j++) {
        if (cells.length >= MAX_MATRIX_SIZE) {
          return cells;
        }
        cells.push({ device: devices[i], locale: locales[j] });
      }
    }
    return cells;
  }

  public static defaultDevices(): string[] {
    return [DEVICE_LHT16, DEVICE_ORIOLE];
  }

  public static defaultLocales(): string[] {
    return [LOCALE_ZH, LOCALE_EN];
  }

  public static size(devices: string[], locales: string[]): number {
    return Math.min(devices.length * locales.length, MAX_MATRIX_SIZE);
  }

  public static contains(cells: MatrixCell[], device: string, locale: string): boolean {
    for (let i = 0; i < cells.length; i++) {
      if (cells[i].device === device && cells[i].locale === locale) {
        return true;
      }
    }
    return false;
  }
}

// Injects deterministic failures for negative scenarios
class FailureInjector {
  private failures: Map<string, boolean> = new Map<string, boolean>();

  public failAt(phase: string): void {
    this.failures.set(phase, true);
  }

  public shouldFail(phase: string): boolean {
    const value = this.failures.get(phase);
    return value === undefined ? false : value;
  }

  public clear(): void {
    this.failures = new Map<string, boolean>();
  }

  public size(): number {
    return this.failures.size;
  }
}

// Summarizes a scenario run for reporting
class ScenarioSummary {
  private passed: number = 0;
  private failed: number = 0;
  private durations: number[] = [];

  public record(passed: boolean, durationMs: number): void {
    if (passed) {
      this.passed++;
    } else {
      this.failed++;
    }
    this.durations.push(durationMs);
  }

  public getPassed(): number {
    return this.passed;
  }

  public getFailed(): number {
    return this.failed;
  }

  public getTotal(): number {
    return this.passed + this.failed;
  }

  public getPassRate(): number {
    return this.getTotal() === 0 ? 0 : this.passed * 100 / this.getTotal();
  }

  public getMaxDuration(): number {
    let max: number = 0;
    for (let i = 0; i < this.durations.length; i++) {
      if (this.durations[i] > max) {
        max = this.durations[i];
      }
    }
    return max;
  }

  public reset(): void {
    this.passed = 0;
    this.failed = 0;
    this.durations = [];
  }
}

export default function advancedScenariosTest() {
  describe('AdvancedScenarios_Test', () => {

    it('scenario_should_order_phases', 0, () => {
      const scenario = AdvancedScenarioCatalog.createIssueAdvanced();
      expect(scenario.getName()).assertEqual('advancedCreateIssue');
      expect(scenario.size()).assertEqual(4);
      expect(scenario.isOrdered()).assertTrue();
      expect(scenario.criticalCount()).assertEqual(3);
      const sorted = scenario.sortedPhases();
      expect(sorted[0].name).assertEqual(PHASE_PREPARE);
      expect(sorted[3].name).assertEqual(PHASE_CLEANUP);
    });

    it('scenario_should_reject_duplicate_phases', 0, () => {
      const scenario = new AdvancedScenario('test');
      expect(scenario.addPhase(PHASE_PREPARE, 1)).assertTrue();
      expect(scenario.addPhase(PHASE_PREPARE, 2)).assertFalse();
      expect(scenario.addPhase('', 2)).assertFalse();
      expect(scenario.hasPhase(PHASE_PREPARE)).assertTrue();
      expect(scenario.hasPhase(PHASE_VERIFY)).assertFalse();
      expect(scenario.size()).assertEqual(1);
    });

    it('catalog_should_expose_scenarios', 0, () => {
      const names = AdvancedScenarioCatalog.names();
      expect(names.length).assertEqual(2);
      expect(names.includes('advancedCreateIssue')).assertTrue();
      expect(AdvancedScenarioCatalog.offlineRecovery().size()).assertEqual(3);
      expect(AdvancedScenarioCatalog.offlineRecovery().criticalCount()).assertEqual(3);
    });

    it('runner_should_complete_all_phases', 0, () => {
      const scenario = AdvancedScenarioCatalog.createIssueAdvanced();
      const runner = new ScenarioRunner();
      expect(runner.run(scenario, (phase: string) => true)).assertTrue();
      expect(runner.getExecuted().length).assertEqual(4);
      expect(runner.hasFailed()).assertFalse();
      expect(runner.getRolledBack().length).assertEqual(0);
      expect(runner.getExecuted()[0]).assertEqual(PHASE_PREPARE);
    });

    it('runner_should_rollback_on_critical_failure', 0, () => {
      const scenario = AdvancedScenarioCatalog.createIssueAdvanced();
      const runner = new ScenarioRunner();
      const injector = new FailureInjector();
      injector.failAt(PHASE_VERIFY);
      const success = runner.run(scenario, (phase: string) => !injector.shouldFail(phase));
      expect(success).assertFalse();
      expect(runner.hasFailed()).assertTrue();
      expect(runner.getFailedPhase()).assertEqual(PHASE_VERIFY);
      expect(runner.getExecuted().length).assertEqual(0);
      expect(runner.getRolledBack()).assertDeepEquals([PHASE_EXECUTE, PHASE_PREPARE]);
    });

    it('runner_should_continue_after_non_critical_failure', 0, () => {
      const scenario = AdvancedScenarioCatalog.createIssueAdvanced();
      const runner = new ScenarioRunner();
      const injector = new FailureInjector();
      injector.failAt(PHASE_CLEANUP);
      const success = runner.run(scenario, (phase: string) => !injector.shouldFail(phase));
      expect(success).assertTrue();
      expect(runner.hasFailed()).assertFalse();
      expect(runner.getExecuted().includes(PHASE_CLEANUP)).assertFalse();
      expect(runner.getExecuted().length).assertEqual(3);
    });

    it('runner_should_reset_state', 0, () => {
      const runner = new ScenarioRunner();
      const scenario = AdvancedScenarioCatalog.offlineRecovery();
      runner.run(scenario, (phase: string) => phase !== PHASE_EXECUTE);
      expect(runner.hasFailed()).assertTrue();
      runner.reset();
      expect(runner.hasFailed()).assertFalse();
      expect(runner.getExecuted().length).assertEqual(0);
      expect(runner.getRolledBack().length).assertEqual(0);
      expect(runner.run(scenario, (phase: string) => true)).assertTrue();
      expect(runner.getExecuted().length).assertEqual(3);
    });

    it('matrix_should_cover_device_locale_pairs', 0, () => {
      const cells = ScenarioMatrix.build(ScenarioMatrix.defaultDevices(), ScenarioMatrix.defaultLocales());
      expect(cells.length).assertEqual(4);
      expect(ScenarioMatrix.size(ScenarioMatrix.defaultDevices(), ScenarioMatrix.defaultLocales()))
        .assertEqual(4);
      expect(ScenarioMatrix.contains(cells, DEVICE_LHT16, LOCALE_ZH)).assertTrue();
      expect(ScenarioMatrix.contains(cells, DEVICE_ORIOLE, LOCALE_EN)).assertTrue();
      expect(ScenarioMatrix.contains(cells, 'unknown', LOCALE_ZH)).assertFalse();
    });

    it('matrix_should_cap_size', 0, () => {
      const devices: string[] = ['a', 'b', 'c', 'd', 'e'];
      const locales: string[] = ['zh', 'en', 'fr', 'de'];
      const cells = ScenarioMatrix.build(devices, locales);
      expect(cells.length).assertEqual(MAX_MATRIX_SIZE);
      expect(ScenarioMatrix.size(devices, locales)).assertEqual(MAX_MATRIX_SIZE);
      expect(ScenarioMatrix.build([], locales).length).assertEqual(0);
    });

    it('injector_should_toggle_phase_failures', 0, () => {
      const injector = new FailureInjector();
      expect(injector.shouldFail(PHASE_EXECUTE)).assertFalse();
      injector.failAt(PHASE_EXECUTE);
      expect(injector.shouldFail(PHASE_EXECUTE)).assertTrue();
      expect(injector.size()).assertEqual(1);
      injector.clear();
      expect(injector.size()).assertEqual(0);
      expect(injector.shouldFail(PHASE_EXECUTE)).assertFalse();
    });

    it('summary_should_track_results', 0, () => {
      const summary = new ScenarioSummary();
      summary.record(true, 100);
      summary.record(false, 300);
      summary.record(true, 200);
      expect(summary.getTotal()).assertEqual(3);
      expect(summary.getPassed()).assertEqual(2);
      expect(summary.getFailed()).assertEqual(1);
      expect(summary.getPassRate()).assertLarger(66);
      expect(summary.getMaxDuration()).assertEqual(300);
      summary.reset();
      expect(summary.getTotal()).assertEqual(0);
      expect(summary.getPassRate()).assertEqual(0);
    });

    it('advanced_flow_should_cover_matrix_and_rollback', 0, () => {
      const devices = ScenarioMatrix.defaultDevices();
      const locales = ScenarioMatrix.defaultLocales();
      const cells = ScenarioMatrix.build(devices, locales);
      const summary = new ScenarioSummary();
      for (let i = 0; i < cells.length; i++) {
        const runner = new ScenarioRunner();
        const injector = new FailureInjector();
        if (cells[i].locale === LOCALE_EN) {
          injector.failAt(PHASE_VERIFY);
        }
        const scenario = AdvancedScenarioCatalog.createIssueAdvanced();
        const passed = runner.run(scenario, (phase: string) => !injector.shouldFail(phase));
        summary.record(passed, 100 * (i + 1));
      }
      expect(cells.length).assertEqual(4);
      expect(summary.getPassed()).assertEqual(2);
      expect(summary.getFailed()).assertEqual(2);
      expect(summary.getPassRate()).assertEqual(50);
      expect(summary.getMaxDuration()).assertEqual(400);
    });

    it('advanced_constants_should_be_stable', 0, () => {
      expect(PHASE_PREPARE).assertEqual('prepare');
      expect(PHASE_EXECUTE).assertEqual('execute');
      expect(PHASE_VERIFY).assertEqual('verify');
      expect(PHASE_CLEANUP).assertEqual('cleanup');
      expect(DEVICE_LHT16).assertEqual('LHT16');
      expect(LOCALE_ZH).assertEqual('zh_CN');
      expect(MAX_MATRIX_SIZE).assertEqual(16);
    });
  });
}

