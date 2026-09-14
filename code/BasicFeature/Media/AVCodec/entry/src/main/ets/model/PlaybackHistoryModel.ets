/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

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

export class PlaybackHistoryModel {
  private entries: PlaybackHistoryEntry[] = [];
  private prefs: preferences.Preferences | undefined = undefined;

  async load(context: common.UIAbilityContext): Promise<void> {
    try {
      this.prefs = await preferences.getPreferences(context, HISTORY_PREFERENCES);
      const value = await this.prefs.get(HISTORY_KEY, '[]');
      const parsed = JSON.parse(String(value)) as Array<PlaybackHistoryEntry>;
      if (Array.isArray(parsed)) {
        this.entries = parsed.filter((item: PlaybackHistoryEntry) => this.isValidEntry(item));
      }
    } catch {
      this.entries = [];
    }
  }

  getEntries(): PlaybackHistoryEntry[] {
    return this.entries.slice();
  }

  getResumePosition(uri: string, durationUs: number): number {
    const entry = this.entries.find((item: PlaybackHistoryEntry) => item.uri === uri);
    if (entry === undefined || entry.positionUs <= 0 || durationUs <= 0 ||
      entry.positionUs >= durationUs - RESUME_EPSILON_US) {
      return 0;
    }
    return Math.max(0, Math.min(entry.positionUs, durationUs));
  }

  async update(uri: string, title: string, positionUs: number, durationUs: number): Promise<void> {
    if (uri.length === 0 || positionUs < 0 || durationUs <= 0) {
      return;
    }
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
    await this.save();
  }

  async markCompleted(uri: string): Promise<void> {
    const entry = this.entries.find((item: PlaybackHistoryEntry) => item.uri === uri);
    if (entry === undefined) {
      return;
    }
    entry.positionUs = 0;
    entry.updatedAt = Date.now();
    await this.save();
  }

  private isValidEntry(item: PlaybackHistoryEntry): boolean {
    return typeof item.uri === 'string' && typeof item.title === 'string' &&
      typeof item.positionUs === 'number' && Number.isFinite(item.positionUs) &&
      typeof item.durationUs === 'number' && Number.isFinite(item.durationUs) && item.durationUs > 0 &&
      typeof item.updatedAt === 'number' && Number.isFinite(item.updatedAt);
  }

  private async save(): Promise<void> {
    if (this.prefs === undefined) {
      return;
    }
    try {
      await this.prefs.put(HISTORY_KEY, JSON.stringify(this.entries));
      await this.prefs.flush();
    } catch {
    }
  }
}

export function getPlaybackTitle(uri: string): string {
  const normalized = uri.split('?')[0];
  const parts = normalized.split('/');
  const last = parts[parts.length - 1];
  return last.length > 0 ? last : uri;
}
