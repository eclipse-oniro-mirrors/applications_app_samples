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
 * @file entry/src/main/ets/pages/components/buttonAndSelection/counterSample/CounterSample.ets
 * 文件职责：CounterSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：CounterSample。
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

/**
 * CounterSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct CounterSample {
  // @State mEnableInc：组件内部状态
  @State mEnableInc: boolean = true
  // @State mEnableDec：组件内部状态
  @State mEnableDec: boolean = true
  // @State enableCount：组件内部状态
  @State enableCount: number = 0
  // @State count：组件内部状态
  @State count: number = 0
  // @State imageCount：组件内部状态
  @State imageCount: number = 0
  private images: Resource[] = [$r('app.media.ic_button_circle_add'), $r('app.media.ic_blank_and_divider'),
  $r('app.media.ic_select_option_gesture'), $r('app.media.ic_prop_size'),
  $r('app.media.ic_custom_dialog_voice')]

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色、高度、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.counter_name') }).id('counter_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text('Number Content').id('counter_sample_text_3')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle
      Column() {
        // Counter：计数器
        // 关键属性：onInc
        Counter() {
          // Text：文本
          // 关键属性：onInc
          Text(this.count.toString()).id('counter_sample_text_6')
        }.id('counter_sample_counter_5').onInc(() => {
          this.count++
        })
        .onDec(() => {
          this.count--
        })
      }.id('counter_sample_column_4').cardStyle()

      // Text：文本
      // 关键属性：leftTitleStyle
      Text('Image Content').id('counter_sample_text_7')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle
      Column() {
        // Counter：计数器
        // 关键属性：onInc
        Counter() {
          // Image：图片
          // 关键属性：宽度、高度、onInc
          Image(this.images[this.imageCount]).id('counter_sample_image_10')
            .width(20)
            .height(20)
        }.id('counter_sample_counter_9').onInc(() => {
          if (this.imageCount < this.images.length - 1)
            this.imageCount++
        })
        .onDec(() => {
          if (this.imageCount > 0)
            this.imageCount--
        })
      }.id('counter_sample_column_8').cardStyle()

      // Text：文本
      // 关键属性：leftTitleStyle
      Text('EnableInc And EnableDec').id('counter_sample_text_11')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle
      Column() {
        // Row：水平布局容器
        // 关键属性：自身对齐
        Row() {
          // Text：文本
          // 关键属性：字号
          Text('enableInc').id('counter_sample_text_14')
            .fontSize(15)
          // Checkbox：复选框
          // 关键属性：select、内容变更回调
          // 交互：输入/提交回调
          Checkbox()
            .id('inc')
            .select(this.mEnableInc)
            .onChange((value) => {
              this.mEnableInc = value
            })
          // Text：文本
          // 关键属性：字号
          Text('enableDec').id('counter_sample_text_15')
            .fontSize(15)
          // Checkbox：复选框
          // 关键属性：select、内容变更回调
          // 交互：输入/提交回调
          Checkbox()
            .id('dec')
            .select(this.mEnableDec)
            .onChange((value) => {
              this.mEnableDec = value
            })
        }.id('counter_sample_row_13').alignSelf(ItemAlign.Start)
        // Counter：计数器
        // 关键属性：onInc
        Counter() {
          // Text：文本
          // 关键属性：onInc
          Text(this.enableCount.toString()).id('counter_sample_text_17')
        }.id('counter_sample_counter_16').onInc(() => {
          this.enableCount++
        })
        .onDec(() => {
          this.enableCount--
        })
        .enableDec(this.mEnableDec)
        .enableInc(this.mEnableInc)
      }.id('counter_sample_column_12').cardStyle()
    }.id('counter_sample_column_1')
    .backgroundColor($r('app.color.background_light_gray'))
    .height('100%')
    .padding({ left: 20, right: 20 })

  }
}