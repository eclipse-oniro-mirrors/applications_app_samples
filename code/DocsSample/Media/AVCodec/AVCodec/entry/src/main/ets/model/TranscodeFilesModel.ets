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
import { fileIo, picker } from '@kit.CoreFileKit';
import { media } from '@kit.MediaKit';
import { TranscodeStatus, TranscodeMeasurement } from 'libtranscoder.so';
import { LocalizedText } from '../common/LocalizedText';
import { TranscodeFileCloser } from '../controller/TranscodeFileCloser';
import { MediaFileActivity } from './MediaFileActivity';
import { MediaFileWriter } from './MediaFileWriter';
import { idleTranscodeStatus } from './TranscodeStatusModel';

const reportTimestamp: Date = new Date(0);
const MAX_HISTORY_BYTES: number = 262144;
const RECOVERY_METADATA_TIMEOUT_MS: number = 3000;

export interface TranscodeHistoryEntry {
  id: string;
  createdAt: number;
  title: string;
  configuration: string;
  status: TranscodeStatus;
  hasFile: boolean;
  recovered?: boolean;
}

export interface TranscodeHistoryCleanup {
  closePending: boolean;
}

export interface TranscodeStorageSummary {
  bytes: number;
  fileCount: number;
  orphanCount: number;
}

export interface TranscodeHistoryPage {
  entries: TranscodeHistoryEntry[];
  nextOffset: number;
  hasMore: boolean;
}

export class TranscodeFilesModel {
  public static readonly HISTORY_PAGE_SIZE: number = 100;

  static validId(id: string): boolean { return /^transcoded_[0-9]+$/.test(id); }

  static report(entry: TranscodeHistoryEntry): string {
    const status: TranscodeStatus = entry.status;
    reportTimestamp.setTime(entry.createdAt);
    const lines: string[] = ['AVCodec Transcode · ' + entry.id, reportTimestamp.toISOString(),
      entry.configuration, 'state=' + status.state + ' stage=' + status.stage + ' error=' + status.errorCode,
      status.stage === 'files' ? 'Local file operation failed (private path omitted).' : status.detail,
      'decoder=' + status.decoderName, 'encoder=' + status.encoderName,
      status.sourceMime + ' ' + status.sourceWidth + 'x' + status.sourceHeight +
      ' -> ' + status.outputWidth + 'x' + status.outputHeight,
      'elapsed=' + status.elapsedMs.toFixed(1) + 'ms firstFrame=' + status.firstFrameMs.toFixed(1) +
      'ms fps=' + status.fps.toFixed(2) + ' speed=' + status.speed.toFixed(2) + 'x',
      'frames=' + status.frames + ' dropped=' + (status.droppedFrames ?? 0) +
      ' videoBytes=' + status.bytes + ' audioBytes=' + status.audioBytes +
      ' fileBytes=' + status.fileBytes + ' copiedBytes=' + status.copiedBytes,
      'outputValidation=' + (status.outputValidation || 'not recorded') +
      ' sampleValidation=' + (status.sampleValidation || 'not recorded') +
      ' outputDurationUs=' + (status.outputDurationUs ?? 0) + ' expectedDurationUs=' + (status.expectedDurationUs ?? 0),
      'waitMs: decoder=' + status.decoderWaitMs.toFixed(1) + ' encoderInput=' +
      status.encoderInputWaitMs.toFixed(1) + ' encoderOutput=' + status.encoderOutputWaitMs.toFixed(1),
      'API wall time; not hardware execution latency. P95 covers the most recent 256 calls.'];
    (status.validationNotes ?? []).forEach((note: string): void => { lines.push('validation: ' + note); });
    status.diagnostics.forEach((metric: TranscodeMeasurement): void => {
      lines.push(metric.name + ': calls=' + metric.calls + ' avg=' + metric.averageMs.toFixed(3) +
        'ms p95=' + metric.p95Ms.toFixed(3) + 'ms max=' + metric.maxMs.toFixed(3) + 'ms');
    });
    return lines.join(String.fromCharCode(10));
  }

  // 报告关闭确认后再发布。写入或同步失败时保留原异常。
  static async persist(directory: string, entry: TranscodeHistoryEntry,
    cleanup?: TranscodeHistoryCleanup): Promise<void> {
    if (!TranscodeFilesModel.validId(entry.id)) {
      throw new Error('Invalid transcode id');
    }
    const path: string = `${directory}/${entry.id}.json`;
    const pending: string = `${path}.pending`;
    const file: fileIo.File = await fileIo.open(pending, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY |
      fileIo.OpenMode.TRUNC | fileIo.OpenMode.NOFOLLOW);
    let closed: boolean = true;
    try {
      await MediaFileWriter.writeAll(file.fd, JSON.stringify(entry));
      await fileIo.fsync(file.fd);
    } finally {
      closed = await TranscodeFileCloser.close(file);
      if (cleanup !== undefined) {
        cleanup.closePending = !closed;
      }
    }
    if (!closed) {
      throw new Error('Transcode history file close unconfirmed');
    }
    await fileIo.rename(pending, path);
  }

