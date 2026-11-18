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
import { BusinessError } from '@kit.BasicServicesKit';
import { HistoryAction, HistoryEntry, HistoryStats, Logger, VCardManager } from 'library';

export const HISTORY_FILTER_ALL: number = 0;
export const HISTORY_FILTER_IMPORT: number = 1;
export const HISTORY_FILTER_EXPORT: number = 2;

/**
 * State orchestration of the history page. The raw list is kept untouched so
 * switching the filter never reloads from preferences.
 */
@ObservedV2
export class HistoryViewModel {
  @Trace public entries: HistoryEntry[] = [];
  @Trace public stats: HistoryStats = new HistoryStats();
  @Trace public filter: number = HISTORY_FILTER_ALL;
  @Trace public loading: boolean = false;
  @Trace public loaded: boolean = false;

  private context: common.Context | null = null;

  init(context: common.Context): void {
    this.context = context;
    this.load();
  }

  async load(): Promise<void> {
    const context: common.Context | null = this.context;
    if (context === null) {
      return;
    }
    this.loading = true;
    try {
      const entries: HistoryEntry[] = await VCardManager.loadHistory(context);
      this.entries = entries;
      this.stats = VCardManager.makeStats(entries);
      this.loaded = true;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[HistoryViewModel] load failed code=' + err.code + ' message=' + err.message);
    }
    this.loading = false;
  }

  setFilter(value: number): void {
    this.filter = value;
  }

  @Computed
  get visibleEntries(): HistoryEntry[] {
    if (this.filter === HISTORY_FILTER_ALL) {
      return this.entries;
    }
    const expected: number = this.filter === HISTORY_FILTER_IMPORT ? HistoryAction.IMPORT : HistoryAction.EXPORT;
    const result: HistoryEntry[] = [];
    for (const entry of this.entries) {
      if (entry.action === expected) {
        result.push(entry);
      }
    }
    return result;
  }

  async clear(): Promise<boolean> {
    const context: common.Context | null = this.context;
    if (context === null) {
      return false;
    }
    try {
      await VCardManager.clearHistory(context);
      this.entries = [];
      this.stats = VCardManager.makeStats([]);
      return true;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error('[HistoryViewModel] clear failed code=' + err.code + ' message=' + err.message);
      return false;
    }
  }
}
