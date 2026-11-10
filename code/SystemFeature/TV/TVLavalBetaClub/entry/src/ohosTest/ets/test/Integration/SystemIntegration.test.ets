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
import KeyConstant from '../../../../main/ets/common/Constants/KeyConstant';
import UrlConstant from '../../../../main/ets/common/Constants/UrlConstant';

const PHASE_CONFIG: string = 'config';

const PHASE_KV: string = 'kv';

const PHASE_PERMISSION: string = 'permission';

const PHASE_MEDIA: string = 'media';

const PHASE_NETWORK: string = 'network';

const PHASE_UI: string = 'ui';

interface StartupPhaseInfo {
  name: string;
  order: number;
  required: boolean;
}

// Runs startup phases in dependency order
class StartupOrchestrator {
  private phases: StartupPhaseInfo[] = [];
  private executed: string[] = [];

  public register(name: string, order: number, required: boolean = true): boolean {
    if (name.length === 0 || this.hasPhase(name)) {
      return false;
    }
    this.phases.push({ name: name, order: order, required: required });
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

  public execute(phase: string, action: () => boolean): boolean {
    const info = this.phaseInfo(phase);
    if (info === undefined) {
      return false;
    }
    const success = action();
    if (success) {
      this.executed.push(phase);
    }
    return success;
  }

  public phaseInfo(name: string): StartupPhaseInfo | undefined {
    for (let i = 0; i < this.phases.length; i++) {
      if (this.phases[i].name === name) {
        return this.phases[i];
      }
    }
    return undefined;
  }

  public isOrdered(): boolean {
    for (let i = 1; i < this.phases.length; i++) {
      if (this.phases[i].order < this.phases[i - 1].order) {
        return false;
      }
    }
    return true;
  }

  public sortedPhases(): StartupPhaseInfo[] {
    return [...this.phases].sort((left: StartupPhaseInfo, right: StartupPhaseInfo) =>
      left.order - right.order);
  }

  public getExecuted(): string[] {
    return [...this.executed];
  }

  public executedCount(): number {
    return this.executed.length;
  }

  public requiredCount(): number {
    return this.phases.filter((phase: StartupPhaseInfo) => phase.required).length;
  }

  public isReady(): boolean {
    const required = this.phases.filter((phase: StartupPhaseInfo) => phase.required);
    for (let i = 0; i < required.length; i++) {
      if (!this.executed.includes(required[i].name)) {
        return false;
      }
    }
    return required.length > 0;
  }

  public reset(): void {
    this.executed = [];
  }
}

// Default startup plan for the beta club app
class DefaultStartupPlan {
  public static build(): StartupOrchestrator {
    const orchestrator = new StartupOrchestrator();
    orchestrator.register(PHASE_CONFIG, 1);
    orchestrator.register(PHASE_KV, 2);
    orchestrator.register(PHASE_PERMISSION, 3);
    orchestrator.register(PHASE_MEDIA, 4);
    orchestrator.register(PHASE_NETWORK, 5);
    orchestrator.register(PHASE_UI, 6);
    return orchestrator;
  }

  public static phaseNames(): string[] {
    return [PHASE_CONFIG, PHASE_KV, PHASE_PERMISSION, PHASE_MEDIA, PHASE_NETWORK, PHASE_UI];
  }

  public static isCritical(phase: string): boolean {
    return phase === PHASE_CONFIG || phase === PHASE_KV || phase === PHASE_UI;
  }
}

// Holds service instances created during startup
class ServiceRegistry {
  private services: Map<string, string> = new Map<string, string>();
  private started: Set<string> = new Set<string>();

  public register(name: string, instance: string): boolean {
    if (name.length === 0 || instance.length === 0 || this.services.has(name)) {
      return false;
    }
    this.services.set(name, instance);
    return true;
  }

  public start(name: string): boolean {
    if (!this.services.has(name)) {
      return false;
    }
    this.started.add(name);
    return true;
  }

  public isStarted(name: string): boolean {
    return this.started.has(name);
  }

  public instanceOf(name: string): string {
    const value = this.services.get(name);
    return value === undefined ? '' : value;
  }

  public size(): number {
    return this.services.size;
  }

  public startedCount(): number {
    return this.started.size;
  }

  public missingFrom(requiredNames: string[]): string[] {
    const missing: string[] = [];
    for (let i = 0; i < requiredNames.length; i++) {
      if (!this.services.has(requiredNames[i])) {
        missing.push(requiredNames[i]);
      }
    }
    return missing;
  }

