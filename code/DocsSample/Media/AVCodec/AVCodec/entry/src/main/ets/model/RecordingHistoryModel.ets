/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

export interface RecordingHistoryEntry {
  uri: string;
  title: string;
  secondaryUri: string;
  recordedAt: number;
  durationSeconds: number;
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
        this.entries = parsed.filter((entry: RecordingHistoryEntry): boolean => this.isValidEntry(entry));
      }
    } catch {
      this.entries = [];
    }
  }

  getEntries(): RecordingHistoryEntry[] {
    return this.entries.slice();
  }

  async add(uri: string, title: string, secondaryUri: string, recordedAt: number,
    durationSeconds: number): Promise<void> {
    if (uri.length === 0 || title.length === 0 || recordedAt <= 0 || durationSeconds <= 0) {
      return;
    }
    const existingIndex: number = this.entries.findIndex((entry: RecordingHistoryEntry): boolean => entry.uri === uri);
    if (existingIndex >= 0) {
      this.entries.splice(existingIndex, 1);
    }
    this.entries.unshift({ uri, title, secondaryUri, recordedAt, durationSeconds });
    if (this.entries.length > MAX_RECORDING_ENTRIES) {
      this.entries.splice(MAX_RECORDING_ENTRIES);
    }
    await this.save();
  }

  private isValidEntry(entry: RecordingHistoryEntry): boolean {
    return typeof entry.uri === 'string' && entry.uri.length > 0 && typeof entry.title === 'string' &&
      typeof entry.secondaryUri === 'string' && typeof entry.recordedAt === 'number' &&
      Number.isFinite(entry.recordedAt) && entry.recordedAt > 0 &&
      typeof entry.durationSeconds === 'number' && Number.isFinite(entry.durationSeconds) &&
      entry.durationSeconds > 0;
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
