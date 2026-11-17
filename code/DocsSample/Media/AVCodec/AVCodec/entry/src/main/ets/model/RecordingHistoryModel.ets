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
import { RecordingOutputCheck } from './RecordingOutputValidation';
import Logger from '../common/utils/Logger';

export interface RecordingSegmentInfo {
  sessionId: string; uri: string; title: string; secondaryUri: string;
  recordedAt: number; durationSeconds: number; complete: boolean;
  validation?: RecordingOutputCheck[];
}

export interface RecordingHistoryEntry {
  sessionId?: string;
  uri: string;
  title: string;
  secondaryUri: string;
  recordedAt: number;
  durationSeconds: number;
  complete?: boolean;
  validation?: RecordingOutputCheck[];
  segments?: RecordingSegmentInfo[];
}

const RECORDING_PREFERENCES: string = 'recording_history';
const RECORDING_ENTRIES_KEY: string = 'entries';
const RECORDING_RECOVERY_PREFIX: string = 'entries_corrupt_';
const MAX_RECORDING_ENTRIES: number = 30;
const MAX_RECORDING_SAVE_ATTEMPTS: number = 2;

interface RecordingHistoryChange {
  entry?: RecordingHistoryEntry;
  groupId: string;
}

class RecordingHistoryStore {
  entries: RecordingHistoryEntry[] = [];
  prefs: preferences.Preferences | undefined = undefined;
  loaded: boolean = false;
  pending: RecordingHistoryChange[] = [];
  recoverySnapshot: string | undefined = undefined;
  recoveryKey: string = '';
}

export class RecordingHistoryModel {
  private static stores: Map<string, RecordingHistoryStore> = new Map<string, RecordingHistoryStore>();
  private static operations: Promise<void> = Promise.resolve();
  private static recoverySequence: number = 0;
  private store: RecordingHistoryStore = new RecordingHistoryStore();

  load(context: common.UIAbilityContext): Promise<void> {
    const key: string = context.filesDir;
    let shared: RecordingHistoryStore | undefined = RecordingHistoryModel.stores.get(key);
    if (shared === undefined) { shared = new RecordingHistoryStore(); RecordingHistoryModel.stores.set(key, shared); }
    this.store = shared;
    return this.enqueue(async (): Promise<boolean> => {
      if (this.store.pending.length === 0) { this.store.loaded = false; }
      this.store.prefs = await preferences.getPreferences(context, RECORDING_PREFERENCES);
      if (!this.store.loaded || this.store.pending.length === 0) {
        const storedValue = await this.store.prefs.get(RECORDING_ENTRIES_KEY, '[]');
        const parsed: RecordingHistoryEntry[] = await this.readEntries(String(storedValue));
        this.store.entries = parsed.filter((entry: RecordingHistoryEntry): boolean => this.isValidEntry(entry))
          .map((entry: RecordingHistoryEntry): RecordingHistoryEntry => ({
            uri: entry.uri, title: entry.title, secondaryUri: entry.secondaryUri, recordedAt: entry.recordedAt,
            durationSeconds: entry.durationSeconds,
            sessionId: typeof entry.sessionId === 'string' ? entry.sessionId : '',
            complete: typeof entry.complete === 'boolean' ? entry.complete : undefined,
            validation: this.validChecks(entry.validation),
            segments: this.validSegments(entry.segments)
          }))
          .slice(0, MAX_RECORDING_ENTRIES);
        this.store.loaded = true;
        // 首次读取失败期间的新记录在读取恢复后合并，不能覆盖原有历史。
        this.store.pending.forEach((change: RecordingHistoryChange): void => this.apply(change));
      }
      return this.save();
    }).then((): void => {});
  }

  getEntries(): RecordingHistoryEntry[] {
    return JSON.parse(JSON.stringify(this.store.entries)) as RecordingHistoryEntry[];
  }

