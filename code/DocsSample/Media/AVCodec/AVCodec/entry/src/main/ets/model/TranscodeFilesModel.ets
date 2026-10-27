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
import { TranscodeStatus, TranscodeMeasurement } from 'libtranscoder.so';
import { RecordingReportStore } from './RecordingReportStore';

const reportTimestamp: Date = new Date(0);

export interface TranscodeHistoryEntry {
  id: string;
  createdAt: number;
  title: string;
  configuration: string;
  status: TranscodeStatus;
  hasFile: boolean;
}

export class TranscodeFilesModel {
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
      'frames=' + status.frames + ' videoBytes=' + status.bytes + ' audioBytes=' + status.audioBytes +
      ' fileBytes=' + status.fileBytes + ' copiedBytes=' + status.copiedBytes,
      'waitMs: decoder=' + status.decoderWaitMs.toFixed(1) + ' encoderInput=' +
      status.encoderInputWaitMs.toFixed(1) + ' encoderOutput=' + status.encoderOutputWaitMs.toFixed(1),
      'API wall time; not hardware execution latency. P95 covers the most recent 256 calls.'];
    status.diagnostics.forEach((metric: TranscodeMeasurement): void => {
      lines.push(metric.name + ': calls=' + metric.calls + ' avg=' + metric.averageMs.toFixed(3) +
        'ms p95=' + metric.p95Ms.toFixed(3) + 'ms max=' + metric.maxMs.toFixed(3) + 'ms');
    });
    return lines.join(String.fromCharCode(10));
  }

  static async persist(directory: string, entry: TranscodeHistoryEntry): Promise<void> {
    if (!TranscodeFilesModel.validId(entry.id)) { throw new Error('Invalid transcode id'); }
    const pending: string = directory + '/' + entry.id + '.json.pending';
    const file: fileIo.File = await fileIo.open(pending, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY |
      fileIo.OpenMode.TRUNC | fileIo.OpenMode.NOFOLLOW);
    try {
      await RecordingReportStore.writeAll(file.fd, JSON.stringify(entry));
      await fileIo.fsync(file.fd);
    } finally { await fileIo.close(file); }
    await fileIo.rename(pending, directory + '/' + entry.id + '.json');
  }

  static async list(directory: string): Promise<TranscodeHistoryEntry[]> {
    if (!await fileIo.access(directory)) { return []; }
    const directoryStat: fileIo.Stat = await fileIo.lstat(directory);
    if (!directoryStat.isDirectory() || directoryStat.isSymbolicLink()) { throw new Error('Unsafe history directory'); }
    const names: string[] = (await fileIo.listFile(directory))
      .filter((name: string): boolean => /^transcoded_[0-9]+[.]json$/.test(name))
      .sort((a: string, b: string): number => Number(b.split('_')[1].split('.')[0]) -
        Number(a.split('_')[1].split('.')[0]));
    const entries: TranscodeHistoryEntry[] = [];
    for (const name of names.slice(0, 100)) {
      try {
        const path: string = directory + '/' + name;
        const stat: fileIo.Stat = await fileIo.lstat(path);
        if (!stat.isFile() || stat.isSymbolicLink() || stat.size > 262144) { continue; }
        const entry: TranscodeHistoryEntry = JSON.parse(await fileIo.readText(path)) as TranscodeHistoryEntry;
        if (!TranscodeFilesModel.validId(entry.id) || entry.id + '.json' !== name ||
          !Number.isFinite(entry.createdAt) || typeof entry.title !== 'string' ||
          typeof entry.configuration !== 'string' || entry.status === null ||
          !Array.isArray(entry.status.diagnostics) || !Number.isInteger(entry.status.state) ||
          entry.status.state < 2 || entry.status.state > 4) { continue; }
        TranscodeFilesModel.report(entry);
        const media: string = directory + '/' + entry.id + '.mp4';
        entry.hasFile = false;
        if (await fileIo.access(media)) {
          const mediaStat: fileIo.Stat = await fileIo.lstat(media);
          entry.hasFile = entry.status.state === 2 && mediaStat.isFile() && !mediaStat.isSymbolicLink();
        }
        entries.push(entry);
      } catch (_error) {}
    }
    return entries;
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

  static async export(context: common.Context, entry: TranscodeHistoryEntry): Promise<boolean> {
    const paths: string[] = await new picker.DocumentViewPicker(context).save({ newFileNames: [entry.id + '.txt'] });
    if (paths.length === 0) { return false; }
    const target: fileIo.File = await fileIo.open(paths[0], fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
    try {
      await RecordingReportStore.writeAll(target.fd, TranscodeFilesModel.report(entry));
    } finally {
      await fileIo.close(target);
    }
    return true;
  }
}
