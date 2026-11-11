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
import { preferences } from '@kit.ArkData';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { logInfo, logWarning } from '../../../main/ets/services/Logger';
import { BusinessStore, NoteItem, StoredData, decodeBusinessDocument } from '../../../main/ets/business/BusinessStore';
import {
  BusinessStorage, BusinessWriteError, PreferencesBusinessStorage
} from '../../../main/ets/business/BusinessStorage';

// Importing this module does not acquire a context, create a Driver or call a native API.
let recycleNamespaceSequence: number = 0;

function assertRecycleNativeQaNamespace(namespace: string): void {
  if (!/^sc_recycle_native_qa_[0-9]+_[0-9]+$/.test(namespace)) {
    throw new Error('Refusing to access a non-QA preferences namespace');
  }
}

/** Real SDK storage plus an injected lost acknowledgement AFTER put/flush have succeeded.
 * This does not claim that the SDK itself reported an error after committing.
 */
export class NativeCommitAcknowledgementFault implements BusinessStorage {
  public writes: number = 0;
  public reloads: number = 0;
  private loseNextAcknowledgement: boolean = false;
  private adapter: PreferencesBusinessStorage;

  constructor(namespace: string) {
    assertRecycleNativeQaNamespace(namespace);
    this.adapter = new PreferencesBusinessStorage(namespace);
  }

  arm(): void { this.loseNextAcknowledgement = true; }

  read(context: common.ApplicationContext): Promise<string> { return this.adapter.read(context); }

  reload(context: common.ApplicationContext): Promise<string> {
    this.reloads++;
    return this.adapter.reload(context);
  }

  async write(value: string): Promise<void> {
    this.writes++;
    await this.adapter.write(value);
    if (this.loseNextAcknowledgement) {
      this.loseNextAcknowledgement = false;
      throw new BusinessWriteError('QA lost acknowledgement after a real native flush', true);
    }
  }
}

export class RecycleNativeQaFixture {
  public readonly context: common.ApplicationContext;
  public readonly namespace: string;
  public time: number = 1800000000000;
  private stores: BusinessStore[] = [];
  private startedAt: number;

  constructor(context: common.ApplicationContext, namespace: string, startedAt: number = Date.now()) {
    assertRecycleNativeQaNamespace(namespace);
    this.context = context;
    this.namespace = namespace;
    this.startedAt = startedAt;
  }

  mark(phase: string): void {
    logInfo(`native QA phase=${phase} elapsedMs=${Date.now() - this.startedAt}`);
  }

  async open(): Promise<BusinessStore> {
    return this.openUsing(new PreferencesBusinessStorage(this.namespace));
  }

  async openUsing(adapter: BusinessStorage): Promise<BusinessStore> {
    const store: BusinessStore = new BusinessStore(adapter, (): number => this.time);
    this.stores.push(store);
    store.initialize(this.context);
    await this.loaded(store);
    return store;
  }

  private loaded(store: BusinessStore): Promise<void> {
    return new Promise<void>((resolve, reject): void => {
      let ended: boolean = false;
      let timer: number = -1;
      const finish = (): void => {
        if (!ended && !store.snapshot().loading) {
          ended = true;
          clearTimeout(timer);
          store.unsubscribe(finish);
          resolve();
        }
      };
      timer = setTimeout((): void => {
        if (!ended) {
          ended = true;
          store.unsubscribe(finish);
          reject(new Error('Native QA preferences load did not settle'));
        }
      }, 10000);
      store.subscribe(finish);
      finish();
    });
  }

  async releaseStores(): Promise<void> {
    let failure: Error | undefined = undefined;
    for (const store of this.stores) {
      try {
        await store.whenStorageIdle();
      } catch (error) {
        failure = error as Error;
      } finally {
        store.dispose();
      }
    }
    this.stores = [];
    if (failure !== undefined) { throw failure; }
  }

  async reopen(): Promise<BusinessStore> {
    await this.releaseStores();
    await preferences.removePreferencesFromCache(this.context, this.namespace);
    return this.open();
  }

  async readRaw(): Promise<string> {
    const nativeStore: preferences.Preferences = await preferences.getPreferences(this.context,
      { name: this.namespace });
    const value: preferences.ValueType = await nativeStore.get('workspace', '');
    if (typeof value !== 'string') { throw new Error('QA workspace is not a string'); }
    return value;
  }

  async readDocument(): Promise<StoredData> {
    return decodeBusinessDocument(await this.readRaw());
  }

  async seed(value: preferences.ValueType): Promise<void> {
    await this.releaseStores();
    await preferences.removePreferencesFromCache(this.context, this.namespace);
    const nativeStore: preferences.Preferences = await preferences.getPreferences(this.context,
      { name: this.namespace });
    await nativeStore.put('workspace', value);
    await nativeStore.flush();
    await preferences.removePreferencesFromCache(this.context, this.namespace);
  }

  async save(store: BusinessStore, title: string, body: string): Promise<NoteItem> {
    store.openNote();
    store.setDraftTitle(title);
    store.setDraftBody(body);
    if (!await store.saveNote()) { throw new Error(`QA note save failed: ${store.snapshot().error}`); }
    const note: NoteItem | undefined = store.snapshot().notes.find((item: NoteItem): boolean =>
      item.title === title && item.body === body);
    if (note === undefined) { throw new Error('QA saved note was not published'); }
    return note;
  }

  async close(): Promise<void> {
    this.mark('cleanup-start');
    try {
      await this.releaseStores();
      this.mark('stores-settled');
    } finally {
      // deletePreferences deletes this test instance from both cache and persistent storage.
      await preferences.deletePreferences(this.context, this.namespace);
      this.mark('private-preferences-deleted');
    }
  }
}

export async function withRecycleNativeQa(
  body: (fixture: RecycleNativeQaFixture) => Promise<void>): Promise<void> {
  const startedAt: number = Date.now();
  const context: common.ApplicationContext = abilityDelegatorRegistry.getAbilityDelegator()
    .getAppContext().getApplicationContext();
  recycleNamespaceSequence++;
  const namespace: string = `sc_recycle_native_qa_${Date.now()}_${recycleNamespaceSequence}`;
  const fixture: RecycleNativeQaFixture = new RecycleNativeQaFixture(context, namespace, startedAt);
  fixture.mark('begin');
  try {
    await body(fixture);
    fixture.mark('body-complete');
  } catch (error) {
    logWarning('Native QA failure');
    throw error;
  } finally {
    try {
      await fixture.close();
    } catch (error) {
      logWarning('Native QA cleanup failure');
      throw error;
    } finally {
      fixture.mark('end');
    }
  }
}
