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

  // 只确认当前仍存在的待处理会话，并保留此前已写入的报告。
  static acknowledge(context: common.Context, pending: MediaPendingSession): Promise<void> {
    return MediaSessionStore.change(context, { id: pending.id, operation: 'cleanup', startedAt: 0 }, undefined,
      pending);
  }

  private static change(context: common.Context, pending: MediaPendingSession,
    report: MediaSessionReport | undefined, acknowledged?: MediaPendingSession): Promise<void> {
    const serialized: string = report === undefined || report.operation === 'recording' ? '' : JSON.stringify(report);
    const task: Promise<void> = MediaSessionStore.writes.then(async (): Promise<void> => {
      const entries: MediaPendingSession[] = MediaSessionStore.parsePending(
        await MediaStateFiles.read(context, 'pending_sessions.json', '[]'));
      if (acknowledged !== undefined && !entries.some((item: MediaPendingSession): boolean =>
        item.id === acknowledged.id && item.operation === acknowledged.operation &&
        item.startedAt === acknowledged.startedAt)) {
        return;
      }
      let remaining: MediaPendingSession[] = entries.filter((item: MediaPendingSession): boolean =>
        item.id !== pending.id);
      if (pending.startedAt > 0) { remaining.push(pending); }
      const recoverReport: boolean = acknowledged !== undefined && acknowledged.operation !== 'recording';
      if (recoverReport || serialized.length > 0) {
        const reports: MediaSessionReport[] = await MediaSessionStore.readReports(context);
        remaining = MediaSessionStore.unreported(remaining, reports);
        if (recoverReport && acknowledged !== undefined) {
          await MediaSessionStore.writeInterruptedReport(context, acknowledged, reports);
        } else {
          const incoming: MediaSessionReport[] = MediaReports.parseList(`[${serialized}]`);
          if (incoming.length !== 1) {
            throw new Error('Invalid completed session report');
          }
          await MediaSessionStore.writeReport(context, incoming[0], reports);
        }
      }
      await MediaStateFiles.write(context, 'pending_sessions.json', JSON.stringify(remaining.slice(-30)));
    });
    MediaSessionStore.writes = task.catch((): void => {});
    return task;
  }

  private static async writeInterruptedReport(context: common.Context, pending: MediaPendingSession,
    reports: MediaSessionReport[]): Promise<void> {
    if (reports.some((report: MediaSessionReport): boolean => MediaSessionStore.matches(pending, report))) {
      return;
    }
    const report: MediaSessionReport = MediaReports.base(pending.id, pending.operation, 'interrupted');
    report.error = MediaReports.error('process.interrupted', -1, 'Previous process ended before task completion');
    await MediaSessionStore.writeReport(context, report, reports);
  }

  private static writeReport(context: common.Context, report: MediaSessionReport,
    reports: MediaSessionReport[]): Promise<void> {
    const next: MediaSessionReport[] = reports.filter((item: MediaSessionReport): boolean => item.id !== report.id);
    next.unshift(report);
    return MediaStateFiles.write(context, 'session_reports.json', JSON.stringify(next.slice(0, 30)));
  }

  // 报告先落盘，进程中断时可能来不及删除对应的待处理记录。
  static async pending(context: common.Context): Promise<MediaPendingSession[]> {
    await MediaSessionStore.writes;
    const entries: MediaPendingSession[] =
      MediaSessionStore.parsePending(await MediaStateFiles.read(context, 'pending_sessions.json', '[]'));
    if (entries.length === 0) {
      return entries;
    }
    try {
      return MediaSessionStore.unreported(entries, await MediaSessionStore.readReports(context));
    } catch (_error) {
      // 报告无法读取时保留全部待处理记录。报告列表仍单独返回读取错误。
      return entries;
    }
  }

  static async reports(context: common.Context): Promise<MediaSessionReport[]> {
    await MediaSessionStore.writes;
    return await MediaSessionStore.readReports(context);
  }

  private static async readReports(context: common.Context): Promise<MediaSessionReport[]> {
    return MediaReports.parseList(await MediaStateFiles.read(context, 'session_reports.json', '[]'));
  }

  private static matches(pending: MediaPendingSession, report: MediaSessionReport): boolean {
    return pending.id === report.id && pending.operation === report.operation && pending.startedAt <= report.createdAt;
  }

  private static unreported(entries: MediaPendingSession[], reports: MediaSessionReport[]): MediaPendingSession[] {
    return entries.filter((item: MediaPendingSession): boolean =>
      !reports.some((report: MediaSessionReport): boolean => MediaSessionStore.matches(item, report)));
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
