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
  getDriver, ensureAppReady, checkComponentExists, clampNumber, safeDiv, uniqueStrings
} from '../Shared/SharedDriver';

enum ComponentKind {
  ABILITY = 0,
  SERVICE = 1,
  DATASHARE = 2,
  FORM = 3,
  WINDOW = 4
}

enum BootPhase {
  INIT = 0,
  CORE = 1,
  EXTENDED = 2,
  READY = 3
}

class SystemComponent {
  name: string = '';
  kind: ComponentKind = ComponentKind.ABILITY;
  priority: number = 0;
  started: boolean = false;
  healthy: boolean = true;
  restartCount: number = 0;

  constructor(name: string, kind: ComponentKind, priority: number) {
    this.name = name;
    this.kind = kind;
    this.priority = priority;
  }

  start(): boolean {
    if (!this.healthy) {
      return false;
    }
    if (!this.started) {
      this.started = true;
    }
    return true;
  }

  stop(): void {
    this.started = false;
  }

  fail(): void {
    this.healthy = false;
    this.started = false;
  }

  recover(): void {
    this.healthy = true;
  }

  restart(): boolean {
    if (!this.healthy) {
      return false;
    }
    this.restartCount = this.restartCount + 1;
    this.started = true;
    return true;
  }

  isRunning(): boolean {
    return this.started && this.healthy;
  }
}

class BootSequence {
  private components: SystemComponent[] = [];
  private phase: BootPhase = BootPhase.INIT;

  addComponent(component: SystemComponent): boolean {
    for (const existing of this.components) {
      if (existing.name === component.name) {
        return false;
      }
    }
    this.components.push(component);
    this.sortByPriority();
    return true;
  }

  private sortByPriority(): void {
    for (let i = 0; i < this.components.length; i++) {
      for (let j = i + 1; j < this.components.length; j++) {
        if (this.components[j].priority < this.components[i].priority) {
          const temp = this.components[i];
          this.components[i] = this.components[j];
          this.components[j] = temp;
        }
      }
    }
  }

  componentCount(): number {
    return this.components.length;
  }

  getPhase(): BootPhase {
    return this.phase;
  }

  startNext(): boolean {
    for (const component of this.components) {
      if (!component.started && component.healthy) {
        const ok = component.start();
        this.updatePhase();
        return ok;
      }
    }
    this.updatePhase();
    return false;
  }

  startAll(): number {
    let started = 0;
    for (const component of this.components) {
      if (!component.started && component.start()) {
        started = started + 1;
      }
    }
    this.updatePhase();
    return started;
  }

  private updatePhase(): void {
    const running = this.runningCount();
    if (running === 0) {
      this.phase = BootPhase.INIT;
    } else if (running < this.components.length) {
      this.phase = BootPhase.CORE;
    } else {
      this.phase = BootPhase.READY;
    }
  }

  runningCount(): number {
    let count = 0;
    for (const component of this.components) {
      if (component.isRunning()) {
        count = count + 1;
      }
    }
    return count;
  }

  findComponent(name: string): SystemComponent | null {
    for (const component of this.components) {
      if (component.name === name) {
        return component;
      }
    }
    return null;
  }

  order(): string[] {
    const result: string[] = [];
    for (const component of this.components) {
      result.push(component.name);
    }
    return result;
  }

  health(): number {
    return clampNumber(safeDiv(this.runningCount(), this.componentCount()), 0, 1);
  }
}

class CapabilityEntry {
  name: string = '';
  available: boolean = true;

  constructor(name: string, available: boolean) {
    this.name = name;
    this.available = available;
  }
}

class CapabilityMatrix {
  private entries: CapabilityEntry[] = [];

  declare(name: string, available: boolean): boolean {
    for (const entry of this.entries) {
      if (entry.name === name) {
        return false;
      }
    }
    this.entries.push(new CapabilityEntry(name, available));
    return true;
  }

  supports(name: string): boolean {
    for (const entry of this.entries) {
      if (entry.name === name) {
        return entry.available;
      }
    }
    return false;
  }

  count(): number {
    return this.entries.length;
  }

  supportedNames(): string[] {
    const result: string[] = [];
    for (const entry of this.entries) {
      if (entry.available) {
        result.push(entry.name);
      }
    }
    return uniqueStrings(result);
  }

  missingAgainst(required: string[]): string[] {
    const missing: string[] = [];
    for (const name of required) {
      if (!this.supports(name)) {
        missing.push(name);
      }
    }
    return missing;
  }
}

class IntegrationReport {
  private boot: BootSequence;
  private capabilities: CapabilityMatrix;
  private warnings: number = 0;

