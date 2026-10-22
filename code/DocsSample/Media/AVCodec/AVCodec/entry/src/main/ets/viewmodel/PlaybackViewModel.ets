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

import player from 'libplayer.so';
import { formatPlaybackInfo, normalizeSeekPosition } from '../model/PlaybackInfoModel';

const PLAYBACK_INFO_UPDATE_INTERVAL_MS: number = 250;

@Observed
export class PlaybackViewModel {
  public infoText: string;
  public syncAvailable: boolean = false;
  public avOffsetUs: number = 0;
  public averageAbsoluteOffsetUs: number = 0;
  public maxAbsoluteOffsetUs: number = 0;
  public audioQueueDurationUs: number = 0;
  public audioDevicePendingUs: number = 0;
  public audioUnderruns: number = 0;
  public syncDrops: number = 0;
  public seekRebuildUs: number = -1;
  public seekFirstOutputUs: number = -1;
  public audioInterrupted: boolean = false;
  public audioInterruptions: number = 0;
  public lastAudioInterruptHint: number = 0;
  public backgroundPaused: boolean = false;
  public seekSubmitted: number = 0;
  public seekMerged: number = 0;
  public seekCompleted: number = 0;
  public recoveryAttemptCount: number = 0;
  public recoveryStatus: number = 0;
  public recoveryReason: number = 0;
  public positionUs: number;
  public durationUs: number;
  public seekPreviewUs: number;
  public isSeeking: boolean;
  public state: number;
  public hasVideo: boolean;
  public isHdrVividConfirmed: boolean;
  public isSmartFluencyAvailable: boolean;
  public isSoftwareDecoderFallbackUsed: boolean;
  public isBufferMode: boolean;
  public videoOutputFrames: number;
  public videoRenderedFrames: number;
  public videoDroppedFrames: number;
  public audioOutputBuffers: number;
  public bufferPresentFrames: number;
  public bufferPresentFailures: number;
  public bufferPresentAverageUs: number;
  public sinkFrames: number;
  public sinkDiagnosticsAvailable: boolean;
  public sinkFailures: number;
  public sinkCacheHits: number;
  public sinkCacheMisses: number;
  public sinkAverageFrameUs: number;
  public sinkAverageNativeImageWaitUs: number;
  public sinkAverageNativeImageAcquireUs: number;
  public sinkAverageAcquireFenceWaitUs: number;
  public sinkAverageImportUs: number;
  public sinkAverageGpuWaitUs: number;
  public sinkAverageCommandRecordUs: number;
  public sinkAverageSubmitUs: number;
  public speed: number;
  public hasAudio: boolean;
  public videoOutputFps: number;
  public hasVideoOutputFpsSample: boolean;
  public videoDropRatePercent: number;
  public seekPreviewFrame: PixelMap | undefined;
  public seekPreviewRotation: number;
  public onPlaybackPositionChanged: ((positionUs: number) => void) | undefined;
  private updateTimer: number;
  private lastStatsTimeMs: number;
  private lastOutputFrames: number;

  constructor() {
    this.infoText = '';
    this.positionUs = 0;
    this.durationUs = 0;
    this.seekPreviewUs = 0;
    this.isSeeking = false;
    this.state = player.PlayerState.IDLE;
    this.hasVideo = false;
    this.isHdrVividConfirmed = false;
    this.isSmartFluencyAvailable = false;
    this.isSoftwareDecoderFallbackUsed = false;
    this.isBufferMode = false;
    this.videoOutputFrames = 0;
    this.videoRenderedFrames = 0;
    this.videoDroppedFrames = 0;
    this.audioOutputBuffers = 0;
    this.bufferPresentFrames = 0;
    this.bufferPresentFailures = 0;
    this.bufferPresentAverageUs = 0;
    this.sinkFrames = 0;
    this.sinkDiagnosticsAvailable = false;
    this.sinkFailures = 0;
    this.sinkCacheHits = 0;
    this.sinkCacheMisses = 0;
    this.sinkAverageFrameUs = 0;
    this.sinkAverageNativeImageWaitUs = 0;
    this.sinkAverageNativeImageAcquireUs = 0;
    this.sinkAverageAcquireFenceWaitUs = 0;
    this.sinkAverageImportUs = 0;
    this.sinkAverageGpuWaitUs = 0;
    this.sinkAverageCommandRecordUs = 0;
    this.sinkAverageSubmitUs = 0;
    this.speed = 1.0;
    this.hasAudio = false;
    this.videoOutputFps = 0;
    this.hasVideoOutputFpsSample = false;
    this.videoDropRatePercent = 0;
    this.seekPreviewFrame = undefined;
    this.seekPreviewRotation = 0;
    this.onPlaybackPositionChanged = undefined;
    this.updateTimer = 0;
    this.lastStatsTimeMs = 0;
    this.lastOutputFrames = 0;
  }

