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

import { PreviewEditor } from '../components/PreviewEditor';

@Entry
@Component
struct Index {
  build() {
    Column({ space: 6 }) {
      Row({ space: 8 }) {
        Text($r('app.string.page_title'))
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .layoutWeight(1)
          .maxLines(1)
      }
      .width('100%')
      .height(36)
      .id('previewPageHeader')
      Scroll() {
        Column({ space: 8 }) {
          PreviewEditor()
          Text($r('app.string.page_hint'))
            .fontSize(12)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
            .padding({ left: 12, right: 12 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Start)
      }
      .width('100%')
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .id('jsPreviewScroll')
    }
    .padding({ top: 8, bottom: 8, left: 12, right: 12 })
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}
