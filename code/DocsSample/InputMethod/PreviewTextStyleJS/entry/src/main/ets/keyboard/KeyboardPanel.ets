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

import { previewSender } from './PreviewSender';

@Entry
@Component
struct KeyboardPanel {
  @StorageLink('previewSenderStatus') status: ResourceStr = $r('app.string.waiting_editor_connection');

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text($r('app.string.keyboard_title'))
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .width('100%')
          .maxLines(1)
        Row({ space: 12 }) {
          Button($r('app.string.send_preview'))
            .layoutWeight(1)
            .height(40)
            .fontSize(14)
            .focusable(false)
            .id('previewAsync')
            .onClick((): void => {
              previewSender.send();
            })
          Button($r('app.string.finish'))
            .layoutWeight(1)
            .height(40)
            .fontSize(14)
            .focusable(false)
            .id('previewFinish')
            .onClick((): void => {
              previewSender.finish();
            })
        }
        .width('100%')
        Text(this.status)
          .id('previewSenderStatus')
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
      }
      .width('100%')
      .padding(12)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.TopStart)
    .backgroundColor($r('app.color.panel_background'))
  }
}
