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

import { common } from '@kit.AbilityKit';
import { UIContext } from '@kit.ArkUI';
import { fileIo, statfs } from '@kit.CoreFileKit';
import { image } from '@kit.ImageKit';
import player from 'libplayer.so';
import recorder from 'librecorder.so';
import transcoder, { TranscodeRequest, TranscodeStatus } from 'libtranscoder.so';
import { LocalizedText } from '../common/LocalizedText';
import { TranscodeExecutionController } from '../controller/TranscodeExecutionController';
import { TranscodeExportController } from '../controller/TranscodeExportController';
import { TranscodeFileCloser } from '../controller/TranscodeFileCloser';
import { TranscodeHistoryController } from '../controller/TranscodeHistoryController';
import { TranscodePreviewController } from '../controller/TranscodePreviewController';
import { TranscodeQueueRunner, TranscodeQueueHost, TranscodeQueueResult } from '../controller/TranscodeQueueRunner';
import { getPlaybackTitle } from './PlaybackHistoryModel';
import { MediaFileActivity } from './MediaFileActivity';
import { TranscodeFilesModel, TranscodeHistoryEntry }
  from './TranscodeFilesModel';
import { MediaTaskCoordinator, MediaTaskLease } from './MediaTaskCoordinator';
import { TranscodeQueueStore, TranscodeQueueSnapshot } from './TranscodeQueueStore';
import { TranscodeQueueModel, TranscodeQueueItem, TranscodeQueueSettings } from './TranscodeQueueModel';
import { TranscodeSourcePicker } from './TranscodeSourcePicker';
import { TranscodeAudioMode, TranscodeQualityModel } from './TranscodeQualityModel';
import { TranscodeTaskSnapshot } from './TranscodeTaskSnapshot';
import { idleTranscodeStatus } from './TranscodeStatusModel';
import type { TranscodeExecutionResult } from '../controller/TranscodeExecutionContext';

@Observed
export class TranscodeModel {
  public quality: TranscodeQualityModel = new TranscodeQualityModel();
  public previewState: TranscodePreviewController = new TranscodePreviewController();
  get previewImage(): image.PixelMap | undefined { return this.previewState.processed; }
  public previewing: boolean = false;
  public previewConfiguration: string = '';
  public queue: TranscodeQueueModel = new TranscodeQueueModel();
  public queueRunning: boolean = false;
  public exports: TranscodeExportController = new TranscodeExportController();
  private queueRunner: TranscodeQueueRunner = new TranscodeQueueRunner();
  public sourceUri: string = '';
  public sourceTitle: string = '';
  public codecIndex: number = 0;
  public modeIndex: number = 0;
  public sizeIndex: number = 0;
  public bitrateIndex: number = 2;
  public grayscale: boolean = false;
  public resizeMode: number = 0;
  public encoderCategory: number = 0;
  public audioMode: number = 0;
  public audioTrack: number = 0;
  public rangeEnabled: boolean = false;
  public rangeStart: string = '0';
  public rangeEnd: string = '';
  public inspecting: boolean = false;
  public analysis: TranscodeStatus = idleTranscodeStatus();
  public analysisSizeEstimate: number = -1;
  public availableBytes: number = -1;
  public historyState: TranscodeHistoryController = new TranscodeHistoryController();
  get history(): TranscodeHistoryEntry[] { return this.historyState.entries; }
  get historyHasMore(): boolean { return this.historyState.hasMore; }
  get historyLoading(): boolean { return this.historyState.loading; }
  get storageBytes(): number { return this.historyState.storageBytes; }
  get orphanFileCount(): number { return this.historyState.orphanCount; }
  private inspectionSequence: number = 0;
  private activeEntry: TranscodeHistoryEntry | undefined = undefined;
  public busy: boolean = false;
  public picking: boolean = false;
  public exporting: boolean = false;
  public cancelRequested: boolean = false;
  public resultPath: string = '';
  public resultSourceUri: string = '';
  public notice: string = '';
  public status: TranscodeStatus = idleTranscodeStatus();
  private execution: TranscodeExecutionController = new TranscodeExecutionController();
  private disposed: boolean = false;
  private queueRestoreRevision: number = 0;
  private pageRevision: number = 0;