  private async readEntries(snapshot: string): Promise<RecordingHistoryEntry[]> {
    try {
      const parsed = JSON.parse(snapshot) as RecordingHistoryEntry[];
      if (Array.isArray(parsed)) { return parsed; }
    } catch (_error) {
      // 读取成功但JSON损坏时，先保存原文，不能把存储读取错误当成空历史。
    }
    const store: preferences.Preferences | undefined = this.store.prefs;
    if (store === undefined) { throw new Error('Recording history storage unavailable'); }
    try {
      if (this.store.recoverySnapshot === snapshot && this.store.recoveryKey.length > 0 &&
        await store.get(this.store.recoveryKey, '') === snapshot) {
        return this.getEntries();
      }
      let key: string;
      do {
        key = RECORDING_RECOVERY_PREFIX + Date.now() + '_' + (++RecordingHistoryModel.recoverySequence);
      } while (await store.has(key));
      await store.put(key, snapshot);
      await store.flush();
      this.store.recoverySnapshot = snapshot;
      this.store.recoveryKey = key;
    } catch (error) {
      throw new Error('Recording history backup failed: ' + String(error));
    }
    Logger.warn('RecordingHistory', 'Invalid history was backed up before recovery');
    // 保留已知历史和待保存变更；备份失败时不会进入这里，也不会覆盖原文。
    return this.getEntries();
  }

  markIncomplete(groupId: string): Promise<boolean> {
    return this.change({ groupId: groupId });
  }

  async add(uri: string, title: string, secondaryUri: string, recordedAt: number,
    durationSeconds: number, sessionId: string = '', complete?: boolean, groupId: string = '',
    validation?: RecordingOutputCheck[]): Promise<boolean> {
    if ((uri.length === 0 && sessionId.length === 0) || title.length === 0 || !Number.isFinite(recordedAt) ||
      recordedAt <= 0 || !Number.isFinite(durationSeconds) || durationSeconds < 0) {
      return false;
    }
    const entry: RecordingHistoryEntry = {
      uri,
      title,
      secondaryUri,
      recordedAt,
      durationSeconds,
      sessionId,
      complete,
      validation
    };
    return this.change({ groupId: groupId, entry: entry });
  }

  flush(): Promise<boolean> { return this.enqueue((): Promise<boolean> => this.save()); }

  private enqueue(action: () => Promise<boolean>): Promise<boolean> {
    const task: Promise<boolean> = RecordingHistoryModel.operations.then(action).catch((error: Error): boolean => {
      Logger.warn('RecordingHistory', 'History operation failed: ' + String(error));
      return false;
    });
    RecordingHistoryModel.operations = task.then((): void => {});
    return task;
  }

  private change(change: RecordingHistoryChange): Promise<boolean> {
    const snapshot = JSON.parse(JSON.stringify(change)) as RecordingHistoryChange;
    return this.enqueue(async (): Promise<boolean> => {
      this.store.pending.push(snapshot);
      this.apply(snapshot);
      return this.save();
    });
  }

  private apply(change: RecordingHistoryChange): void {
    const entry: RecordingHistoryEntry | undefined = change.entry;
    if (entry === undefined) {
      const previous = this.store.entries.find((item: RecordingHistoryEntry): boolean =>
        item.sessionId === change.groupId);
      if (previous !== undefined) { previous.complete = false; }
    } else if (change.groupId.length > 0) {
      const segment: RecordingSegmentInfo = {
        sessionId: entry.sessionId ?? '',
        uri: entry.uri,
        title: entry.title,
        secondaryUri: entry.secondaryUri,
        recordedAt: entry.recordedAt,
        durationSeconds: entry.durationSeconds,
        complete: entry.complete ?? false,
        validation: entry.validation
      };
      this.addSegment(segment, change.groupId);
    } else {
      this.store.entries = this.store.entries.filter((item: RecordingHistoryEntry): boolean =>
        entry.uri.length > 0 ? item.uri !== entry.uri : item.sessionId !== entry.sessionId);
      this.store.entries.unshift(entry);
      this.store.entries = this.store.entries.slice(0, MAX_RECORDING_ENTRIES);
    }
  }

  private validSegments(segments: RecordingSegmentInfo[] | undefined): RecordingSegmentInfo[] | undefined {
    if (!Array.isArray(segments)) { return undefined; }
    return segments.filter((segment: RecordingSegmentInfo): boolean => segment !== null &&
      typeof segment === 'object' && typeof segment.uri === 'string' && typeof segment.title === 'string' &&
      typeof segment.secondaryUri === 'string' && typeof segment.sessionId === 'string' &&
      typeof segment.complete === 'boolean' && Number.isFinite(segment.recordedAt) && segment.recordedAt > 0 &&
      Number.isFinite(segment.durationSeconds) && segment.durationSeconds >= 0).slice(0, 1000)
      .map((segment: RecordingSegmentInfo): RecordingSegmentInfo => ({ sessionId: segment.sessionId,
        uri: segment.uri, title: segment.title, secondaryUri: segment.secondaryUri, recordedAt: segment.recordedAt,
        durationSeconds: segment.durationSeconds, complete: segment.complete,
        validation: this.validChecks(segment.validation) }));
  }

