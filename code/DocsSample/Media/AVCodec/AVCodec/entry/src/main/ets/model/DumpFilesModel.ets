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

import { LocalizedText } from '../common/LocalizedText';
import { fileIo, picker, statfs } from '@kit.CoreFileKit';
import { zlib } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import player from 'libplayer.so';
import recorder from 'librecorder.so';
import { MediaFileActivity } from './MediaFileActivity';

export interface DumpFileEntry {
  name: string;
  path: string;
  bytes: number;
  modified: number;
}

export interface DumpSessionEntry {
  id: string;
  files: DumpFileEntry[];
  bytes: number;
  modified: number;
  status: string;
}

export class DumpFilesModel {
  private static readonly EXPORT_RESERVE_BYTES: number = 128 * 1024 * 1024;

  static async removeSession(directory: string, sessionId: string): Promise<number> {
    DumpFilesModel.requireIdle();
    if (!MediaFileActivity.beginCleanup()) {
      throw new Error(LocalizedText.get($r('app.string.dump_media_busy')));
    }
    try {
      // 不接受 UI 缓存中的任意路径。确认后重新从应用 filesDir 扫描并按会话匹配。
      const sessions = await DumpFilesModel.sessions(directory);
      const session = sessions.find((item: DumpSessionEntry): boolean => item.id === sessionId);
      if (session === undefined) {
        return 0;
      }
      let removed: number = 0;
      for (const entry of session.files) {
        DumpFilesModel.requireIdle();
        if (!DumpFilesModel.isDumpName(entry.name) || entry.path !== directory + '/' + entry.name) {
          throw new Error(LocalizedText.get($r('app.string.dump_cleanup_rejected')));
        }
        await fileIo.unlink(entry.path);
        removed++;
      }
      return removed;
    } finally {
      MediaFileActivity.endCleanup();
    }
  }

  private static isDumpName(name: string): boolean {
    return /^(VideoDecoderOut_[A-Za-z0-9_]+\.yuv|recording_[0-9]+_(primary|secondary)\.h26[45])(\.(layout|session|pts)\.txt)?$/.test(name) &&
      !name.includes('..') && !name.endsWith('.pending');
  }

  static async list(directory: string): Promise<DumpFileEntry[]> {
    const entries: DumpFileEntry[] = [];
    const names: string[] = await fileIo.listFile(directory);
    for (const name of names) {
      if (!DumpFilesModel.isDumpName(name)) {
        continue;
      }
      if (name.endsWith('.pending')) {
        continue;
      }
      const path: string = directory + '/' + name;
      try {
        const stat: fileIo.Stat = await fileIo.lstat(path);
        if (stat.isFile() && !stat.isSymbolicLink()) {
          entries.push({ name: name, path: path, bytes: stat.size, modified: stat.mtime });
        }
      } catch (_error) {
        // 状态文件在扫描期间可能被原子替换，单个文件不可读不影响其余会话。
      }
    }
    return entries.sort((left: DumpFileEntry, right: DumpFileEntry): number => right.modified - left.modified);
  }

  static sessionKey(name: string): string {
    const recording: RegExpMatchArray | null = name.match(/^recording_[0-9]+/);
    if (recording !== null) {
      return recording[0];
    }
    return name.replace(/\.(layout|session|pts)\.txt$/, '');
  }

  static async sessions(directory: string): Promise<DumpSessionEntry[]> {
    const files: DumpFileEntry[] = await DumpFilesModel.list(directory);
    const groups = new Map<string, DumpSessionEntry>();
    for (const entry of files) {
      const key: string = DumpFilesModel.sessionKey(entry.name);
      let session: DumpSessionEntry | undefined = groups.get(key);
      if (session === undefined) {
        session = { id: key, files: [], bytes: 0, modified: 0, status: LocalizedText.get($r('app.string.dump_legacy_status')) };
        groups.set(key, session);
      }
      session.files.push(entry);
      session.bytes += entry.bytes;
      session.modified = Math.max(session.modified, entry.modified);
      if (entry.name.endsWith('.session.txt')) {
        try {
          const metadata: string = await fileIo.readText(entry.path, { length: 8192 });
          const state: string = metadata.split('\n')[0].replace('state=', '').trim();
          const label: string = DumpFilesModel.stateLabel(state);
          session.status = session.status === LocalizedText.get($r('app.string.dump_legacy_status')) ? label : session.status + ' / ' + label;
        } catch (_error) {
          session.status = LocalizedText.get($r('app.string.dump_status_read_failed'));
        }
      }
    }
    const result: DumpSessionEntry[] = [];
    groups.forEach((session: DumpSessionEntry): void => { result.push(session); });
    return result.sort((left: DumpSessionEntry, right: DumpSessionEntry): number => right.modified - left.modified);
  }

