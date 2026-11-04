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
import { image } from '@kit.ImageKit';
import transcoder, { TranscodeRequest, TranscodeStatus } from 'libtranscoder.so';

@Observed
export class TranscodePreviewController {
  public processed: image.PixelMap | undefined = undefined;
  public original: image.PixelMap | undefined = undefined;
  public showOriginal: boolean = false;
  public position: number = 0;
  public actualTimeMs: number = 0;
  public configuration: string = '';
  private sequence: number = 0;

  clear(): void {
    this.sequence++;
    const processed: image.PixelMap | undefined = this.processed;
    const original: image.PixelMap | undefined = this.original;
    this.processed = undefined;
    this.original = undefined;
    this.configuration = '';
    if (processed !== undefined) { void processed.release().catch((): void => {}); }
    if (original !== undefined) { void original.release().catch((): void => {}); }
  }

  async load(uri: string, request: TranscodeRequest, configuration: string): Promise<void> {
    this.clear();
    const sequence: number = this.sequence;
    let file: fileIo.File | undefined = undefined;
    let processed: image.PixelMap | undefined = undefined;
    let original: image.PixelMap | undefined = undefined;
    try {
      file = await fileIo.open(uri, fileIo.OpenMode.READ_ONLY);
      if (sequence !== this.sequence) { return; }
      request.inputFd = file.fd;
      request.audioMode = 2;
      // A Surface job uses a synchronous Buffer decoder only for the pixel preview.
      request.useSurfaceInput = false;
      request.gpuProcessing = false;
      const result: TranscodeStatus = await transcoder.preview(request);
      if (sequence !== this.sequence) { return; }
      if (result.state !== 2) { throw new Error(result.detail || 'Preview image unavailable'); }
      processed = await this.bitmap(result.previewRgba, result.previewWidth, result.previewHeight);
      original = await this.bitmap(result.originalRgba, result.originalWidth, result.originalHeight);
      if (sequence !== this.sequence) { return; }
      this.processed = processed;
      this.original = original;
      this.actualTimeMs = result.previewTimeMs ?? request.previewTimeMs ?? 0;
      this.configuration = configuration;
      processed = undefined;
      original = undefined;
    } finally {
      if (processed !== undefined) { await processed.release().catch((): void => {}); }
      if (original !== undefined) { await original.release().catch((): void => {}); }
      if (file !== undefined) { await fileIo.close(file).catch((): void => {}); }
    }
  }

  private async bitmap(bytes?: ArrayBuffer, width: number = 0, height: number = 0): Promise<image.PixelMap> {
    if (bytes === undefined || width <= 0 || height <= 0 || bytes.byteLength !== width * height * 4) {
      throw new Error('Invalid preview pixels');
    }
    return image.createPixelMap(bytes, {
      size: { width: width, height: height }, pixelFormat: image.PixelMapFormat.RGBA_8888, editable: false
    });
  }
}
