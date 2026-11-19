/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/textAndInput/richTextSample/RichTextSample.ets
 * 文件职责：RichTextSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：RichTextSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import { getStringData } from '../../../../data/ResourceDataHandle'

const RIGH_TEXT = '<h1 style="text-align: center;">h1标题</h1>' +
'<h1 style="text-align: center;"><i>h1斜体</i></h1>' +
'<h1 style="text-align: center;"><u>h1下划线</u></h1>' +
'<h2 style="text-align: center;">h2标题</h2>' +
'<h3 style="text-align: center;">h3标题</h3>' +
'<p style="text-align: center;">p常规</p><hr/>' +
'<div style="width: 500px;height: 500px;border: 1px solid;margin: 0auto;">' +
'<p style="font-size: 35px;text-align: center;font-weight: bold; color: rgb(24,78,228)">字体大小35px,行高45px</p>' +
'<p style="background-color: #e5e5e5;line-height: 45px;font-size: 35px;text-indent: 2em;">' +
'<p>这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字</p>' // 为了更好的体现出富文本效果，所以此常量内容包括中文字符

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
  .alignSelf(ItemAlign.Start)
  .margin({ left: 12, top: 12 })
}

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .padding(15)
}

@Extend(Circle) function colorPicker(color: Color | string, callback: () => void) {
  .fill(color)
  .height(20)
  .width(20)
  .onClick(() => {
    callback()
  })
}

@Styles function pressedStyle() {
  .opacity(0.7)
  .borderWidth(1)
  .borderRadius(20)
}

/**
 * RichTextSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct RichTextSample {
  // @State data：组件内部状态
  @State data: string = RIGH_TEXT

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.rich_text') }).id('rich_text_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text("Display").id('rich_text_sample_text_3')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度、高度
      Column() {
        // Stack：层叠布局容器
        Stack() {
          // RichText：富文本
          RichText(this.data).id('rich_text_sample_rich_text_6')
          // Image：图片
          // 关键属性：宽度、高度、objectFit、绝对定位
          Image($r('app.media.banner')).id('rich_text_sample_image_7')
            .width('100%')
            .height(80)
            .objectFit(ImageFit.Contain)
            .position({ y: 0 })
        }.id('rich_text_sample_stack_5')
      }.id('rich_text_sample_column_4')
      .cardStyle()
      .width('100%')
      .height('80%')
    }.id('rich_text_sample_column_1').height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}
