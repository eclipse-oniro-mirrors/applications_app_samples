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

import { UIContext } from '@kit.ArkUI';
import { fileIo, fileUri, picker } from '@kit.CoreFileKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import transcoder, { TranscodeRequest, TranscodeStatus } from 'libtranscoder.so';
import { LocalizedText } from '../common/LocalizedText';
import { getPlaybackTitle } from './PlaybackHistoryModel';

function idleTranscodeStatus(): TranscodeStatus {
  return { state: 0, stage: 'idle', detail: '', errorCode: 0, progress: 0,
    frames: 0, bytes: 0, outputWidth: 0, outputHeight: 0, audioCopied: false };
}

@Observed
export class TranscodeModel {
  sourceUri: string = '';
  sourceTitle: string = '';
  codecIndex: number = 0;
  modeIndex: number = 0;
  sizeIndex: number = 0;
  bitrateIndex: number = 2;
  grayscale: boolean = false;
  keepAudio: boolean = true;
  busy: boolean = false;
  picking: boolean = false;
  exporting: boolean = false;
  cancelRequested: boolean = false;
  resultPath: string = '';
  notice: string = '';
  status: TranscodeStatus = idleTranscodeStatus();
  private pollTimer: number = 0;
  private disposed: boolean = false;

  activate(): void {
    this.disposed = false;
  }

  setMode(index: number): void {
    if (this.busy || index < 0 || index > 1) { return; }
    this.modeIndex = index;
    if (index === 1) {
      this.sizeIndex = 0;
      this.grayscale = false;
    }
  }

  async chooseSource(ui: UIContext, fromGallery: boolean): Promise<void> {
    if (this.busy || this.picking || this.exporting) { return; }
    const context = ui.getHostContext();
    if (context === undefined) { return; }
    this.picking = true;
    try {
      let uri: string = '';
      if (fromGallery) {
        const selection: photoAccessHelper.PhotoSelectResult = await new photoAccessHelper.PhotoViewPicker().select({
          MIMEType: photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE, maxSelectNumber: 1
        });
        uri = selection.photoUris[0] ?? '';
      } else {
        const selection: string[] = await new picker.DocumentViewPicker(context).select({
          maxSelectNumber: 1, fileSuffixFilters: ['Video|.mp4,.mkv,.mov,.webm,.ts,.3gp']
        });
        uri = selection[0] ?? '';
      }
      if (uri.length > 0 && !this.disposed) {
        this.sourceUri = uri;
        this.sourceTitle = getPlaybackTitle(uri);
        this.notice = '';
      }
    } catch (error) {
      this.notice = LocalizedText.get($r('app.string.transcode_select_failed')) + ' ' + JSON.stringify(error);
    } finally {
      this.picking = false;
    }
  }

  async start(ui: UIContext): Promise<void> {
    if (this.busy || this.picking || this.exporting || this.sourceUri.length === 0) { return; }
    const context = ui.getHostContext();
    if (context === undefined) { return; }
    this.disposed = false;
    this.busy = true;
    this.cancelRequested = false;
    this.notice = '';
    this.resultPath = '';
    this.status = idleTranscodeStatus();
    const directory: string = context.filesDir + '/transcodes';
    const outputPath: string = directory + '/transcoded_' + Date.now() + '.mp4';
    const partialPath: string = outputPath + '.part';
    let input: fileIo.File | undefined = undefined;
    let output: fileIo.File | undefined = undefined;
    try {
      if (!await fileIo.access(directory)) { await fileIo.mkdir(directory); }
      input = await fileIo.open(this.sourceUri, fileIo.OpenMode.READ_ONLY);
      output = await fileIo.open(partialPath,
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
      if (this.disposed || this.cancelRequested) {
        this.notice = LocalizedText.get($r('app.string.transcode_cancelled'));
        return;
      }
      const request: TranscodeRequest = {
        inputFd: input.fd, outputFd: output.fd,
        mime: this.codecIndex === 0 ? 'video/avc' : 'video/hevc',
        bitrate: [2000000, 4000000, 8000000, 16000000][this.bitrateIndex] ?? 8000000,
        longEdge: [0, 1920, 1080, 720][this.sizeIndex] ?? 0,
        surface: this.modeIndex === 1, grayscale: this.grayscale, keepAudio: this.keepAudio
      };
      const completion: Promise<TranscodeStatus> = transcoder.start(request);
      this.pollTimer = setInterval((): void => {
        this.status = transcoder.getStatus();
      }, 250);
      this.status = await completion;
      if (this.status.state === 2) {
        await fileIo.rename(partialPath, outputPath);
        this.resultPath = outputPath;
        this.notice = LocalizedText.get($r('app.string.transcode_complete'));
      } else if (this.status.state === 3) {
        this.notice = LocalizedText.get($r('app.string.transcode_cancelled'));
      } else {
        this.notice = LocalizedText.get($r('app.string.transcode_failed')) + ' ' +
          this.status.detail + ' (' + this.status.errorCode + ')';
      }
    } catch (error) {
      this.notice = LocalizedText.get($r('app.string.transcode_failed')) + ' ' + JSON.stringify(error);
    } finally {
      this.clearPolling();
      if (input !== undefined) { await fileIo.close(input).catch((): void => {}); }
      if (output !== undefined) { await fileIo.close(output).catch((): void => {}); }
      if (this.resultPath.length === 0) { await fileIo.unlink(partialPath).catch((): void => {}); }
      this.busy = false;
    }
  }

  cancel(): void {
    if (!this.busy) { return; }
    this.cancelRequested = true;
    transcoder.cancel();
  }

  async save(ui: UIContext, toGallery: boolean): Promise<void> {
    if (this.busy || this.picking || this.exporting || this.resultPath.length === 0) { return; }
    const context = ui.getHostContext();
    if (context === undefined) { return; }
    this.exporting = true;
    let helper: photoAccessHelper.PhotoAccessHelper | undefined = undefined;
    let target: fileIo.File | undefined = undefined;
    try {
      let destinations: string[] = [];
      const fileTitle: string = 'transcoded_' + Date.now();
      if (toGallery) {
        helper = photoAccessHelper.getPhotoAccessHelper(context);
        const creation: photoAccessHelper.PhotoCreationConfig = {
          title: fileTitle, fileNameExtension: 'mp4', photoType: photoAccessHelper.PhotoType.VIDEO
        };
        destinations = await helper.showAssetsCreationDialog(
          [fileUri.getUriFromPath(this.resultPath)], [creation]);
      } else {
        destinations = await new picker.DocumentViewPicker(context).save({
          newFileNames: [fileTitle + '.mp4']
        });
      }
      if (destinations.length === 0) { return; }
      target = await fileIo.open(destinations[0], fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
      await fileIo.copyFile(this.resultPath, target.fd);
      this.notice = LocalizedText.get($r('app.string.transcode_saved'));
    } catch (error) {
      this.notice = LocalizedText.get($r('app.string.transcode_save_failed')) + ' ' + JSON.stringify(error);
    } finally {
      if (target !== undefined) { await fileIo.close(target).catch((): void => {}); }
      if (helper !== undefined) { await helper.release().catch((): void => {}); }
      this.exporting = false;
    }
  }

  dispose(): void {
    this.disposed = true;
    this.cancel();
    this.clearPolling();
  }

  private clearPolling(): void {
    if (this.pollTimer !== 0) {
      clearInterval(this.pollTimer);
      this.pollTimer = 0;
    }
  }
}
