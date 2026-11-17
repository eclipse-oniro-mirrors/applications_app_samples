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

import { common } from '@kit.AbilityKit';
import { BusinessStorage, BusinessWriteError } from '../../../main/ets/business/BusinessStorage';
import { BusinessStore, NoteItem, TodoItem } from '../../../main/ets/business/BusinessStore';
import { CaseScope, Cleanup, getTestContext } from './CaseScope';
import { Deferred, FixtureError } from './ShortcutFixture';

export class StoredDayFixture {
  public date: string = '2026-11-02';
  public items: TodoItem[] = [new TodoItem('plan', '计划'), new TodoItem('focus', '专注'), new TodoItem('review', '回顾')];
}

export class StoredBusinessFixture {
  public version: number = 1;
  public notes: NoteItem[] = [];
  public draftTitle: string = '';
  public draftBody: string = '';
  public todoDays: StoredDayFixture[] = [];
}

export class ControlledBusinessStorage implements BusinessStorage {
  public value: string = '';
  public reads: number = 0;
  public writes: number = 0;
  public failRead: boolean = false;
  public failWrite: boolean = false;
  public readGate: Deferred<string> | undefined = undefined;
  public writeGate: Deferred<void> | undefined = undefined;
  public submitted: string[] = [];

  async read(_context: common.ApplicationContext): Promise<string> {
    this.reads++;
    if (this.failRead) { throw new FixtureError(17, 'read failed'); }
    const gate = this.readGate;
    return gate === undefined ? this.value : gate.promise;
  }

  async reload(context: common.ApplicationContext): Promise<string> { return this.read(context); }

  async write(value: string): Promise<void> {
    this.writes++;
    this.submitted.push(value);
    if (this.failWrite) { throw new BusinessWriteError('write failed', false); }
    const gate = this.writeGate;
    if (gate !== undefined) { await gate.promise; }
    this.value = value;
  }

  release(): void {
    this.readGate?.resolve(this.value);
    this.writeGate?.resolve(undefined);
  }
}

export function createBusiness(scope: CaseScope, storage: ControlledBusinessStorage,
  now: () => number): BusinessStore {
  const store = new BusinessStore(storage, now);
  scope.cleanup(() => { store.dispose(); storage.release(); });
  return store;
}

export async function waitBusiness(scope: CaseScope, store: BusinessStore): Promise<void> {
  await scope.until(() => !store.snapshot().loading, (changed: () => void): Cleanup => {
    store.subscribe(changed);
    return () => store.unsubscribe(changed);
  });
}

export async function loadBusiness(scope: CaseScope, storage: ControlledBusinessStorage,
  now: () => number): Promise<BusinessStore> {
  const store = createBusiness(scope, storage, now);
  store.initialize(getTestContext());
  await waitBusiness(scope, store);
  return store;
}
