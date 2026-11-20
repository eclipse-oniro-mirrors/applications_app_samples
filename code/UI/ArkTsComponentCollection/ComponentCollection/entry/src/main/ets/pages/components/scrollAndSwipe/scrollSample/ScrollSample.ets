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
 * @file entry/src/main/ets/pages/components/scrollAndSwipe/scrollSample/ScrollSample.ets
 * 文件职责：ScrollSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ScrollSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import promptAction from '@ohos.promptAction'

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(18)
  .height(22)
  .alignSelf(ItemAlign.Start)
  .margin({ left: 12, bottom: 8 })
}

@Extend(Column) function cardStyle() {
  .margin({ bottom: 12 })
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
 * ScrollSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ScrollSample {
  // @State scroll_direction：组件内部状态
  @State scroll_direction: ScrollDirection = ScrollDirection.Horizontal

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.scroll_name') }).id('scroll_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：背景色、宽度、内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.scroll_horizontal')).id('scroll_sample_text_5')
            .leftTitleStyle()
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Scroll：滚动容器
            // 关键属性：scrollable、宽度、高度、onReachStart、showToast
            Scroll() {
              // Image：图片
              // 关键属性：宽度、高度、objectFit
              Image($r('app.media.banner')).id('scroll_sample_image_8')
                .width('150%')
                .height('100%')
                .objectFit(ImageFit.Contain)
            }.id('scroll_sample_scroll_7')
            .scrollable(this.scroll_direction)
            .width('100%')
            .height(200)
            .onReachStart(() => {
              promptAction.showToast({ message: $r('app.string.horizontal_reach_start')}) // '�������onReachStart'
            })
            .onReachEnd(() => {
              promptAction.showToast({ message: $r('app.string.horizontal_reach_end')}) // '�������onReachEnd'
            })
          }.id('scroll_sample_column_6').cardStyle()

          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.scroll_vertical')).id('scroll_sample_text_9')
            .leftTitleStyle()
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Scroll：滚动容器
            // 关键属性：scrollable、宽度、高度、onReachStart、showToast
            Scroll() {
              // Image：图片
              // 关键属性：宽度、高度、objectFit
              Image($r('app.media.banner')).id('scroll_sample_image_12')
                .width('100%')
                .height('150%')
                .objectFit(ImageFit.Contain)
            }.id('scroll_sample_scroll_11')
            .scrollable(ScrollDirection.Vertical)
            .width('100%')
            .height(200)
            .onReachStart(() => {
              promptAction.showToast({ message: $r('app.string.vertical_reach_start')})
            })
            .onReachEnd(() => {
              promptAction.showToast({ message: $r('app.string.vertical_reach_end')})
            })
          }.id('scroll_sample_column_10').cardStyle()

          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.avoiding_input_method_testing')).id('scroll_sample_text_13')
            .leftTitleStyle()
          // Column：垂直布局容器
          // 关键属性：cardStyle、外边距
          Column() {
            // TextInput：单行输入框
            // 关键属性：宽度、高度、enableKeyboardOnFocus
            TextInput({ placeholder: $r('app.string.avoiding_input_method_testing') })
              .width('95%').height(50).enableKeyboardOnFocus(false).id('test_input')
            // Scroll：滚动容器
            // 关键属性：scrollable、宽度、高度、cardStyle
            Scroll() {
              // Image：图片
              // 关键属性：宽度、高度、objectFit
              Image($r('app.media.banner')).id('scroll_sample_image_15')
                .width('100%')
                .height('150%')
                .objectFit(ImageFit.Contain)
            }
            .id('avoiding_input_scroll')
            .scrollable(ScrollDirection.Vertical)
            .width('100%')
            .height(200)
          }.id('scroll_sample_column_14').cardStyle()
          .margin({ bottom: 80 })
        }.id('scroll_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('scroll_sample_scroll_3')
      .backgroundColor($r('app.color.background_light_gray'))
      .width('100%')
      .padding({ left: 20, right: 20 })
    }.id('scroll_sample_column_1')
  }
}