  private validChecks(checks: RecordingOutputCheck[] | undefined): RecordingOutputCheck[] | undefined {
    if (!Array.isArray(checks)) { return undefined; }
    return checks.filter((check: RecordingOutputCheck): boolean => check !== null &&
      typeof check === 'object' && typeof check.uri === 'string' && typeof check.secondary === 'boolean' &&
      ['matched', 'different', 'unavailable'].includes(check.status) && typeof check.error === 'string' &&
      Array.isArray(check.differences) && check.differences.every((item: string): boolean => typeof item === 'string') &&
      check.expected !== null && typeof check.expected === 'object' &&
      Number.isFinite(check.expected.width) && Number.isFinite(check.expected.height) &&
      Number.isFinite(check.expected.durationMs) && Number.isFinite(check.expected.fileBytes) &&
      typeof check.expected.hasAudio === 'boolean' && (check.actual === undefined ||
      (check.actual !== null && typeof check.actual === 'object' && Number.isFinite(check.actual.width) &&
      Number.isFinite(check.actual.height) && typeof check.actual.durationMs === 'number' &&
      Number.isFinite(check.actual.fileBytes) &&
      (check.actual.hasAudio === undefined || typeof check.actual.hasAudio === 'boolean')))).slice(0, 2);
  }

  private addSegment(segment: RecordingSegmentInfo, groupId: string): void {
    const previous = this.store.entries.find((entry: RecordingHistoryEntry): boolean =>
      entry.sessionId === groupId);
    const segments: RecordingSegmentInfo[] = (previous?.segments ?? []).filter((item: RecordingSegmentInfo): boolean =>
      item.sessionId !== segment.sessionId).concat([segment]);
    const first: RecordingSegmentInfo = segments[0];
    this.store.entries = this.store.entries.filter((entry: RecordingHistoryEntry): boolean =>
      entry.sessionId !== groupId);
    this.store.entries.unshift({
      sessionId: groupId,
      uri: first.uri,
      title: first.title,
      secondaryUri: first.secondaryUri,
      recordedAt: first.recordedAt,
      durationSeconds: segments.reduce((sum: number, item: RecordingSegmentInfo): number =>
        sum + item.durationSeconds, 0),
      complete: segments.every((item: RecordingSegmentInfo): boolean => item.complete), segments: segments });
    this.store.entries = this.store.entries.slice(0, MAX_RECORDING_ENTRIES);
  }

  private isValidEntry(entry: RecordingHistoryEntry): boolean {
    if (entry === null || typeof entry !== 'object') { return false; }
    return typeof entry.uri === 'string' && (entry.uri.length > 0 ||
      (typeof entry.sessionId === 'string' && entry.sessionId.length > 0)) &&
      typeof entry.title === 'string' &&
      typeof entry.secondaryUri === 'string' && typeof entry.recordedAt === 'number' &&
      Number.isFinite(entry.recordedAt) && entry.recordedAt > 0 &&
      typeof entry.durationSeconds === 'number' && Number.isFinite(entry.durationSeconds) &&
      entry.durationSeconds >= 0;
  }

  private async save(): Promise<boolean> {
    if (this.store.prefs === undefined || !this.store.loaded) {
      Logger.warn('RecordingHistory', 'History storage is unavailable; pending changes are retained');
      return false;
    }
    if (this.store.pending.length === 0) { return true; }
    for (let attempt: number = 0; attempt < MAX_RECORDING_SAVE_ATTEMPTS; attempt++) {
      try {
        await this.store.prefs.put(RECORDING_ENTRIES_KEY, JSON.stringify(this.store.entries));
        await this.store.prefs.flush();
        this.store.pending = [];
        return true;
      } catch (error) {
        Logger.warn('RecordingHistory', 'History save failed, attempt=' + (attempt + 1) + ': ' + String(error));
      }
    }
    return false;
  }
}
