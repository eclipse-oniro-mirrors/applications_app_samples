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

const SERVICE_KV: string = 'kv';

const SERVICE_NETWORK: string = 'network';

const SERVICE_MEDIA: string = 'media';

const SERVICE_PERMISSION: string = 'permission';

const SERVICE_LOG: string = 'log';

const STATUS_PENDING: string = 'pending';

const STATUS_SUCCESS: string = 'success';

const STATUS_FAILED: string = 'failed';

const MAX_DEPENDENCIES: number = 5;

interface IntegrationPhase {
  name: string;
  service: string;
  status: string;
  attempts: number;
}

interface DependencyEdge {
  from: string;
  to: string;
}

// Registers pipeline phases and their dependencies
class IntegrationPipeline {
  private phases: Map<string, IntegrationPhase> = new Map<string, IntegrationPhase>();
  private dependencies: DependencyEdge[] = [];

  public addPhase(name: string, service: string): boolean {
    if (name.length === 0 || this.phases.has(name) || !IntegrationPipeline.isServiceKnown(service)) {
      return false;
    }
    this.phases.set(name, {
      name: name,
      service: service,
      status: STATUS_PENDING,
      attempts: 0
    });
    return true;
  }

  public static isServiceKnown(service: string): boolean {
    return service === SERVICE_KV || service === SERVICE_NETWORK ||
      service === SERVICE_MEDIA || service === SERVICE_PERMISSION ||
      service === SERVICE_LOG;
  }

  public addDependency(from: string, to: string): boolean {
    if (!this.phases.has(from) || !this.phases.has(to) || from === to) {
      return false;
    }
    if (this.dependencies.length >= MAX_DEPENDENCIES) {
      return false;
    }
    for (let i = 0; i < this.dependencies.length; i++) {
      if (this.dependencies[i].from === from && this.dependencies[i].to === to) {
        return false;
      }
    }
    this.dependencies.push({ from: from, to: to });
    return true;
  }

  public dependenciesOf(name: string): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.dependencies.length; i++) {
      if (this.dependencies[i].from === name) {
        result.push(this.dependencies[i].to);
      }
    }
    return result;
  }

  public runPhase(name: string, action: () => boolean): boolean {
    const phase = this.phases.get(name);
    if (phase === undefined || phase.status === STATUS_SUCCESS) {
      return false;
    }
    const dependencies = this.dependenciesOf(name);
    for (let i = 0; i < dependencies.length; i++) {
      const dependency = this.phases.get(dependencies[i]);
      if (dependency === undefined || dependency.status !== STATUS_SUCCESS) {
        return false;
      }
    }
    phase.attempts++;
    const success = action();
    phase.status = success ? STATUS_SUCCESS : STATUS_FAILED;
    return success;
  }

  public statusOf(name: string): string {
    const phase = this.phases.get(name);
    return phase === undefined ? '' : phase.status;
  }

  public attemptsOf(name: string): number {
    const phase = this.phases.get(name);
    return phase === undefined ? 0 : phase.attempts;
  }

  public size(): number {
    return this.phases.size;
  }

  public successCount(): number {
    let count: number = 0;
    this.phases.forEach((phase: IntegrationPhase) => {
      if (phase.status === STATUS_SUCCESS) {
        count++;
      }
    });
    return count;
  }

  public failedPhases(): string[] {
    const result: string[] = [];
    this.phases.forEach((phase: IntegrationPhase) => {
      if (phase.status === STATUS_FAILED) {
        result.push(phase.name);
      }
    });
    return result;
  }

  public isComplete(): boolean {
    if (this.phases.size === 0) {
      return false;
    }
    let complete: boolean = true;
    this.phases.forEach((phase: IntegrationPhase) => {
      if (phase.status === STATUS_PENDING) {
        complete = false;
      }
    });
    return complete;
  }

  public reset(): void {
    this.phases.forEach((phase: IntegrationPhase) => {
      phase.status = STATUS_PENDING;
      phase.attempts = 0;
    });
  }
}

// Records service interaction counts during integration runs
class ServiceStub {
  private readonly name: string;
  private available: boolean = true;
  private calls: number = 0;
  private failures: number = 0;

  constructor(name: string) {
    this.name = name;
  }

  public setAvailable(available: boolean): void {
    this.available = available;
  }

