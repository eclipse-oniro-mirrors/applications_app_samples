/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

/**
 * @file entry/src/main/ets/pages/universal/events/customEventSample/CustomEventHome.ets
 * 文件职责：CustomEventHome 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CustomEventHome。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';
import { getStringData } from '../../../../data/ResourceDataHandle';
import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import ShowToast from '../../../../util/ShowToast';

/**
 * CustomEventHome：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct CustomEventHome {
  private btnFontColor: Resource = $r('app.color.white');
  private customClickUrl: string = 'pages/universal/events/customEventSample/CustomClickEvent';
  private customScrollingUrl: string = 'pages/universal/events/customEventSample/CustomScrollingEvent';

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色
    Column() {
      // 标题
      // Column：垂直布局容器
      // 关键属性：高度、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：高度、宽度
        Row() {
          // Image：图片
          // 关键属性：宽度、高度、外边距、objectFit、点击事件回调、back
          // 交互：可点击交互
          Image($r('app.media.ic_back'))
            .width(24)
            .height(24)
            .margin({ left: 24 })
            .objectFit(ImageFit.Contain)
            .onClick(() => {
              router.back()
            })
            .id('backBtn')
          // Text：文本
          // 关键属性：字号、布局权重、字重、外边距、align
          Text($r('app.string.send_event')).id('custom_event_home_text_4')
            .fontSize(20)
            .layoutWeight(1)
            .fontWeight(700)
            .margin({ left: 16 })
            .align(Alignment.Start)
          // Blank：占位空白
          Blank().id('custom_event_home_blank_5')
        }.id('custom_event_home_row_3')
        .height(56)
        .width('100%')
      }.id('custom_event_home_column_2')
      .height(56)
      .width('100%')

      // Blank：占位空白
      Blank().id('custom_event_home_blank_6')
      // Column：垂直布局容器
      // 关键属性：内边距、宽度、交叉轴对齐、主轴对齐、空间不足收缩
      Column({ space: 12 }) {
        // Button：按钮
        // 关键属性：背景色、宽度、高度、字号、字重、圆角
        // 交互：可点击交互
        Button($r('app.string.custom_click_event_button'))
          .backgroundColor('#007DFF')
          .width('100%')
          .height(40)
          .fontSize(16)
          .fontWeight(500)
          .borderRadius(20)
          .fontColor(this.btnFontColor)
          .id('customClick')
          .onClick(() => {
            router.pushUrl({
              url: this.customClickUrl
            });
          })

        // Button：按钮
        // 关键属性：背景色、宽度、高度、字号、字重、圆角
        // 交互：可点击交互
        Button($r('app.string.custom_Scrolling_event_button'))
          .backgroundColor('#007DFF')
          .width('100%')
          .height(40)
          .fontSize(16)
          .fontWeight(500)
          .borderRadius(20)
          .fontColor(this.btnFontColor)
          .id('customScrolling')
          .onClick(() => {
            router.pushUrl({
              url: this.customScrollingUrl
            });
          })
      }.id('custom_event_home_column_7')
      .padding({ left: 24, right: 24, bottom: 16 })
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.End)
      .flexShrink(1)
    }.id('custom_event_home_column_1')
    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}