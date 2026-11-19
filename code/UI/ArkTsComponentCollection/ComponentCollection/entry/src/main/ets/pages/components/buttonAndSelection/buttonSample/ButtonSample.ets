/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file entry/src/main/ets/pages/components/buttonAndSelection/buttonSample/ButtonSample.ets
 * 文件职责：ButtonSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ButtonSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import ShowToast from '../../../../util/ShowToast'
import { TitleBar } from '../../../../common/TitleBar'
import { getStringData } from '../../../../data/ResourceDataHandle'

@Extend(Column) function columnStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

@Extend(Row) function rowStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

/**
 * ButtonSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ButtonSample {
  private context = getContext(this)
  // @State onClickId：组件内部状态
  @State onClickId: string = 'onClickId'

  @Styles buttonDefaultStyle() {
    .height(40)
    .layoutWeight(1)
    .margin({ left: 8, right: 8 })
    .backgroundColor($r('app.color.button_default_bg_color'))
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：尺寸、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.button_title') }).id(this.onClickId)
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束、内边距
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.button_type') }).id('button_sample_introduction_title_4')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Row：水平布局容器
            // 关键属性：宽度、主轴对齐
            Row() {
              // Default style is capsule
              // Button：按钮
              // 关键属性：buttonDefaultStyle、点击事件回调、longToast
              // 交互：可点击交互
              Button($r('app.string.button_confirm'))
                .buttonDefaultStyle()
                .onClick(() => {
                  ShowToast.longToast(`${getStringData($r('app.string.button_type_capsule'))}${getStringData($r('app.string.button_click'))}`)
                  this.onClickId = 'Capsule onClickId'
                }).id('Capsule')
              // Set button type as parameter
              // Button：按钮
              // 关键属性：buttonDefaultStyle、点击事件回调、longToast
              // 交互：可点击交互
              Button($r('app.string.button_confirm'), { type: ButtonType.Normal })
                .buttonDefaultStyle()
                .onClick(() => {
                  ShowToast.longToast(`${getStringData($r('app.string.button_type_normal'))}${getStringData($r('app.string.button_click'))}`)
                  this.onClickId = 'Normal onClickId'
                }).id('Normal')
              // Button：按钮
              // 关键属性：布局权重、外边距、输入类型、点击事件回调、longToast
              // 交互：可点击交互
              Button() {
                // Image：图片
                Image($r('app.media.ic_button_circle_add')).id('button_sample_image_7')
              }
              .layoutWeight(1)
              .margin({ left: 8, right: 8 })
              .type(ButtonType.Circle) // Set button type as attribute
              .onClick(() => {
                ShowToast.longToast(`${getStringData($r('app.string.button_type_circle'))}${getStringData($r('app.string.button_click'))}`)
                this.onClickId = 'Circle onClickId'
              }).id('Circle')
            }.id('button_sample_row_6')
            .width('100%')
            .justifyContent(FlexAlign.SpaceAround)

            // Row：水平布局容器
            // 关键属性：宽度、外边距、主轴对齐
            Row() {
              // Text：文本
              Text($r('app.string.button_type_capsule')).id('button_sample_text_9')
              // Text：文本
              Text($r('app.string.button_type_normal')).id('button_sample_text_10')
              // Text：文本
              Text($r('app.string.button_type_circle')).id('button_sample_text_11')
            }.id('button_sample_row_8')
            .width('100%')
            .margin({ top: 12 })
            .justifyContent(FlexAlign.SpaceAround)
          }.id('button_sample_column_5')
          .columnStyle()

          // State effect default is ture
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.button_state_effect') })
            .id('button_sample_introduction_title_12')
          // Row：水平布局容器
          // 关键属性：rowStyle、主轴对齐
          Row() {
            // Set state effect as parameter
            // Button：按钮
            // 关键属性：buttonDefaultStyle、点击事件回调、longToast
            // 交互：可点击交互
            Button($r('app.string.button_state_effect_true'), { stateEffect: true })
              .buttonDefaultStyle()
              .onClick(() => {
                ShowToast.longToast(`${getStringData($r('app.string.button_state_effect_true'))}${getStringData($r('app.string.button_click'))}`)
                this.onClickId = 'Has effect onClickId'
              }).id('Has effect')

            // No effect but response onClick event
            // Button：按钮
            // 关键属性：buttonDefaultStyle、stateEffect、点击事件回调、longToast
            // 交互：可点击交互
            Button($r('app.string.button_state_effect_false'))
              .buttonDefaultStyle()
              .stateEffect(false) // Set button type as attribute
              .onClick(() => {
                ShowToast.longToast(`${getStringData($r('app.string.button_state_effect_false'))}${getStringData($r('app.string.button_click'))}`)
                this.onClickId = 'No effect onClickId'
              }).id('No effect')

            // Disable this button
            // Button：按钮
            // 关键属性：buttonDefaultStyle、是否可用、透明度、点击事件回调
            // 交互：可点击交互
            Button($r('app.string.button_disable_style'))
              .buttonDefaultStyle()
              .enabled(false) // If false will not response onClick event
              .opacity(0.4) // Opacity if disable
              .onClick(() => {
                // onClick event will not response
                ShowToast.longToast(`${getStringData($r('app.string.button_disable_style'))}${getStringData($r('app.string.button_click'))}`)
                this.onClickId = 'Disable onClickId'
              })
              .id('Disable')
          }.id('button_sample_row_13')
          .rowStyle()
          .justifyContent(FlexAlign.SpaceAround)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.button_custom_style') })
            .id('button_sample_introduction_title_14')
          // Row：水平布局容器
          // 关键属性：rowStyle、主轴对齐
          Row() {
            // Button：按钮
            // 关键属性：输入类型、圆角、buttonDefaultStyle、点击事件回调
            // 交互：可点击交互
            Button($r('app.string.button_border_radius'))
              .type(ButtonType.Normal)
              .borderRadius(6)
              .buttonDefaultStyle()
              .onClick(() => {
                // onClick event will not response
                ShowToast.longToast(`${getStringData($r('app.string.button_border_radius'))}${getStringData($r('app.string.button_click'))}`)
                this.onClickId = 'Rounded button onClickId'
              })
              .id('Rounded button')

            // Button：按钮
            // 关键属性：buttonDefaultStyle、点击事件回调
            // 交互：可点击交互
            Button() {
              // Row：水平布局容器
              Row() {
                // Image：图片
                // 关键属性：尺寸、外边距
                Image($r('app.media.ic_button_loading')).id('button_sample_image_17')
                  .size({ width: 18, height: 18 })
                  .margin({ left: 6, right: 6 })
                // Text：文本
                // 关键属性：字号、字体颜色
                Text($r('app.string.button_with_icon')).id('button_sample_text_18')
                  .fontSize(16)
                  .fontColor(Color.White)
              }.id('button_sample_row_16')
            }
            .buttonDefaultStyle()
            .onClick(() => {
              // onClick event will not response
              ShowToast.longToast(`${getStringData($r('app.string.button_with_icon'))}${getStringData($r('app.string.button_click'))}`)
              this.onClickId = 'Icon button onClickId'
            }).id('Icon button')

            // Button：按钮
            // 关键属性：buttonDefaultStyle、背景色、点击事件回调
            // 交互：可点击交互
            Button() {
              // Text：文本
              // 关键属性：字号、字体颜色
              Text($r('app.string.button_custom_bg_color')).id('button_sample_text_19')
                .fontSize(16)
                .fontColor(Color.White)
            }
            .buttonDefaultStyle()
            .backgroundColor($r('app.color.button_custom_color'))
            .onClick(() => {
              // onClick event will not response
              ShowToast.longToast(`${getStringData($r('app.string.button_custom_bg_color'))}${getStringData($r('app.string.button_click'))}`)
              this.onClickId = 'Custom color onClickId'
            }).id('Custom color')
          }.id('button_sample_row_15')
          .rowStyle()
          .justifyContent(FlexAlign.SpaceAround)
        }.id('button_sample_column_3')
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen at least
        .padding({ right: 16, left: 16 })
      }.id('button_sample_scroll_2')
    }.id('button_sample_column_1')
    .size({ width: '100%', height: '100%' })
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}