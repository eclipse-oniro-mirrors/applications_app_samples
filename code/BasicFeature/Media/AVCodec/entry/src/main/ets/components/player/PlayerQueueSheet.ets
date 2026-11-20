/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { PlaybackHistoryEntry, getPlaybackTitle } from '../../model/PlaybackHistoryModel';
import { PlaybackMode } from '../../model/PlaybackModeModel';

@Component
export struct PlayerQueueSheet {
  @Prop queueEntries: string[] = [];
  @Prop queueIndex: number = -1;
  @Prop recentEntries: PlaybackHistoryEntry[] = [];
  @Prop playbackMode: PlaybackMode = PlaybackMode.SEQUENTIAL;
  @Prop autoRecoveryEnabled: boolean = true;
  @Prop buttonEnabled: boolean = true;
  @Prop recentPositionPrefix: string = '';
  @Prop recentCompletedText: string = '';
  onModeChanged: (index: number) => void = (_index: number): void => {};
  onRecoveryChanged: (enabled: boolean) => void = (_enabled: boolean): void => {};
  onAddQueue: () => void = (): void => {};
  onClearQueue: () => void = (): void => {};
  onPlayQueueEntry: (index: number) => void = (_index: number): void => {};
  onPlayRecentEntry: (entry: PlaybackHistoryEntry) => void = (_entry: PlaybackHistoryEntry): void => {};

  private formatHistoryPosition(positionUs: number): string {
    const totalSeconds: number = Math.floor(Math.max(0, positionUs) / 1000000);
    const minutes: number = Math.floor(totalSeconds / 60);
    const seconds: number = totalSeconds % 60;
    return (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
  }

  build() {
    Scroll() {
      Column({ space: '8vp' }) {
        Select([
          { value: $r('app.string.playback_mode_sequential') },
          { value: $r('app.string.playback_mode_repeat_one') },
          { value: $r('app.string.playback_mode_repeat_all') },
          { value: $r('app.string.playback_mode_shuffle') }
        ])
          .selected(this.playbackMode)
          .onSelect((index: number) => this.onModeChanged(index))
          .width('100%')
        Text($r('app.string.playback_mode_hint'))
          .fontSize('12fp')
          .fontColor('#667085')
        Row() {
          Text($r('app.string.playback_auto_recovery'))
            .fontSize('15fp')
            .layoutWeight(1)
          Toggle({ type: ToggleType.Switch, isOn: this.autoRecoveryEnabled })
            .onChange((enabled: boolean) => this.onRecoveryChanged(enabled))
        }
        .width('100%')
        .height('48vp')
        Row({ space: '6vp' }) {
          Button($r('app.string.playback_queue_add'))
            .layoutWeight(1)
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .onClick(this.onAddQueue)
          Button($r('app.string.playback_queue_clear'))
            .layoutWeight(1)
            .height('30vp')
            .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
            .fontSize('10fp')
            .enabled(this.queueEntries.length > 0)
            .onClick(this.onClearQueue)
        }
        .height('44vp')
        if (this.queueEntries.length > 0) {
          Text($r('app.string.playback_queue_current'))
            .fontSize('14fp')
            .fontColor('#344054')
          ForEach(this.queueEntries, (path: string, index: number) => {
            Row() {
              Text((index + 1).toString() + '. ' + getPlaybackTitle(path))
                .layoutWeight(1)
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
              Text(index === this.queueIndex ? $r('app.string.playback_queue_playing') : '')
                .fontSize('12fp')
                .fontColor('#0A59F7')
            }
            .width('100%')
            .height('44vp')
            .padding({ left: '8vp', right: '8vp' })
            .backgroundColor(index === this.queueIndex ? '#EAF1FF' : '#F7F8FA')
            .borderRadius('10vp')
            .onClick(() => this.onPlayQueueEntry(index))
          }, (path: string) => path)
        }
        Text($r('app.string.playback_recent'))
          .fontSize('14fp')
          .fontColor('#344054')
        if (this.recentEntries.length === 0) {
          Text($r('app.string.playback_recent_empty'))
            .fontSize('13fp')
            .fontColor('#667085')
        } else {
          ForEach(this.recentEntries, (entry: PlaybackHistoryEntry) => {
            Row({ space: '6vp' }) {
              Column({ space: '4vp' }) {
                Text(entry.title)
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text(entry.positionUs > 0 ?
                  this.recentPositionPrefix + this.formatHistoryPosition(entry.positionUs) :
                  this.recentCompletedText)
                  .fontSize('12fp')
                  .fontColor('#667085')
              }
              .layoutWeight(1)
              Button($r('app.string.playback_recent_play'))
                .enabled(this.buttonEnabled)
                .height('30vp')
                .responseRegion({ x: 0, y: '-7vp', width: '100%', height: '44vp' })
                .fontSize('10fp')
                .onClick(() => this.onPlayRecentEntry(entry))
            }
            .width('100%')
            .padding('8vp')
            .backgroundColor('#F7F8FA')
            .borderRadius('10vp')
          }, (entry: PlaybackHistoryEntry) => entry.uri)
        }
      }
      .width('100%')
      .padding({ left: '12vp', right: '12vp', top: '8vp', bottom: '12vp' })
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Auto)
  }
}
