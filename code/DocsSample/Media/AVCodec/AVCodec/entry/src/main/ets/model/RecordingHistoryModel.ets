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

export interface RecordingSegmentInfo {
  sessionId: string; uri: string; title: string; secondaryUri: string;
  recordedAt: number; durationSeconds: number; complete: boolean;
}

export interface RecordingHistoryEntry {
  sessionId?: string;
  uri: string;
  title: string;
  secondaryUri: string;
  recordedAt: number;
  durationSeconds: number;
  complete?: boolean;
  segments?: RecordingSegmentInfo[];
}

const RECORDING_PREFERENCES: string = 'recording_history';
const RECORDING_ENTRIES_KEY: string = 'entries';
const MAX_RECORDING_ENTRIES: number = 30;

export class RecordingHistoryModel {
  private entries: RecordingHistoryEntry[] = [];
  private prefs: preferences.Preferences | undefined = undefined;

  async load(context: common.UIAbilityContext): Promise<void> {
    try {
      this.prefs = await preferences.getPreferences(context, RECORDING_PREFERENCES);
      const storedValue = await this.prefs.get(RECORDING_ENTRIES_KEY, '[]');
      const parsed = JSON.parse(String(storedValue)) as Array<RecordingHistoryEntry>;
      if (Array.isArray(parsed)) {
        this.entries = parsed.filter((entry: RecordingHistoryEntry): boolean => this.isValidEntry(entry))
          .map((entry: RecordingHistoryEntry): RecordingHistoryEntry => ({
            uri: entry.uri, title: entry.title, secondaryUri: entry.secondaryUri, recordedAt: entry.recordedAt,
            durationSeconds: entry.durationSeconds,
            sessionId: typeof entry.sessionId === 'string' ? entry.sessionId : '',
            complete: typeof entry.complete === 'boolean' ? entry.complete : undefined,
            segments: this.validSegments(entry.segments)
          }))
          .slice(0, MAX_RECORDING_ENTRIES);
      }
    } catch {
      this.entries = [];
    }
  }

  getEntries(): RecordingHistoryEntry[] {
    return this.entries.slice();
  }

  async markIncomplete(groupId: string): Promise<void> {
    const entry: RecordingHistoryEntry | undefined = this.entries.find((item: RecordingHistoryEntry): boolean =>
      item.sessionId === groupId);
    if (entry === undefined) { return; }
    entry.complete = false;
    await this.save();
  }

  async add(uri: string, title: string, secondaryUri: string, recordedAt: number,
    durationSeconds: number, sessionId: string = '', complete?: boolean, groupId: string = ''): Promise<void> {
    if ((uri.length === 0 && sessionId.length === 0) || title.length === 0 || recordedAt <= 0 || durationSeconds < 0) {
      return;
    }
    if (groupId.length > 0) {
      await this.addSegment({ sessionId: sessionId, uri: uri, title: title, secondaryUri: secondaryUri,
        recordedAt: recordedAt, durationSeconds: durationSeconds, complete: complete ?? false }, groupId);
      return;
    }
    const existingIndex: number = this.entries.findIndex((entry: RecordingHistoryEntry): boolean =>
      uri.length > 0 ? entry.uri === uri : entry.sessionId === sessionId);
    if (existingIndex >= 0) {
      this.entries.splice(existingIndex, 1);
    }
    this.entries.unshift({ uri, title, secondaryUri, recordedAt, durationSeconds, sessionId, complete });
    if (this.entries.length > MAX_RECORDING_ENTRIES) {
      this.entries.splice(MAX_RECORDING_ENTRIES);
    }
    await this.save();
  }

  private validSegments(segments: RecordingSegmentInfo[] | undefined): RecordingSegmentInfo[] | undefined {
    if (!Array.isArray(segments)) { return undefined; }
    return segments.filter((segment: RecordingSegmentInfo): boolean => segment !== null &&
      typeof segment === 'object' && typeof segment.uri === 'string' && typeof segment.title === 'string' &&
      typeof segment.secondaryUri === 'string' && typeof segment.sessionId === 'string' &&
      typeof segment.complete === 'boolean' && Number.isFinite(segment.recordedAt) && segment.recordedAt > 0 &&
      Number.isFinite(segment.durationSeconds) && segment.durationSeconds >= 0).slice(0, 1000);
  }

  private async addSegment(segment: RecordingSegmentInfo, groupId: string): Promise<void> {
    const previous: RecordingHistoryEntry | undefined = this.entries.find((entry: RecordingHistoryEntry): boolean =>
      entry.sessionId === groupId);
    const segments: RecordingSegmentInfo[] = (previous?.segments ?? []).filter((item: RecordingSegmentInfo): boolean =>
      item.sessionId !== segment.sessionId).concat([segment]);
    const first: RecordingSegmentInfo = segments[0];
    this.entries = this.entries.filter((entry: RecordingHistoryEntry): boolean => entry.sessionId !== groupId);
    this.entries.unshift({ sessionId: groupId, uri: first.uri, title: first.title, secondaryUri: first.secondaryUri,
      recordedAt: first.recordedAt,
      durationSeconds: segments.reduce((sum: number, item: RecordingSegmentInfo): number =>
        sum + item.durationSeconds, 0),
      complete: segments.every((item: RecordingSegmentInfo): boolean => item.complete), segments: segments });
    this.entries = this.entries.slice(0, MAX_RECORDING_ENTRIES);
    await this.save();
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

  private async save(): Promise<void> {
    if (this.prefs === undefined) {
      return;
    }
    try {
      await this.prefs.put(RECORDING_ENTRIES_KEY, JSON.stringify(this.entries));
      await this.prefs.flush();
    } catch {
    }
  }
}
