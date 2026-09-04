/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { formatMediaTime } from '../model/PlaybackInfoModel';
import { PlaybackViewModel } from '../viewmodel/PlaybackViewModel';

const PLAYBACK_SEEK_STEP_US: number = 100000;

@Component
export struct PlaybackProgressPanel {
  @ObjectLink model: PlaybackViewModel;
  @Prop seekEnabled: boolean = false;
  @Prop previewRotation: number = 0;
  onShowMediaInfo: () => void = () => {};
  onProgressChange: (value: number, mode: SliderChangeMode) => void = () => {};

  private isPortraitPreview(): boolean {
    // AVImageGenerator applies the container rotation to the returned frame;
    // this value is used only to size the preview container.
    return this.previewRotation === 90 || this.previewRotation === 270;
  }

  private previewOffsetY(): number {
    return this.isPortraitPreview() ? -194 : -124;
  }

  private previewContainerWidth(): string {
    return this.isPortraitPreview() ? '102vp' : '172vp';
  }

  private previewContainerHeight(): string {
    return this.isPortraitPreview() ? '198vp' : '128vp';
  }

  @Builder
  private seekPreview() {
    if (this.model.isSeeking && this.model.seekPreviewFrame !== undefined) {
      Column() {
        Image(this.model.seekPreviewFrame)
          .width(this.isPortraitPreview() ? '90vp' : '160vp')
          .height(this.isPortraitPreview() ? '160vp' : '90vp')
          .objectFit(ImageFit.Contain)
        Text(formatMediaTime(this.model.seekPreviewUs)).fontSize('12fp').fontColor(Color.White).margin({ top: '4vp' })
      }
      .width(this.previewContainerWidth())
      .height(this.previewContainerHeight())
      .alignItems(HorizontalAlign.Center)
      .padding('6vp').backgroundColor('#CC101820').borderRadius('6vp')
      .margin({ bottom: '6vp' }).hitTestBehavior(HitTestMode.None)
    }
  }

  build() {
    Column() {
      Row() {
        Blank().layoutWeight(1)
        Button($r('app.string.media_info')).height('24vp').fontSize('12fp').fontColor(Color.White)
          .backgroundColor('#335F8C').onClick(this.onShowMediaInfo)
      }
      .width('100%').height('28vp')
      Row({ space: '8vp' }) {
        Text(formatMediaTime(this.model.isSeeking ? this.model.seekPreviewUs : this.model.positionUs))
          .width('48vp').fontSize('12fp').fontColor(Color.White).textAlign(TextAlign.End)
        Slider({
          value: this.model.isSeeking ? this.model.seekPreviewUs : this.model.positionUs,
          min: 0,
          max: Math.max(this.model.durationUs, 1),
          step: Math.min(PLAYBACK_SEEK_STEP_US, Math.max(this.model.durationUs, 1)),
          style: SliderStyle.OutSet
        })
          .layoutWeight(1).height('28vp').blockColor(Color.White).trackColor('#667080')
          .selectedColor('#5DA9FF').showTips(false).enabled(this.seekEnabled).onChange(this.onProgressChange)
        Text(formatMediaTime(this.model.durationUs)).width('48vp').fontSize('12fp').fontColor(Color.White)
      }
      .width('100%').height('32vp')
    }
    .width('100%').height('64vp').padding({ left: '8vp', right: '8vp' })
    .backgroundColor('#99000000').margin({ bottom: '8vp' }).clip(false)
    .overlay(this.seekPreview(), { align: Alignment.Top, offset: { x: 0, y: this.previewOffsetY() } })
  }
}
