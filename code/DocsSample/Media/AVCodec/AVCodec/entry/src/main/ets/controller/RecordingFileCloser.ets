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

import { fileIo } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Logger from '../common/utils/Logger';

export class RecordingFileCloser {
  private static unconfirmed: Set<number> = new Set<number>();

  static async close(fd: number): Promise<boolean> {
    if (fd < 0) { return true; }
    if (RecordingFileCloser.unconfirmed.has(fd)) { return false; }
    try {
      await fileIo.close(fd);
      return true;
    } catch (error) {
      const failure = error as BusinessError;
      // EBADF确认描述符已无效；其他错误不能确认关闭结果，也不能盲目重试可能已复用的fd。
      if (failure.code === 13900008) { return true; }
      RecordingFileCloser.unconfirmed.add(fd);
      Logger.error('RecordingFiles', 'Output close is unconfirmed, code=' + failure.code +
        '; media tasks remain blocked until restart');
      return false;
    }
  }
}
