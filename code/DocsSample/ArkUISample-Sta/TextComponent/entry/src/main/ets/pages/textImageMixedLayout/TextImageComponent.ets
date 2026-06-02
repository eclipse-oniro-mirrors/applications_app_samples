'use static'

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

import {
  $r,
  Color,
  Component,
  Entry,
  ImageSpan,
  ImageSpanAlignment,
  NavDestination,
  Span,
  Text,
  TextDecorationStyle,
  TextDecorationType,
  TextVerticalAlign
} from '@kit.ArkUI';

@Entry
@Component
export struct TextImageComponent {
  build(): void {
    NavDestination() {
      Text() {
        ImageSpan($r('app.media.hot_sale'))
          .width(50)
          .height(30)
          .borderRadius(5)
          .verticalAlign(ImageSpanAlignment.FOLLOW_PARAGRAPH)
        Span($r('app.string.surprise_price'))
          .fontSize(25)
          .fontColor(Color.Red)
        Span('1599')
          .decoration({
            type: TextDecorationType.LineThrough,
            color: Color.Grey,
            style: TextDecorationStyle.SOLID
          })
          .fontSize(16)
      }.textVerticalAlign(TextVerticalAlign.CENTER)
    }
    .backgroundColor('#f1f2f3')
    .title($r('app.string.TextImage_MixedLayout_Text_1'))
  }
}