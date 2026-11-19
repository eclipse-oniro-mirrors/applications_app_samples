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
 * @file LoadingProgressSample.ets
 * 文件职责：LoadingProgressSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：LoadingProgressSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'

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
 * LoadingProgressSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct LoadingProgressSample {
  // @State mColor：组件内部状态
  @State mColor: Color = Color.Gray
  private colorArray: Array<Color> = [Color.Gray, Color.Red, Color.Yellow, Color.Pink, Color.Blue, Color.Green, Color.Orange]

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.loading_progress') }).id('loading_progress_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.normal_display')).id('loading_progress_sample_text_3')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // LoadingProgress：加载进度
        // 关键属性：宽度、高度、color
        LoadingProgress().id('loading_progress_sample_loading_progress_5')
          .width(100)
          .height(100)
          .color(this.mColor)
      }.id('loading_progress_sample_column_4')
      .cardStyle()
      .width('100%')

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.checkbox_select_color')).id('loading_progress_sample_text_6')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度
      Column() {
        // Row：水平布局容器
        // 关键属性：宽度
        Row() {
          // Blank：占位空白
          Blank().id('loading_progress_sample_blank_9')
          ForEach(this.colorArray, (item: Color, index) => {
            // Circle：圆形
            // 关键属性：colorPicker
            Circle({ width: 20, height: 20 })
              .colorPicker(item, () => {
                this.mColor = item
              }).id('test_circle' + index)
              .stateStyles({
                pressed: pressedStyle,
                normal: {
                  .borderRadius(20)
                  .borderWidth(1)
                }
              })
            // Blank：占位空白
            Blank().id('loading_progress_sample_blank_10')
          }

          )
        }.id('loading_progress_sample_row_8').width('100%')
      }.id('loading_progress_sample_column_7')
      .cardStyle()
      .width('100%')

    }.id('loading_progress_sample_column_1')

    .height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}