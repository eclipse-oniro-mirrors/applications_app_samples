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

import { PlaybackViewModel } from '../../viewmodel/PlaybackViewModel';
import { SubtitleStyleModel } from '../../model/SubtitleStyleModel';
import { CommonConstants as Const } from '../../common/CommonConstants';
import { PlayerSurface } from './PlayerSurface';
import { PlayerStatusOverlay } from './PlayerStatusOverlay';
import { PlaybackDiagnosticsOverlay } from './PlaybackDiagnosticsOverlay';

@Component
export struct PlayerViewport {
  @ObjectLink model: PlaybackViewModel;
  @ObjectLink subtitleStyle: SubtitleStyleModel;
  controller: XComponentController = new XComponentController();
  @Prop sourcePathAvailable: boolean = false;
  @Prop sourceWidth: number = 0;
  @Prop sourceHeight: number = 0;
  @Prop sourceRotation: number = 0;
  @Prop transformType: number = 0;
  @Prop displayScaleMode: number = 0;
  @Prop failureText: string = '';
  @Prop diagnosticsVisible: boolean = false;
  @Prop audioOnlyText: string = '';
  @Prop subtitleText: string = '';
  textForResource: (resource: Resource) => string = (_resource: Resource): string => '';
  onAreaChanged: (_oldArea: Area, newArea: Area) => void = (_oldArea: Area, _newArea: Area): void => {};

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      PlayerSurface({
        controller: this.controller,
        sourceWidth: this.sourceWidth,
        sourceHeight: this.sourceHeight,
        sourceRotation: this.sourceRotation,
        transformType: this.transformType,
        displayMode: this.displayScaleMode,
        onAreaChanged: this.onAreaChanged
      })
      PlayerStatusOverlay({
        audioOnly: this.sourcePathAvailable && !this.model.hasVideo && this.model.hasAudio,
        audioOnlyText: this.audioOnlyText,
        hdrVisible: this.model.hasVideo && this.model.isHdrVividConfirmed,
        subtitleText: this.subtitleText,
        subtitleVisible: this.subtitleStyle.visible,
        subtitleFontSize: this.subtitleStyle.fontSize(),
        subtitleFontColor: this.subtitleStyle.fontColor(),
        subtitleBackgroundColor: this.subtitleStyle.backgroundColor(),
        subtitleAtBottom: this.subtitleStyle.positionIndex === 0
      })
      if (this.failureText.length > 0) {
        Text(this.failureText).fontSize(12).fontColor('#FDA29B')
          .width('100%').padding(12).backgroundColor('#CC101828')
      }
      PlaybackDiagnosticsOverlay({
        model: this.model,
        diagnosticsVisible: this.diagnosticsVisible,
        textForResource: this.textForResource
      })
    }
    .width(Const.FULL_SIZE)
    .height('auto')
    .layoutWeight(1)
    .backgroundColor(Color.Black)
  }
}
