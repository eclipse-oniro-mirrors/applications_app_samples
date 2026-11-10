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

import { LocalizedText } from '../../common/LocalizedText';
import recorder from 'librecorder.so';

@Component
export struct RecorderLiveParameters {
  @Prop recording: boolean = false;
  @Prop dualOutput: boolean = false;
  @State private primary: boolean = true;
  @State private bitrateMbps: number = 20;
  @State private busy: boolean = false;
  @State private notice: string = '';

  private async update(keyFrame: boolean): Promise<void> {
    if (!this.recording || this.busy) {
      return;
    }
    this.busy = true;
    try {
      const sessionId: string = recorder.getDiagnostics().sessionId;
      const result = await recorder.updateParameters(sessionId, this.primary,
        keyFrame ? 0 : this.bitrateMbps * 1000000, keyFrame);
      this.notice = result.code === 0 ?
        (keyFrame ? LocalizedText.get($r('app.string.recorder_keyframe_accepted')) : LocalizedText.get($r('app.string.recorder_bitrate_accepted'))) :
        LocalizedText.get($r('app.string.recorder_update_failed_prefix')) + result.code + LocalizedText.get($r('app.string.recorder_update_failed_suffix'));
    } catch (_error) {
      this.notice = LocalizedText.get($r('app.string.recorder_update_failed'));
    } finally {
      this.busy = false;
    }
  }

  build() {
    Column({ space: 6 }) {
      Row({ space: 6 }) {
        if (this.dualOutput) {
          Button(this.primary ? LocalizedText.get($r('app.string.recorder_primary')) : LocalizedText.get($r('app.string.recorder_secondary'))).fontSize(12)
            .layoutWeight(1)
            .onClick((): void => { this.primary = !this.primary; })
        }
        Button(this.bitrateMbps + ' Mbit/s').fontSize(12).layoutWeight(1)
          .onClick((): void => { this.bitrateMbps = this.bitrateMbps === 30 ? 10 : this.bitrateMbps + 10; })
        Button(LocalizedText.get($r('app.string.recorder_change_bitrate'))).fontSize(12).layoutWeight(1).onClick((): void => { void this.update(false); })
      }.width('100%').enabled(this.recording && !this.busy)
      Row() {
        Button(LocalizedText.get($r('app.string.recorder_request_keyframe'))).fontSize(12).layoutWeight(1).onClick((): void => { void this.update(true); })
      }.width('100%').enabled(this.recording && !this.busy)
      if (this.notice.length > 0) {
        Text(this.notice).fontSize(11).fontColor(Color.White).width('100%')
      }
    }.width('100%').padding(8).backgroundColor('#AA101828').borderRadius(8)
  }
}
