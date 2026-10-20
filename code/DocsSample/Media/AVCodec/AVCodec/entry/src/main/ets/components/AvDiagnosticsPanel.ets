/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { PlaybackViewModel } from '../viewmodel/PlaybackViewModel';

@Component
export struct AvDiagnosticsPanel {
  @ObjectLink model: PlaybackViewModel;

  private milliseconds(valueUs: number): string {
    return valueUs >= 0 ? (valueUs / 1000).toFixed(1) + ' ms' : '--';
  }

  build() {
    Column({ space: 2 }) {
      if (this.model.hasAudio && this.model.hasVideo) {
        Text($r('app.string.diagnostics_av_offset', this.model.syncAvailable ?
          (this.model.avOffsetUs / 1000).toFixed(1) + ' ms' : '--'))
          .fontSize('11fp').fontColor('#E8FFFFFF')
        Text($r('app.string.diagnostics_av_range',
          this.milliseconds(this.model.averageAbsoluteOffsetUs), this.milliseconds(this.model.maxAbsoluteOffsetUs)))
          .fontSize('11fp').fontColor('#E8FFFFFF')
      }
      if (this.model.hasAudio) {
        Text($r('app.string.diagnostics_audio_queue',
          this.milliseconds(this.model.audioQueueDurationUs), this.milliseconds(this.model.audioDevicePendingUs)))
          .fontSize('11fp').fontColor('#E8FFFFFF')
        Text($r('app.string.diagnostics_starvation', this.model.audioUnderruns, this.model.syncDrops))
          .fontSize('11fp').fontColor('#E8FFFFFF')
        Text(this.model.audioInterrupted ?
          $r('app.string.diagnostics_audio_interrupt_active', this.model.audioInterruptions) :
          $r('app.string.diagnostics_audio_interrupt_idle', this.model.audioInterruptions))
          .fontSize('11fp').fontColor('#E8FFFFFF')
      }
      if (this.model.backgroundPaused) {
        Text($r('app.string.diagnostics_background_paused'))
          .fontSize('11fp').fontColor('#E8FFFFFF')
      }
      Text($r('app.string.diagnostics_seek_time', this.milliseconds(this.model.seekRebuildUs),
        this.milliseconds(this.model.seekFirstOutputUs)))
        .fontSize('11fp').fontColor('#E8FFFFFF')
      Text($r('app.string.diagnostics_seek_queue', this.model.seekSubmitted, this.model.seekMerged,
        this.model.seekCompleted))
        .fontSize('11fp').fontColor('#E8FFFFFF')
      Text($r('app.string.diagnostics_measurement_note')).fontSize('10fp').fontColor('#BBFFFFFF')
    }.alignItems(HorizontalAlign.Start)
  }
}
