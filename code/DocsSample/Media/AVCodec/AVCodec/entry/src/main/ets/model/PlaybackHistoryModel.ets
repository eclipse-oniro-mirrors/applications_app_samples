/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import Logger from '../common/utils/Logger';

export interface PlaybackHistoryEntry {
  uri: string;
  title: string;
  positionUs: number;
  durationUs: number;
  updatedAt: number;
}

const HISTORY_PREFERENCES = 'playback_history';
const HISTORY_KEY = 'entries';
const MAX_HISTORY_ENTRIES = 20;
const RESUME_EPSILON_US = 3 * 1000000;
const MAX_SAVE_ATTEMPTS: number = 2;
const HISTORY_RELOAD_INTERVAL_MS: number = 5000;
const HISTORY_SAVE_RETRY_INTERVAL_MS: number = 5000;
const TAG: string = 'PlaybackHistoryModel';

export class PlaybackHistoryModel {
  private entries: PlaybackHistoryEntry[] = [];
  private prefs: preferences.Preferences | undefined = undefined;
  private loadTask: Promise<void> = Promise.resolve();
  private writeTask: Promise<boolean> = Promise.resolve(true);
  private writeRevision: number = 0;
  private savedRevision: number = 0;
  private loaded: boolean = false;
  private context: common.UIAbilityContext | undefined = undefined;
  private retryAfter: number = 0;
  private pendingLoads: number = 0;
  private saveRetryAfter: number = 0;
  private pendingCompletions: Map<string, number> = new Map<string, number>();

  load(context: common.UIAbilityContext): Promise<void> {
    this.context = context;
    this.retryAfter = Date.now() + HISTORY_RELOAD_INTERVAL_MS;
    ++this.pendingLoads;
    const task: Promise<void> = this.loadTask.then(async (): Promise<void> => {
      await this.writeTask;
      this.loaded = false;
      this.prefs = await preferences.getPreferences(context, HISTORY_PREFERENCES);
      const value = await this.prefs.get(HISTORY_KEY, '[]');
      const parsed = JSON.parse(String(value)) as Array<PlaybackHistoryEntry>;
      if (!Array.isArray(parsed)) {
        throw new Error('Invalid playback history root');
      }
      const stored: PlaybackHistoryEntry[] = this.normalizeEntries(parsed, false);
      this.loaded = true;
      if (this.savedRevision < this.writeRevision) {
        // 未落盘的内存记录优先，重新加载不能丢弃失败快照。
        const pendingUris: Set<string> = new Set<string>();
        this.entries.forEach((entry: PlaybackHistoryEntry): void => { pendingUris.add(entry.uri); });
        this.entries = this.entries.concat(
          stored.filter((entry: PlaybackHistoryEntry): boolean => !pendingUris.has(entry.uri)));
        this.pendingCompletions.forEach((completedAt: number, uri: string): void => {
          const entry: PlaybackHistoryEntry | undefined = this.entries.find(
            (item: PlaybackHistoryEntry): boolean => item.uri === uri);
          if (entry !== undefined) {
            entry.positionUs = 0;
            entry.updatedAt = completedAt;
          }
        });
        this.pendingCompletions.clear();
        this.entries = this.normalizeEntries(this.entries);
        await this.save();
      } else {
        this.entries = this.normalizeEntries(stored);
      }
    }).catch((error: Error): void => {
      this.retryAfter = Date.now() + HISTORY_RELOAD_INTERVAL_MS;
      Logger.warn(TAG, 'Load playback history failed: ' + String(error));
    }).finally((): void => { --this.pendingLoads; });
    // 更新和完成操作等待读取结束，避免旧读取覆盖新进度。
    this.loadTask = task;
    return task;
  }

  private ensureLoaded(force: boolean = false): Promise<void> {
    if (this.loaded || this.pendingLoads > 0 || this.context === undefined ||
      (!force && Date.now() < this.retryAfter)) {
      return this.loadTask;
    }
    // 共用同一个读取Promise，按调用顺序应用等待中的进度和完成标记。
    return this.load(this.context);
  }

  getEntries(): PlaybackHistoryEntry[] {
    return this.entries.map((entry: PlaybackHistoryEntry): PlaybackHistoryEntry => ({
      uri: entry.uri,
      title: entry.title,
      positionUs: entry.positionUs,
      durationUs: entry.durationUs,
      updatedAt: entry.updatedAt
    }));
  }

  getResumePosition(uri: string, durationUs: number, enabled: boolean = false): number {
    if (!enabled) {
      return 0;
    }
    const entry = this.entries.find((item: PlaybackHistoryEntry) => item.uri === uri);
    if (entry === undefined || entry.positionUs <= 0 || durationUs <= 0 ||
      entry.positionUs >= durationUs - RESUME_EPSILON_US) {
      return 0;
    }
    return Math.max(0, Math.min(entry.positionUs, durationUs));
  }

