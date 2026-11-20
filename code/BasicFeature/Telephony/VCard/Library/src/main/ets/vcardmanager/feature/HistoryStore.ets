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
import { HistoryAction, HistoryEntry, HistoryStats } from '../model/HistoryTypes';
import { VCardSettings } from '../model/VCardTypes';
import { VCardConstants } from '../common/VCardConstants';
import { SettingsStore } from './SettingsStore';
import { Logger } from '../utils/Logger';

const ENTRIES_KEY: string = 'entries';
const EMPTY_ENTRIES: string = '[]';

export class HistoryStore {
  static async load(context: common.Context): Promise<HistoryEntry[]> {
    try {
      const store: preferences.Preferences = await preferences.getPreferences(context,
        { name: VCardConstants.PREFERENCE_HISTORY });
      const raw: preferences.ValueType = await store.get(ENTRIES_KEY, EMPTY_ENTRIES);
      const text: string = typeof raw === 'string' ? raw : EMPTY_ENTRIES;
      return HistoryStore.decode(text);
    } catch (error) {
      const message: string = error instanceof Error ? error.message : '';
      Logger.warn('[HistoryStore] load failed: ' + message);
      return [];
    }
  }

  static async append(context: common.Context, entry: HistoryEntry): Promise<void> {
    const entries: HistoryEntry[] = await HistoryStore.load(context);
    entries.unshift(entry);
    const settings: VCardSettings = await SettingsStore.load(context);
    const limit: number = settings.historyLimit > 0 ? settings.historyLimit : VCardConstants.DEFAULT_HISTORY_LIMIT;
    if (entries.length > limit) {
      entries.splice(limit);
    }
    const store: preferences.Preferences = await preferences.getPreferences(context,
      { name: VCardConstants.PREFERENCE_HISTORY });
    await store.put(ENTRIES_KEY, JSON.stringify(entries));
    await store.flush();
  }

  static async clear(context: common.Context): Promise<void> {
    const store: preferences.Preferences = await preferences.getPreferences(context,
      { name: VCardConstants.PREFERENCE_HISTORY });
    await store.put(ENTRIES_KEY, EMPTY_ENTRIES);
    await store.flush();
  }

  static makeStats(entries: HistoryEntry[]): HistoryStats {
    const stats: HistoryStats = new HistoryStats();
    stats.total = entries.length;
    for (const entry of entries) {
      if (entry.action === HistoryAction.IMPORT) {
        stats.importCount++;
      } else if (entry.action === HistoryAction.EXPORT) {
        stats.exportCount++;
      } else if (entry.action === HistoryAction.CREATE || entry.action === HistoryAction.UPDATE ||
        entry.action === HistoryAction.DELETE) {
        stats.contactCount++;
      }
      if (entry.success) {
        stats.successCount++;
      }
    }
    return stats;
  }

  private static decode(text: string): HistoryEntry[] {
    try {
      // Single cast at the JSON trust boundary; every field is re-validated below.
      const source: HistoryEntry[] = JSON.parse(text) as HistoryEntry[];
      const entries: HistoryEntry[] = [];
      for (const item of source) {
        if (!item) {
          continue;
        }
        const entry: HistoryEntry = new HistoryEntry();
        entry.id = typeof item.id === 'string' ? item.id : '';
        entry.action = typeof item.action === 'number' ? item.action : HistoryAction.IMPORT;
        entry.target = typeof item.target === 'string' ? item.target : '';
        entry.cardCount = typeof item.cardCount === 'number' ? item.cardCount : 0;
        entry.success = typeof item.success === 'boolean' ? item.success : false;
        entry.code = typeof item.code === 'number' ? item.code : 0;
        entry.timestamp = typeof item.timestamp === 'number' ? item.timestamp : 0;
        entries.push(entry);
      }
      return entries;
    } catch (error) {
      Logger.warn('[HistoryStore] json is corrupted');
      return [];
    }
  }
}
