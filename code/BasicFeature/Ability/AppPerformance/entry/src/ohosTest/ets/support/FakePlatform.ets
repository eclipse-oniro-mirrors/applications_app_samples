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

/** In-memory AppPlatform only for ohosTest; never touches a native service. */
import { AppPlatform, AppStateStore, BundleSnapshot } from '../../../main/ets/core/AppPlatform';

const WALL_EPOCH: number = 1700000000000;
let fixtureSerial: number = 0;

export class FixtureError extends Error {
  public code: number;

  constructor(code: number, message: string) {
    super(message);
    this.code = code;
  }
}

export function fixtureError(code: number, message: string): FixtureError {
  return new FixtureError(code, message);
}

export class MemoryStore implements AppStateStore {
  public value: string = '';
  public writeFailure: boolean = false;
  public writeErrorCode: number = 15500000;
  public readFailure: boolean = false;
  public readCalls: number = 0;
  public writeCalls: string[] = [];

  read(): string {
    this.readCalls++;
    if (this.readFailure) {
      throw fixtureError(15500000, 'fixture store read failure');
    }
    return this.value;
  }

  write(value: string): Promise<void> {
    this.writeCalls.push(value);
    if (this.writeFailure) {
      return Promise.reject<void>(fixtureError(this.writeErrorCode, 'fixture store write failure'));
    }
    this.value = value;
    return Promise.resolve();
  }
}

interface ScheduledAction {
  id: number;
  due: number;
  interval: number;
  action: () => void;
}

class FileReply {
  public promise: Promise<void>;
  private complete: (() => void) | undefined = undefined;

  constructor(errorCode: number) {
    this.promise = new Promise<void>((resolve, reject): void => {
      this.complete = (): void => {
        if (errorCode >= 0) {
          reject(fixtureError(errorCode, 'fixture file rejection'));
        } else {
          resolve();
        }
      };
    });
  }

  release(): void {
    const complete = this.complete;
    this.complete = undefined;
    if (complete !== undefined) {
      complete();
    }
  }
}

export class FakePlatform implements AppPlatform {
  public calls: string[] = [];
  public fileCalls: string[][] = [];
  public moduleCalls: string[][] = [];
  public snapCalls: boolean[] = [];
  public rebuildCalls: number = 0;
  public copiedTexts: string[] = [];
  public timeoutDelays: number[] = [];
  public intervalDelays: number[] = [];
  public clearedTimeouts: number[] = [];
  public clearedIntervals: number[] = [];
  public resourceCalls: number = 0;
  public configCalls: number = 0;
  public files: string[] = ['libentry.so', 'entry.hap', 'shared.hsp'];
  public modules: string[] = ['entry', 'feature'];
  public versionName: string = '1.0.fixture';
  public environmentText: string = 'fixture-board · fixture-os';
  public config: string = '{"evictFilePages":["libentry.so","entry.hap","shared.hsp"]}';
  public resource: Uint8Array = new Uint8Array([65, 66, 67]);
  public fileAvailable: boolean = true;
  public moduleAvailable: boolean = true;
  public setAvailable: boolean = true;
  public rebuildAvailable: boolean = true;
  public fileErrorCode: number = -1;
  public moduleErrorCode: number = -1;
  public setErrorCode: number = -1;
  public rebuildErrorCode: number = -1;
  public resourceErrorCode: number = -1;
  public configErrorCode: number = -1;
  public listErrorCode: number = -1;
  public bundleErrorCode: number = -1;
  public copyErrorCode: number = -1;
  public deferFile: boolean = false;
  public store: MemoryStore;
  private time: number = 1000;
  private timerSerial: number = 0;
  private timers: ScheduledAction[] = [];
  private fileReplies: FileReply[] = [];
  private idSerial: number = 0;
  private fixtureId: number;

  constructor(store: MemoryStore = new MemoryStore()) {
    this.store = store;
    this.fixtureId = ++fixtureSerial;
  }

  now(): number {
    this.calls.push('now');
    return this.time;
  }

  wallNow(): number {
    this.calls.push('wallNow');
    return WALL_EPOCH + this.time;
  }

  randomId(): string {
    this.calls.push('randomId');
    return `fixture-${this.fixtureId}-${++this.idSerial}`;
  }

  environment(): string {
    this.calls.push('environment');
    return this.environmentText;
  }

  bundleInfo(): BundleSnapshot {
    this.calls.push('bundleInfo');
    if (this.bundleErrorCode >= 0) {
      throw fixtureError(this.bundleErrorCode, 'fixture bundle failure');
    }
    return { versionName: this.versionName, modules: this.modules.slice() };
  }

  listFiles(): string[] {
    this.calls.push('listFiles');
    if (this.listErrorCode >= 0) {
      throw fixtureError(this.listErrorCode, 'fixture list failure');
    }
    return this.files.slice();
  }

  readConfig(): string {
    this.calls.push('readConfig');
    this.configCalls++;
    if (this.configErrorCode >= 0) {
      throw fixtureError(this.configErrorCode, 'fixture config failure');
    }
    return this.config;
  }

