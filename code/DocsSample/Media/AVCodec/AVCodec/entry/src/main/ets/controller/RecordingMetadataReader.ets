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
import { RecordingOutputCheck, RecordingOutputExpectation, RecordingOutputMetadata,
  RecordingOutputValidation } from '../model/RecordingOutputValidation';

export class RecordingMetadataReader {
  static async read(uri: string, label: string): Promise<string> {
    if (uri.length === 0) { return ''; }
    try {
      const actual: RecordingOutputMetadata = await RecordingMetadataReader.inspect(uri);
      return label + ': ' + RecordingMetadataReader.values(actual);
    } catch (error) {
      return label + ': ' + LocalizedText.get($r('app.string.rec_result_metadata_unavailable')) +
        ' · ' + String(error);
    }
  }

  static async validate(uri: string, secondary: boolean, expected: RecordingOutputExpectation,
    closed: boolean): Promise<RecordingOutputCheck> {
    if (!closed) {
      return RecordingOutputValidation.compare(uri, secondary, expected, undefined, 'Output file close failed');
    }
    try {
      return RecordingOutputValidation.compare(uri, secondary, expected, await RecordingMetadataReader.inspect(uri));
    } catch (error) {
      return RecordingOutputValidation.compare(uri, secondary, expected, undefined,
        String(error) + ' · ' + JSON.stringify(error));
    }
  }

  static describe(checks: RecordingOutputCheck[]): string {
    return checks.map((check: RecordingOutputCheck): string => {
      const label: string = LocalizedText.get(check.secondary ? $r('app.string.recorder_secondary') :
        $r('app.string.recorder_primary'));
      const status: string = LocalizedText.get(check.status === 'matched' ? $r('app.string.rec_check_matched') :
        (check.status === 'different' ? $r('app.string.rec_check_different') : $r('app.string.rec_check_unavailable')));
      const expected = check.expected;
      return label + ': ' + status + '\n' + LocalizedText.get($r('app.string.rec_check_expected')) + ': ' +
        RecordingMetadataReader.values(expected) + '\n' + LocalizedText.get($r('app.string.rec_check_actual')) + ': ' +
        (check.actual === undefined ? '--' : RecordingMetadataReader.values(check.actual)) +
        (check.differences.length > 0 ? '\n' + check.differences.join(', ') : '') +
        (check.error.length > 0 ? '\n' + check.error : '');
    }).join('\n');
  }

  private static values(data: RecordingOutputMetadata): string {
    return data.width + ' x ' + data.height + ' · ' + data.durationMs.toFixed(0) + ' ms · ' +
      data.fileBytes + ' B · audio=' + (data.hasAudio === undefined ? '--' : data.hasAudio);
  }

  private static async inspect(uri: string): Promise<RecordingOutputMetadata> {
    let file: fileIo.File | undefined = undefined;
    let extractor: media.AVMetadataExtractor | undefined = undefined;
    try {
      if (!canIUse('SystemCapability.Multimedia.Media.AVMetadataExtractor')) {
        throw new Error('Metadata extractor unavailable');
      }
      // 使用独立fd，不与Native Muxer或播放器共享；只在文件关闭后读取成品。
      file = await fileIo.open(uri, fileIo.OpenMode.READ_ONLY);
      const stat: fileIo.Stat = await fileIo.stat(file.fd);
      extractor = await media.createAVMetadataExtractor();
      extractor.fdSrc = { fd: file.fd, offset: 0, length: stat.size };
      const metadata: media.AVMetadata | undefined = deviceInfo.sdkApiVersion >= 26 ?
        await extractor.fetchMetadataWithTimeout(3000) : await extractor.fetchMetadata();
      if (metadata === undefined) { throw new Error('Metadata unavailable'); }
      const audio: string = String(metadata.hasAudio ?? '').trim().toLowerCase();
      const singleVideoTrack: boolean = Number(metadata.trackCount) === 1 &&
        String(metadata.hasVideo ?? '').toLowerCase() === 'yes';
      return { width: RecordingMetadataReader.number(metadata.videoWidth),
        height: RecordingMetadataReader.number(metadata.videoHeight),
        durationMs: RecordingMetadataReader.number(metadata.duration), fileBytes: stat.size,
        hasAudio: ['yes', 'true', '1'].includes(audio) ? true :
          (['no', 'false', '0'].includes(audio) || (audio.length === 0 && singleVideoTrack) ? false : undefined) };
    } finally {
      if (extractor !== undefined) { try { await extractor.release(); } catch (_error) {} }
      if (file !== undefined) { try { await fileIo.close(file); } catch (_error) {} }
    }
  }

  private static number(text: string | undefined): number {
    const parsed: number = Number(text);
    return Number.isFinite(parsed) && parsed > 0 ? parsed : 0;
  }
}
