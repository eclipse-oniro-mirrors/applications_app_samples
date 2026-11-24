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

import { fileIo } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { MediaFileActivity } from '../model/MediaFileActivity';
import Logger from '../common/utils/Logger';

const BAD_FILE_DESCRIPTOR: number = 13900008;

// 非EBADF关闭错误保留File，禁止重试可能已复用的fd。
export class TranscodeFileCloser {
  private static retained: Map<number, fileIo.File> = new Map<number, fileIo.File>();

  private static pending: Map<number, Promise<boolean>> = new Map<number, Promise<boolean>>();

  private static closeResults: WeakMap<fileIo.File, Promise<boolean>> = new WeakMap<fileIo.File, Promise<boolean>>();

  // 同一个File复用关闭结果。关闭后系统可能已释放File的底层实体。
  static async close(file: fileIo.File | undefined): Promise<boolean> {
    if (file === undefined) {
      return true;
    }
    const previous: Promise<boolean> | undefined = TranscodeFileCloser.closeResults.get(file);
    if (previous !== undefined) {
      return await previous;
    }
    const fd: number = file.fd;
    if (TranscodeFileCloser.retained.has(fd)) {
      return false;
    }
    const pending: Promise<boolean> | undefined = TranscodeFileCloser.pending.get(fd);
    if (pending !== undefined) {
      TranscodeFileCloser.closeResults.set(file, pending);
      return await pending;
    }
    const closing: Promise<boolean> = TranscodeFileCloser.closeOnce(file, fd);
    TranscodeFileCloser.closeResults.set(file, closing);
    TranscodeFileCloser.pending.set(fd, closing);
    try {
      return await closing;
    } finally {
      TranscodeFileCloser.pending.delete(fd);
    }
  }

  private static async closeOnce(file: fileIo.File, fd: number): Promise<boolean> {
    try {
      await fileIo.close(file);
      return true;
    } catch (error) {
      const failure: BusinessError = error as BusinessError;
      if (failure.code === BAD_FILE_DESCRIPTOR) {
        return true;
      }
      TranscodeFileCloser.retained.set(fd, file);
      MediaFileActivity.blockUnconfirmedCleanup();
      Logger.error('TranscodeFiles', `File close is unconfirmed, code=${failure.code}`);
      return false;
    }
  }
}