  public notStartedFrom(requiredNames: string[]): string[] {
    const pending: string[] = [];
    for (let i = 0; i < requiredNames.length; i++) {
      if (this.services.has(requiredNames[i]) && !this.started.has(requiredNames[i])) {
        pending.push(requiredNames[i]);
      }
    }
    return pending;
  }
}

// Evaluates readiness gates before the UI becomes interactive
class ReadinessGate {
  private checks: Map<string, boolean> = new Map<string, boolean>();

  public set(name: string, ready: boolean): void {
    if (name.length > 0) {
      this.checks.set(name, ready);
    }
  }

  public isReady(name: string): boolean {
    const value = this.checks.get(name);
    return value === undefined ? false : value;
  }

  public allReady(): boolean {
    if (this.checks.size === 0) {
      return false;
    }
    let ready = true;
    this.checks.forEach((value: boolean) => {
      if (!value) {
        ready = false;
      }
    });
    return ready;
  }

  public blockedGates(): string[] {
    const blocked: string[] = [];
    this.checks.forEach((value: boolean, name: string) => {
      if (!value) {
        blocked.push(name);
      }
    });
    return blocked;
  }

  public size(): number {
    return this.checks.size;
  }

  public clear(): void {
    this.checks = new Map<string, boolean>();
  }
}

// Produces the startup summary for diagnostics
class StartupReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public getCheckCount(): number {
    return this.checks.length;
  }

  public getFailures(): string[] {
    return [...this.failureItems];
  }

