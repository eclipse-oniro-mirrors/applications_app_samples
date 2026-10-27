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

import { common } from '@kit.AbilityKit';
import { MediaStateFiles } from './MediaStateFiles';
import { MediaReports, MediaSessionReport } from './MediaSessionReport';
import { MediaTaskKind } from './MediaTaskCoordinator';

export interface MediaPendingSession { id: string; operation: MediaTaskKind; startedAt: number; }
export class MediaSessionStore {
  private static writes: Promise<void> = Promise.resolve();

  static begin(context: common.Context, pending: MediaPendingSession): Promise<void> {
    return MediaSessionStore.change(context, pending, undefined);
  }
  static finish(context: common.Context, id: string, report?: MediaSessionReport): Promise<void> {
    return MediaSessionStore.change(context, { id: id, operation: 'cleanup', startedAt: 0 }, report);
  }
  private static change(context: common.Context, pending: MediaPendingSession,
    report: MediaSessionReport | undefined): Promise<void> {
    const serialized: string = report === undefined || report.operation === 'recording' ? '' : JSON.stringify(report);
    const task: Promise<void> = MediaSessionStore.writes.then(async (): Promise<void> => {
      const entries: MediaPendingSession[] = MediaSessionStore.parsePending(
        await MediaStateFiles.read(context, 'pending_sessions.json', '[]'));
      const remaining: MediaPendingSession[] = entries.filter((item: MediaPendingSession): boolean => item.id !== pending.id);
      if (pending.startedAt > 0) { remaining.push(pending); }
      if (serialized.length > 0) {
        const reports: MediaSessionReport[] = MediaReports.parseList(
          await MediaStateFiles.read(context, 'session_reports.json', '[]'))
          .filter((item: MediaSessionReport): boolean => item.id !== report?.id);
        const incoming: MediaSessionReport[] = MediaReports.parseList('[' + serialized + ']');
        if (incoming.length !== 1) { throw new Error('Invalid completed session report'); }
        reports.unshift(incoming[0]);
        await MediaStateFiles.write(context, 'session_reports.json', JSON.stringify(reports.slice(0, 30)));
      }
      await MediaStateFiles.write(context, 'pending_sessions.json', JSON.stringify(remaining.slice(-30)));
    });
    MediaSessionStore.writes = task.catch((): void => {});
    return task;
  }
  static async pending(context: common.Context): Promise<MediaPendingSession[]> {
    await MediaSessionStore.writes;
    return MediaSessionStore.parsePending(await MediaStateFiles.read(context, 'pending_sessions.json', '[]'));
  }
  static async reports(context: common.Context): Promise<MediaSessionReport[]> {
    await MediaSessionStore.writes;
    return MediaReports.parseList(await MediaStateFiles.read(context, 'session_reports.json', '[]'));
  }
  private static parsePending(text: string): MediaPendingSession[] {
    const entries: MediaPendingSession[] = JSON.parse(text) as MediaPendingSession[];
    if (!Array.isArray(entries)) { throw new Error('Invalid pending session list'); }
    return entries.filter((entry: MediaPendingSession): boolean => entry !== null && typeof entry === 'object' &&
      typeof entry.id === 'string' && entry.id.length > 0 && entry.id.length <= 160 &&
      Number.isFinite(entry.startedAt) && entry.startedAt > 0 &&
      ['playback', 'recording', 'transcode'].includes(entry.operation)).slice(-30);
  }
}
