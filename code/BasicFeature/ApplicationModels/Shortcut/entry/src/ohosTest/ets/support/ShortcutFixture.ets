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

import { common, shortcutManager } from '@kit.AbilityKit';
import { BatchStorage } from '../../../main/ets/services/BatchStorage';
import { BusinessError } from '@kit.BasicServicesKit';
import { ShortcutApi } from '../../../main/ets/services/ShortcutApi';
import { ShortcutService } from '../../../main/ets/services/ShortcutService';
import { CaseScope, Cleanup, getTestContext } from './CaseScope';

export class FixtureError extends Error implements BusinessError {
  public code: number;

  constructor(code: number, message: string) {
    super(message);
    this.code = code;
  }
}

export class Deferred<T> {
  public promise: Promise<T>;
  private accept: (value: T) => void = (_: T): void => {};
  private decline: (error: BusinessError) => void = (_: BusinessError): void => {};
  private settled: boolean = false;

  constructor() {
    this.promise = new Promise<T>((resolve, reject) => {
      this.accept = resolve;
      this.decline = reject;
    });
  }

  resolve(value: T): void {
    if (this.settled) { return; }
    this.settled = true;
    this.accept(value);
  }

  reject(error: BusinessError): void {
    if (this.settled) { return; }
    this.settled = true;
    this.decline(error);
  }
}

export class SetRequest {
  public id: string;
  public visible: boolean;
  public pending: Deferred<void> = new Deferred<void>();

  constructor(id: string, visible: boolean) {
    this.id = id;
    this.visible = visible;
  }
}

export class ControlledShortcutApi implements ShortcutApi {
  public supported: boolean = true;
  public supportError: FixtureError | undefined = undefined;
  public supportCalls: number = 0;
  public queries: Deferred<shortcutManager.ShortcutInfo[]>[] = [];
  public settings: SetRequest[] = [];
  private listeners: (() => void)[] = [];

  isShortcutSupported(): boolean {
    this.supportCalls++;
    if (this.supportError !== undefined) { throw this.supportError; }
    return this.supported;
  }

  getAllShortcutInfoForSelf(): Promise<shortcutManager.ShortcutInfo[]> {
    const pending: Deferred<shortcutManager.ShortcutInfo[]> = new Deferred<shortcutManager.ShortcutInfo[]>();
    this.queries.push(pending);
    this.changed();
    return pending.promise;
  }

  setShortcutVisibleForSelf(id: string, visible: boolean): Promise<void> {
    const request: SetRequest = new SetRequest(id, visible);
    this.settings.push(request);
    this.changed();
    return request.pending.promise;
  }

  subscribe(changed: () => void): Cleanup {
    this.listeners.push(changed);
    return (): void => {
      this.listeners = this.listeners.filter((listener: () => void) => listener !== changed);
    };
  }

  release(): void {
    this.listeners = [];
    for (const pending of this.queries) { pending.resolve([]); }
    for (const request of this.settings) { request.pending.resolve(undefined); }
  }

  private changed(): void {
    for (const listener of this.listeners.slice()) { listener(); }
  }
}

export class MemoryBatchStorage implements BatchStorage {
  public value: string = '';
  public writes: number = 0;
  public failAtWrite: number = -1;
  public failRead: boolean = false;
  async read(_context: common.ApplicationContext): Promise<string> {
    if (this.failRead) { throw new Error('controlled batch read failure'); }
    return this.value;
  }
  async write(value: string): Promise<void> {
    this.writes++;
    if (this.writes === this.failAtWrite) { throw new Error('controlled batch write failure'); }
    this.value = value;
  }
}

export class ShortcutFixture {
  public api: ControlledShortcutApi = new ControlledShortcutApi();
  public batchStorage: MemoryBatchStorage = new MemoryBatchStorage();
  public service: ShortcutService = new ShortcutService(this.api, this.batchStorage);
  private scope: CaseScope;

  constructor(scope: CaseScope) {
    this.scope = scope;
    scope.cleanup((): void => {
      this.service.dispose();
      this.api.release();
    });
  }

  initialize(): void {
    this.service.initialize(getTestContext());
  }

  async load(infos: shortcutManager.ShortcutInfo[]): Promise<void> {
    this.initialize();
    (await this.query(0)).resolve(infos);
    await this.idle();
  }

  async query(index: number): Promise<Deferred<shortcutManager.ShortcutInfo[]>> {
    await this.scope.until((): boolean => this.api.queries.length > index,
      (changed: () => void): Cleanup => this.api.subscribe(changed));
    return this.api.queries[index];
  }

  async setting(index: number): Promise<SetRequest> {
    await this.scope.until((): boolean => this.api.settings.length > index,
      (changed: () => void): Cleanup => this.api.subscribe(changed));
    return this.api.settings[index];
  }

  async idle(): Promise<void> {
    await this.scope.until((): boolean => !this.service.snapshot().busy,
      (changed: () => void): Cleanup => {
        const id: number = this.service.subscribe(changed);
        return (): void => this.service.unsubscribe(id);
      });
  }
}

export function shortcutInfo(id: string, visible?: boolean): shortcutManager.ShortcutInfo {
  const page: shortcutManager.ParameterItem = { key: 'page', value: 'note' };
  const payload: shortcutManager.ParameterItem = { key: 'payload', value: 'p'.repeat(180) };
  const want: shortcutManager.ShortcutWant = {
    targetBundle: 'com.example.shortcut', targetModule: 'entry', targetAbility: 'EntryAbility',
    parameters: [page, payload]
  };
  const info: shortcutManager.ShortcutInfo = {
    id: id,
    bundleName: 'com.example.shortcut',
    moduleName: 'entry',
    hostAbility: 'EntryAbility',
    icon: '$media:shortcut_note',
    iconId: 0,
    label: `入口 ${id}`,
    labelId: 0,
    appIndex: 0,
    sourceType: 2,
    visible: visible,
    wants: [want]
  };
  return info;
}
