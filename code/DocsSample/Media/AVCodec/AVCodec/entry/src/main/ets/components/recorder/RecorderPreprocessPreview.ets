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
import { CommonConstants as Const } from '../../common/CommonConstants';
import { RecorderPreprocessModel, RecorderPreprocessPlan } from '../../model/RecorderPreprocessModel';

@Component
export struct RecorderPreprocessPreview {
  @Prop sourceWidth: number = 1920;
  @Prop sourceHeight: number = 1080;
  @Prop sourceFrameRate: number = 30;
  @Prop preprocessMode: number = 0;
  @Prop cropPercent: number = 75;
  @Prop targetHeight: number = 720;
  @Prop secondaryHeight: number = 720;
  @Prop secondaryEnabled: boolean = false;
  @Prop dropToFrameRate: number = 0;
  @State private canvasWidth: number = 240;
  @State private canvasHeight: number = 135;

  private plan(): RecorderPreprocessPlan {
    return RecorderPreprocessModel.plan(this.sourceWidth, this.sourceHeight, this.sourceFrameRate,
      this.preprocessMode, this.cropPercent, this.targetHeight, this.secondaryHeight, this.dropToFrameRate);
  }

  private frameWidth(): number {
    return Math.min(this.canvasWidth, this.canvasHeight * this.sourceWidth / Math.max(1, this.sourceHeight));
  }

  private frameHeight(): number {
    return this.frameWidth() * this.sourceHeight / Math.max(1, this.sourceWidth);
  }

  private selectionWidth(): number {
    return this.preprocessMode === Const.VIDEO_PREPROC_CROP ? this.frameWidth() *
      this.plan().cropWidth / Math.max(1, this.sourceWidth) : this.frameWidth();
  }

  private selectionHeight(): number {
    return this.preprocessMode === Const.VIDEO_PREPROC_CROP ? this.frameHeight() *
      this.plan().cropHeight / Math.max(1, this.sourceHeight) : this.frameHeight();
  }

  build() {
    Column({ space: 6 }) {
      Text(LocalizedText.get($r('app.string.preprocess_preview_title'))).fontSize(14).fontWeight(FontWeight.Medium).width('100%')
      Stack({ alignContent: Alignment.Center }) {
        Column().width(this.frameWidth()).height(this.frameHeight()).backgroundColor('#344054')
        Column().width(this.selectionWidth()).height(this.selectionHeight())
          .backgroundColor('#1832D583').border({ width: 2, color: '#6CE9A6' })
        Text(this.preprocessMode === Const.VIDEO_PREPROC_CROP ? LocalizedText.get($r('app.string.preprocess_retained_area')) : LocalizedText.get($r('app.string.preprocess_full_frame')))
          .fontSize(12).fontColor(Color.White)
      }.width('100%').height(150).backgroundColor('#101828').borderRadius(8).clip(true)
        .onAreaChange((_oldArea: Area, newArea: Area): void => {
          this.canvasWidth = Number(newArea.width);
          this.canvasHeight = Number(newArea.height);
        })
      Text(LocalizedText.get($r('app.string.preprocess_input_prefix')) + this.sourceWidth + '×' + this.sourceHeight + ' · ' + this.sourceFrameRate + ' fps')
        .fontSize(12).width('100%')
      if (this.preprocessMode === Const.VIDEO_PREPROC_CROP) {
        Text(LocalizedText.get($r('app.string.preprocess_crop_origin_prefix')) + this.plan().cropLeft + ', ' + this.plan().cropTop + ') · ' +
          this.plan().cropWidth + '×' + this.plan().cropHeight).fontSize(12).width('100%')
      }
      Text(LocalizedText.get($r('app.string.preprocess_primary_prefix')) + this.plan().primaryWidth + '×' + this.plan().primaryHeight + ' · ' +
        this.plan().outputFrameRate + ' fps').fontSize(12).fontColor('#027A48').width('100%')
      if (this.secondaryEnabled) {
        Text(LocalizedText.get($r('app.string.preprocess_secondary_prefix')) + this.plan().secondaryWidth + '×' + this.plan().secondaryHeight + ' · ' +
          this.plan().outputFrameRate + ' fps').fontSize(12).fontColor('#175CD3').width('100%')
        Text(LocalizedText.get($r('app.string.preprocess_secondary_hint')))
          .fontSize(11).fontColor('#667085').width('100%')
      }
      Text(LocalizedText.get($r('app.string.preprocess_preview_hint')))
        .fontSize(11).fontColor('#667085').width('100%')
    }.width('100%').padding(12).backgroundColor('#EEF4FF').borderRadius(12)
  }
}
