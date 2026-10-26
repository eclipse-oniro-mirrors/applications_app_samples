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
import { fileIo, picker } from '@kit.CoreFileKit';
import { util } from '@kit.ArkTS';
import { RecorderDiagnostics } from 'librecorder.so';
import { RecorderLiveDiagnosticsModel } from './RecorderLiveDiagnosticsModel';
import { LocalizedText } from '../common/LocalizedText';

export interface RecordingReport {
  persistenceFailed?: boolean;
  version: number;
  sessionId: string;
  recordedAt: number;
  durationSeconds: number;
  title: string;
  primaryUri: string;
  secondaryUri: string;
  primaryDump: string;
  secondaryDump: string;
  diagnostics: RecorderDiagnostics;
  fileMetadata: string;
  text: string;
}

// 本地报告保留文件关联；分享副本不带媒体 URI、Dump 绝对路径和文件名。
export class RecordingReportStore {
  private static writes: Promise<void> = Promise.resolve();
  private static latest: RecordingReport | undefined = undefined;
  private static revision: number = 0;
  private static readonly MAX_REPORTS: number = 30;

  static validId(id: string): boolean { return /^recording_[0-9]+_[0-9]+$/.test(id); }

  static text(report: RecordingReport): string {
    return ['AVCodec · ' + report.sessionId, new Date(report.recordedAt).toISOString(),
      report.durationSeconds.toFixed(1) + ' s', RecorderLiveDiagnosticsModel.endReason(report.diagnostics.endReason),
      report.diagnostics.requestedConfiguration, report.diagnostics.observedConfiguration,
      report.diagnostics.parameterChanges, report.fileMetadata,
      RecorderLiveDiagnosticsModel.report(report.diagnostics, report.secondaryUri.length > 0)]
      .join(String.fromCharCode(10, 10));
  }

  static save(context: common.Context, report: RecordingReport): Promise<void> {
    if (!RecordingReportStore.validId(report.sessionId)) {
      return Promise.reject(new Error('Invalid recording session id'));
    }
    const saved = JSON.parse(JSON.stringify(report)) as RecordingReport;
    saved.persistenceFailed = false;
    const snapshot: string = JSON.stringify(saved);
    const revision: number = ++RecordingReportStore.revision;
    RecordingReportStore.latest = JSON.parse(snapshot) as RecordingReport;
    RecordingReportStore.latest.persistenceFailed = true;
    const task: Promise<void> = RecordingReportStore.writes.then(async (): Promise<void> => {
      const directory: string = context.filesDir + '/recording_reports';
      await fileIo.mkdir(directory, true);
      await RecordingReportStore.atomicWrite(directory + '/' + saved.sessionId + '.txt', saved.text);
      // JSON 是完整报告的入口，最后替换。中断不会留下可读到一半的 JSON。
      await RecordingReportStore.atomicWrite(directory + '/' + saved.sessionId + '.json', snapshot);
      if (RecordingReportStore.revision === revision && RecordingReportStore.latest !== undefined) {
        RecordingReportStore.latest.persistenceFailed = false;
      }
      await RecordingReportStore.prune(directory);
    });
    RecordingReportStore.writes = task.catch((): void => {});
    return task;
  }

  static async read(context: common.Context, id: string): Promise<RecordingReport> {
    if (!RecordingReportStore.validId(id)) { throw new Error('Invalid recording session id'); }
    await RecordingReportStore.writes;
    if (RecordingReportStore.latest?.sessionId === id) {
      return JSON.parse(JSON.stringify(RecordingReportStore.latest)) as RecordingReport;
    }
    const path: string = context.filesDir + '/recording_reports/' + id + '.json';
    const stat: fileIo.Stat = await fileIo.lstat(path);
    if (!stat.isFile() || stat.isSymbolicLink() || stat.size > 2 * 1024 * 1024) {
      throw new Error('Invalid recording report');
    }
    const report = JSON.parse(await fileIo.readText(path)) as RecordingReport;
    if (report === null || report.version !== 1 || report.sessionId !== id || typeof report.text !== 'string' ||
      typeof report.title !== 'string' || typeof report.fileMetadata !== 'string' ||
      typeof report.primaryDump !== 'string' || typeof report.secondaryDump !== 'string' ||
      typeof report.primaryUri !== 'string' || typeof report.secondaryUri !== 'string' ||
      !Number.isFinite(report.recordedAt) || !Number.isFinite(report.durationSeconds) || report.durationSeconds < 0) {
      throw new Error('Invalid recording report');
    }
    // JSON 可能损坏或来自旧版本；先验证诊断字段可格式化，再交给声明式页面读取。
    try { RecordingReportStore.text(report); } catch (_error) { throw new Error('Invalid recording diagnostics'); }
    return report;
  }

  static async writeAll(fd: number, value: string): Promise<void> {
    const bytes: Uint8Array = new util.TextEncoder().encodeInto(value);
    const buffer: ArrayBuffer = bytes.buffer as ArrayBuffer;
    let offset: number = 0;
    while (offset < bytes.byteLength) {
      const written: number = await fileIo.write(fd, buffer.slice(offset));
      if (written <= 0) { throw new Error('Report write made no progress'); }
      offset += written;
    }
  }

  private static async atomicWrite(path: string, value: string): Promise<void> {
    const temporary: string = path + '.pending';
    if (await fileIo.access(temporary)) {
      const stat: fileIo.Stat = await fileIo.lstat(temporary);
      if (stat.isSymbolicLink() || !stat.isFile()) { throw new Error('Unsafe temporary report'); }
      await fileIo.unlink(temporary);
    }
    const file: fileIo.File = await fileIo.open(temporary,
      fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
    try {
      await RecordingReportStore.writeAll(file.fd, value);
      await fileIo.fsync(file.fd);
    } finally { await fileIo.close(file); }
    await fileIo.rename(temporary, path);
  }

  private static async prune(directory: string): Promise<void> {
    const names: string[] = await fileIo.listFile(directory);
    const ids: string[] = [];
    for (const name of names) {
      if (!/^recording_[0-9]+_[0-9]+\.(json|txt)(\.pending)?$/.test(name)) { continue; }
      const id: string = name.split('.')[0];
      if (ids.indexOf(id) < 0) { ids.push(id); }
    }
    ids.sort((a: string, b: string): number => Number(b.split('_')[1]) - Number(a.split('_')[1]));
    for (const id of ids.slice(RecordingReportStore.MAX_REPORTS)) {
      for (const suffix of ['.json', '.txt', '.json.pending', '.txt.pending']) {
        try { await fileIo.unlink(directory + '/' + id + suffix); } catch (_error) {}
      }
    }
  }

  static async export(context: common.Context, report: RecordingReport, json: boolean): Promise<boolean> {
    const options = new picker.DocumentSaveOptions();
    options.newFileNames = [report.sessionId + (json ? '.json' : '.txt')];
    const paths: string[] = await new picker.DocumentViewPicker(context).save(options);
    if (paths.length === 0) { return false; }
    const file: fileIo.File = await fileIo.open(paths[0], fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
    try {
      // 重建脱敏副本，不修改本地历史关联。
      const shared = JSON.parse(JSON.stringify(report)) as RecordingReport;
      shared.title = '';
      shared.primaryUri = '';
      shared.secondaryUri = '';
      shared.primaryDump = '';
      shared.secondaryDump = '';
      await RecordingReportStore.writeAll(file.fd, json ? JSON.stringify(shared, null, 2) : report.text);
    } finally { await fileIo.close(file); }
    return true;
  }

  static unavailable(): string { return LocalizedText.get($r('app.string.rec_report_unavailable')); }
}