  static async list(directory: string): Promise<TranscodeHistoryEntry[]> {
    return (await TranscodeFilesModel.listPage(directory, 0, TranscodeFilesModel.HISTORY_PAGE_SIZE)).entries;
  }

  static async listPage(directory: string, offset: number, pageSize: number): Promise<TranscodeHistoryPage> {
    if (!Number.isInteger(offset) || offset < 0 || !Number.isInteger(pageSize) || pageSize < 1) {
      throw new Error('Invalid history page');
    }
    if (!await fileIo.access(directory)) { return { entries: [], nextOffset: 0, hasMore: false }; }
    const directoryStat: fileIo.Stat = await fileIo.lstat(directory);
    if (!directoryStat.isDirectory() || directoryStat.isSymbolicLink()) { throw new Error('Unsafe history directory'); }
    const names: string[] = await fileIo.listFile(directory);
    const reports: Set<string> = new Set<string>();
    const mediaIds: Set<string> = new Set<string>();
    for (const name of names) {
      if (/^transcoded_[0-9]+[.]json$/.test(name)) { reports.add(name.slice(0, -'.json'.length)); }
      if (/^transcoded_[0-9]+[.]mp4$/.test(name)) { mediaIds.add(name.slice(0, -'.mp4'.length)); }
    }
    const ids: string[] = Array.from(new Set<string>(Array.from(reports).concat(Array.from(mediaIds))))
      .sort((a: string, b: string): number => Number(b.split('_')[1]) - Number(a.split('_')[1]));
    const entries: TranscodeHistoryEntry[] = [];
    const end: number = Math.min(ids.length, offset + Math.min(pageSize, TranscodeFilesModel.HISTORY_PAGE_SIZE));
    for (const id of ids.slice(offset, end)) {
      const report: TranscodeHistoryEntry | undefined =
        reports.has(id) ? await TranscodeFilesModel.readHistory(directory, id) : undefined;
      const output: fileIo.Stat | undefined =
        mediaIds.has(id) ? await TranscodeFilesModel.statOutput(directory, id) : undefined;
      if (report !== undefined) {
        report.hasFile = output !== undefined && report.status.state === 2;
        entries.push(report);
      } else if (output !== undefined) {
        entries.push(TranscodeFilesModel.recoveredEntry(id, output.size));
      }
    }
    return { entries: entries, nextOffset: end, hasMore: end < ids.length };
  }

  private static async readHistory(directory: string, id: string): Promise<TranscodeHistoryEntry | undefined> {
    try {
      const path: string = directory + '/' + id + '.json';
      const stat: fileIo.Stat = await fileIo.lstat(path);
      if (!stat.isFile() || stat.isSymbolicLink() || stat.size > MAX_HISTORY_BYTES) { return undefined; }
      const entry: TranscodeHistoryEntry = JSON.parse(await fileIo.readText(path)) as TranscodeHistoryEntry;
      if (entry.id !== id || !Number.isFinite(entry.createdAt) || typeof entry.title !== 'string' ||
        typeof entry.configuration !== 'string' || entry.status === null || !Array.isArray(entry.status.diagnostics) ||
        !Number.isInteger(entry.status.state) || entry.status.state < 2 || entry.status.state > 4) {
        return undefined;
      }
      TranscodeFilesModel.report(entry);
      entry.recovered = false;
      return entry;
    } catch (_error) { return undefined; }
  }

  private static async statOutput(directory: string, id: string): Promise<fileIo.Stat | undefined> {
    try {
      const stat: fileIo.Stat = await fileIo.lstat(directory + '/' + id + '.mp4');
      return stat.isFile() && !stat.isSymbolicLink() && stat.size > 0 ? stat : undefined;
    } catch (_error) { return undefined; }
  }

  private static recoveredEntry(id: string, bytes: number): TranscodeHistoryEntry {
    const status: TranscodeStatus = idleTranscodeStatus();
    status.fileBytes = bytes;
    return {
      id: id,
      createdAt: Number(id.substring('transcoded_'.length)),
      title: id + '.mp4',
      configuration: '',
      status: status,
      hasFile: false,
      recovered: true
    };
  }

  static async verifyRecoveredOutput(directory: string, id: string): Promise<boolean> {
    if (!TranscodeFilesModel.validId(id) || MediaFileActivity.isCleanupUnconfirmed()) { return false; }
    const directoryStat: fileIo.Stat = await fileIo.lstat(directory);
    if (!directoryStat.isDirectory() || directoryStat.isSymbolicLink()) { return false; }
    const candidate: fileIo.Stat | undefined = await TranscodeFilesModel.statOutput(directory, id);
    if (candidate === undefined) { return false; }
    const path: string = directory + '/' + id + '.mp4';
    const file: fileIo.File = await fileIo.open(path, fileIo.OpenMode.READ_ONLY | fileIo.OpenMode.NOFOLLOW);
    let extractor: media.AVMetadataExtractor | undefined = undefined;
    let verified: boolean = false;
    let closed: boolean = true;
    try {
      const stat: fileIo.Stat = await fileIo.stat(file.fd);
      if (stat.isFile() && stat.size > 0) {
        extractor = await media.createAVMetadataExtractor();
        extractor.fdSrc = { fd: file.fd, offset: 0, length: stat.size };
        const metadata: media.AVMetadata | undefined =
          await extractor.fetchMetadataWithTimeout(RECOVERY_METADATA_TIMEOUT_MS);
        if (metadata !== undefined) {
          const width: number = Number(metadata.videoWidth);
          const height: number = Number(metadata.videoHeight);
          verified = Number.isFinite(width) && width > 0 && Number.isFinite(height) && height > 0;
        }
      }
    } finally {
      try {
        if (extractor !== undefined) { await extractor.release(); }
      } catch (_error) { verified = false; }
      closed = await TranscodeFileCloser.close(file);
    }
    return verified && closed;
  }