  startUpdates(): void {
    this.stopUpdates();
    this.update();
    this.updateTimer = setInterval(() => this.update(), PLAYBACK_INFO_UPDATE_INTERVAL_MS);
  }

  stopUpdates(): void {
    if (this.updateTimer !== 0) {
      clearInterval(this.updateTimer);
      this.updateTimer = 0;
    }
  }

  update(): void {
    const info = player.getPlaybackInfo();
    this.syncAvailable = info.diagnostics.syncAvailable;
    this.avOffsetUs = info.diagnostics.avOffsetUs;
    this.averageAbsoluteOffsetUs = info.diagnostics.averageAbsoluteOffsetUs;
    this.maxAbsoluteOffsetUs = info.diagnostics.maxAbsoluteOffsetUs;
    this.audioQueueDurationUs = info.diagnostics.audioQueueDurationUs;
    this.audioDevicePendingUs = info.diagnostics.audioDevicePendingUs;
    this.audioUnderruns = info.diagnostics.audioUnderruns;
    this.syncDrops = info.diagnostics.syncDrops;
    this.seekRebuildUs = info.diagnostics.seekRebuildUs;
    this.seekFirstOutputUs = info.diagnostics.seekFirstOutputUs;
    this.audioInterrupted = info.diagnostics.audioInterrupted;
    this.audioInterruptions = info.diagnostics.audioInterruptions;
    this.lastAudioInterruptHint = info.diagnostics.lastAudioInterruptHint;
    this.backgroundPaused = info.diagnostics.backgroundPaused;
    this.isHdrVividConfirmed = info.isHdrVividConfirmed;
    this.isSmartFluencyAvailable = info.isSmartFluencyAvailable;
    this.isSoftwareDecoderFallbackUsed = info.isSoftwareDecoderFallbackUsed;
    this.isBufferMode = info.isBufferMode;
    this.videoOutputFrames = info.videoOutputFrames;
    this.videoRenderedFrames = info.videoRenderedFrames;
    this.videoDroppedFrames = info.videoDroppedFrames;
    this.audioOutputBuffers = info.audioOutputBuffers;
    this.bufferPresentFrames = info.bufferPresentFrames;
    this.bufferPresentFailures = info.bufferPresentFailures;
    this.bufferPresentAverageUs = info.bufferPresentAverageUs;
    this.sinkFrames = info.videoSinkDiagnostics.frames;
    this.sinkDiagnosticsAvailable = info.videoSinkDiagnostics.available;
    this.sinkFailures = info.videoSinkDiagnostics.failures;
    this.sinkCacheHits = info.videoSinkDiagnostics.cacheHits;
    this.sinkCacheMisses = info.videoSinkDiagnostics.cacheMisses;
    this.sinkAverageFrameUs = info.videoSinkDiagnostics.averageFrameUs;
    this.sinkAverageNativeImageWaitUs = info.videoSinkDiagnostics.averageNativeImageWaitUs;
    this.sinkAverageNativeImageAcquireUs = info.videoSinkDiagnostics.averageNativeImageAcquireUs;
    this.sinkAverageAcquireFenceWaitUs = info.videoSinkDiagnostics.averageAcquireFenceWaitUs;
    this.sinkAverageImportUs = info.videoSinkDiagnostics.averageImportUs;
    this.sinkAverageGpuWaitUs = info.videoSinkDiagnostics.averageGpuWaitUs;
    this.sinkAverageCommandRecordUs = info.videoSinkDiagnostics.averageCommandRecordUs;
    this.sinkAverageSubmitUs = info.videoSinkDiagnostics.averageSubmitUs;
    this.speed = info.speed;
    this.hasAudio = info.hasAudio;
    const nowMs: number = Date.now();
    if (this.lastStatsTimeMs > 0 && nowMs > this.lastStatsTimeMs) {
      const elapsedSeconds: number = (nowMs - this.lastStatsTimeMs) / 1000;
      const frameDelta: number = info.videoOutputFrames - this.lastOutputFrames;
      if (frameDelta > 0) {
        this.videoOutputFps = frameDelta / elapsedSeconds;
        this.hasVideoOutputFpsSample = true;
      }
    }
    const totalVideoFrames: number = info.videoOutputFrames;
    this.videoDropRatePercent = totalVideoFrames > 0 ?
      info.videoDroppedFrames * 100 / totalVideoFrames : 0;
    this.lastStatsTimeMs = nowMs;
    this.lastOutputFrames = info.videoOutputFrames;
    this.state = info.state;
    this.hasVideo = info.hasVideo;
    this.durationUs = Math.max(0, info.durationUs);
    if (!this.isSeeking) {
      this.positionUs = normalizeSeekPosition(info.positionUs, this.durationUs);
      this.seekPreviewUs = this.positionUs;
      if (this.onPlaybackPositionChanged !== undefined) {
        this.onPlaybackPositionChanged(this.positionUs);
      }
    }
    this.infoText = formatPlaybackInfo(info.state, info.speed, info.durationUs, info.positionUs,
      info.hasVideo, info.hasAudio, info.isSmartFluencyAvailable);
  }

