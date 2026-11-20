/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { RecorderOverview } from '../components/recorder/RecorderOverview';

@Component
export struct RecorderPage {
  @Prop cameraWidth: number = 0;
  @Prop cameraHeight: number = 0;
  @Prop frameRate: number = 0;
  @Prop buttonEnabled: boolean = true;
  onOpenSettings: () => void = (): void => {};
  onStartRecording: () => void = (): void => {};

  build() {
    RecorderOverview({
      cameraWidth: this.cameraWidth,
      cameraHeight: this.cameraHeight,
      frameRate: this.frameRate,
      buttonEnabled: this.buttonEnabled,
      onOpenSettings: this.onOpenSettings,
      onStartRecording: this.onStartRecording
    })
  }
}
