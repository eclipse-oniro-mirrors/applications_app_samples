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

import { formatMediaTime } from '../model/PlaybackInfoModel';
import { PlaybackViewModel } from '../viewmodel/PlaybackViewModel';

const PLAYBACK_SEEK_STEP_US: number = 100000;

@Component
export struct PlaybackProgressPanel {
  @ObjectLink model: PlaybackViewModel;
  @Prop seekEnabled: boolean = false;
  @Prop previewRotation: number = 0;
  @Prop diagnosticsVisible: boolean = false;
  onShowMediaInfo: () => void = () => {};
  onToggleDiagnostics: () => void = () => {};
  onProgressChange: (value: number, mode: SliderChangeMode) => void = () => {};

  private isPortraitPreview(): boolean {
    // AVImageGenerator 已将容器旋转应用到返回帧；此处仅据此调整预览容器尺寸。
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
      Row({ space: '8vp' }) {
        Blank().layoutWeight(1)
        Button(this.diagnosticsVisible ? $r('app.string.playback_diagnostics_close') :
          $r('app.string.playback_diagnostics'))
          .height('28vp')
          .fontSize('10fp')
          .fontColor(Color.White)
          .backgroundColor(this.diagnosticsVisible ? '#0A59F7' : '#335F8C')
          .onClick(this.onToggleDiagnostics)
        Button($r('app.string.media_info'))
          .height('28vp')
          .fontSize('10fp')
          .fontColor(Color.White)
          .backgroundColor('#335F8C')
          .onClick(this.onShowMediaInfo)
      }
      .width('100%').height('36vp').padding({ left: '8vp', right: '8vp' })
      Row({ space: '8vp' }) {
        Text(formatMediaTime(this.model.isSeeking ? this.model.seekPreviewUs : this.model.positionUs))
          .width('48vp').fontSize('12fp').fontColor(Color.White).textAlign(TextAlign.End)
        Row() {
          Slider({
            value: this.model.isSeeking ? this.model.seekPreviewUs : this.model.positionUs,
            min: 0,
            max: Math.max(this.model.durationUs, 1),
            step: Math.min(PLAYBACK_SEEK_STEP_US, Math.max(this.model.durationUs, 1)),
            style: SliderStyle.OutSet
          })
            .width('100%').height('28vp').blockColor(Color.White).trackColor('#667080')
            .selectedColor('#5DA9FF').showTips(false).enabled(this.seekEnabled).onChange(this.onProgressChange)
        }
        .layoutWeight(1).height('36vp').padding({ left: '6vp', right: '6vp' })
        .backgroundColor('#99000000').borderRadius('12vp')
        Text(formatMediaTime(this.model.durationUs)).width('48vp').fontSize('12fp').fontColor(Color.White)
      }
      .width('100%').height('40vp').padding({ left: '8vp', right: '8vp' })
    }
    .width('100%').padding({ bottom: '8vp' })
    .clip(false)
    .overlay(this.seekPreview(), { align: Alignment.Top, offset: { x: 0, y: this.previewOffsetY() } })
  }
}
