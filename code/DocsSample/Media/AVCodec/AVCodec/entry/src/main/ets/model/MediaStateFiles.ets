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
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';
import { MediaFileWriter } from './MediaFileWriter';

export class MediaStateFiles {
  private static writes: Promise<void> = Promise.resolve();

  static async read(context: common.Context, name: string, fallback: string): Promise<string> {
    try {
      await MediaStateFiles.writes;
      const path: string = MediaStateFiles.path(context, name);
      if (!await fileIo.access(path)) { return fallback; }
      const stat: fileIo.Stat = await fileIo.lstat(path);
      if (!stat.isFile() || stat.isSymbolicLink() || stat.size > 8 * 1024 * 1024) {
        throw new Error('Invalid media state file');
      }
      return await fileIo.readText(path, { length: 8 * 1024 * 1024 });
    } catch (error) {
      throw new Error('Read media state ' + name + ': ' + (error as Error).message + ' / ' + JSON.stringify(error));
    }
  }

  static write(context: common.Context, name: string, snapshot: string): Promise<void> {
    const task: Promise<void> = MediaStateFiles.writes.then(async (): Promise<void> => {
      if (snapshot.length > 2 * 1024 * 1024) { throw new Error('Media state snapshot too large'); }
      const directory: string = context.filesDir + '/media_state';
      try {
        await fileIo.mkdir(directory, true);
      } catch (error) {
        const fileError: BusinessError = error as BusinessError;
        if (fileError.code !== 13900015) { throw error as Error; }
      }
      const stat: fileIo.Stat = await fileIo.lstat(directory);
      if (!stat.isDirectory() || stat.isSymbolicLink()) { throw new Error('Invalid media state directory'); }
      const path: string = MediaStateFiles.path(context, name);
      const file: fileIo.File = await fileIo.open(path + '.pending', fileIo.OpenMode.CREATE |
        fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC | fileIo.OpenMode.NOFOLLOW);
      try {
        await MediaFileWriter.writeAll(file.fd, snapshot);
        await fileIo.fsync(file.fd);
      } finally {
        await fileIo.close(file);
      }
      await fileIo.rename(path + '.pending', path);
    });
    MediaStateFiles.writes = task.catch((): void => {});
    return task;
  }

  private static path(context: common.Context, name: string): string {
    if (!/^[a-z_]+[.]json$/.test(name)) { throw new Error('Invalid media state name'); }
    return context.filesDir + '/media_state/' + name;
  }
}