  setSeekPosition(positionUs: number): number {
    const targetUs = normalizeSeekPosition(positionUs, this.durationUs);
    this.seekPreviewUs = targetUs;
    this.positionUs = targetUs;
    return targetUs;
  }

  clearRecoveryDiagnostics(): void {
    this.recoveryAttemptCount = 0;
    this.recoveryStatus = 0;
    this.recoveryReason = 0;
  }

  markRecoveryPending(reason: number): void {
    this.recoveryAttemptCount += 1;
    this.recoveryStatus = 1;
    this.recoveryReason = reason;
  }

  markRecoverySucceeded(): void {
    this.recoveryStatus = 2;
  }

  markRecoveryFailed(): void {
    this.recoveryStatus = 3;
  }

  reset(): void {
    this.syncAvailable = false;
    this.avOffsetUs = 0;
    this.averageAbsoluteOffsetUs = 0;
    this.maxAbsoluteOffsetUs = 0;
    this.audioQueueDurationUs = 0;
    this.audioDevicePendingUs = 0;
    this.audioUnderruns = 0;
    this.syncDrops = 0;
    this.seekRebuildUs = -1;
    this.seekFirstOutputUs = -1;
    this.audioInterrupted = false;
    this.audioInterruptions = 0;
    this.lastAudioInterruptHint = 0;
    this.backgroundPaused = false;
    this.seekSubmitted = 0;
    this.seekMerged = 0;
    this.seekCompleted = 0;
    this.infoText = '';
    this.positionUs = 0;
    this.durationUs = 0;
    this.seekPreviewUs = 0;
    this.isSeeking = false;
    this.state = player.PlayerState.IDLE;
    this.hasVideo = false;
    this.isHdrVividConfirmed = false;
    this.isSmartFluencyAvailable = false;
    this.isSoftwareDecoderFallbackUsed = false;
    this.isBufferMode = false;
    this.videoOutputFrames = 0;
    this.videoRenderedFrames = 0;
    this.videoDroppedFrames = 0;
    this.audioOutputBuffers = 0;
    this.bufferPresentFrames = 0;
    this.bufferPresentFailures = 0;
    this.bufferPresentAverageUs = 0;
    this.sinkFrames = 0;
    this.sinkDiagnosticsAvailable = false;
    this.sinkFailures = 0;
    this.sinkCacheHits = 0;
    this.sinkCacheMisses = 0;
    this.sinkAverageFrameUs = 0;
    this.sinkAverageNativeImageWaitUs = 0;
    this.sinkAverageNativeImageAcquireUs = 0;
    this.sinkAverageAcquireFenceWaitUs = 0;
    this.sinkAverageImportUs = 0;
    this.sinkAverageGpuWaitUs = 0;
    this.sinkAverageCommandRecordUs = 0;
    this.sinkAverageSubmitUs = 0;
    this.speed = 1.0;
    this.hasAudio = false;
    this.videoOutputFps = 0;
    this.hasVideoOutputFpsSample = false;
    this.videoDropRatePercent = 0;
    this.seekPreviewFrame = undefined;
    this.seekPreviewRotation = 0;
    this.lastStatsTimeMs = 0;
    this.lastOutputFrames = 0;
  }
}
