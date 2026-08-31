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
  public seekPreviewFrame: PixelMap | undefined;
  public onPlaybackPositionChanged: ((positionUs: number) => void) | undefined;
  private updateTimer: number;

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
    this.seekPreviewFrame = undefined;
    this.onPlaybackPositionChanged = undefined;
    this.updateTimer = 0;
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
    this.seekPreviewFrame = undefined;
  }
}
