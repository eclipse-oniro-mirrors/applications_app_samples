/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { RecorderOverview } from '../components/recorder/RecorderOverview';
import { RecordingHistoryEntry } from '../model/RecordingHistoryModel';

@Component
export struct RecorderPage {
  @Prop cameraWidth: number = 0;
  @Prop cameraHeight: number = 0;
  @Prop frameRate: number = 0;
  @Prop buttonEnabled: boolean = true;
  @Prop recordingEntries: RecordingHistoryEntry[] = [];
  onOpenSettings: () => void = (): void => {};
  onStartRecording: () => void = (): void => {};
  onPlayRecording: (uri: string) => void = (_uri: string): void => {};

  build() {
    RecorderOverview({
      cameraWidth: this.cameraWidth,
      cameraHeight: this.cameraHeight,
      frameRate: this.frameRate,
      buttonEnabled: this.buttonEnabled,
      recordingEntries: this.recordingEntries,
      onOpenSettings: this.onOpenSettings,
      onStartRecording: this.onStartRecording,
      onPlayRecording: this.onPlayRecording
    })
  }
}