  static async clear(directory: string): Promise<void> {
    if (!await fileIo.access(directory)) { return; }
    const directoryStat: fileIo.Stat = await fileIo.lstat(directory);
    if (!directoryStat.isDirectory() || directoryStat.isSymbolicLink()) { throw new Error('Unsafe cleanup directory'); }
    for (const name of await fileIo.listFile(directory)) {
      if (!/^transcoded_[0-9]+[.](mp4([.]part)?|json([.]pending)?)$/.test(name)) { continue; }
      const path: string = directory + '/' + name;
      const stat: fileIo.Stat = await fileIo.lstat(path);
      if (stat.isFile() && !stat.isSymbolicLink()) { await fileIo.unlink(path); }
    }
  }

  static async storageUsage(directory: string): Promise<TranscodeStorageSummary> {
    const summary: TranscodeStorageSummary = { bytes: 0, fileCount: 0, orphanCount: 0 };
    if (!await fileIo.access(directory)) { return summary; }
    const directoryStat: fileIo.Stat = await fileIo.lstat(directory);
    if (!directoryStat.isDirectory() || directoryStat.isSymbolicLink()) { throw new Error('Unsafe output directory'); }
    for (const name of await fileIo.listFile(directory)) {
      if (!/^transcoded_[0-9]+[.](mp4([.]part)?|json([.]pending)?)$/.test(name)) { continue; }
      const stat: fileIo.Stat = await fileIo.lstat(directory + '/' + name);
      if (!stat.isFile() || stat.isSymbolicLink()) { continue; }
      summary.bytes += stat.size;
      summary.fileCount++;
      if (name.endsWith('.part') || name.endsWith('.json.pending')) { summary.orphanCount++; }
    }
    return summary;
  }

  static async deleteEntry(directory: string, id: string): Promise<void> {
    if (!TranscodeFilesModel.validId(id)) { throw new Error('Invalid transcode id'); }
    if (!await fileIo.access(directory)) { return; }
    const directoryStat: fileIo.Stat = await fileIo.lstat(directory);
    if (!directoryStat.isDirectory() || directoryStat.isSymbolicLink()) { throw new Error('Unsafe output directory'); }
    const paths: string[] = [];
    for (const suffix of ['.mp4', '.json', '.mp4.part', '.json.pending']) {
      const path: string = directory + '/' + id + suffix;
      if (!await fileIo.access(path)) { continue; }
      const stat: fileIo.Stat = await fileIo.lstat(path);
      if (stat.isSymbolicLink() || !stat.isFile()) { throw new Error('Unsafe transcode file'); }
      paths.push(path);
    }
    for (const path of paths) { await fileIo.unlink(path); }
  }

  static async cleanupOrphans(directory: string): Promise<void> {
    if (!await fileIo.access(directory)) { return; }
    const directoryStat: fileIo.Stat = await fileIo.lstat(directory);
    if (!directoryStat.isDirectory() || directoryStat.isSymbolicLink()) { throw new Error('Unsafe cleanup directory'); }
    for (const name of await fileIo.listFile(directory)) {
      if (!/^transcoded_[0-9]+[.](mp4[.]part|json[.]pending)$/.test(name)) { continue; }
      const path: string = directory + '/' + name;
      const stat: fileIo.Stat = await fileIo.lstat(path);
      if (stat.isFile() && !stat.isSymbolicLink()) { await fileIo.unlink(path); }
    }
  }

  static async export(context: common.Context, entry: TranscodeHistoryEntry): Promise<boolean> {
    if (MediaFileActivity.isCleanupUnconfirmed()) {
      throw new Error(LocalizedText.get($r('app.string.transcode_close_unconfirmed')));
    }
    const paths: string[] = await new picker.DocumentViewPicker(context).save({ newFileNames: [entry.id + '.txt'] });
    if (paths.length === 0) { return false; }
    const target: fileIo.File = await fileIo.open(paths[0], fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
    let closed: boolean = true;
    try {
      await MediaFileWriter.writeAll(target.fd, TranscodeFilesModel.report(entry));
    } finally {
      closed = await TranscodeFileCloser.close(target);
    }
    if (!closed) {
      throw new Error(LocalizedText.get($r('app.string.transcode_close_unconfirmed')));
    }
    return true;
  }
}