  activate(): void {
    this.pageRevision++;
    this.queueRestoreRevision++;
    this.disposed = false;
    this.inspecting = false;
    this.historyState.activate();
  }

  setRangeStart(value: string): void { this.rangeStart = value; this.clearPreview(); this.updateSizeEstimate(); }
  setRangeEnd(value: string): void { this.rangeEnd = value; this.clearPreview(); this.updateSizeEstimate(); }

  setRangeEnabled(enabled: boolean): void {
    this.rangeEnabled = enabled && this.modeIndex !== 1;
    this.clearPreview();
    this.updateSizeEstimate();
  }

  isRangeValid(): boolean { return this.validRange(this.analysis.durationUs); }

  private updateSizeEstimate(request?: TranscodeRequest): void {
    if (request === undefined && !this.isRangeValid()) { this.analysisSizeEstimate = -1; return; }
    this.estimateRequest(request ?? this.request(0, 0));
  }

  private estimateRequest(request: TranscodeRequest): void {
    const snapshot: TranscodeTaskSnapshot = new TranscodeTaskSnapshot('', request);
    if (!snapshot.validRange(this.analysis.durationUs) || this.analysis.durationUs <= 0) {
      this.analysisSizeEstimate = -1;
      return;
    }
    const durationUs: number = (request.startTimeMs ?? 0) !== 0 || (request.endTimeMs ?? 0) !== 0 ?
      (request.endTimeMs || this.analysis.durationUs / 1000) * 1000 - (request.startTimeMs ?? 0) * 1000 :
      this.analysis.durationUs;
    this.analysisSizeEstimate = durationUs / 1000000 *
      (request.bitrate + (request.audioMode === 2 ? 0 : request.audioMode === 1 ?
        (request.audioBitrate ?? 128000) : 192000)) / 8 * 1.15;
    if (request.remuxOnly) { this.analysisSizeEstimate = -1; }
  }

  private rangeMilliseconds(value: string, allowEmpty: boolean): number {
    const text: string = value.trim();
    if (text.length === 0) { return allowEmpty ? 0 : -1; }
    if (!/^\d+(?:\.\d{1,3})?$/.test(text)) { return -1; }
    const milliseconds: number = Math.round(Number(text) * 1000);
    return Number.isSafeInteger(milliseconds) && milliseconds <= 2147483647 ? milliseconds : -1;
  }

  private validRange(durationUs: number = 0): boolean {
    if (!this.rangeEnabled) { return true; }
    if (this.modeIndex === 1) { return false; }
    const start: number = this.rangeMilliseconds(this.rangeStart, false);
    const end: number = this.rangeMilliseconds(this.rangeEnd, true);
    const durationMs: number = durationUs / 1000;
    if (start < 0 || end < 0 || (this.rangeEnd.trim().length > 0 && end <= start)) { return false; }
    if (durationUs <= 0) { return true; }
    const selectedEnd: number = end === 0 && this.rangeEnd.trim().length === 0 ? durationMs : end;
    return start >= 0 && end >= 0 && selectedEnd > start && selectedEnd <= durationMs;
  }

  async reassociateQueueItem(id: string, ui: UIContext): Promise<void> {
    if (this.busy || this.queueRunning || this.picking || this.exporting || this.inspecting || this.disposed ||
      id === this.queue.activeId) { return; }
    this.picking = true;
    try {
      const uri: string = await TranscodeSourcePicker.select(ui, false);
      if (uri.length > 0 && !this.disposed && id !== this.queue.activeId) {
        this.queue.reassociate(id, uri, getPlaybackTitle(uri));
        await this.persistQueue(ui);
      }
    } catch (error) {
      this.notice = LocalizedText.get($r('app.string.transcode_select_failed')) + ' ' + JSON.stringify(error);
    } finally { this.picking = false; }
  }

  setMode(index: number): void {
    if (this.busy || this.queueRunning || index < 0 || index > 2) { return; }
    this.modeIndex = index;
    if (index === 2 && this.quality.filter === 2) { this.quality.filter = 1; }
    if (index === 1) {
      this.rangeEnabled = false;
      this.sizeIndex = 0;
      this.grayscale = false;
      this.resizeMode = 0;
      this.quality.filter = 0;
    }
    this.clearPreview();
  }

