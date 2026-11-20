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

// 非EBADF关闭错误保留File，禁止重试可能已复用的fd。
export class TranscodeFileCloser {
  private static retained: Map<number, fileIo.File> = new Map<number, fileIo.File>();

  private static pending: Map<number, Promise<boolean>> = new Map<number, Promise<boolean>>();

  static async close(file: fileIo.File | undefined): Promise<boolean> {
    if (file === undefined) { return true; }
    if (TranscodeFileCloser.retained.has(file.fd)) { return false; }
    const pending: Promise<boolean> | undefined = TranscodeFileCloser.pending.get(file.fd);
    if (pending !== undefined) { return await pending; }
    const closing: Promise<boolean> = TranscodeFileCloser.closeOnce(file);
    TranscodeFileCloser.pending.set(file.fd, closing);
    try { return await closing; } finally { TranscodeFileCloser.pending.delete(file.fd); }
  }

  private static async closeOnce(file: fileIo.File): Promise<boolean> {
    try {
      await fileIo.close(file);
      return true;
    } catch (error) {
      const failure: BusinessError = error as BusinessError;
      if (failure.code === 13900008) { return true; }
      TranscodeFileCloser.retained.set(file.fd, file);
      MediaFileActivity.blockUnconfirmedCleanup();
      Logger.error('TranscodeFiles', 'File close is unconfirmed, code=' + failure.code);
      return false;
    }
  }
}