  public isAvailable(): boolean {
    return this.available;
  }

  public invoke(success: boolean = true): boolean {
    this.calls++;
    if (!success || !this.available) {
      this.failures++;
      return false;
    }
    return true;
  }

  public getName(): string {
    return this.name;
  }

  public getCalls(): number {
    return this.calls;
  }

  public getFailures(): number {
    return this.failures;
  }

  public reset(): void {
    this.calls = 0;
    this.failures = 0;
    this.available = true;
  }
}

// Builds the standard startup integration pipeline
class PipelineFactory {
  public static standard(): IntegrationPipeline {
    const pipeline = new IntegrationPipeline();
    pipeline.addPhase('config', SERVICE_LOG);
    pipeline.addPhase('kv', SERVICE_KV);
    pipeline.addPhase('permission', SERVICE_PERMISSION);
    pipeline.addPhase('media', SERVICE_MEDIA);
    pipeline.addPhase('network', SERVICE_NETWORK);
    pipeline.addDependency('kv', 'config');
    pipeline.addDependency('media', 'permission');
    pipeline.addDependency('network', 'kv');
    return pipeline;
  }

  public static phaseNames(): string[] {
    return ['config', 'kv', 'permission', 'media', 'network'];
  }
}

export default function integrationTestingTest() {
  describe('IntegrationTesting_Test', () => {

    it('pipeline_should_register_phases', 0, () => {
      const pipeline = new IntegrationPipeline();
      expect(pipeline.addPhase('config', SERVICE_LOG)).assertTrue();
      expect(pipeline.addPhase('config', SERVICE_LOG)).assertFalse();
      expect(pipeline.addPhase('', SERVICE_LOG)).assertFalse();
      expect(pipeline.addPhase('bad', 'unknown')).assertFalse();
      expect(pipeline.size()).assertEqual(1);
      expect(pipeline.statusOf('config')).assertEqual(STATUS_PENDING);
    });

    it('pipeline_should_recognize_services', 0, () => {
      expect(IntegrationPipeline.isServiceKnown(SERVICE_KV)).assertTrue();
      expect(IntegrationPipeline.isServiceKnown(SERVICE_NETWORK)).assertTrue();
      expect(IntegrationPipeline.isServiceKnown(SERVICE_MEDIA)).assertTrue();
      expect(IntegrationPipeline.isServiceKnown(SERVICE_PERMISSION)).assertTrue();
      expect(IntegrationPipeline.isServiceKnown(SERVICE_LOG)).assertTrue();
      expect(IntegrationPipeline.isServiceKnown('unknown')).assertFalse();
    });

    it('pipeline_should_register_dependencies', 0, () => {
      const pipeline = new IntegrationPipeline();
      pipeline.addPhase('config', SERVICE_LOG);
      pipeline.addPhase('kv', SERVICE_KV);
      expect(pipeline.addDependency('kv', 'config')).assertTrue();
      expect(pipeline.addDependency('kv', 'config')).assertFalse();
      expect(pipeline.addDependency('kv', 'kv')).assertFalse();
      expect(pipeline.addDependency('kv', 'missing')).assertFalse();
      expect(pipeline.dependenciesOf('kv')).assertDeepEquals(['config']);
      expect(pipeline.dependenciesOf('config').length).assertEqual(0);
    });

    it('pipeline_should_gate_on_dependencies', 0, () => {
      const pipeline = new IntegrationPipeline();
      pipeline.addPhase('config', SERVICE_LOG);
      pipeline.addPhase('kv', SERVICE_KV);
      pipeline.addDependency('kv', 'config');
      expect(pipeline.runPhase('kv', () => true)).assertFalse();
      expect(pipeline.statusOf('kv')).assertEqual(STATUS_PENDING);
      expect(pipeline.runPhase('config', () => true)).assertTrue();
      expect(pipeline.runPhase('kv', () => true)).assertTrue();
      expect(pipeline.statusOf('kv')).assertEqual(STATUS_SUCCESS);
    });

    it('pipeline_should_track_attempts_and_failures', 0, () => {
      const pipeline = new IntegrationPipeline();
      pipeline.addPhase('network', SERVICE_NETWORK);
      expect(pipeline.runPhase('network', () => false)).assertFalse();
      expect(pipeline.statusOf('network')).assertEqual(STATUS_FAILED);
      expect(pipeline.attemptsOf('network')).assertEqual(1);
      expect(pipeline.failedPhases()).assertDeepEquals(['network']);
      expect(pipeline.runPhase('network', () => true)).assertTrue();
      expect(pipeline.attemptsOf('network')).assertEqual(2);
      expect(pipeline.failedPhases().length).assertEqual(0);
    });

    it('pipeline_should_reject_completed_phase', 0, () => {
      const pipeline = new IntegrationPipeline();
      pipeline.addPhase('config', SERVICE_LOG);
      expect(pipeline.runPhase('config', () => true)).assertTrue();
      expect(pipeline.runPhase('config', () => true)).assertFalse();
      expect(pipeline.runPhase('missing', () => true)).assertFalse();
      expect(pipeline.attemptsOf('config')).assertEqual(1);
    });

    it('pipeline_should_report_completion', 0, () => {
      const pipeline = PipelineFactory.standard();
      expect(pipeline.size()).assertEqual(5);
      expect(pipeline.isComplete()).assertFalse();
      const names = PipelineFactory.phaseNames();
      for (let i = 0; i < names.length; i++) {
        pipeline.runPhase(names[i], () => true);
      }
      expect(pipeline.successCount()).assertEqual(5);
      expect(pipeline.isComplete()).assertTrue();
      pipeline.reset();
      expect(pipeline.successCount()).assertEqual(0);
      expect(pipeline.isComplete()).assertFalse();
    });

    it('service_stub_should_track_calls', 0, () => {
      const stub = new ServiceStub(SERVICE_KV);
      expect(stub.getName()).assertEqual(SERVICE_KV);
      expect(stub.isAvailable()).assertTrue();
      expect(stub.invoke()).assertTrue();
      expect(stub.invoke(false)).assertFalse();
      expect(stub.getCalls()).assertEqual(2);
      expect(stub.getFailures()).assertEqual(1);
      stub.setAvailable(false);
      expect(stub.invoke()).assertFalse();
      expect(stub.getFailures()).assertEqual(2);
      stub.reset();
      expect(stub.getCalls()).assertEqual(0);
      expect(stub.isAvailable()).assertTrue();
    });

    it('integration_flow_should_run_pipeline', 0, () => {
      const pipeline = PipelineFactory.standard();
      const kv = new ServiceStub(SERVICE_KV);
      const network = new ServiceStub(SERVICE_NETWORK);
      const names = PipelineFactory.phaseNames();
      for (let i = 0; i < names.length; i++) {
        const name = names[i];
        pipeline.runPhase(name, () => {
          if (name === 'kv') {
            return kv.invoke();
          }
          if (name === 'network') {
            return network.invoke();
          }
          return true;
        });
      }
      expect(pipeline.isComplete()).assertTrue();
      expect(pipeline.successCount()).assertEqual(5);
      expect(kv.getCalls()).assertEqual(1);
      expect(network.getCalls()).assertEqual(1);
      expect(pipeline.failedPhases().length).assertEqual(0);
    });

    it('integration_flow_should_handle_service_failure', 0, () => {
      const pipeline = PipelineFactory.standard();
      const media = new ServiceStub(SERVICE_MEDIA);
      media.setAvailable(false);
      const names = PipelineFactory.phaseNames();
      for (let i = 0; i < names.length; i++) {
        const name = names[i];
        pipeline.runPhase(name, () => name !== 'media' || media.invoke());
      }
      expect(pipeline.statusOf('media')).assertEqual(STATUS_FAILED);
      expect(pipeline.failedPhases()).assertDeepEquals(['media']);
      expect(pipeline.isComplete()).assertTrue();
      expect(pipeline.successCount()).assertEqual(4);
    });

    it('integration_constants_should_be_stable', 0, () => {
      expect(SERVICE_KV).assertEqual('kv');
      expect(SERVICE_NETWORK).assertEqual('network');
      expect(SERVICE_MEDIA).assertEqual('media');
      expect(SERVICE_PERMISSION).assertEqual('permission');
      expect(SERVICE_LOG).assertEqual('log');
      expect(STATUS_SUCCESS).assertEqual('success');
      expect(MAX_DEPENDENCIES).assertEqual(5);
    });
  });
}

