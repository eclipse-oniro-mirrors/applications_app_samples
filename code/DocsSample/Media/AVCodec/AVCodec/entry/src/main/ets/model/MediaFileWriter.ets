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
import { util } from '@kit.ArkTS';

export class MediaFileWriter {
  static async writeAll(fd: number, value: string): Promise<void> {
    const bytes: Uint8Array = new util.TextEncoder().encodeInto(value);
    const buffer: ArrayBuffer = bytes.buffer.slice(bytes.byteOffset,
      bytes.byteOffset + bytes.byteLength) as ArrayBuffer;
    let offset: number = 0;
    while (offset < bytes.byteLength) {
      const written: number = await fileIo.write(fd, buffer.slice(offset));
      if (written <= 0) { throw new Error('File write made no progress'); }
      offset += written;
    }
  }
}