  static stateLabel(state: string): string {
    switch (state) {
      case 'writing': return LocalizedText.get($r('app.string.dump_status_writing'));
      case 'completed': return LocalizedText.get($r('app.string.dump_status_completed'));
      case 'limit_reached': return LocalizedText.get($r('app.string.dump_status_limit'));
      case 'size_limit': return LocalizedText.get($r('app.string.dump_status_size_limit'));
      case 'duration_limit': return LocalizedText.get($r('app.string.dump_status_duration_limit'));
      case 'low_space': return LocalizedText.get($r('app.string.dump_status_low_space'));
      case 'space_query_failed': return LocalizedText.get($r('app.string.dump_status_space_query_failed'));
      case 'write_failed': return LocalizedText.get($r('app.string.dump_status_write_failed'));
      case 'open_failed': return LocalizedText.get($r('app.string.dump_status_open_failed'));
      case 'layout_changed': return LocalizedText.get($r('app.string.dump_status_layout_changed'));
      case 'invalid_buffer': return LocalizedText.get($r('app.string.dump_status_invalid_buffer'));
      default: return LocalizedText.get($r('app.string.dump_status_unknown'));
    }
  }

  static async freeBytes(directory: string): Promise<number> {
    return statfs.getFreeSize(directory);
  }

  static async exportSession(context: common.Context, session: DumpSessionEntry): Promise<boolean> {
    DumpFilesModel.requireIdle();
    const options = new picker.DocumentSaveOptions();
    options.newFileNames = [session.id + '.zip'];
    options.fileSuffixChoices = ['.zip'];
    const destinations: string[] = await new picker.DocumentViewPicker(context).save(options);
    if (destinations.length === 0) {
      return false;
    }
    // 文件选择器会让出执行权；返回后重新检查状态和文件大小，不沿用打开页面时的快照。
    DumpFilesModel.requireIdle();
    let bytes: number = 0;
    for (const entry of session.files) {
      bytes += (await fileIo.stat(entry.path)).size;
    }
    // ZIP 不再复制一份源数据目录；无压缩打包，避免大体积裸帧占满 ArkTS 堆或长时间压缩。
    const available: number = await DumpFilesModel.freeBytes(context.cacheDir);
    if (available < bytes + DumpFilesModel.EXPORT_RESERVE_BYTES) {
      throw new Error(LocalizedText.get($r('app.string.dump_archive_space')));
    }
    const archive: string = context.cacheDir + '/dump_export_' + Date.now() + '.zip';
    try {
      await zlib.compressFiles(session.files.map((entry: DumpFileEntry): string => entry.path), archive,
        { level: zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION });
      DumpFilesModel.requireIdle();
      await DumpFilesModel.copyToDestination(archive, destinations[0]);
      return true;
    } finally {
      try {
        await fileIo.unlink(archive);
      } catch (_error) {
        // 打包未产生文件时无需清理；不删除用户原始 Dump。
      }
    }
  }

  static async exportFile(context: common.Context, entry: DumpFileEntry): Promise<boolean> {
    DumpFilesModel.requireIdle();
    const options = new picker.DocumentSaveOptions();
    options.newFileNames = [entry.name];
    const destinations: string[] = await new picker.DocumentViewPicker(context).save(options);
    if (destinations.length === 0) {
      return false;
    }
    DumpFilesModel.requireIdle();
    await DumpFilesModel.copyToDestination(entry.path, destinations[0]);
    return true;
  }

  private static requireIdle(): void {
    if (player.getState() !== player.PlayerState.IDLE || recorder.getDiagnostics().active) {
      throw new Error(LocalizedText.get($r('app.string.dump_wait_operation')));
    }
  }

  private static async copyToDestination(path: string, destination: string): Promise<void> {
    let source: fileIo.File | undefined = undefined;
    let target: fileIo.File | undefined = undefined;
    try {
      source = await fileIo.open(path, fileIo.OpenMode.READ_ONLY);
      target = await fileIo.open(destination, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
      // 原生异步复制不把整份 4K 裸帧数据读入 ArkTS 堆；也不占用解码输出线程。
      await fileIo.copyFile(source.fd, target.fd);
    } finally {
      try {
        if (target !== undefined) {
          await fileIo.close(target);
        }
      } finally {
        if (source !== undefined) {
          await fileIo.close(source);
        }
      }
    }
  }
}
