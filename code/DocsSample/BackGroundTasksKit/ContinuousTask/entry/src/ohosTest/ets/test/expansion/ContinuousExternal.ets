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
import { media } from '@kit.MediaKit';
import { avSession } from '@kit.AVSessionKit';
import { common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { rpc } from '@kit.IPCKit';
import { MockKit } from '@ohos/hypium';

// Installed Hypium 1.0.24 index.d.ts returns Function while its real JS extends that
// function with stub/afterAction. This local test-only interface describes ONLY
// the inspected external-library contract; it does not modify SDK declarations.
export interface SdkMockFunction extends Function {
  stub(...matchers: Object[]): SdkMockFunction;
  afterAction(action: Function): void;
}
export function sdkMock(mock: MockKit, target: Object, original: Function): SdkMockFunction {
  return mock.mockFunc(target, original) as SdkMockFunction;
}

// Structurally checked surfaces exercised by the unchanged real SUT.
// These are deliberately partial SDK doubles: no unexercised fake native methods.
export interface PlayerSdkView {
  duration: number;
  fdSrc: media.AVFileDescriptor;
  reset(): Promise<void>;
  prepare(): Promise<void>;
  play(): Promise<void>;
  pause(): Promise<void>;
  stop(): Promise<void>;
}
export interface SessionSdkView {
  destroy(): Promise<void>;
}
export interface ResourcesSdkView {
  getRawFd(path: string): Promise<resourceManager.RawFileDescriptor>;
}
export interface ContextSdkView {
  resourceManager: resourceManager.ResourceManager;
}
export interface MessageSequenceView {
  readParcelable(value: rpc.Parcelable): void;
  readInt(): number;
  readString(): string;
  writeInt(value: number): void;
  writeString(value: string): void;
}

export class Deferred<T> {
  public promise: Promise<T>;
  public resolve: (value: T) => void = () => {
    throw new Error('Deferred not constructed');
  };
  public reject: (reason: Error) => void = () => {
    throw new Error('Deferred not constructed');
  };
  public settled: boolean = false;
  constructor() {
    this.promise = new Promise<T>((resolve, reject) => {
      this.resolve = (value: T): void => {
        this.settled = true;
        resolve(value);
      };
      this.reject = (reason: Error): void => {
        this.settled = true;
        reject(reason);
      };
    });
  }
}

// Bounded microtask drain only: every exercised SDK promise is owned by this fixture.
// The longest production chain has then -> nested then -> catch (no timer/native work).
export async function drain(): Promise<void> {
  await Promise.resolve();
  await Promise.resolve();
  await Promise.resolve();
  await Promise.resolve();
  await Promise.resolve();
  await Promise.resolve();
}

export class ExternalPlayer implements PlayerSdkView {
  public calls: string[];
  public state: string = 'idle';
  private currentDuration: number = 0;
  public durationReads: number = 0;
  get duration(): number {
    this.durationReads++;
    return this.currentDuration;
  }
  set duration(value: number) {
    this.currentDuration = value;
  }
  public fdSrc: media.AVFileDescriptor = { fd: -17, offset: 2, length: 3 };
  public resetGate: Deferred<void> = new Deferred<void>();
  public prepareGate: Deferred<void> = new Deferred<void>();
  public playGate: Deferred<void> = new Deferred<void>();
  public pauseGate: Deferred<void> = new Deferred<void>();
  public stopGate: Deferred<void> = new Deferred<void>();
  public resetThrows: boolean = false;
  public playThrows: boolean = false;
  public pauseThrows: boolean = false;
  public stopThrows: boolean = false;
  public failure: Error = new Error('controlled SDK failure');
  public stateListener: (state: string) => void = () => {
    throw new Error('stateChange was not registered');
  };
  public errorListener: (error: Error) => void = () => {
    throw new Error('error was not registered');
  };
  constructor(calls: string[] = []) {
    this.calls = calls;
  }
  on(event: string, listener: ((state: string) => void) | ((error: Error) => void)): void {
    this.calls.push('on:' + event);
    if (event === 'stateChange') {
      this.stateListener = listener as (state: string) => void;
    }
    if (event === 'error') {
      this.errorListener = listener as (error: Error) => void;
    }
  }
  reset(): Promise<void> {
    this.calls.push('reset');
    if (this.resetThrows) {
      throw this.failure;
    }
    return this.resetGate.promise;
  }
  prepare(): Promise<void> {
    this.calls.push('prepare');
    return this.prepareGate.promise;
  }
  play(): Promise<void> {
    this.calls.push('play');
    if (this.playThrows) {
      throw this.failure;
    }
    return this.playGate.promise;
  }
  pause(): Promise<void> {
    this.calls.push('pause');
    if (this.pauseThrows) {
      throw this.failure;
    }
    return this.pauseGate.promise;
  }
  stop(): Promise<void> {
    this.calls.push('stop');
    if (this.stopThrows) {
      throw this.failure;
    }
    return this.stopGate.promise;
  }
  emit(state: string): void {
    this.state = state;
    this.stateListener(state);
  }
  asSdk(): media.AVPlayer {
    const sdkView: PlayerSdkView = this;
    return sdkView as media.AVPlayer;
  }
  settle(): void {
    if (!this.resetGate.settled) {
      this.resetGate.resolve();
    }
    if (!this.prepareGate.settled) {
      this.prepareGate.resolve();
    }
    if (!this.playGate.settled) {
      this.playGate.resolve();
    }
    if (!this.pauseGate.settled) {
      this.pauseGate.resolve();
    }
    if (!this.stopGate.settled) {
      this.stopGate.resolve();
    }
  }
}

export class ExternalSession implements SessionSdkView {
  public calls: string[];
  public outcome: string = 'resolve';
  public failure: Error = new Error('controlled session destroy failure');
  constructor(calls: string[]) {
    this.calls = calls;
  }
  destroy(): Promise<void> {
    this.calls.push('destroy');
    if (this.outcome === 'sync-throw') {
      throw this.failure;
    }
    if (this.outcome === 'reject') {
      return Promise.reject(this.failure);
    }
    return Promise.resolve();
  }
  asSdk(): avSession.AVSession {
    const sdkView: SessionSdkView = this;
    return sdkView as avSession.AVSession;
  }
}

export class ExternalResources implements ResourcesSdkView {
  public calls: string[];
  public gate: Deferred<resourceManager.RawFileDescriptor> = new Deferred<resourceManager.RawFileDescriptor>();
  public throws: boolean = false;
  constructor(calls: string[]) {
    this.calls = calls;
  }
  getRawFd(path: string): Promise<resourceManager.RawFileDescriptor> {
    this.calls.push('raw:' + path);
    if (this.throws) {
      throw new Error('controlled raw failure');
    }
    return this.gate.promise;
  }
}
export class ExternalContext implements ContextSdkView {
  public resourceManager: resourceManager.ResourceManager;
  constructor(resources: ExternalResources) {
    const sdkView: ResourcesSdkView = resources;
    this.resourceManager = sdkView as resourceManager.ResourceManager;
  }
  asSdk(): common.UIAbilityContext {
    const sdkView: ContextSdkView = this;
    return sdkView as common.UIAbilityContext;
  }
}

export class ExternalCallee {
  public calls: string[] = [];
  public callback: (input: rpc.MessageSequence) => rpc.Parcelable = () => {
    throw new Error('callee.on did not register callback');
  };
  on(name: string, callback: (input: rpc.MessageSequence) => rpc.Parcelable): void {
    this.calls.push(name);
    this.callback = callback;
  }
  off(name: string): void {
    this.calls.push('off:' + name);
  }
}
export class ExternalMessage implements MessageSequenceView {
  public calls: string[] = [];
  public num: number;
  public text: string;
  public writtenInt: number = -1;
  public writtenText: string = '';
  constructor(num: number, text: string) {
    this.num = num;
    this.text = text;
  }
  readParcelable(value: rpc.Parcelable): boolean {
    this.calls.push('readParcelable');
    const sdkView: MessageSequenceView = this;
    return value.unmarshalling(sdkView as rpc.MessageSequence);
  }
  readInt(): number {
    this.calls.push('readInt');
    return this.num;
  }
  readString(): string {
    this.calls.push('readString');
    return this.text;
  }
  writeInt(value: number): boolean {
    this.calls.push('writeInt');
    this.writtenInt = value;
    return true;
  }
  writeString(value: string): boolean {
    this.calls.push('writeString');
    this.writtenText = value;
    return true;
  }
}
