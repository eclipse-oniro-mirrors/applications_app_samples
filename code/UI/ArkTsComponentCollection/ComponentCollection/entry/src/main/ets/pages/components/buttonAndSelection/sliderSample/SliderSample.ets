/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/components/buttonAndSelection/sliderSample/SliderSample.ets
 * 文件职责：SliderSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：SliderSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { ChangePanel } from './ChangePanel'
import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import ShowToast from '../../../../util/ShowToast'
import { TitleBar } from '../../../../common/TitleBar'

@Extend(Row) function rowStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

@Extend(Column) function columnStyle() {
  .width('100%')
  .padding(12)
  .borderRadius(24)
  .backgroundColor(Color.White)
}

/**
 * SliderSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct SliderSample {
  // @State eventValue：组件内部状态
  @State eventValue: number = 10
  // @State sliderChange：组件内部状态
  @State sliderChange: number = 2
  // @State minOrMaxValue：组件内部状态
  @State minOrMaxValue: number = 60
  // @State blockColor：组件内部状态
  @State blockColor: string = '#FFFFFFFF'
  // @State selectColor：组件内部状态
  @State selectColor: string = '#FF0A59F7'
  // @State trackColor：组件内部状态
  @State trackColor: string = '#19000000'
  // @State trackThickness：组件内部状态
  @State trackThickness: number = 5
  // @State sliderValue：组件内部状态
  @State sliderValue: number = 0;
  private steps: string[] = ['10', '20', '30', '40', '50', '60', '70', '80', '90']
  private changeModes: Resource[] = [$r('app.string.slider_event_begin'), $r('app.string.slider_event_moving'),
  $r('app.string.slider_event_end'), $r('app.string.slider_event_click')]

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.slider_title') }).id('slider_sample_title_bar_2')
      // Scroll：滚动容器
      // 关键属性：高度、内边距
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.slider_current_value') })
            .id('slider_sample_introduction_title_5')
          // Row：水平布局容器
          // 关键属性：rowStyle
          Row() {
            // Slider：滑块
            // 关键属性：布局权重、内容变更回调
            // 交互：输入/提交回调
            Slider({
              value: this.minOrMaxValue,
              min: 50,
              max: 130,
              style: SliderStyle.OutSet
            }).id('testSlide1')
              .layoutWeight(1)
              .onChange((value: number) => {
                this.minOrMaxValue = value
              }).onClick((event: ClickEvent) => {
              let text = '  screenX:' + event.screenX + '  screenY:' + event.screenY
              console.log('Sample_ComponentCollection' + text)
            })
            // Text：文本
            Text(`${Math.trunc(this.minOrMaxValue)}`).id('test_Text1')
          }.id('slider_sample_row_6')
          .rowStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.slider_events') }).id('slider_sample_introduction_title_7')
          // Column：垂直布局容器
          // 关键属性：columnStyle、主轴对齐
          Column() {
            // Text：文本
            Text(this.changeModes[this.sliderChange]).id('slider_sample_text_9')
            // Slider：滑块
            // 关键属性：内容变更回调
            // 交互：输入/提交回调
            Slider({
              value: this.eventValue,
              style: SliderStyle.OutSet
            }).id('slider_sample_slider_10')
              .onChange((value: number, mode: SliderChangeMode) => {
                switch (mode) {
                  case SliderChangeMode.Begin:
                    this.sliderChange = 0
                    break
                  case SliderChangeMode.Moving:
                    this.sliderChange = 1
                    break
                  case SliderChangeMode.End:
                    this.sliderChange = 2
                    break
                  case SliderChangeMode.Click:
                    this.sliderChange = 3
                    break
                  default:
                    this.sliderChange = 2
                }
                this.eventValue = value
              })
          }.id('slider_sample_column_8')
          .columnStyle()
          .justifyContent(FlexAlign.Center)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.slider_step_tip') })
            .id('slider_sample_introduction_title_11')
          // Column：垂直布局容器
          // 关键属性：columnStyle
          Column() {
            // Slider：滑块
            // 关键属性：宽度、showTips、function toString() { [native code] }、showSteps、内边距、内容变更回调
            // 交互：输入/提交回调
            Slider({
              value: this.sliderValue,
              step: 10,
              min: 10,
              max: 90,
              style: SliderStyle.OutSet
            }).id('slider_sample_slider_13')
              .width('100%')
              .showTips(true, this.sliderValue.toString())
              .showSteps(true)
              .padding({ left: 12, right: 12 })
              .onChange((value) => {
                this.sliderValue = value;
              })

            // Row：水平布局容器
            // 关键属性：高度、宽度、内边距、主轴对齐
            Row() {
              ForEach(this.steps, (item: string) => {
                // Text：文本
                // 关键属性：字号、文本对齐、尺寸约束
                Text(item).id('slider_sample_text_15')
                  .fontSize(18)
                  .textAlign(TextAlign.Center)
                  .constraintSize({ maxWidth: 30 })
              })
            }.id('slider_sample_row_14')
            .height(20)
            .width('100%')
            .padding({ left: 12, right: 12 })
            .justifyContent(FlexAlign.SpaceBetween)
          }.id('slider_sample_column_12')
          .columnStyle()

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.slider_attributes') })
            .id('slider_sample_introduction_title_16')
          // Column：垂直布局容器
          // 关键属性：columnStyle、主轴对齐
          Column() {
            // Slider：滑块
            // 关键属性：blockColor、trackColor、selectedColor、trackThickness
            Slider({
              value: 10,
              style: SliderStyle.OutSet
            }).id('slider_sample_slider_18')
              .blockColor(this.blockColor)
              .trackColor(this.trackColor)
              .selectedColor(this.selectColor)
              .trackThickness(this.trackThickness)
            // ChangePanel：ChangePanel 自定义组件
            ChangePanel({
              blockColor: $blockColor,
              selectColor: $selectColor,
              trackColor: $trackColor,
              trackThickness: $trackThickness
            }).id('slider_sample_change_panel_19')
          }.id('slider_sample_column_17')
          .columnStyle()
          .justifyContent(FlexAlign.Center)

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.slider_vertical_reverse') })
            .id('slider_sample_introduction_title_20')
          // Row：水平布局容器
          // 关键属性：rowStyle、高度、主轴对齐、外边距
          Row() {
            // Column：垂直布局容器
            Column() {
              // Slider：滑块
              // 关键属性：布局权重
              Slider({
                value: 10,
                direction: Axis.Vertical,
                reverse: false,
                style: SliderStyle.OutSet
              }).id('slider_sample_slider_23')
                .layoutWeight(1)
              // Text：文本
              Text($r('app.string.slider_forward')).id('slider_sample_text_24')
            }.id('slider_sample_column_22')

            // Column：垂直布局容器
            Column() {
              // Slider：滑块
              // 关键属性：布局权重
              Slider({
                value: 10,
                direction: Axis.Vertical,
                reverse: true,
                style: SliderStyle.OutSet
              }).id('slider_sample_slider_26')
                .layoutWeight(1)
              // Text：文本
              Text($r('app.string.slider_reverse')).id('slider_sample_text_27')
            }.id('slider_sample_column_25')
          }.id('slider_sample_row_21')
          .rowStyle()
          .height(240)
          .justifyContent(FlexAlign.SpaceAround)
          .margin({ bottom: 80 })
        }.id('slider_sample_column_4')
        .constraintSize({ minHeight: '100%' }) // Let the minHeight of the component cover screen at least
      }.id('slider_sample_scroll_3')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }.id('slider_sample_column_1')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}