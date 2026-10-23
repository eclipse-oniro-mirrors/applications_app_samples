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

import { TranscodeModel } from '../model/TranscodeModel';
import { LocalizedText } from '../common/LocalizedText';

@Component
export struct TranscodePage {
  @ObjectLink model: TranscodeModel;

  private codecOptions(): SelectOption[] {
    return [{ value: 'H.264 / AVC' }, { value: 'H.265 / HEVC' }];
  }

  private modeOptions(): SelectOption[] {
    return [{ value: 'Buffer' }, { value: 'Surface' }];
  }

  private sizeOptions(): SelectOption[] {
    return [{ value: $r('app.string.transcode_original_size') }, { value: $r('app.string.transcode_size_1920') },
      { value: $r('app.string.transcode_size_1080') }, { value: $r('app.string.transcode_size_720') }];
  }

  private bitrateOptions(): SelectOption[] {
    return [{ value: '2 Mbps' }, { value: '4 Mbps' }, { value: '8 Mbps' }, { value: '16 Mbps' }];
  }

  @Builder
  private sourceCard() {
    Column({ space: 12 }) {
      Text($r('app.string.transcode_source'))
        .fontSize(17).fontWeight(FontWeight.Medium)
      Text(this.model.sourceTitle.length > 0 ? this.model.sourceTitle : $r('app.string.transcode_no_source'))
        .fontSize(14).fontColor('#667085').width('100%').maxLines(3)
      Row({ space: 8 }) {
        Button($r('app.string.transcode_from_files'))
          .layoutWeight(1).fontSize(14)
          .onClick((): void => { void this.model.chooseSource(this.getUIContext(), false); })
        Button($r('app.string.transcode_from_gallery'))
          .layoutWeight(1).fontSize(14)
          .onClick((): void => { void this.model.chooseSource(this.getUIContext(), true); })
      }
      .enabled(!this.model.busy && !this.model.picking && !this.model.exporting)
    }
    .width('100%').padding(16).alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.White).borderRadius(16)
  }

  @Builder
  private optionsCard() {
    Column({ space: 12 }) {
      Text($r('app.string.transcode_output'))
        .fontSize(17).fontWeight(FontWeight.Medium)
      Row() {
        Text($r('app.string.transcode_codec')).layoutWeight(1)
        Select(this.codecOptions()).selected(this.model.codecIndex)
          .value(this.codecOptions()[this.model.codecIndex].value)
          .onSelect((index: number): void => { this.model.codecIndex = index; })
      }
      Row() {
        Text($r('app.string.transcode_mode')).layoutWeight(1)
        Select(this.modeOptions()).selected(this.model.modeIndex)
          .value(this.modeOptions()[this.model.modeIndex].value)
          .onSelect((index: number): void => this.model.setMode(index))
      }
      Row() {
        Text($r('app.string.transcode_size')).layoutWeight(1)
        Select(this.sizeOptions()).selected(this.model.sizeIndex)
          .value(this.sizeOptions()[this.model.sizeIndex].value)
          .enabled(this.model.modeIndex === 0)
          .onSelect((index: number): void => { this.model.sizeIndex = index; })
      }
      Row() {
        Text($r('app.string.transcode_bitrate')).layoutWeight(1)
        Select(this.bitrateOptions()).selected(this.model.bitrateIndex)
          .value(this.bitrateOptions()[this.model.bitrateIndex].value)
          .onSelect((index: number): void => { this.model.bitrateIndex = index; })
      }
      Row() {
        Text($r('app.string.transcode_grayscale')).layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.model.grayscale })
          .enabled(this.model.modeIndex === 0)
          .onChange((checked: boolean): void => { this.model.grayscale = checked; })
      }
      Row() {
        Text($r('app.string.transcode_audio')).layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.model.keepAudio })
          .onChange((checked: boolean): void => { this.model.keepAudio = checked; })
      }
      Text(this.model.modeIndex === 0 ? $r('app.string.transcode_buffer_hint') : $r('app.string.transcode_surface_hint'))
        .fontSize(12).fontColor('#667085')
    }
    .enabled(!this.model.busy && !this.model.exporting && !this.model.picking)
    .width('100%').padding(16).alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.White).borderRadius(16)
  }

  @Builder
  private resultCard() {
    Column({ space: 12 }) {
      if (this.model.busy || this.model.status.state > 0) {
        Text(this.model.busy ? $r('app.string.transcode_running') : $r('app.string.transcode_result'))
          .fontSize(17).fontWeight(FontWeight.Medium)
        Progress({ value: this.model.status.progress, total: 100, type: ProgressType.Linear })
          .width('100%')
        Text(LocalizedText.format($r('app.string.transcode_progress'), this.model.status.progress.toFixed(1),
          this.model.status.frames.toString(), (this.model.status.bytes / 1048576).toFixed(1)))
          .fontSize(13).fontColor('#667085')
        if (this.model.status.outputWidth > 0) {
          Text(this.model.status.outputWidth + ' × ' + this.model.status.outputHeight)
            .fontSize(13).fontColor('#667085')
        }
      }
      if (this.model.notice.length > 0) {
        Text(this.model.notice).fontSize(14).fontColor('#344054').width('100%')
      }
      if (this.model.busy) {
        Button(this.model.cancelRequested ? $r('app.string.transcode_cancelling') : $r('app.string.transcode_cancel'))
          .width('100%').enabled(!this.model.cancelRequested)
          .onClick((): void => this.model.cancel())
      } else {
        Button($r('app.string.transcode_start')).width('100%')
          .enabled(this.model.sourceUri.length > 0 && !this.model.picking && !this.model.exporting)
          .onClick((): void => { void this.model.start(this.getUIContext()); })
      }
      if (this.model.resultPath.length > 0) {
        Row({ space: 8 }) {
          Button($r('app.string.transcode_save_files')).layoutWeight(1).fontSize(14)
            .onClick((): void => { void this.model.save(this.getUIContext(), false); })
          Button($r('app.string.transcode_save_gallery')).layoutWeight(1).fontSize(14)
            .onClick((): void => { void this.model.save(this.getUIContext(), true); })
        }
        .enabled(!this.model.exporting && !this.model.busy && !this.model.picking)
        Text($r('app.string.transcode_private_result')).fontSize(12).fontColor('#667085')
      }
    }
    .width('100%').padding(16).alignItems(HorizontalAlign.Start)
    .backgroundColor(Color.White).borderRadius(16)
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Text($r('app.string.tab_transcode')).fontSize(26).fontWeight(FontWeight.Bold)
        Text($r('app.string.transcode_description')).fontSize(14).fontColor('#667085')
        this.sourceCard()
        this.optionsCard()
        this.resultCard()
        Text($r('app.string.transcode_limits')).fontSize(12).fontColor('#667085')
      }
      .width('100%').padding(16).alignItems(HorizontalAlign.Start)
    }
    .width('100%').height('100%').backgroundColor('#F8F9FA')
    .align(Alignment.Top).scrollBar(BarState.Auto)
  }
}
