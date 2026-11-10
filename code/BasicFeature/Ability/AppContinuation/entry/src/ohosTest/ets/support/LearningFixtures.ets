/** Deterministic platform fixtures; callbacks and business deadlines are driven in memory. */
import { continueManager, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { LearningController } from '../../../main/ets/learning/LearningController';
import { ContinueClient } from '../../../main/ets/learning/ContinueClient';
import {
  ContinueNativeCallback, ContinueNativePort, LearningClock, LearningDependencies,
  LearningEnvironmentPort, LearningStore, PublicEnvironment
} from '../../../main/ets/learning/LearningPorts';
import { TEXT_PAYLOAD_KEY } from '../../../main/ets/learning/LearningTypes';

export const STORE_KEY: string = 'single_text_document';

interface ScheduledCall {
  id: number;
  due: number;
  body: () => void;
}

export class FixturePlatformError extends Error implements BusinessError {
  code: number;

  constructor(code: number, message: string) {
    super(message);
    this.code = code;
  }
}

export function platformError(code: number = 16300501,
  message: string = 'fixture platform failure'): FixturePlatformError {
  return new FixturePlatformError(code, message);
}

export class ManualLearningClock implements LearningClock {
  private time: number = 1700000000000;
  private serial: number = 0;
  private calls: ScheduledCall[] = [];

  now(): number {
    return this.time;
  }

  setTimeout(body: () => void, delayMillis: number): number {
    const call: ScheduledCall = { id: ++this.serial, due: this.time + Math.max(0, delayMillis), body: body };
    this.calls.push(call);
    return call.id;
  }

  clearTimeout(id: number): void {
    this.calls = this.calls.filter((call: ScheduledCall) => call.id !== id);
  }

  advance(millis: number): void {
    if (!Number.isFinite(millis) || millis < 0) {
      throw new Error('Invalid manual-clock advance.');
    }
    const target: number = this.time + millis;
    let count: number = 0;
    while (true) {
      this.calls.sort((left: ScheduledCall, right: ScheduledCall) => left.due - right.due || left.id - right.id);
      const next = this.calls[0];
      if (next === undefined || next.due > target) {
        break;
      }
      if (++count > 1000) {
        throw new Error('Manual-clock callback loop exceeded fixture limit.');
      }
      this.calls.shift();
      this.time = next.due;
      next.body();
    }
    this.time = target;
  }

  pendingCount(): number {
    return this.calls.length;
  }

  clearAll(): void {
    this.calls = [];
  }
}

export function resultInfo(state: number = 0, text: string = ''): continueManager.ContinueResultInfo {
  const info: continueManager.ContinueResultInfo = {
    resultState: state as continueManager.ContinueStateCode, resultInfo: text
  };
  return info;
}

export class FakeContinueNative implements ContinueNativePort {
  onCallbacks: ContinueNativeCallback[] = [];
  offCallbacks: ContinueNativeCallback[] = [];
  onFailure: FixturePlatformError | undefined = undefined;
  offFailure: FixturePlatformError | undefined = undefined;
  onImmediate: boolean = false;
  offImmediate: boolean = false;
  immediateOnError: BusinessError | undefined = undefined;
  immediateOffError: BusinessError | undefined = undefined;
  immediateOnInfo: continueManager.ContinueResultInfo = resultInfo();
  immediateOffInfo: continueManager.ContinueResultInfo = resultInfo();

  on(callback: ContinueNativeCallback): void {
    this.onCallbacks.push(callback);
    if (this.onImmediate) {
      callback(this.immediateOnError, this.immediateOnInfo);
    }
    if (this.onFailure !== undefined) {
      throw this.onFailure;
    }
  }

  off(callback: ContinueNativeCallback): void {
    this.offCallbacks.push(callback);
    if (this.offImmediate) {
      callback(this.immediateOffError, this.immediateOffInfo);
    }
    if (this.offFailure !== undefined) {
      throw this.offFailure;
    }
  }

  deliverOn(index: number, error: BusinessError | undefined | null = undefined,
    info: continueManager.ContinueResultInfo | undefined | null = resultInfo()): void {
    const callback = this.onCallbacks[index];
    if (callback === undefined) {
      throw new Error(`No captured ON callback at ${index}.`);
    }
    callback(error, info);
  }

  deliverOff(index: number, error: BusinessError | undefined | null = undefined,
    info: continueManager.ContinueResultInfo | undefined | null = resultInfo()): void {
    const callback = this.offCallbacks[index];
    if (callback === undefined) {
      throw new Error(`No captured OFF callback at ${index}.`);
    }
    callback(error, info);
  }
}

export class MemoryLearningStore implements LearningStore {
  private values: Map<string, Object> = new Map<string, Object>();
  getCalls: number = 0;
  putCalls: number = 0;
  deleteCalls: number = 0;
  flushCalls: number = 0;
  failRead: boolean = false;
  failPutCalls: number[] = [];
  failDeleteCalls: number[] = [];
  failFlushCalls: number[] = [];

  constructor(seed: Object | undefined = undefined) {
    if (seed !== undefined) {
      this.values.set(STORE_KEY, seed);
    }
  }

  getSync(key: string, defaultValue: string): Object {
    this.getCalls++;
    if (this.failRead) {
      throw platformError(15500000, 'fixture read failure');
    }
    const value = this.values.get(key);
    return value === undefined ? defaultValue : value;
  }

  putSync(key: string, value: string): void {
    this.putCalls++;
    if (this.failPutCalls.indexOf(this.putCalls) >= 0) {
      throw platformError(15500000, 'fixture put failure');
    }
    this.values.set(key, value);
  }

  deleteSync(key: string): void {
    this.deleteCalls++;
    if (this.failDeleteCalls.indexOf(this.deleteCalls) >= 0) {
      throw platformError(15500000, 'fixture delete failure');
    }
    this.values.delete(key);
  }

  flushSync(): void {
    this.flushCalls++;
    if (this.failFlushCalls.indexOf(this.flushCalls) >= 0) {
      throw platformError(15500000, 'fixture flush failure');
    }
  }

  stored(): Object | undefined {
    return this.values.get(STORE_KEY);
  }
}

export class PermissionReply {
  readonly promise: Promise<number[]>;
  private fulfill: ((values: number[]) => void) | undefined = undefined;
  private fail: ((error: BusinessError) => void) | undefined = undefined;

  constructor() {
    this.promise = new Promise<number[]>((resolve, reject) => {
      this.fulfill = (values: number[]): void => resolve(values);
      this.fail = (error: BusinessError): void => reject(error);
    });
  }

  resolve(values: number[]): void {
    const fulfill = this.fulfill;
    if (fulfill !== undefined) {
      fulfill(values);
    }
  }

  reject(error: BusinessError): void {
    const fail = this.fail;
    if (fail !== undefined) {
      fail(error);
    }
  }
}

export class FakeLearningEnvironment implements LearningEnvironmentPort {
  publicInfo: PublicEnvironment = { apiVersion: 26, deviceType: 'fixture-board', osFullName: 'fixture-os' };
  mission: boolean = true;
  permission: number = 0;
  readFailure: boolean = false;
  missionFailure: boolean = false;
  permissionFailure: boolean = false;
  requestFailure: boolean = false;
  readCalls: number = 0;
  requestCalls: number = 0;
  reply: PermissionReply = new PermissionReply();

  readPublic(): PublicEnvironment {
    this.readCalls++;
    if (this.readFailure) {
      throw platformError();
    }
    return this.publicInfo;
  }

  supportsMission(): boolean {
    if (this.missionFailure) {
      throw platformError();
    }
    return this.mission;
  }

  checkPermission(): number {
    if (this.permissionFailure) {
      throw platformError();
    }
    return this.permission;
  }

  requestPermission(): Promise<number[]> {
    this.requestCalls++;
    if (this.requestFailure) {
      throw platformError();
    }
    return this.reply.promise;
  }
}

export class LearningFixture implements LearningDependencies {
  readonly clock: ManualLearningClock = new ManualLearningClock();
  readonly native: FakeContinueNative = new FakeContinueNative();
  readonly environment: FakeLearningEnvironment = new FakeLearningEnvironment();
  readonly store: MemoryLearningStore;
  readonly controller: LearningController;
  private readonly failOpen: boolean;

  constructor(seed: Object | undefined = undefined, failOpen: boolean = false, failRead: boolean = false) {
    this.store = new MemoryLearningStore(seed);
    this.store.failRead = failRead;
    this.failOpen = failOpen;
    this.controller = new LearningController(undefined, this);
  }

  openStore(): LearningStore {
    if (this.failOpen) {
      throw platformError(15500000, 'fixture open failure');
    }
    return this.store;
  }

  release(): void {
    this.controller.dispose();
    this.clock.clearAll();
  }
}

export class ClientFixture {
  readonly clock: ManualLearningClock = new ManualLearningClock();
  readonly native: FakeContinueNative = new FakeContinueNative();
  readonly client: ContinueClient = new ContinueClient(this.native, this.clock);

  release(): void {
    this.client.dispose();
    this.clock.clearAll();
  }
}

export function withLearning(body: (fixture: LearningFixture) => void, seed: Object | undefined = undefined,
  failOpen: boolean = false, failRead: boolean = false): void {
  const fixture = new LearningFixture(seed, failOpen, failRead);
  try {
    body(fixture);
  } finally {
    fixture.release();
  }
}

export function withClient(body: (fixture: ClientFixture) => void): void {
  const fixture = new ClientFixture();
  try {
    body(fixture);
  } finally {
    fixture.release();
  }
}

export function payloadBag(text: string = '接续文本🌱', tag: string = 'transfer-1', start: number = 0,
  end: number = 2): Record<string, Object> {
  const bag: Record<string, Object> = {};
  bag['version'] = 1;
  bag['transferId'] = tag;
  bag['page'] = 'text';
  bag['text'] = text;
  bag['selectionStart'] = start;
  bag['selectionEnd'] = end;
  return bag;
}

export function rawPayload(text: string = '接续文本🌱', tag: string = 'transfer-1', start: number = 0,
  end: number = 2): string {
  return JSON.stringify(payloadBag(text, tag, start, end));
}

export function inboundWant(raw: Object | undefined = undefined): Want {
  const parameters: Record<string, Object> = {};
  if (raw !== undefined) {
    parameters[TEXT_PAYLOAD_KEY] = raw;
  }
  const want: Want = { parameters: parameters };
  return want;
}

export async function flushPermissionMicrotasks(): Promise<void> {
  await Promise.resolve();
  await Promise.resolve();
  await Promise.resolve();
}
