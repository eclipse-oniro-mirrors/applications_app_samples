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
 * WITHOUT WARRANTIES OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import type { media } from '@kit.MediaKit';
import type { AudioRecorderPort } from '../../../main/ets/model/RecordModel';

export class RecorderGate {
  public promise: Promise<void>;
  private resolvePromise: () => void = (): void => {};

  constructor() {
    this.promise = new Promise<void>((resolve: () => void): void => {
      this.resolvePromise = resolve;
    });
  }

  open(): void {
    this.resolvePromise();
  }
}

export class RecorderFake implements AudioRecorderPort {
  public configs: media.AVRecorderConfig[] = [];
  public states: string[] = [];
  public errors: string[] = [];
  private name: string;
  private history: string[];
  private failures: Map<string, string> = new Map<string, string>();
  private gates: Map<string, RecorderGate> = new Map<string, RecorderGate>();
  private counts: Map<string, number> = new Map<string, number>();
  private stateCallback: ((state: string) => void) | undefined = undefined;
  private errorCallback: ((message: string) => void) | undefined = undefined;

  constructor(name: string, history: string[]) {
    this.name = name;
    this.history = history;
  }

  onStateChange(callback: (state: string) => void): void {
    this.history.push(this.name + '.onStateChange');
    this.stateCallback = callback;
  }

  onError(callback: (message: string) => void): void {
    this.history.push(this.name + '.onError');
    this.errorCallback = callback;
  }

  emitState(state: string): void {
    this.states.push(state);
    if (this.stateCallback !== undefined) {
      this.stateCallback(state);
    }
  }

  emitError(message: string): void {
    this.errors.push(message);
    if (this.errorCallback !== undefined) {
      this.errorCallback(message);
    }
  }

  fail(method: string, message: string): void {
    this.failures.set(method, message);
  }

  recover(method: string): void {
    this.failures.delete(method);
  }

  defer(method: string, gate: RecorderGate): void {
    this.gates.set(method, gate);
  }

  callCount(method: string): number {
    const count: number | undefined = this.counts.get(method);
    return count === undefined ? 0 : count;
  }

  private async invoke(method: string): Promise<void> {
    this.history.push(this.name + '.' + method + '.enter');
    this.counts.set(method, this.callCount(method) + 1);
    const gate: RecorderGate | undefined = this.gates.get(method);
    if (gate !== undefined) {
      await gate.promise;
    }
    const failure: string | undefined = this.failures.get(method);
    if (failure !== undefined) {
      this.history.push(this.name + '.' + method + '.reject');
      throw new Error(failure);
    }
    this.history.push(this.name + '.' + method + '.resolve');
  }

  prepare(config: media.AVRecorderConfig): Promise<void> {
    this.configs.push(config);
    return this.invoke('prepare');
  }

  start(): Promise<void> {
    return this.invoke('start');
  }

  pause(): Promise<void> {
    return this.invoke('pause');
  }

  resume(): Promise<void> {
    return this.invoke('resume');
  }

  stop(): Promise<void> {
    return this.invoke('stop');
  }

  reset(): Promise<void> {
    return this.invoke('reset');
  }

  release(): Promise<void> {
    return this.invoke('release');
  }
}

export class RecorderContractFake extends RecorderFake {
  public contractViolations: string[] = [];
  private observedState: string = 'idle';

  emitState(state: string): void {
    this.observedState = state;
    super.emitState(state);
  }

  private requireState(method: string, allowed: string[]): void {
    if (allowed.indexOf(this.observedState) < 0) {
      const message: string = method + ' invalid in ' + this.observedState;
      this.contractViolations.push(message);
      throw new Error(message);
    }
  }

  async stop(): Promise<void> {
    this.requireState('stop', ['started', 'paused']);
    await super.stop();
    this.emitState('stopped');
  }

  async reset(): Promise<void> {
    this.requireState('reset', ['stopped']);
    await super.reset();
    this.emitState('idle');
  }
}

export class RecorderFactoryFake {
  public calls: number = 0;
  private recorders: RecorderFake[];
  private history: string[];
  private failures: Map<number, string> = new Map<number, string>();
  private gates: Map<number, RecorderGate> = new Map<number, RecorderGate>();

  constructor(recorders: RecorderFake[], history: string[]) {
    this.recorders = recorders;
    this.history = history;
  }

  fail(call: number, message: string): void {
    this.failures.set(call, message);
  }

  defer(call: number, gate: RecorderGate): void {
    this.gates.set(call, gate);
  }

  async create(): Promise<AudioRecorderPort> {
    this.calls++;
    const call: number = this.calls;
    const label: string = 'factory.' + call;
    this.history.push(label + '.enter');
    const gate: RecorderGate | undefined = this.gates.get(call);
    if (gate !== undefined) {
      await gate.promise;
    }
    const failure: string | undefined = this.failures.get(call);
    if (failure !== undefined) {
      this.history.push(label + '.reject');
      throw new Error(failure);
    }
    const recorder: RecorderFake | undefined = this.recorders[call - 1];
    if (recorder === undefined) {
      this.history.push(label + '.reject');
      throw new Error('Recorder factory exhausted at call ' + call);
    }
    this.history.push(label + '.resolve');
    return recorder;
  }
}

export async function recorderTick(): Promise<void> {
  await new Promise<void>((resolve: () => void): void => {
    setTimeout((): void => resolve(), 1);
  });
}

export async function recorderRejection(operation: () => Promise<void>): Promise<string> {
  try {
    await operation();
  } catch (error) {
    return (error as Error).message;
  }
  return '';
}
