/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@ComponentV2
export struct EmptyState {
  @Param idPrefix: string = 'id_empty';
  @Param title: ResourceStr = '';
  @Param description: ResourceStr = '';
  @Param actionText: ResourceStr = '';
  @Event onAction: () => void = () => {
  };

  build() {
    Column({ space: 8 }) {
      Text(this.title)
        .id(`${this.idPrefix}_title`)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.text_primary'))
        .textAlign(TextAlign.Center)
      Text(this.description)
        .id(`${this.idPrefix}_desc`)
        .fontSize(13)
        .fontColor($r('app.color.text_secondary'))
        .lineHeight(20)
        .textAlign(TextAlign.Center)
      if (this.actionText !== '') {
        Button(this.actionText)
          .id(`${this.idPrefix}_action`)
          .height(36)
          .fontSize(14)
          .fontColor($r('app.color.brand_primary'))
          .backgroundColor($r('app.color.brand_light'))
          .borderRadius(18)
          .padding({ left: 16, right: 16 })
          .margin({ top: 4 })
          .onClick(() => {
            this.onAction();
          })
      }
    }
    .id(`${this.idPrefix}_root`)
    .width('100%')
    .padding({ top: 32, bottom: 32, left: 16, right: 16 })
    .alignItems(HorizontalAlign.Center)
  }
}
