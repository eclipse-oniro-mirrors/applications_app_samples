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

import { TranscodeModel } from '../../model/TranscodeModel';
import { TranscodeGeometryModel, TranscodeGeometryPlan } from '../../model/TranscodeGeometryModel';

@Component
export struct TranscodePreprocessPanel {
  @ObjectLink model: TranscodeModel;
  @State private availableWidth: number = 280;

  private plan(): TranscodeGeometryPlan {
    return TranscodeGeometryModel.plan(this.model.analysis.sourceWidth, this.model.analysis.sourceHeight,
      [0, 1920, 1080, 720][this.model.sizeIndex] ?? 0, this.model.resizeMode);
  }
  private modes(): SelectOption[] {
    return [{ value: $r('app.string.task_fit') }, { value: $r('app.string.task_crop') },
      { value: $r('app.string.task_letterbox') }];
  }
  private previewHeight(): number {
    return this.plan().width > 0 ? this.previewWidth() * this.plan().height / this.plan().width : 158;
  }
  private previewWidth(): number {
    return this.plan().height > 0 ? Math.min(this.availableWidth, 220 * this.plan().width / this.plan().height) : this.availableWidth;
  }
  private contentWidth(): number {
    return this.plan().width > 0 ? this.previewWidth() * this.plan().contentWidth / this.plan().width : this.previewWidth();
  }
  private contentHeight(): number {
    return this.plan().height > 0 ? this.previewHeight() * this.plan().contentHeight / this.plan().height : 158;
  }

  build() {
    Column({ space: 10 }) {
      Text($r('app.string.task_preview')).fontSize(17).fontWeight(FontWeight.Medium)
      Select(this.modes()).selected(this.model.resizeMode).value(this.modes()[this.model.resizeMode].value)
        .enabled(this.model.modeIndex === 0 && !this.model.busy && !this.model.queueRunning)
        .onSelect((index: number): void => { this.model.resizeMode = index; void this.model.inspect(this.getUIContext()); })
      Text($r('app.string.task_preview_hint')).fontSize(12).fontColor('#667085')
      if (this.plan().width > 0) {
        Stack({ alignContent: Alignment.Center }) {
          Column().width('100%').height('100%').backgroundColor('#344054')
          Column().width(this.plan().cropWidth / this.model.analysis.sourceWidth * 100 + '%')
            .height(this.plan().cropHeight / this.model.analysis.sourceHeight * 100 + '%')
            .border({ width: 2, color: '#6CE9A6' }).backgroundColor('#2232D583')
        }.width(Math.min(this.availableWidth, 150 * this.model.analysis.sourceWidth / this.model.analysis.sourceHeight))
          .aspectRatio(this.model.analysis.sourceWidth / this.model.analysis.sourceHeight).clip(true)
        Stack({ alignContent: Alignment.Center }) {
          Column().width(this.contentWidth()).height(this.contentHeight()).backgroundColor('#60A5FA')
            .border({ width: 1, color: '#BFDBFE' })
          Text(this.plan().width + ' × ' + this.plan().height).fontColor(Color.White).fontSize(14)
        }.width(this.previewWidth()).height(this.previewHeight()).backgroundColor('#101828').clip(true)
        Text('crop (' + this.plan().left + ', ' + this.plan().top + ') ' +
          this.plan().cropWidth + ' × ' + this.plan().cropHeight + '\ncontent (' +
          this.plan().contentLeft + ', ' + this.plan().contentTop + ') ' +
          this.plan().contentWidth + ' × ' + this.plan().contentHeight).fontSize(12).fontColor('#475467')
      }
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start).backgroundColor(Color.White).borderRadius(16)
      .onAreaChange((_before: Area, after: Area): void => {
        this.availableWidth = Math.max(1, Number(after.width) - 32);
      })
  }
}