  setOperation(index: number): void {
    if (this.busy || this.queueRunning) { return; }
    this.quality.operation = index;
    if (index !== 1) { this.quality.remuxAllAudioTracks = false; }
    if (index === 1) {
      this.modeIndex = 0; this.sizeIndex = 0; this.grayscale = false; this.resizeMode = 0;
      this.rangeEnabled = false; this.quality.filter = 0; this.quality.frameRate = 0;
      this.quality.deepValidation = false;
      if (this.audioMode === 1) { this.audioMode = 0; }
    }
    this.clearPreview();
  }

  clearPreview(): void {
    this.previewState.clear();
    this.previewConfiguration = '';
  }

  previewTimeMs(): number {
    const request: TranscodeRequest = this.request(0, 0);
    const start: number = request.startTimeMs ?? 0;
    const end: number = request.endTimeMs || this.analysis.durationUs / 1000;
    const frameRate: number = Number.isFinite(this.analysis.sourceFrameRate) && this.analysis.sourceFrameRate > 0 ?
      this.analysis.sourceFrameRate : 30;
    const lastFrame: number = Math.max(start, end - Math.max(1, 1000 / frameRate));
    return Math.floor(start + (lastFrame - start) * this.previewState.position / 100);
  }

  async preview(ui: UIContext): Promise<void> {
    if (this.busy || this.queueRunning || this.inspecting || this.picking || this.exporting || this.disposed ||
      this.sourceUri.length === 0 || this.modeIndex === 1 || this.quality.operation !== 0) { return; }
    if (!this.validRange(this.analysis.durationUs)) {
      this.notice = LocalizedText.get($r('app.string.transcode_range_invalid')); return;
    }
    if (player.getState() !== player.PlayerState.IDLE || recorder.getDiagnostics().active ||
      !MediaFileActivity.beginTranscode()) {
      this.notice = LocalizedText.get($r('app.string.transcode_resource_busy')); return;
    }
    this.busy = true; this.previewing = true; this.cancelRequested = false;
    this.clearPreview();
    try {
      const request: TranscodeRequest = this.request(0, 0);
      request.previewTimeMs = this.previewTimeMs();
      const configuration: string = this.configuration();
      await this.previewState.load(this.sourceUri, request, configuration);
      this.previewConfiguration = configuration;
    } catch (error) {
      if (MediaFileActivity.isCleanupUnconfirmed()) { this.markClosePending(); } else {
        this.notice = JSON.stringify(error);
      }
    } finally {
      MediaFileActivity.endTranscode(); this.previewing = false; this.busy = false;
    }
  }

  async chooseSource(ui: UIContext, fromGallery: boolean): Promise<void> {
    if (this.busy || this.queueRunning || this.picking || this.exporting) { return; }
    const context = ui.getHostContext();
    if (context === undefined) { return; }
    this.picking = true;
    try {
      const uri: string = await TranscodeSourcePicker.select(ui, fromGallery);
      if (uri.length > 0 && !this.disposed) {
        this.clearPreview();
        this.sourceUri = uri;
        this.sourceTitle = getPlaybackTitle(uri);
        this.notice = '';
        this.audioTrack = 0;
        this.quality.audioSourceLayout = 0;
        this.rangeEnabled = false;
        this.rangeStart = '0';
        this.rangeEnd = '';
        await this.inspect(ui);
      }
    } catch (error) {
      this.notice = LocalizedText.get($r('app.string.transcode_select_failed')) + ' ' + JSON.stringify(error);
    } finally {
      this.picking = false;
    }
  }

  async start(ui: UIContext): Promise<void> {
    if (this.queueRunning || this.disposed) { return; }
    await this.execute(ui);
  }

