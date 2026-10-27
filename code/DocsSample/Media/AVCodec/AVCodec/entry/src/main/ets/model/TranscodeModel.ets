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
import { fileIo, fileUri, picker, statfs } from '@kit.CoreFileKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import transcoder, { TranscodeRequest, TranscodeStatus } from 'libtranscoder.so';
import { LocalizedText } from '../common/LocalizedText';
import { getPlaybackTitle } from './PlaybackHistoryModel';
import player from 'libplayer.so';
import recorder from 'librecorder.so';
import { MediaFileActivity } from './MediaFileActivity';
import { TranscodeFilesModel, TranscodeHistoryEntry } from './TranscodeFilesModel';

function idleTranscodeStatus(): TranscodeStatus {
  return { state: 0, stage: 'idle', detail: '', errorCode: 0, progress: 0,
    frames: 0, bytes: 0, outputWidth: 0, outputHeight: 0, audioCopied: false, elapsedMs: 0, firstFrameMs: -1,
    fps: 0, speed: 0, remainingSeconds: -1, decoderWaitMs: 0, encoderInputWaitMs: 0, encoderOutputWaitMs: 0,
    copiedBytes: 0, fileBytes: 0, availableBytes: -1, estimatedBytes: -1, diagnostics: [],
    decoderName: '', encoderName: '', sourceWidth: 0, sourceHeight: 0, durationUs: 0, sourceFrameRate: 0,
    sourceMime: '', audioTracks: [], audioTrackIds: [], minBitrate: 0, maxBitrate: 0, audioBytes: 0, audioMode: 0 };
}

@Observed
export class TranscodeModel {
  public sourceUri: string = '';
  public sourceTitle: string = '';
  public codecIndex: number = 0;
  public modeIndex: number = 0;
  public sizeIndex: number = 0;
  public bitrateIndex: number = 2;
  public grayscale: boolean = false;
  public encoderCategory: number = 0;
  public audioMode: number = 0;
  public audioTrack: number = 0;
  public inspecting: boolean = false;
  public analysis: TranscodeStatus = idleTranscodeStatus();
  public analysisSizeEstimate: number = -1;
  public availableBytes: number = -1;
  public history: TranscodeHistoryEntry[] = [];
  private inspectionSequence: number = 0;
  private activeEntry: TranscodeHistoryEntry | undefined = undefined;
  private historySequence: number = 0;
  public busy: boolean = false;
  public picking: boolean = false;
  public exporting: boolean = false;
  public cancelRequested: boolean = false;
  public resultPath: string = '';
  public notice: string = '';
  public status: TranscodeStatus = idleTranscodeStatus();
  private pollTimer: number = 0;
  private disposed: boolean = false;

