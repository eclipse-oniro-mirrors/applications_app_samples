/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { NewsCommentModel } from '../model/NewsCommentModel';
import { Date, Column, Row, VerticalAlign, HorizontalAlign, Image, $r, Text, Span, ImageFit, Blank, Margin, Padding, Component } from '@ohos.arkui.component';
import { State, StateDecoratedVariable, MutableState, stateOf, observableProxy } from '@ohos.arkui.stateManagement';

const FONT_WEIGHT_FIVE_HUNDRED = 500;
const FONT_WEIGHT_FOUR_HUNDRED = 400;

@Component
export struct CommentPage {
  commonData: NewsCommentModel = new NewsCommentModel('', '', '', '', '', '', new Date());
  build() {
    Column() {
      Row() {
        Image(this.commonData.url)
          .objectFit(ImageFit.Contain)
          .width(30)
          .height(30)
          .borderRadius(30)
          .margin({ top: 10, left: 15 } as Margin)
        Column() {
          Text() {
            Span(this.commonData.user)
              .fontSize(14)
              .fontWeight(FONT_WEIGHT_FIVE_HUNDRED)
              .fontColor('#000000')
            Span((new Date().getTime() - this.commonData.commentTime.getTime()) / 1000 <= 5 ? '   刚刚·杭州' : '   昨天23:24·杭州')
              .fontSize(14)
              .fontWeight(FONT_WEIGHT_FOUR_HUNDRED)
              .opacity(0.5)
              .fontColor('#000000')
          }
          .width('80%')
          .margin({ bottom: 6 } as Margin)
          Text(this.commonData.text)
            .fontSize(14)
            .fontWeight(FONT_WEIGHT_FOUR_HUNDRED)
            .opacity(0.8)
            .fontColor('#000000')
            .lineHeight(20)
            .width('80%')
            .margin({ bottom: 6 } as Margin)
          Row() {
            Text('回复 >')
              .fontSize(14)
              .fontColor('#368AEF')
              .fontWeight(FONT_WEIGHT_FOUR_HUNDRED)
              .backgroundColor('#dbdbdb')
              .borderRadius(5)
              .opacity(0.8)
              .padding({ left: 3, right: 3, top: 2, bottom: 2 } as Padding)
            Blank()
            Image($r('app.media.news_follow'))
              .width(20)
              .height(20)
              .objectFit(ImageFit.Fill)
            Image($r('app.media.news_HeartBreak'))
              .width(20)
              .height(20)
              .objectFit(ImageFit.Fill)
              .margin({ left: 20 } as Margin)
          }
          .width('85%')
        }
        .padding({ left: 12, top: 10 } as Padding)
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .alignItems(VerticalAlign.Top)
    }
    .width('100%')
  }
}