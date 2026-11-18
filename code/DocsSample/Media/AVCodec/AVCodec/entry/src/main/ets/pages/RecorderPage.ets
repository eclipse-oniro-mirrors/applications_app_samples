/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { RecorderOverview } from '../components/recorder/RecorderOverview';
import { RecordingHistoryEntry, RecordingHistoryModel } from '../model/RecordingHistoryModel';
import { common } from '@kit.AbilityKit';
import Logger from '../common/utils/Logger';

@Component
export struct RecorderPage {
  @Prop cameraWidth: number = 0;
  @Prop cameraHeight: number = 0;
  @Prop frameRate: number = 0;
  @Prop buttonEnabled: boolean = true;
  @State private recordingEntries: RecordingHistoryEntry[] = [];
  @Prop @Watch('refreshHistory') refreshToken: number = 0;
  private history: RecordingHistoryModel = new RecordingHistoryModel();
  private loading: number = 0;

  aboutToAppear(): void { this.refreshHistory(); }
  aboutToDisappear(): void { this.loading++; }

  private refreshHistory(): void { void this.loadHistory(); }

  private async loadHistory(): Promise<void> {
    const request: number = ++this.loading;
    const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    try {
      await this.history.load(context);
      if (request === this.loading) { this.recordingEntries = this.history.getEntries(); }
    } catch (error) { Logger.warn('RecorderPage', JSON.stringify(error)); }
  }
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
