/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import player from 'libplayer.so';
import { formatPlaybackInfo, normalizeSeekPosition } from '../model/PlaybackInfoModel';

const PLAYBACK_INFO_UPDATE_INTERVAL_MS: number = 250;

@Observed
export class PlaybackViewModel {
  public infoText: string;
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
  public speed: number;
  public hasAudio: boolean;
  public videoOutputFps: number;
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
    this.speed = 1.0;
    this.hasAudio = false;
    this.videoOutputFps = 0;
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
    this.speed = info.speed;
    this.hasAudio = info.hasAudio;
    const nowMs: number = Date.now();
    if (this.lastStatsTimeMs > 0 && nowMs > this.lastStatsTimeMs) {
      const elapsedSeconds: number = (nowMs - this.lastStatsTimeMs) / 1000;
      this.videoOutputFps = Math.max(0, (info.videoOutputFrames - this.lastOutputFrames) / elapsedSeconds);
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

  reset(): void {
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
    this.speed = 1.0;
    this.hasAudio = false;
    this.videoOutputFps = 0;
    this.videoDropRatePercent = 0;
    this.seekPreviewFrame = undefined;
    this.seekPreviewRotation = 0;
    this.lastStatsTimeMs = 0;
    this.lastOutputFrames = 0;
  }
}
