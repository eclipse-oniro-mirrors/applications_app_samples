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

import { autoStartupManager, common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';
import { systemDateTime } from '@kit.BasicServicesKit';
import { HistoryStorage } from './AutoStartupHistory';
import { reportFailure } from './SampleLogger';

export class NativeStatusSnapshot {
  public requestId: number = 0;
  public startedAt: number = 0;
  public finishedAt: number = 0;
  public pending: boolean = false;
  public joins: number = 0;
  clone(): NativeStatusSnapshot {
    const copy = new NativeStatusSnapshot();
    copy.requestId = this.requestId; copy.startedAt = this.startedAt; copy.finishedAt = this.finishedAt;
    copy.pending = this.pending; copy.joins = this.joins;
    return copy;
  }
}

export interface AutoStartupApi {
  isAutoStartupSupported(): boolean;
  getAutoStartupStatusForSelf(): Promise<boolean>;
  nativeStatus?(): NativeStatusSnapshot;
}

export interface QueryClock {
  now(): number;
  monotonicNow?(): number;
  setTimeout(callback: () => void, delayMillis: number): number;
  clearTimeout(id: number): void;
}

export class SystemAutoStartupApi implements AutoStartupApi {
  isAutoStartupSupported(): boolean {
    return autoStartupManager.isAutoStartupSupported();
  }

  getAutoStartupStatusForSelf(): Promise<boolean> {
    return autoStartupManager.getAutoStartupStatusForSelf();
  }
}

export class SystemQueryClock implements QueryClock {
  now(): number {
    return Date.now();
  }

  monotonicNow(): number {
    return systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
  }

  setTimeout(callback: () => void, delayMillis: number): number {
    return setTimeout(callback, delayMillis);
  }

  clearTimeout(id: number): void {
    clearTimeout(id);
  }
}

export function elapsedNow(clock: QueryClock): number {
  return clock.monotonicNow === undefined ? clock.now() : clock.monotonicNow();
}

/** One injectable native status slot shared by normal queries and independent diagnostics. */
export class SharedAutoStartupApi implements AutoStartupApi {
  private request: Promise<boolean> | undefined = undefined;
  private state: NativeStatusSnapshot = new NativeStatusSnapshot();
  private listeners: (() => void)[] = [];
  private api: AutoStartupApi;
  private clock: QueryClock;
  constructor(api: AutoStartupApi, clock: QueryClock) { this.api = api; this.clock = clock; }
  isAutoStartupSupported(): boolean { return this.api.isAutoStartupSupported(); }
  nativeStatus(): NativeStatusSnapshot { return this.state.clone(); }
  subscribe(listener: () => void): () => void {
    this.listeners.push(listener);
    return (): void => { this.listeners = this.listeners.filter((item: () => void): boolean => item !== listener); };
  }
  getAutoStartupStatusForSelf(): Promise<boolean> {
    if (this.request !== undefined) {
      this.state.joins++;
      this.notify();
      return this.request;
    }
    this.state.requestId++;
    this.state.startedAt = this.clock.now(); this.state.finishedAt = 0;
    this.state.pending = true; this.state.joins = 0;
    let native: Promise<boolean>;
    try {
      native = this.api.getAutoStartupStatusForSelf();
    } catch (error) {
      this.release(); throw error as Error;
    }
    const tracked = native.then((value: boolean): boolean => { this.release(); return value; },
      (error: Error): boolean => { this.release(); throw error; });
    this.request = tracked;
    this.notify();
    return tracked;
  }
  private release(): void {
    this.request = undefined; this.state.pending = false; this.state.finishedAt = this.clock.now();
    this.notify();
  }
  private notify(): void {
    this.listeners.slice().forEach((listener: () => void): void => {
      try {
        listener();
      } catch (_) {
        // Subscriber isolation: one failing listener must not stop the remaining notifications.
        reportFailure('Runtime listener');
      }
    });
  }
}
export const systemAutoStartupApi: SharedAutoStartupApi =
  new SharedAutoStartupApi(new SystemAutoStartupApi(), new SystemQueryClock());

/** Bounded query history in a private Preferences namespace. */
export class PreferencesHistoryStorage implements HistoryStorage {
  private readonly store: preferences.Preferences;

  constructor(context: common.UIAbilityContext, name: string = 'autostart_query_history_v1') {
    this.store = preferences.getPreferencesSync(context, { name: name });
  }

  read(): string {
    const value: preferences.ValueType = this.store.getSync('history', '');
    return typeof value === 'string' ? value : '';
  }

  async write(value: string): Promise<void> {
    this.store.putSync('history', value);
    await this.store.flush();
  }
}