  private async execute(ui: UIContext): Promise<TranscodeExecutionResult | undefined> {
    if (this.busy || this.picking || this.exporting || this.inspecting || this.disposed ||
      this.sourceUri.length === 0) {
      return undefined;
    }
    if (!this.validRange()) {
      this.notice = LocalizedText.get($r('app.string.transcode_range_invalid'));
      return undefined;
    }
    const context: common.Context | undefined = ui.getHostContext();
    if (context === undefined) {
      return undefined;
    }
    const pageRevision: number = this.pageRevision;
    const request: TranscodeRequest = this.request(0, 0);
    const snapshot: TranscodeTaskSnapshot = new TranscodeTaskSnapshot(this.configuration(), request);
    this.queueRestoreRevision++;
    this.busy = true;
    this.cancelRequested = false;
    try {
      const pending: Promise<TranscodeExecutionResult | undefined> =
        this.execution.run(context, this.sourceUri, this.sourceTitle, snapshot,
          (status: TranscodeStatus): void => {
            if (pageRevision === this.pageRevision) {
              this.analysis = status;
              this.updateSizeEstimate(request);
            }
          }, (status: TranscodeStatus): void => {
            if (pageRevision === this.pageRevision) {
              this.showExecutionProgress(status);
            }
          });
      if (this.execution.isActive()) {
        this.resetExecutionDisplay();
      }
      const result: TranscodeExecutionResult | undefined = await pending;
      if (result === undefined) {
        if (pageRevision === this.pageRevision) {
          this.notice = LocalizedText.get($r('app.string.transcode_resource_busy'));
        }
        return undefined;
      }
      if (result.closePending) {
        this.queue.paused = true;
      }
      await this.applyExecutionResult(result, pageRevision);
      return result;
    } finally {
      this.busy = false;
    }
  }

  private resetExecutionDisplay(): void {
    this.notice = '';
    this.resultPath = '';
    this.resultSourceUri = '';
    this.activeEntry = undefined;
    this.status = idleTranscodeStatus();
  }

  private showExecutionProgress(status: TranscodeStatus): void {
    this.status = status;
    if (this.queue.activeId.length > 0) {
      this.queue.update(this.queue.activeId, 'running', status.progress);
    }
  }

  private async applyExecutionResult(result: TranscodeExecutionResult, pageRevision: number): Promise<void> {
    if (pageRevision !== this.pageRevision) {
      return;
    }
    this.status = result.status;
    this.resultPath = result.path;
    this.resultSourceUri = result.path.length > 0 ? result.sourceUri : '';
    this.activeEntry = result.entry;
    this.notice = result.notice;
    try {
      await this.refreshHistory(result.directory);
    } catch (_error) {
      if (pageRevision === this.pageRevision) {
        this.notice += ` ${LocalizedText.get($r('app.string.transcode_history_failed'))}`;
      }
    }
  }

  private markClosePending(): void {
    this.status.state = 4;
    this.status.cleanupStage = 'files.close';
    this.status.cleanupCode = -1;
    this.status.detail = LocalizedText.get($r('app.string.transcode_close_unconfirmed'));
    this.notice = this.status.detail;
    this.queue.paused = true;
  }

  cancel(): void {
    if (!this.busy) { return; }
    this.cancelRequested = true;
    this.queue.paused = true;
    if (this.previewing) {
      this.clearPreview();
      const lease: MediaTaskLease | undefined = MediaTaskCoordinator.current();
      if (lease?.kind === 'transcode') { MediaTaskCoordinator.cancelling(lease); }
      transcoder.cancel();
    } else {
      this.execution.cancel();
    }
  }

  async save(ui: UIContext, toGallery: boolean): Promise<void> {
    if (this.busy || this.queueRunning || this.picking || this.exporting || this.resultPath.length === 0) { return; }
    await this.savePaths(ui, [this.resultPath], toGallery);
  }

  async exportCompleted(ui: UIContext, toGallery: boolean): Promise<void> {
    if (this.busy || this.queueRunning || this.picking || this.exporting || this.inspecting) { return; }
    const context = ui.getHostContext();
    if (context === undefined) { return; }
    const directory: string = context.filesDir + '/transcodes/';
    const paths: string[] = this.queue.items.filter((item: TranscodeQueueItem): boolean =>
      item.state === 'completed' && item.resultPath.startsWith(directory) &&
      TranscodeFilesModel.validId(item.resultPath.substring(directory.length).replace(/\.mp4$/, '')))
      .map((item: TranscodeQueueItem): string => item.resultPath);
    await this.savePaths(ui, paths, toGallery);
  }

  private async savePaths(ui: UIContext, paths: string[], toGallery: boolean): Promise<void> {
    const context = ui.getHostContext();
    if (context === undefined) { return; }
    this.exporting = true;
    try {
      await this.exports.save(context, paths, toGallery);
      this.notice = LocalizedText.get($r('app.string.transcode_export_summary'));
    } catch (error) {
      this.notice = LocalizedText.get($r('app.string.transcode_save_failed')) + ' ' + JSON.stringify(error);
    } finally {
      this.exporting = false;
    }
  }

