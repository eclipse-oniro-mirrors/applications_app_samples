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
import { media } from '@kit.MediaKit';
import { deviceInfo } from '@kit.BasicServicesKit';
import { LocalizedText } from '../common/LocalizedText';

export class RecordingMetadataReader {
  static async read(uri: string, label: string): Promise<string> {
    if (uri.length === 0) { return ''; }
    let file: fileIo.File | undefined = undefined;
    let extractor: media.AVMetadataExtractor | undefined = undefined;
    try {
      if (!canIUse('SystemCapability.Multimedia.Media.AVMetadataExtractor')) {
        throw new Error('Metadata extractor unavailable');
      }
      // 使用独立 fd，不与 Native Muxer 或播放器共享；只在文件关闭后读取成品。
      file = await fileIo.open(uri, fileIo.OpenMode.READ_ONLY);
      const stat: fileIo.Stat = await fileIo.stat(file.fd);
      extractor = await media.createAVMetadataExtractor();
      extractor.fdSrc = { fd: file.fd, offset: 0, length: stat.size };
      const metadata: media.AVMetadata | undefined = deviceInfo.sdkApiVersion >= 26 ?
        await extractor.fetchMetadataWithTimeout(3000) : await extractor.fetchMetadata();
      if (metadata === undefined) { throw new Error('Metadata unavailable'); }
      return label + ': ' + (metadata.videoWidth ?? '--') + ' x ' + (metadata.videoHeight ?? '--') +
        ' · ' + (metadata.duration ?? '--') + ' ms · ' + (stat.size / 1048576).toFixed(2) + ' MiB · ' +
        (metadata.mimeType ?? '--') + ' · tracks=' + (metadata.trackCount ?? '--') +
        ' · audio=' + (metadata.hasAudio ?? '--') + ' / ' + (metadata.sampleRate ?? '--') + ' Hz';
    } catch (_error) {
      return label + ': ' + LocalizedText.get($r('app.string.rec_result_metadata_unavailable'));
    } finally {
      if (extractor !== undefined) { try { await extractor.release(); } catch (_error) {} }
      if (file !== undefined) { try { await fileIo.close(file); } catch (_error) {} }
    }
  }
}
