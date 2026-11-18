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
import { fileIo } from '@kit.CoreFileKit';
import { MediaFileActivity } from './MediaFileActivity';

export interface MediaPartialFile { name: string; bytes: number; }

export class MediaRecoveryFiles {
  static async list(context: common.Context): Promise<MediaPartialFile[]> {
    try {
      const directory: string = context.filesDir + '/transcodes';
      if (!await fileIo.access(directory)) { return []; }
      const stat: fileIo.Stat = await fileIo.lstat(directory);
      if (!stat.isDirectory() || stat.isSymbolicLink()) { throw new Error('Unsafe recovery directory'); }
      const result: MediaPartialFile[] = [];
      for (const name of await fileIo.listFile(directory)) {
        if (!/^transcoded_[0-9]+[.]mp4[.]part$/.test(name)) { continue; }
        const entry: fileIo.Stat = await fileIo.lstat(directory + '/' + name);
        if (entry.isFile() && !entry.isSymbolicLink()) { result.push({ name: name, bytes: entry.size }); }
      }
      return result;
    } catch (error) {
      throw new Error('List partial files: ' + (error as Error).message + ' / ' + JSON.stringify(error));
    }
  }

  static async clear(context: common.Context): Promise<void> {
    if (!MediaFileActivity.beginCleanup()) { throw new Error('A media task still owns its output files'); }
    try {
      for (const entry of await MediaRecoveryFiles.list(context)) {
        const path: string = context.filesDir + '/transcodes/' + entry.name;
        const stat: fileIo.Stat = await fileIo.lstat(path);
        if (stat.isFile() && !stat.isSymbolicLink()) { await fileIo.unlink(path); }
      }
    } catch (error) {
      throw new Error('Clear partial files: ' + (error as Error).message + ' / ' + JSON.stringify(error));
    } finally { MediaFileActivity.endCleanup(); }
  }
}
