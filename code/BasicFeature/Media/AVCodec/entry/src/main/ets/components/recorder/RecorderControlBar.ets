/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

@Component
export struct RecorderControlBar {
  @Prop buttonEnabled: boolean = true;
  onOpenSettings: () => void = (): void => {};
  onStartRecording: () => void = (): void => {};

  build() {
    Row({ space: '8vp' }) {
      Button($r('app.string.setting'))
        .enabled(this.buttonEnabled)
        .layoutWeight(1)
        .height('52vp')
        .backgroundColor('#E67E22')
        .fontColor(Color.White)
        .onClick(this.onOpenSettings)
      Button($r('app.string.record'))
        .enabled(this.buttonEnabled)
        .layoutWeight(1)
        .height('52vp')
        .backgroundColor('#C93535')
        .fontColor(Color.White)
        .onClick(this.onStartRecording)
    }
    .width('100%')
  }
}