  dispose(): void {
    this.pageRevision++;
    this.queueRestoreRevision++;
    this.disposed = true;
    this.queue.paused = true;
    this.inspectionSequence++;
    this.historyState.dispose();
    this.cancel();
    this.execution.stopPolling();
    this.clearPreview();
  }

  private request(inputFd: number, outputFd: number): TranscodeRequest {
    return {
      inputFd: inputFd,
      outputFd: outputFd,
      mime: this.codecIndex === 0 ? 'video/avc' : 'video/hevc',
      bitrate: [2000000, 4000000, 8000000, 16000000][this.bitrateIndex] ?? 8000000,
      longEdge: [0, 1920, 1080, 720][this.sizeIndex] ?? 0,
      useSurfaceInput: this.modeIndex !== 0,
      gpuProcessing: this.modeIndex === 2,
      grayscale: this.grayscale,
      encoderCategory: this.encoderCategory,
      resizeMode: this.resizeMode,
      audioMode: this.audioMode,
      audioTrack: this.audioTrack,
      deepValidation: this.quality.operation === 0 && this.quality.deepValidation,
      remuxAllAudioTracks: this.quality.remuxAllAudioTracks,
      remuxOnly: this.quality.operation === 1,
      codecMode: this.quality.codecMode,
      scalingFilter: this.quality.filter,
      frameRateLimit: [0, 24, 30, 60, 120][this.quality.frameRate] ?? 0,
      bitrateMode: this.quality.bitrateMode,
      keyFrameIntervalMs: [1000, 2000, 3000, 5000][this.quality.keyFrame] ?? 2000,
      audioSampleRate: [0, 44100, 48000][this.quality.audioRate] ?? 0,
      audioChannels: this.quality.audioChannels,
      audioSourceLayout: this.quality.audioSourceLayout,
      audioResampler: this.quality.audioResampler,
      audioBitrate: [64000, 128000, 192000][this.quality.audioBitrate] ?? 128000,
      startTimeMs: this.rangeEnabled ? Math.round(Number(this.rangeStart) * 1000) : 0,
      endTimeMs: this.rangeEnabled && this.rangeEnd.trim().length > 0 ?
        Math.round(Number(this.rangeEnd) * 1000) : 0
    };
  }

  private configuration(): string {
    const mode: string = this.modeIndex === 0 ? 'Buffer' : this.modeIndex === 2 ? 'OpenGL' :
      LocalizedText.get($r('app.string.transcode_window_mode'));
    if (this.quality.operation === 1) {
      return `MP4 remux · audio=${this.audioMode === TranscodeAudioMode.NONE ? 'none' : 'copy'}` +
        ` · track=${this.audioTrack} · allAudio=${this.quality.remuxAllAudioTracks}`;
    }
    return (this.codecIndex === 0 ? 'H.264' : 'H.265') + ' · ' + mode +
      ' · codecMode=' + (this.quality.codecMode === 1 ? 'async' : 'sync') +
      ' · ' + ([2, 4, 8, 16][this.bitrateIndex] ?? 8) + ' Mbps · gray=' + this.grayscale +
      ' · edge=' + [0, 1920, 1080, 720][this.sizeIndex] + ' · resize=' + this.resizeMode +
      ' · audio=' + ['copy', 'AAC-LC', 'none'][this.audioMode] + ' · track=' + this.audioTrack +
      ' · deepValidation=' + this.quality.deepValidation + ' · allRemuxAudio=' + this.quality.remuxAllAudioTracks +
      ' · filter=' + ['nearest', 'bilinear', 'area'][this.quality.filter] +
      ' · fpsLimit=' + [0, 24, 30, 60, 120][this.quality.frameRate] +
      ' · rateControl=' + ['VBR', 'CBR'][this.quality.bitrateMode] +
      ' · keyFrameMs=' + [1000, 2000, 3000, 5000][this.quality.keyFrame] +
      ' · audioRate=' + [0, 44100, 48000][this.quality.audioRate] +
      ' · audioChannels=' + this.quality.audioChannels +
      ' · audioSourceLayout=' + ['unspecified', '5.1-side', '5.1-back'][this.quality.audioSourceLayout] +
      ' · resampler=' + ['linear', 'low-pass'][this.quality.audioResampler] +
      ' · audioBitrate=' + [64000, 128000, 192000][this.quality.audioBitrate] +
      (this.rangeEnabled ? ' · range=' + this.rangeStart + '..' + (this.rangeEnd || 'end') + ' s' : '');
  }