  async update(uri: string, title: string, positionUs: number, durationUs: number,
    force: boolean = false): Promise<boolean> {
    if (uri.length === 0 || !Number.isFinite(positionUs) || !Number.isFinite(durationUs) ||
      positionUs < 0 || durationUs <= 0) {
      return false;
    }
    await this.ensureLoaded(force);
    // 同一文件的新进度取代尚未恢复读取的旧完成标记。
    this.pendingCompletions.delete(uri);
    const existingIndex = this.entries.findIndex((item: PlaybackHistoryEntry) => item.uri === uri);
    const entry: PlaybackHistoryEntry = {
      uri,
      title,
      positionUs: Math.max(0, Math.min(positionUs, durationUs)),
      durationUs,
      updatedAt: Date.now()
    };
    if (existingIndex >= 0) {
      this.entries.splice(existingIndex, 1);
    }
    this.entries.unshift(entry);
    if (this.entries.length > MAX_HISTORY_ENTRIES) {
      this.entries.splice(MAX_HISTORY_ENTRIES);
    }
    ++this.writeRevision;
    return this.save(force);
  }

  async markCompleted(uri: string, durationUs: number = 0): Promise<boolean> {
    if (uri.length === 0) {
      return false;
    }
    await this.ensureLoaded();
    let entry: PlaybackHistoryEntry | undefined = this.entries.find(
      (item: PlaybackHistoryEntry): boolean => item.uri === uri);
    if (entry === undefined && Number.isFinite(durationUs) && durationUs > 0) {
      entry = {
        uri,
        title: getPlaybackTitle(uri),
        positionUs: 0,
        durationUs,
        updatedAt: Date.now()
      };
      this.entries.unshift(entry);
      if (this.entries.length > MAX_HISTORY_ENTRIES) {
        this.entries.splice(MAX_HISTORY_ENTRIES);
      }
    }
    if (entry === undefined) {
      if (!this.loaded) {
        // 未读出的记录也要保留完成操作，恢复读取后再应用。
        this.pendingCompletions.set(uri, Date.now());
        ++this.writeRevision;
      }
      return false;
    }
    this.pendingCompletions.delete(uri);
    entry.positionUs = 0;
    entry.updatedAt = Date.now();
    this.entries = this.normalizeEntries(this.entries);
    ++this.writeRevision;
    return this.save(true);
  }

  private isValidEntry(item: PlaybackHistoryEntry | null | undefined): boolean {
    return item !== null && item !== undefined && typeof item === 'object' &&
      typeof item.uri === 'string' && item.uri.length > 0 && typeof item.title === 'string' &&
      typeof item.positionUs === 'number' && Number.isFinite(item.positionUs) &&
      typeof item.durationUs === 'number' && Number.isFinite(item.durationUs) && item.durationUs > 0 &&
      typeof item.updatedAt === 'number' && Number.isFinite(item.updatedAt) && item.updatedAt >= 0;
  }

  private normalizeEntries(parsed: PlaybackHistoryEntry[], truncate: boolean = true): PlaybackHistoryEntry[] {
    const valid: PlaybackHistoryEntry[] = parsed.filter((item: PlaybackHistoryEntry): boolean =>
      this.isValidEntry(item));
    valid.sort((left: PlaybackHistoryEntry, right: PlaybackHistoryEntry): number => right.updatedAt - left.updatedAt);
    const seen: Set<string> = new Set<string>();
    const entries: PlaybackHistoryEntry[] = [];
    for (const item of valid) {
      if (seen.has(item.uri)) {
        continue;
      }
      seen.add(item.uri);
      entries.push({
        uri: item.uri,
        title: item.title,
        positionUs: Math.max(0, Math.min(item.positionUs, item.durationUs)),
        durationUs: item.durationUs,
        updatedAt: item.updatedAt
      });
      if (truncate && entries.length === MAX_HISTORY_ENTRIES) {
        break;
      }
    }
    return entries;
  }

  async flush(): Promise<boolean> {
    await this.ensureLoaded(true);
    await this.writeTask;
    if (!this.loaded) { return false; }
    if (this.savedRevision === this.writeRevision) {
      return true;
    }
    return this.save(true);
  }

  private save(force: boolean = false): Promise<boolean> {
    const store = this.prefs;
    if (store === undefined || !this.loaded || (!force && Date.now() < this.saveRetryAfter)) {
      return Promise.resolve(false);
    }
    // 退避期间只更新内存；串行任务执行前再次检查，避免排队的进度保存重复重试。
    const snapshot: string = JSON.stringify(this.entries);
    const revision: number = this.writeRevision;
    this.writeTask = this.writeTask.then(async (): Promise<boolean> => {
      if (!force && Date.now() < this.saveRetryAfter) {
        return false;
      }
      for (let attempt: number = 0; attempt < MAX_SAVE_ATTEMPTS; attempt++) {
        if (revision <= this.savedRevision) {
          return true;
        }
        if (revision !== this.writeRevision) {
          return false;
        }
        try {
          await store.put(HISTORY_KEY, snapshot);
          await store.flush();
          this.savedRevision = revision;
          this.saveRetryAfter = 0;
          return true;
        } catch (error) {
          this.saveRetryAfter = Date.now() + HISTORY_SAVE_RETRY_INTERVAL_MS;
          Logger.warn(TAG, `Save playback history failed: ${String(error)}`);
        }
      }
      return false;
    });
    return this.writeTask;
  }
}

export function getPlaybackTitle(uri: string): string {
  const normalized = uri.split('?')[0];
  const parts = normalized.split('/');
  const last = parts[parts.length - 1];
  return last.length > 0 ? last : uri;
}
