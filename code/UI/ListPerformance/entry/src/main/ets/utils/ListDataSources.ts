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

import { BasicPrefetcher, IDataSourcePrefetching } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { ListConstants } from './Constants';
import { ListDataUtils } from './ListDataUtils';
import { PlaceholderRegistry } from './PlaceholderRegistry';

/** Provides List Row Data helpers for the sample. */
export class ListRowData {
  id: number;
  title: string;
  subtitle: string;
  loaded: boolean;

  constructor(id: number, loaded: boolean) {
    this.id = id;
    this.loaded = loaded;
    this.title = ListDataUtils.itemTitle(id);
    this.subtitle = ListDataUtils.itemSubtitle(id);
  }
}

/** Provides List Data Source helpers for the sample. */
export class ListDataSource implements IDataSource {
  protected total: number;
  protected registry: PlaceholderRegistry;
  private listeners: DataChangeListener[] = [];

  constructor(total: number, registry: PlaceholderRegistry) {
    this.total = total;
    this.registry = registry;
  }

  totalCount(): number {
    return this.total;
  }

  getData(index: number): ListRowData {
    return new ListRowData(index, this.registry.isLoaded(index));
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listeners.push(listener);
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const index = this.listeners.indexOf(listener);
    if (index >= 0) {
      this.listeners.splice(index, 1);
    }
  }

  notifyReload(): void {
    for (let i = 0; i < this.listeners.length; i++) {
      this.listeners[i].onDataReloaded();
    }
  }

  loadNext(): number {
    const start = this.registry.loadedCount();
    const end = ListDataUtils.nextBatch(start, this.total, ListConstants.BATCH);
    this.registry.registerRange(start, end);
    this.notifyReload();
    return this.registry.loadedCount();
  }

  reset(): void {
    this.registry.reset();
    this.notifyReload();
  }

  loadedCount(): number {
    return this.registry.loadedCount();
  }

  registryRef(): PlaceholderRegistry {
    return this.registry;
  }
}

let sharedPrefetcher: BasicPrefetcher | undefined = undefined;

export function getSharedPrefetcher(): BasicPrefetcher {
  if (sharedPrefetcher === undefined) {
    sharedPrefetcher = new BasicPrefetcher();
  }
  return sharedPrefetcher;
}

export type PrefetchUpdate = (prefetched: number, loaded: number, total: number) => void;

/** Provides Prefetch Data Source helpers for the sample. */
export class PrefetchDataSource extends ListDataSource implements IDataSourcePrefetching {
  private prefetched: number = 0;
  private nextIndex: number = 0;
  private onUpdate: PrefetchUpdate;

  constructor(total: number, registry: PlaceholderRegistry, onUpdate: PrefetchUpdate) {
    super(total, registry);
    this.onUpdate = onUpdate;
  }

  loadNext(): number {
    const loaded = super.loadNext();
    this.onUpdate(this.prefetched, loaded, this.total);
    return loaded;
  }

  prefetch(index: number): void {
    if (this.registry.isLoaded(index)) {
      return;
    }
    this.registry.register(index);
    this.prefetched++;
    Logger.event('PrefetchDataSource', 'prefetch',
      ListDataUtils.formatPrefetch(this.prefetched, this.registry.loadedCount(), this.total));
    this.onUpdate(this.prefetched, this.registry.loadedCount(), this.total);
  }

  prefetchNext(): void {
    let attempts = 0;
    while (attempts < this.total && this.registry.isLoaded(this.nextIndex)) {
      this.nextIndex = (this.nextIndex + 1) % this.total;
      attempts++;
    }
    if (attempts < this.total) {
      this.prefetch(this.nextIndex);
      this.nextIndex = (this.nextIndex + 1) % this.total;
    }
  }

  prefetchedCount(): number {
    return this.prefetched;
  }

  clearStats(): void {
    this.prefetched = 0;
    this.nextIndex = 0;
    this.onUpdate(this.prefetched, this.registry.loadedCount(), this.total);
    Logger.event('PrefetchDataSource', 'clearStats');
  }
}