  readResource(): Promise<Uint8Array> {
    this.calls.push('readResource');
    this.resourceCalls++;
    if (this.resourceErrorCode >= 0) {
      return Promise.reject<Uint8Array>(fixtureError(this.resourceErrorCode, 'fixture resource rejection'));
    }
    return Promise.resolve(new Uint8Array(this.resource));
  }

  openStore(): AppStateStore {
    this.calls.push('openStore');
    return this.store;
  }

  copyText(value: string): Promise<void> {
    this.calls.push('copyText');
    this.copiedTexts.push(value);
    if (this.copyErrorCode >= 0) {
      return Promise.reject<void>(fixtureError(this.copyErrorCode, 'fixture copy rejection'));
    }
    return Promise.resolve();
  }

  canEvictFiles(): boolean {
    this.calls.push('canEvictFiles');
    return this.fileAvailable;
  }

  canEvictModules(): boolean {
    this.calls.push('canEvictModules');
    return this.moduleAvailable;
  }

  evictFiles(targets: string[]): Promise<void> {
    this.calls.push('evictFiles');
    this.fileCalls.push(targets.slice());
    if (this.deferFile) {
      const reply = new FileReply(this.fileErrorCode);
      this.fileReplies.push(reply);
      return reply.promise;
    }
    if (this.fileErrorCode >= 0) {
      return Promise.reject<void>(fixtureError(this.fileErrorCode, 'fixture file rejection'));
    }
    return Promise.resolve();
  }

  evictModules(targets: string[]): Promise<void> {
    this.calls.push('evictModules');
    this.moduleCalls.push(targets.slice());
    if (this.moduleErrorCode >= 0) {
      return Promise.reject<void>(fixtureError(this.moduleErrorCode, 'fixture module rejection'));
    }
    return Promise.resolve();
  }

  canSetSnap(): boolean {
    this.calls.push('canSetSnap');
    return this.setAvailable;
  }

  setSnapEnabled(flag: boolean): void {
    this.calls.push('setSnapEnabled');
    this.snapCalls.push(flag);
    if (this.setErrorCode >= 0) {
      throw fixtureError(this.setErrorCode, 'fixture set rejection');
    }
  }

  canRebuildSnap(): boolean {
    this.calls.push('canRebuildSnap');
    return this.rebuildAvailable;
  }

  rebuildSnap(): void {
    this.calls.push('rebuildSnap');
    this.rebuildCalls++;
    if (this.rebuildErrorCode >= 0) {
      throw fixtureError(this.rebuildErrorCode, 'fixture rebuild rejection');
    }
  }

  setTimeout(action: () => void, delay: number): number {
    this.calls.push('setTimeout');
    this.timeoutDelays.push(delay);
    return this.schedule(action, delay, false);
  }

  clearTimeout(id: number): void {
    this.calls.push('clearTimeout');
    this.clearedTimeouts.push(id);
    this.removeTimer(id);
  }

  setInterval(action: () => void, delay: number): number {
    this.calls.push('setInterval');
    this.intervalDelays.push(delay);
    return this.schedule(action, delay, true);
  }

  clearInterval(id: number): void {
    this.calls.push('clearInterval');
    this.clearedIntervals.push(id);
    this.removeTimer(id);
  }

  /** Settle one captured file Promise at most once; no real timer or sleep. */
  releaseFile(): void {
    const reply = this.fileReplies.shift();
    if (reply !== undefined) {
      reply.release();
    }
  }

  /** Execute due timeouts/intervals in deadline/id order, including newly scheduled work. */
  advance(ms: number): void {
    if (!Number.isFinite(ms) || ms < 0 || !Number.isFinite(this.time + ms)) {
      throw new Error('Invalid fixture clock advance');
    }
    const target = this.time + ms;
    let executed: number = 0;
    while (true) {
      this.timers.sort((left: ScheduledAction, right: ScheduledAction): number =>
        left.due - right.due || left.id - right.id);
      const next = this.timers[0];
      if (next === undefined || next.due > target) {
        break;
      }
      if (++executed > 1000) {
        throw new Error('Fixture timer callback limit exceeded');
      }
      this.timers.shift();
      this.time = next.due;
      if (next.interval > 0) {
        next.due += next.interval;
        this.timers.push(next);
      }
      next.action();
    }
    this.time = target;
  }

  pendingTimers(): number {
    return this.timers.length;
  }

  private schedule(action: () => void, delay: number, repeating: boolean): number {
    if (!Number.isFinite(delay)) {
      throw new Error('Invalid fixture timer delay');
    }
    const duration = repeating ? Math.max(1, delay) : Math.max(0, delay);
    const timer: ScheduledAction = {
      id: ++this.timerSerial,
      due: this.time + duration,
      interval: repeating ? duration : 0,
      action: action
    };
    this.timers.push(timer);
    return timer.id;
  }

  private removeTimer(id: number): void {
    this.timers = this.timers.filter((timer: ScheduledAction): boolean => timer.id !== id);
  }
}
