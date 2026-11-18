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
            validation: this.validChecks(entry.validation),
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
    durationSeconds: number, sessionId: string = '', complete?: boolean, groupId: string = '',
    validation?: RecordingOutputCheck[]): Promise<void> {
    if ((uri.length === 0 && sessionId.length === 0) || title.length === 0 || recordedAt <= 0 || durationSeconds < 0) {
      return;
    }
    if (groupId.length > 0) {
      await this.addSegment({ sessionId: sessionId, uri: uri, title: title, secondaryUri: secondaryUri,
        recordedAt: recordedAt, durationSeconds: durationSeconds, complete: complete ?? false, validation }, groupId);
      return;
    }
    const existingIndex: number = this.entries.findIndex((entry: RecordingHistoryEntry): boolean =>
      uri.length > 0 ? entry.uri === uri : entry.sessionId === sessionId);
    if (existingIndex >= 0) {
      this.entries.splice(existingIndex, 1);
    }
    this.entries.unshift({ uri, title, secondaryUri, recordedAt, durationSeconds, sessionId, complete, validation });
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
