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
 * @file entry/src/main/ets/pages/animations/interpolationCalculationSample/InterpolationCalculationSample.ets
 * 文件职责：InterpolationCalculationSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：InterpolationCalculation。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import Curves from '@ohos.curves'
import { IntroductionTitle } from '../../../common/IntroductionTitle'
import { TitleBar } from '../../../common/TitleBar'

const ANIMATION_TIME: number = 2000

@Extend(Text) function textStyle(customWidth: string) {
  .height(50)
  .width(customWidth)
  .margin({ left: 12 })
  .alignSelf(ItemAlign.Start)
}

/**
 * InterpolationCalculation：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct InterpolationCalculation {
  // @State customWidth：组件内部状态
  @State customWidth: string = '15%'
  // @State isAnimationStart：组件内部状态
  @State isAnimationStart: boolean = false
  private initCurve: ICurve = Curves.initCurve(Curve.EaseIn)
  private stepsCurve: ICurve = Curves.stepsCurve(9, true)
  private cubicBezierCurve: ICurve = Curves.cubicBezierCurve(0.1, 0.0, 0.1, 1.0)
  private springCurve: ICurve = Curves.springCurve(100, 1, 228, 30)

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.interpolation_calculation') }).id('interpolation_calculation_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.interpolation_calculation_init_curve') })
            .id('interpolation_calculation_sample_introduction_title_5')
          // Text：文本
          // 关键属性：textStyle、背景色、动画配置
          Text().id('interpolation_calculation_sample_text_6')
            .textStyle(this.customWidth)
            .backgroundColor($r('app.color.curve_init'))
            .animation({ duration: ANIMATION_TIME, curve: this.initCurve })

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.interpolation_calculation_steps_curve') })
            .id('interpolation_calculation_sample_introduction_title_7')
          // Text：文本
          // 关键属性：textStyle、背景色、动画配置
          Text().id('interpolation_calculation_sample_text_8')
            .textStyle(this.customWidth)
            .backgroundColor($r('app.color.curve_steps'))
            .animation({ duration: ANIMATION_TIME, curve: this.stepsCurve })

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.interpolation_calculation_cubic_bezier_curve') })
            .id('interpolation_calculation_sample_introduction_title_9')
          // Text：文本
          // 关键属性：textStyle、背景色、动画配置
          Text().id('interpolation_calculation_sample_text_10')
            .textStyle(this.customWidth)
            .backgroundColor($r('app.color.curve_bezier'))
            .animation({ duration: ANIMATION_TIME, curve: this.cubicBezierCurve })

          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.interpolation_calculation_spring') })
            .id('interpolation_calculation_sample_introduction_title_11')
          // Text：文本
          // 关键属性：textStyle、背景色、动画配置
          Text().id('interpolation_calculation_sample_text_12')
            .textStyle(this.customWidth)
            .backgroundColor($r('app.color.curve_spring'))
            .animation({ duration: ANIMATION_TIME, curve: this.springCurve })

          // Button：按钮
          // 关键属性：高度、字号、圆角、外边距、字体颜色、字重
          // 交互：可点击交互
          Button('Go!')
            .height(50)
            .fontSize(32)
            .borderRadius(24)
            .margin({ top: 20 })
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bolder)
            .onClick(() => {
              this.customWidth = this.isAnimationStart ? '15%' : '95%'
              this.isAnimationStart = !this.isAnimationStart
            })
            .id('test_goButton')
        }.id('interpolation_calculation_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('interpolation_calculation_sample_scroll_3')
    }.id('interpolation_calculation_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}