  activate(): void {
    this.disposed = false;
    this.inspecting = false;
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
        this.audioTrack = 0;
        await this.inspect(ui);
      }
    } catch (error) {
      this.notice = LocalizedText.get($r('app.string.transcode_select_failed')) + ' ' + JSON.stringify(error);
    } finally {
      this.picking = false;
    }
  }

  async start(ui: UIContext): Promise<void> {
    if (this.busy || this.picking || this.exporting || this.inspecting || this.sourceUri.length === 0) { return; }
    const context = ui.getHostContext();
    if (context === undefined) { return; }
    if (player.getState() !== player.PlayerState.IDLE || recorder.getDiagnostics().active ||
      !MediaFileActivity.beginTranscode()) {
      this.notice = LocalizedText.get($r('app.string.transcode_resource_busy'));
      return;
    }
    this.disposed = false;
    this.busy = true;
    this.cancelRequested = false;
    this.notice = '';
    this.resultPath = '';
    this.activeEntry = undefined;
    this.status = idleTranscodeStatus();
    const directory: string = context.filesDir + '/transcodes';
    const outputPath: string = directory + '/transcoded_' + Date.now() + '.mp4';
    const partialPath: string = outputPath + '.part';
    const id: string = outputPath.substring(outputPath.lastIndexOf('/') + 1, outputPath.length - 4);
    const title: string = this.sourceTitle;
    const configuration: string = this.configuration();
    let input: fileIo.File | undefined = undefined;
    let output: fileIo.File | undefined = undefined;
    try {
      if (!await fileIo.access(directory)) { await fileIo.mkdir(directory); }
      const directoryStat: fileIo.Stat = await fileIo.lstat(directory);
      if (!directoryStat.isDirectory() || directoryStat.isSymbolicLink()) { throw new Error('Unsafe output directory'); }
      input = await fileIo.open(this.sourceUri, fileIo.OpenMode.READ_ONLY);
      output = await fileIo.open(partialPath,
        fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC | fileIo.OpenMode.NOFOLLOW);
      if (this.disposed || this.cancelRequested) {
        this.status = idleTranscodeStatus();
        this.status.state = 3;
        this.status.stage = 'cancelled';
        this.notice = LocalizedText.get($r('app.string.transcode_cancelled'));
        return;
      }
      const request: TranscodeRequest = this.request(input.fd, output.fd);
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
      if (this.status.state < 2 || (this.status.state === 2 && this.resultPath.length === 0)) {
        this.status = idleTranscodeStatus();
        this.status.state = 4;
        this.status.stage = 'files';
        this.status.detail = JSON.stringify(error);
      }
      this.notice = LocalizedText.get($r('app.string.transcode_failed')) + ' ' + JSON.stringify(error);
    } finally {
      this.clearPolling();
      if (input !== undefined) { await fileIo.close(input).catch((): void => {}); }
      if (output !== undefined) { await fileIo.close(output).catch((): void => {}); }
      if (this.resultPath.length === 0) { await fileIo.unlink(partialPath).catch((): void => {}); }
      if (this.status.state >= 2) {
        const entry: TranscodeHistoryEntry = { id: id, createdAt: Date.now(), title: title,
          configuration: configuration, status: this.status, hasFile: this.resultPath.length > 0 };
        this.activeEntry = entry;
        try {
          await TranscodeFilesModel.persist(directory, entry);
          this.history = await TranscodeFilesModel.list(directory);
        } catch (_error) { this.notice += ' ' + LocalizedText.get($r('app.string.transcode_history_failed')); }
      }
      this.busy = false;
      MediaFileActivity.endTranscode();
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
      // Gallery/provider URIs do not necessarily expose destination free space. copyFile errors remain retryable.
      const bytes: number = (await fileIo.stat(this.resultPath)).size;
      const free: number = await statfs.getFreeSize(context.filesDir);
      if (free < bytes + 64 * 1024 * 1024) {
        throw new Error(LocalizedText.get($r('app.string.transcode_export_space')));
      }
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
    this.inspectionSequence++;
    this.historySequence++;
    this.cancel();
    this.clearPolling();
  }

  private clearPolling(): void {
    if (this.pollTimer !== 0) {
      clearInterval(this.pollTimer);
      this.pollTimer = 0;
    }
  }

  private request(inputFd: number, outputFd: number): TranscodeRequest {
    return { inputFd: inputFd, outputFd: outputFd, mime: this.codecIndex === 0 ? 'video/avc' : 'video/hevc',
      bitrate: [2000000, 4000000, 8000000, 16000000][this.bitrateIndex] ?? 8000000,
      longEdge: [0, 1920, 1080, 720][this.sizeIndex] ?? 0, useSurfaceInput: this.modeIndex === 1,
      grayscale: this.grayscale, encoderCategory: this.encoderCategory,
      audioMode: this.audioMode, audioTrack: this.audioTrack };
  }

  private configuration(): string {
    const mode: string = this.modeIndex === 0 ? 'Buffer' : LocalizedText.get($r('app.string.transcode_window_mode'));
    return (this.codecIndex === 0 ? 'H.264' : 'H.265') + ' · ' + mode +
      ' · ' + ([2, 4, 8, 16][this.bitrateIndex] ?? 8) + ' Mbps · gray=' + this.grayscale +
      ' · audio=' + ['copy', 'AAC-LC 128 kbps', 'none'][this.audioMode] + ' · track=' + this.audioTrack;
  }

  async inspect(ui: UIContext): Promise<void> {
    if (this.busy || this.exporting || this.sourceUri.length === 0) { return; }
    const sequence: number = ++this.inspectionSequence;
    const request: TranscodeRequest = this.request(0, 0);
    const uri: string = this.sourceUri;
    this.inspecting = true;
    this.analysis = idleTranscodeStatus();
    this.analysisSizeEstimate = -1;
    let file: fileIo.File | undefined = undefined;
    try {
      file = await fileIo.open(uri, fileIo.OpenMode.READ_ONLY);
      request.inputFd = file.fd;
      const inspection: Promise<TranscodeStatus> = transcoder.inspect(request);
      const result: TranscodeStatus = await inspection;
      const context = ui.getHostContext();
      const available: number = context === undefined ? -1 : await statfs.getFreeSize(context.filesDir);
      if (sequence === this.inspectionSequence && !this.disposed) {
        this.analysis = result;
        this.analysisSizeEstimate = result.durationUs > 0 ?
          result.durationUs / 1000000 * (request.bitrate + (request.audioMode === 2 ? 0 : 192000)) / 8 * 1.15 : -1;
        this.availableBytes = available;
      }
    } catch (error) {
      if (sequence === this.inspectionSequence) {
        this.analysis = idleTranscodeStatus();
        this.analysis.state = 4;
        this.analysis.detail = JSON.stringify(error);
        this.notice = JSON.stringify(error);
      }
    } finally {
      if (file !== undefined) {
        try {
          await fileIo.close(file);
        } catch (_error) {}
      }
      if (sequence === this.inspectionSequence) { this.inspecting = false; }
    }
  }

  async loadHistory(ui: UIContext): Promise<void> {
    const context = ui.getHostContext();
    if (context === undefined) { return; }
    const sequence: number = ++this.historySequence;
    try {
      const entries: TranscodeHistoryEntry[] = await TranscodeFilesModel.list(context.filesDir + '/transcodes');
      if (sequence === this.historySequence && !this.disposed) { this.history = entries; }
    } catch (_error) {}
  }

  async openHistory(ui: UIContext, entry: TranscodeHistoryEntry): Promise<void> {
    const context = ui.getHostContext();
    if (context === undefined || this.busy || this.exporting || this.picking || this.inspecting) { return; }
    if (!TranscodeFilesModel.validId(entry.id)) { return; }
    this.activeEntry = entry;
    this.status = entry.status;
    this.resultPath = entry.hasFile ? context.filesDir + '/transcodes/' + entry.id + '.mp4' : '';
    this.notice = entry.title;
  }

  async exportReport(ui: UIContext): Promise<void> {
    const context = ui.getHostContext();
    const entry: TranscodeHistoryEntry | undefined = this.activeEntry;
    if (context === undefined || entry === undefined || this.busy || this.exporting) { return; }
    this.exporting = true;
    try {
      await TranscodeFilesModel.export(context, entry);
    } catch (error) {
      this.notice = JSON.stringify(error);
    } finally {
      this.exporting = false;
    }
  }

  async clearHistory(ui: UIContext): Promise<void> {
    const context = ui.getHostContext();
    if (context === undefined || this.busy || this.exporting || this.picking) { return; }
    let confirmed: boolean = false;
    try {
      const confirm = await ui.getPromptAction().showDialog({
      title: LocalizedText.get($r('app.string.transcode_cleanup')),
      message: LocalizedText.get($r('app.string.transcode_cleanup_hint')),
      buttons: [{ text: LocalizedText.get($r('app.string.transcode_cancel')), color: '#667085' },
        { text: LocalizedText.get($r('app.string.transcode_cleanup')), color: '#C00000' }]
      });
      confirmed = confirm.index === 1;
    } catch (_error) { return; }
    if (!confirmed || this.busy || this.exporting || this.inspecting || this.picking ||
      player.getState() !== player.PlayerState.IDLE || recorder.getDiagnostics().active ||
      !MediaFileActivity.beginCleanup()) { return; }
    this.exporting = true;
    this.historySequence++;
    try {
      await TranscodeFilesModel.clear(context.filesDir + '/transcodes');
      this.history = [];
      this.resultPath = '';
      this.activeEntry = undefined;
      this.status = idleTranscodeStatus();
      this.notice = '';
    } catch (error) {
      this.notice = JSON.stringify(error);
    } finally {
      this.exporting = false;
      MediaFileActivity.endCleanup();
    }
  }
}
