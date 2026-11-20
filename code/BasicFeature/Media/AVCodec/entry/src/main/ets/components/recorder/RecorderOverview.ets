/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { RecorderPreview } from './RecorderPreview';
import { RecorderControlBar } from './RecorderControlBar';

@Component
export struct RecorderOverview {
  @Prop cameraWidth: number = 0;
  @Prop cameraHeight: number = 0;
  @Prop frameRate: number = 0;
  @Prop buttonEnabled: boolean = true;
  onOpenSettings: () => void = () => {};
  onStartRecording: () => void = () => {};

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