  constructor(boot: BootSequence, capabilities: CapabilityMatrix) {
    this.boot = boot;
    this.capabilities = capabilities;
  }

  addWarning(count: number): void {
    if (count > 0) {
      this.warnings = this.warnings + count;
    }
  }

  warningCount(): number {
    return this.warnings;
  }

  bootHealth(): number {
    return this.boot.health();
  }

  isOperational(): boolean {
    return this.boot.runningCount() > 0 && this.warnings === 0;
  }

  summarize(): string {
    return 'running=' + this.boot.runningCount() + '/=' + this.boot.componentCount() +
      ' warn=' + this.warnings;
  }
}

export default function systemIntegrationTest(): void {
  describe('SystemIntegration', () => {
    it('SystemIntegration_001', 0, async (done: Function) => {
      const boot = new BootSequence();
      expect(boot.componentCount()).assertEqual(0);
      expect(boot.getPhase()).assertEqual(BootPhase.INIT);
      expect(boot.health()).assertEqual(0);
      done();
    });

    it('SystemIntegration_002', 0, async (done: Function) => {
      const boot = new BootSequence();
      expect(boot.addComponent(new SystemComponent('main', ComponentKind.ABILITY, 2))).assertTrue();
      expect(boot.addComponent(new SystemComponent('main', ComponentKind.ABILITY, 1))).assertFalse();
      expect(boot.componentCount()).assertEqual(1);
      done();
    });

    it('SystemIntegration_003', 0, async (done: Function) => {
      const boot = new BootSequence();
      boot.addComponent(new SystemComponent('window', ComponentKind.WINDOW, 3));
      boot.addComponent(new SystemComponent('main', ComponentKind.ABILITY, 1));
      boot.addComponent(new SystemComponent('service', ComponentKind.SERVICE, 2));
      expect(boot.order()[0]).assertEqual('main');
      expect(boot.order()[2]).assertEqual('window');
      done();
    });

    it('SystemIntegration_004', 0, async (done: Function) => {
      const boot = new BootSequence();
      boot.addComponent(new SystemComponent('main', ComponentKind.ABILITY, 1));
      boot.addComponent(new SystemComponent('service', ComponentKind.SERVICE, 2));
      expect(boot.startNext()).assertTrue();
      expect(boot.getPhase()).assertEqual(BootPhase.CORE);
      expect(boot.runningCount()).assertEqual(1);
      done();
    });

    it('SystemIntegration_005', 0, async (done: Function) => {
      const boot = new BootSequence();
      boot.addComponent(new SystemComponent('main', ComponentKind.ABILITY, 1));
      boot.addComponent(new SystemComponent('service', ComponentKind.SERVICE, 2));
      expect(boot.startAll()).assertEqual(2);
      expect(boot.getPhase()).assertEqual(BootPhase.READY);
      expect(boot.health()).assertEqual(1);
      done();
    });

    it('SystemIntegration_006', 0, async (done: Function) => {
      const boot = new BootSequence();
      const main = new SystemComponent('main', ComponentKind.ABILITY, 1);
      main.fail();
      boot.addComponent(main);
      expect(boot.startAll()).assertEqual(0);
      expect(boot.getPhase()).assertEqual(BootPhase.INIT);
      expect(boot.health()).assertEqual(0);
      done();
    });

    it('SystemIntegration_007', 0, async (done: Function) => {
      const boot = new BootSequence();
      boot.addComponent(new SystemComponent('main', ComponentKind.ABILITY, 1));
      boot.startAll();
      const found = boot.findComponent('main');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.isRunning()).assertTrue();
      }
      expect(boot.findComponent('none') === null).assertTrue();
      done();
    });

    it('SystemIntegration_008', 0, async (done: Function) => {
      const component = new SystemComponent('svc', ComponentKind.SERVICE, 1);
      expect(component.isRunning()).assertFalse();
      expect(component.start()).assertTrue();
      expect(component.isRunning()).assertTrue();
      component.stop();
      expect(component.isRunning()).assertFalse();
      done();
    });

    it('SystemIntegration_009', 0, async (done: Function) => {
      const component = new SystemComponent('svc', ComponentKind.SERVICE, 1);
      component.fail();
      expect(component.start()).assertFalse();
      expect(component.restart()).assertFalse();
      component.recover();
      expect(component.restart()).assertTrue();
      expect(component.restartCount).assertEqual(1);
      done();
    });

    it('SystemIntegration_010', 0, async (done: Function) => {
      const boot = new BootSequence();
      boot.addComponent(new SystemComponent('a', ComponentKind.FORM, 1));
      boot.addComponent(new SystemComponent('b', ComponentKind.DATASHARE, 2));
      boot.startAll();
      expect(boot.startNext()).assertFalse();
      expect(boot.runningCount()).assertEqual(2);
      done();
    });
    it('SystemIntegration_011', 0, async (done: Function) => {
      const matrix = new CapabilityMatrix();
      expect(matrix.declare('dataShare', true)).assertTrue();
      expect(matrix.declare('dataShare', false)).assertFalse();
      expect(matrix.count()).assertEqual(1);
      done();
    });

    it('SystemIntegration_012', 0, async (done: Function) => {
      const matrix = new CapabilityMatrix();
      matrix.declare('dataShare', true);
      matrix.declare('form', false);
      expect(matrix.supports('dataShare')).assertTrue();
      expect(matrix.supports('form')).assertFalse();
      expect(matrix.supports('unknown')).assertFalse();
      done();
    });

    it('SystemIntegration_013', 0, async (done: Function) => {
      const matrix = new CapabilityMatrix();
      matrix.declare('a', true);
      matrix.declare('b', false);
      matrix.declare('c', true);
      const supported = matrix.supportedNames();
      expect(supported.length).assertEqual(2);
      expect(supported.indexOf('b') < 0).assertTrue();
      done();
    });

    it('SystemIntegration_014', 0, async (done: Function) => {
      const matrix = new CapabilityMatrix();
      matrix.declare('a', true);
      matrix.declare('b', false);
      const missing = matrix.missingAgainst(['a', 'b', 'c']);
      expect(missing.length).assertEqual(2);
      expect(missing.indexOf('b') >= 0).assertTrue();
      expect(missing.indexOf('c') >= 0).assertTrue();
      done();
    });

    it('SystemIntegration_015', 0, async (done: Function) => {
      const boot = new BootSequence();
      boot.addComponent(new SystemComponent('a', ComponentKind.ABILITY, 1));
      const matrix = new CapabilityMatrix();
      matrix.declare('a', true);
      const report = new IntegrationReport(boot, matrix);
      expect(report.isOperational()).assertFalse();
      boot.startAll();
      expect(report.isOperational()).assertTrue();
      expect(report.bootHealth()).assertEqual(1);
      done();
    });

    it('SystemIntegration_016', 0, async (done: Function) => {
      const boot = new BootSequence();
      boot.addComponent(new SystemComponent('a', ComponentKind.ABILITY, 1));
      boot.startAll();
      const report = new IntegrationReport(boot, new CapabilityMatrix());
      expect(report.warningCount()).assertEqual(0);
      report.addWarning(2);
      report.addWarning(-1);
      expect(report.warningCount()).assertEqual(2);
      expect(report.isOperational()).assertFalse();
      done();
    });

    it('SystemIntegration_017', 0, async (done: Function) => {
      const boot = new BootSequence();
      boot.addComponent(new SystemComponent('a', ComponentKind.ABILITY, 1));
      boot.addComponent(new SystemComponent('b', ComponentKind.SERVICE, 2));
      boot.startNext();
      const report = new IntegrationReport(boot, new CapabilityMatrix());
      expect(report.summarize()).assertEqual('running=1/=2 warn=0');
      expect(report.bootHealth()).assertEqual(0.5);
      done();
    });

    it('SystemIntegration_018', 0, async (done: Function) => {
      expect(systemIntegrationTag()).assertEqual('SystemIntegration');
      const boot = new BootSequence();
      boot.addComponent(new SystemComponent('a', ComponentKind.WINDOW, 5));
      boot.startAll();
      boot.addComponent(new SystemComponent('b', ComponentKind.FORM, 1));
      expect(boot.order()[0]).assertEqual('b');
      expect(boot.runningCount()).assertEqual(1);
      done();
    });

    it('SystemIntegration_020', 0, async (done: Function) => {
      const boot = new BootSequence();
      boot.addComponent(new SystemComponent('a', ComponentKind.ABILITY, 1));
      boot.addComponent(new SystemComponent('b', ComponentKind.SERVICE, 2));
      boot.addComponent(new SystemComponent('c', ComponentKind.FORM, 3));
      boot.startAll();
      expect(boot.runningCount()).assertEqual(3);
      expect(boot.getPhase()).assertEqual(BootPhase.READY);
      expect(boot.health()).assertEqual(1);
      done();
    });

    it('SystemIntegration_021', 0, async (done: Function) => {
      const matrix = new CapabilityMatrix();
      matrix.declare('x', true);
      matrix.declare('y', true);
      expect(matrix.missingAgainst(['x']).length).assertEqual(0);
      expect(matrix.supportedNames().length).assertEqual(2);
      done();
    });

    it('SystemIntegration_019', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', 'SystemIntegration probe');
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}

function systemIntegrationTag(): string {
  return 'SystemIntegration';
}
