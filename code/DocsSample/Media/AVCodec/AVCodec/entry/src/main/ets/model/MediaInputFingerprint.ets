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
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import { MediaInputIdentity, MediaReports } from './MediaSessionReport';
import { MediaFileActivity } from './MediaFileActivity';
import { PlaybackUriAccessController } from '../controller/PlaybackUriAccessController';

export class MediaInputFingerprint {
  static async calculate(context: common.Context, input: MediaInputIdentity): Promise<MediaInputIdentity> {
    if (!input.sourceUri) { throw new Error('Source URI unavailable'); }
    if (!MediaFileActivity.beginCleanup()) { throw new Error('Media task is busy'); }
    let file: fileIo.File | undefined = undefined;
    try {
      await PlaybackUriAccessController.prepare(input.sourceUri, context);
      file = await fileIo.open(input.sourceUri, fileIo.OpenMode.READ_ONLY);
      MediaInputFingerprint.check(input, await fileIo.stat(file.fd));
      const md: cryptoFramework.Md = cryptoFramework.createMd('SHA256');
      const buffer: ArrayBuffer = new ArrayBuffer(1024 * 1024);
      let total: number = 0;
      while (total < input.bytes) {
        const length: number = Math.min(buffer.byteLength, input.bytes - total);
        const count: number = await fileIo.read(file.fd, buffer, { length: length });
        if (count <= 0 || count > Math.min(buffer.byteLength, input.bytes - total)) {
          throw new Error('Source read did not complete');
        }
        await md.update({ data: new Uint8Array(buffer, 0, count) });
        total += count;
      }
      MediaInputFingerprint.check(input, await fileIo.stat(file.fd));
      const digest: cryptoFramework.DataBlob = await md.digest();
      const hex: string = Array.from(digest.data)
        .map((byte: number): string => byte.toString(16).padStart(2, '0')).join('');
      const result: MediaInputIdentity = {
        bytes: input.bytes,
        modifiedAt: input.modifiedAt,
        sha256: hex,
        sourceUri: input.sourceUri
      };
      if (!MediaReports.validInput(result)) { throw new Error('Invalid source checksum'); }
      return result;
    } finally {
      try { if (file !== undefined) { await fileIo.close(file); } } finally { MediaFileActivity.endCleanup(); }
    }
  }

  private static check(input: MediaInputIdentity, stat: fileIo.Stat): void {
    if (stat.size !== input.bytes || stat.mtime !== input.modifiedAt) { throw new Error('Source file changed'); }
  }
}