  async inspect(ui: UIContext): Promise<void> {
    if (this.busy || this.queueRunning || this.exporting || this.sourceUri.length === 0) { return; }
    if (!MediaFileActivity.beginLaunch()) {
      this.notice = LocalizedText.get($r('app.string.transcode_resource_busy'));
      return;
    }
    const sequence: number = ++this.inspectionSequence;
    this.clearPreview();
    const uri: string = this.sourceUri;
    this.inspecting = true;
    this.analysis = idleTranscodeStatus();
    this.analysisSizeEstimate = -1;
    const request: TranscodeRequest = this.request(0, 0);
    request.startTimeMs = 0;
    request.endTimeMs = 0;
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
        this.updateSizeEstimate();
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
        if (!await TranscodeFileCloser.close(file)) { this.markClosePending(); }
      }
      MediaFileActivity.endLaunch();
      if (sequence === this.inspectionSequence) { this.inspecting = false; }
    }
  }

  async loadHistory(ui: UIContext): Promise<void> {
    const context = ui.getHostContext();
    if (context === undefined) { return; }
    try {
      await this.historyState.load(context.filesDir + '/transcodes');
    } catch (error) {
      this.notice = JSON.stringify(error);
    }
  }

  async loadMoreHistory(ui: UIContext): Promise<void> {
    const context = ui.getHostContext();
    if (context === undefined || this.busy || this.queueRunning || this.exporting || this.picking ||
      this.inspecting) { return; }
    try {
      await this.historyState.load(context.filesDir + '/transcodes', true);
    } catch (error) {
      this.notice = JSON.stringify(error);
    }
  }

  private async refreshHistory(directory: string): Promise<void> { await this.historyState.refresh(directory); }

  private queueSettings(): TranscodeQueueSettings {
    return {
      codecIndex: this.codecIndex,
      modeIndex: this.modeIndex,
      sizeIndex: this.sizeIndex,
      bitrateIndex: this.bitrateIndex,
      encoderCategory: this.encoderCategory,
      audioMode: this.audioMode,
      audioTrack: this.audioTrack,
      resizeMode: this.resizeMode
    };
  }

  async enqueue(ui: UIContext): Promise<void> {
    if (this.busy || this.queueRunning || this.sourceUri.length === 0 || this.inspecting ||
      this.analysis.state !== 2) { return; }
    if (!this.validRange(this.analysis.durationUs)) {
      this.notice = LocalizedText.get($r('app.string.transcode_range_invalid')); return;
    }
    const request: TranscodeRequest = this.request(0, 0);
    this.queue.add(this.sourceUri, this.sourceTitle, this.queueSettings(), this.grayscale,
      request.startTimeMs ?? 0, request.endTimeMs ?? 0, this.quality.snapshot());
    await this.persistQueue(ui);
  }

  async enqueueMany(ui: UIContext, gallery: boolean): Promise<void> {
    if (this.busy || this.queueRunning || this.picking || this.exporting || this.inspecting || this.disposed ||
      !this.validRange()) { return; }
    this.picking = true;
    try {
      const uris: string[] = await TranscodeSourcePicker.selectMany(ui, gallery, 30 - this.queue.items.length);
      if (this.disposed) { return; }
      const request: TranscodeRequest = this.request(0, 0);
      uris.forEach((uri: string): void => {
        this.queue.add(uri, getPlaybackTitle(uri), this.queueSettings(), this.grayscale,
          request.startTimeMs ?? 0, request.endTimeMs ?? 0, this.quality.snapshot());
      });
      await this.persistQueue(ui);
    } catch (error) { this.notice = JSON.stringify(error); } finally { this.picking = false; }
  }

  async persistQueue(ui: UIContext): Promise<boolean> {
    const context = ui.getHostContext();
    if (context === undefined) { return false; }
    this.queueRestoreRevision++;
    try {
      await TranscodeQueueStore.save(context, this.queue);
      return true;
    } catch (error) { this.notice = JSON.stringify(error); return false; }
  }

  async restoreQueue(ui: UIContext): Promise<void> {
    const context = ui.getHostContext();
    if (context === undefined || this.queue.items.length > 0 || this.queueRunning || this.disposed) { return; }
    const revision: number = ++this.queueRestoreRevision;
    const initial: string = JSON.stringify(this.queue);
    try {
      const snapshot: TranscodeQueueSnapshot = await TranscodeQueueStore.restore(context);
      if (revision !== this.queueRestoreRevision || this.disposed || this.queueRunning ||
        this.busy || initial !== JSON.stringify(this.queue)) { return; }
      this.queue.items = snapshot.items;
      this.queue.stopOnFailure = snapshot.stopOnFailure;
      this.queue.items.forEach((item: TranscodeQueueItem): void => {
        if (item.state === 'running') { this.queue.update(item.id, 'interrupted', 0); }
      });
      this.queue.paused = true;
    } catch (error) {
      if (revision === this.queueRestoreRevision && !this.disposed && initial === JSON.stringify(this.queue)) {
        this.notice = JSON.stringify(error);
      }
    }
  }

  async runQueue(ui: UIContext): Promise<void> {
    if (this.queueRunning || this.busy || this.picking || this.exporting || this.inspecting || this.disposed) {
      return;
    }
    this.queueRestoreRevision++;
    this.queueRunning = true;
    try {
      const host: TranscodeQueueHost = {
        available: (): boolean => !MediaTaskCoordinator.busy() &&
          player.getState() === player.PlayerState.IDLE && !recorder.getDiagnostics().active,
        disposed: (): boolean => this.disposed,
        execute: (item: TranscodeQueueItem): Promise<TranscodeQueueResult | undefined> =>
          this.executeQueueItem(ui, item),
        persist: (): Promise<boolean> => this.persistQueue(ui)
      };
      await this.queueRunner.run(this.queue, host);
    } finally { this.queue.activeId = ''; this.queueRunning = false; }
  }

  private async executeQueueItem(ui: UIContext, item: TranscodeQueueItem): Promise<TranscodeQueueResult | undefined> {
    this.sourceUri = item.uri; this.sourceTitle = item.title;
    this.analysis = idleTranscodeStatus();
    const settings: TranscodeQueueSettings = TranscodeQueueModel.settings(item);
    this.codecIndex = settings.codecIndex;
    this.modeIndex = settings.modeIndex;
    this.sizeIndex = settings.sizeIndex;
    this.bitrateIndex = settings.bitrateIndex;
    this.encoderCategory = settings.encoderCategory;
    this.audioMode = settings.audioMode;
    this.audioTrack = settings.audioTrack;
    this.grayscale = item.grayscale;
    this.resizeMode = settings.resizeMode;
    this.quality.restore(item.quality);
    this.clearPreview();
    this.rangeEnabled = (item.startTimeMs ?? 0) > 0 || (item.endTimeMs ?? 0) > 0;
    this.rangeStart = ((item.startTimeMs ?? 0) / 1000).toString();
    this.rangeEnd = (item.endTimeMs ?? 0) > 0 ? ((item.endTimeMs ?? 0) / 1000).toString() : '';
    const revision: number = this.pageRevision;
    const result: TranscodeExecutionResult | undefined = await this.execute(ui);
    if (result === undefined) { return undefined; }
    if (revision === this.pageRevision) { this.analysis = result.status; }
    return { state: result.status.state, progress: result.status.progress, path: result.path };
  }

  async openHistory(ui: UIContext, entry: TranscodeHistoryEntry): Promise<void> {
    const context = ui.getHostContext();
    if (context === undefined || this.busy || this.queueRunning || this.exporting || this.picking || this.inspecting) {
      return;
    }
    if (!TranscodeFilesModel.validId(entry.id)) { return; }
    this.activeEntry = entry;
    this.resultSourceUri = '';
    this.status = entry.status;
    this.resultPath = entry.hasFile ? context.filesDir + '/transcodes/' + entry.id + '.mp4' : '';
    this.notice = entry.title;
  }

  async exportReport(ui: UIContext): Promise<void> {
    const context = ui.getHostContext();
    const entry: TranscodeHistoryEntry | undefined = this.activeEntry;
    if (context === undefined || entry === undefined || this.busy || this.queueRunning || this.exporting) { return; }
    this.exporting = true;
    try {
      await TranscodeFilesModel.export(context, entry);
    } catch (error) {
      this.notice = JSON.stringify(error);
    } finally {
      this.exporting = false;
    }
  }

  async deleteHistoryEntry(ui: UIContext, entry: TranscodeHistoryEntry): Promise<void> {
    const context = ui.getHostContext();
    if (context === undefined || this.busy || this.queueRunning || this.exporting || this.picking ||
      this.historyLoading) { return; }
    if (!TranscodeFilesModel.validId(entry.id)) { return; }
    let confirmed: boolean = false;
    try {
      const confirm = await ui.getPromptAction().showDialog({
      title: LocalizedText.get($r('app.string.transcode_delete_file')),
      message: LocalizedText.get($r('app.string.transcode_delete_file_hint')),
      buttons: [{ text: LocalizedText.get($r('app.string.transcode_cancel')), color: '#667085' },
        { text: LocalizedText.get($r('app.string.transcode_delete_file')), color: '#C00000' }]
      });
      confirmed = confirm.index === 1;
    } catch (_error) { return; }
    if (!confirmed || this.busy || this.queueRunning || this.exporting || this.inspecting || this.picking ||
      player.getState() !== player.PlayerState.IDLE || recorder.getDiagnostics().active ||
      !MediaFileActivity.beginCleanup()) { return; }
    this.exporting = true;
    this.historyState.invalidate();
    try {
      const directory: string = context.filesDir + '/transcodes';
      await TranscodeFilesModel.deleteEntry(directory, entry.id);
      const resultPath: string = directory + '/' + entry.id + '.mp4';
      for (const item of this.queue.items) {
        if (item.resultPath === resultPath) { this.queue.remove(item.id); }
      }
      await this.persistQueue(ui);
      await this.refreshHistory(directory);
      if (this.activeEntry?.id === entry.id) {
        this.resultPath = '';
        this.activeEntry = undefined;
        this.status = idleTranscodeStatus();
      }
      this.notice = LocalizedText.get($r('app.string.transcode_file_deleted'));
    } catch (error) {
      this.notice = JSON.stringify(error);
    } finally {
      this.exporting = false;
      MediaFileActivity.endCleanup();
    }
  }

  async cleanOrphanFiles(ui: UIContext): Promise<void> {
    const context = ui.getHostContext();
    if (context === undefined || this.busy || this.queueRunning || this.exporting || this.picking || this.inspecting ||
      this.historyLoading) {
      return;
    }
    if (this.orphanFileCount === 0) {
      this.notice = LocalizedText.get($r('app.string.transcode_no_orphan_files'));
      return;
    }
    let confirmed: boolean = false;
    try {
      const confirm = await ui.getPromptAction().showDialog({
        title: LocalizedText.get($r('app.string.transcode_cleanup_orphans')),
        message: LocalizedText.format($r('app.string.transcode_cleanup_orphans_hint'),
          this.orphanFileCount.toString()),
        buttons: [{ text: LocalizedText.get($r('app.string.transcode_cancel')), color: '#667085' },
          { text: LocalizedText.get($r('app.string.transcode_cleanup_orphans')), color: '#C00000' }]
      });
      confirmed = confirm.index === 1;
    } catch (_error) { return; }
    if (!confirmed || this.busy || this.queueRunning || this.exporting || this.inspecting || this.picking ||
      player.getState() !== player.PlayerState.IDLE || recorder.getDiagnostics().active ||
      !MediaFileActivity.beginCleanup()) { return; }
    this.exporting = true;
    this.historyState.invalidate();
    try {
      const directory: string = context.filesDir + '/transcodes';
      await TranscodeFilesModel.cleanupOrphans(directory);
      await this.refreshHistory(directory);
      this.notice = LocalizedText.get($r('app.string.transcode_cleanup_complete'));
    } catch (error) {
      this.notice = JSON.stringify(error);
    } finally {
      this.exporting = false;
      MediaFileActivity.endCleanup();
    }
  }

  async clearHistory(ui: UIContext): Promise<void> {
    await this.cleanOrphanFiles(ui);
  }
}
