/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { RecorderPreview } from './RecorderPreview';
import { RecorderControlBar } from './RecorderControlBar';
import { RecordingHistoryEntry } from '../../model/RecordingHistoryModel';

@Component
export struct RecorderOverview {
  @Prop cameraWidth: number = 0;
  @Prop cameraHeight: number = 0;
  @Prop frameRate: number = 0;
  @Prop buttonEnabled: boolean = true;
  @Prop recordingEntries: RecordingHistoryEntry[] = [];
  onOpenSettings: () => void = () => {};
  onStartRecording: () => void = () => {};
  onPlayRecording: (uri: string) => void = (_uri: string): void => {};

  private formatRecordingDate(timestamp: number): string {
    const date: Date = new Date(timestamp);
    const year: number = date.getFullYear();
    const month: string = (date.getMonth() + 1).toString().padStart(2, '0');
    const day: string = date.getDate().toString().padStart(2, '0');
    const hour: string = date.getHours().toString().padStart(2, '0');
    const minute: string = date.getMinutes().toString().padStart(2, '0');
    return `${year}-${month}-${day} ${hour}:${minute}`;
  }

  private formatRecordingDuration(durationSeconds: number): string {
    const minutes: number = Math.floor(durationSeconds / 60);
    const seconds: string = (durationSeconds % 60).toString().padStart(2, '0');
    return `${minutes}:${seconds}`;
  }

  @Builder
  private recordingEntryView(entry: RecordingHistoryEntry) {
    Row({ space: '10vp' }) {
      Column({ space: '4vp' }) {
        Text(entry.title).width('100%').fontSize('14fp').fontWeight(FontWeight.Medium)
          .fontColor('#182431').maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
        Text(`${this.formatRecordingDate(entry.recordedAt)} · ${this.formatRecordingDuration(entry.durationSeconds)}`)
          .width('100%').fontSize('12fp').fontColor('#66727D')
      }
      .layoutWeight(1)
      Button($r('app.string.recording_play'))
        .height('34vp')
        .fontSize('11fp')
        .onClick((): void => this.onPlayRecording(entry.uri))
    }
    .width('100%')
    .padding('10vp')
    .backgroundColor('#F5F7F9')
    .borderRadius('10vp')
  }

  build() {
    Scroll() {
      Column({ space: '16vp' }) {
        Column({ space: '4vp' }) {
          Text($r('app.string.recorder_home_title'))
            .fontSize('24fp')
            .fontWeight(FontWeight.Bold)
            .fontColor('#101820')
            .width('100%')
          Text($r('app.string.recorder_home_description'))
            .fontSize('14fp')
            .fontColor('#667085')
            .width('100%')
        }.width('100%')

        RecorderPreview({
          cameraWidth: this.cameraWidth,
          cameraHeight: this.cameraHeight,
          frameRate: this.frameRate
        })
        RecorderControlBar({
          buttonEnabled: this.buttonEnabled,
          onOpenSettings: this.onOpenSettings,
          onStartRecording: this.onStartRecording
        })
        if (!this.buttonEnabled) {
          Text($r('app.string.recorder_playback_blocked_hint'))
            .fontSize('13fp')
            .fontColor('#667085')
            .textAlign(TextAlign.Center)
            .width('100%')
        }
        Column({ space: '10vp' }) {
          Text($r('app.string.recording_history_title'))
            .width('100%').fontSize('18fp').fontWeight(FontWeight.Bold).fontColor('#182431')
          if (this.recordingEntries.length === 0) {
            Text($r('app.string.recording_history_empty'))
              .width('100%').fontSize('13fp').fontColor('#66727D')
              .padding({ top: '14vp', bottom: '14vp' })
          } else {
            ForEach(this.recordingEntries, (entry: RecordingHistoryEntry) => this.recordingEntryView(entry),
              (entry: RecordingHistoryEntry) => entry.uri)
          }
        }
        .width('100%')
        .margin({ top: '8vp' })
      }
      .width('100%')
      .padding({ left: '16vp', right: '16vp', top: '20vp', bottom: '24vp' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .scrollBar(BarState.Auto)
  }
}