  public isReady(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public summary(): string {
    return this.isReady() ? 'ready' : 'degraded';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function systemIntegrationTest() {
  describe('SystemIntegration_Test', () => {

    it('startup_plan_should_be_ordered', 0, () => {
      const plan = DefaultStartupPlan.build();
      expect(plan.isOrdered()).assertTrue();
      const names = DefaultStartupPlan.phaseNames();
      expect(names.length).assertEqual(6);
      const sorted = plan.sortedPhases();
      expect(sorted[0].name).assertEqual(PHASE_CONFIG);
      expect(sorted[sorted.length - 1].name).assertEqual(PHASE_UI);
      expect(plan.requiredCount()).assertEqual(6);
    });

    it('orchestrator_should_reject_duplicate_phases', 0, () => {
      const orchestrator = new StartupOrchestrator();
      expect(orchestrator.register(PHASE_CONFIG, 1)).assertTrue();
      expect(orchestrator.register(PHASE_CONFIG, 2)).assertFalse();
      expect(orchestrator.register('', 3)).assertFalse();
      expect(orchestrator.hasPhase(PHASE_CONFIG)).assertTrue();
      expect(orchestrator.phaseInfo('missing') === undefined).assertTrue();
      expect(orchestrator.execute('missing', () => true)).assertFalse();
    });

    it('orchestrator_should_execute_phases', 0, () => {
      const plan = DefaultStartupPlan.build();
      for (let i = 0; i < DefaultStartupPlan.phaseNames().length; i++) {
        const name = DefaultStartupPlan.phaseNames()[i];
        expect(plan.execute(name, () => true)).assertTrue();
      }
      expect(plan.executedCount()).assertEqual(6);
      expect(plan.getExecuted()[0]).assertEqual(PHASE_CONFIG);
      expect(plan.isReady()).assertTrue();
    });

    it('orchestrator_should_track_failures', 0, () => {
      const plan = DefaultStartupPlan.build();
      expect(plan.execute(PHASE_CONFIG, () => true)).assertTrue();
      expect(plan.execute(PHASE_KV, () => false)).assertFalse();
      expect(plan.executedCount()).assertEqual(1);
      expect(plan.isReady()).assertFalse();
      expect(plan.getExecuted().includes(PHASE_KV)).assertFalse();
      plan.reset();
      expect(plan.executedCount()).assertEqual(0);
      expect(plan.isReady()).assertFalse();
    });

    it('orchestrator_should_identify_critical_phases', 0, () => {
      expect(DefaultStartupPlan.isCritical(PHASE_CONFIG)).assertTrue();
      expect(DefaultStartupPlan.isCritical(PHASE_KV)).assertTrue();
      expect(DefaultStartupPlan.isCritical(PHASE_UI)).assertTrue();
      expect(DefaultStartupPlan.isCritical(PHASE_MEDIA)).assertFalse();
      expect(DefaultStartupPlan.isCritical(PHASE_NETWORK)).assertFalse();
      expect(DefaultStartupPlan.isCritical(PHASE_PERMISSION)).assertFalse();
    });

    it('registry_should_store_and_start_services', 0, () => {
      const registry = new ServiceRegistry();
      expect(registry.register('kv', 'KvManagerService')).assertTrue();
      expect(registry.register('network', 'NetworkManager')).assertTrue();
      expect(registry.register('kv', 'Duplicate')).assertFalse();
      expect(registry.register('', 'Empty')).assertFalse();
      expect(registry.size()).assertEqual(2);
      expect(registry.instanceOf('kv')).assertEqual('KvManagerService');
      expect(registry.instanceOf('missing')).assertEqual('');
      expect(registry.start('kv')).assertTrue();
      expect(registry.start('missing')).assertFalse();
      expect(registry.isStarted('kv')).assertTrue();
      expect(registry.startedCount()).assertEqual(1);
    });

    it('registry_should_report_missing_and_pending', 0, () => {
      const registry = new ServiceRegistry();
      registry.register('kv', 'KvManagerService');
      registry.register('network', 'NetworkManager');
      registry.start('kv');
      const required: string[] = ['kv', 'network', 'media'];
      expect(registry.missingFrom(required)).assertDeepEquals(['media']);
      expect(registry.notStartedFrom(required)).assertDeepEquals(['network']);
      expect(registry.missingFrom(['kv']).length).assertEqual(0);
      expect(registry.notStartedFrom(['kv']).length).assertEqual(0);
    });

    it('readiness_gate_should_require_all_checks', 0, () => {
      const gate = new ReadinessGate();
      expect(gate.allReady()).assertFalse();
      gate.set(PHASE_CONFIG, true);
      gate.set(PHASE_KV, true);
      gate.set(PHASE_UI, false);
      expect(gate.size()).assertEqual(3);
      expect(gate.isReady(PHASE_CONFIG)).assertTrue();
      expect(gate.isReady(PHASE_UI)).assertFalse();
      expect(gate.isReady('missing')).assertFalse();
      expect(gate.allReady()).assertFalse();
      expect(gate.blockedGates()).assertDeepEquals([PHASE_UI]);
      gate.set(PHASE_UI, true);
      expect(gate.allReady()).assertTrue();
      expect(gate.blockedGates().length).assertEqual(0);
      gate.clear();
      expect(gate.size()).assertEqual(0);
    });

    it('readiness_gate_should_ignore_empty_names', 0, () => {
      const gate = new ReadinessGate();
      gate.set('', true);
      expect(gate.size()).assertEqual(0);
      expect(gate.allReady()).assertFalse();
      gate.set(PHASE_CONFIG, true);
      expect(gate.allReady()).assertTrue();
      expect(gate.isReady('')).assertFalse();
    });

    it('startup_report_should_aggregate', 0, () => {
      const report = new StartupReport();
      report.check('config', true);
      report.check('kv', true);
      expect(report.isReady()).assertTrue();
      expect(report.summary()).assertEqual('ready');
      report.check('media', false);
      expect(report.isReady()).assertFalse();
      expect(report.summary()).assertEqual('degraded');
      expect(report.getFailures()).assertDeepEquals(['media']);
      report.reset();
      expect(report.getCheckCount()).assertEqual(0);
      expect(report.isReady()).assertFalse();
    });

    it('system_flow_should_reach_ready_state', 0, () => {
      const plan = DefaultStartupPlan.build();
      const registry = new ServiceRegistry();
      const gate = new ReadinessGate();
      const report = new StartupReport();
      const services: string[] = ['kv', 'network', 'media'];
      for (let i = 0; i < services.length; i++) {
        registry.register(services[i], services[i]);
      }
      const names = DefaultStartupPlan.phaseNames();
      for (let i = 0; i < names.length; i++) {
        const success = plan.execute(names[i], () => true);
        report.check(names[i], success);
      }
      for (let i = 0; i < services.length; i++) {
        registry.start(services[i]);
      }
      gate.set(PHASE_CONFIG, plan.getExecuted().includes(PHASE_CONFIG));
      gate.set(PHASE_KV, registry.isStarted('kv'));
      gate.set(PHASE_UI, plan.getExecuted().includes(PHASE_UI));
      expect(plan.isReady()).assertTrue();
      expect(gate.allReady()).assertTrue();
      expect(report.isReady()).assertTrue();
      expect(registry.startedCount()).assertEqual(3);
    });

    it('system_constants_should_align_with_app', 0, () => {
      expect(KeyConstant.KV_STORE_ID).assertEqual('betaClubStore');
      expect(KeyConstant.UPLOAD_ATTACHMENT_PATH_FOLDER).assertEqual('attachment');
      expect(UrlConstant.ISSUE_REPORT.length).assertLarger(0);
      expect(PHASE_CONFIG).assertEqual('config');
      expect(PHASE_UI).assertEqual('ui');
    });
  });
}

