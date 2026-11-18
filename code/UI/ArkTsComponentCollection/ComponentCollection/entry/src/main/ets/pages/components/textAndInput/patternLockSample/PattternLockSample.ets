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
 * @file entry/src/main/ets/pages/components/textAndInput/patternLockSample/PattternLockSample.ets
 * 文件职责：PattternLockSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PattternLockSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';
import { PatternLockControlPanel } from './ChangePanel'

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .padding(12)
  .borderRadius(16)
  .width('100%')
}

/**
 * PattternLockSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct PattternLockSample {
  // @State passwords：组件内部状态
  @State passwords: Number[] = []
  // @State message：组件内部状态
  @State message: string = 'please input password!'
  // @State sideLength：组件内部状态
  @State sideLength: number = 200
  // @State circleRadius：组件内部状态
  @State circleRadius: number = 9
  // @State pathStrokeWidth：组件内部状态
  @State pathStrokeWidth: number = 18
  // @State activeColor：组件内部状态
  @State activeColor: Color = Color.Blue
  // @State selectedColor：组件内部状态
  @State selectedColor: Color = Color.Blue
  // @State pathColor：组件内部状态
  @State pathColor: Color = Color.Blue
  // @State regularColor：组件内部状态
  @State regularColor: Color = Color.Blue
  private patternLockController: PatternLockController = new PatternLockController()

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：主轴对齐、交叉轴对齐、背景色、高度、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.patternlock_title') }).id('patttern_lock_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：cardStyle、高度
      Column() {
        // Text：文本
        // 关键属性：文本对齐、外边距、字号
        Text(this.message).id('patttern_lock_sample_text_4').textAlign(TextAlign.Center).margin(20).fontSize(20)
        // PatternLock：PatternLock 自定义组件
        // 关键属性：sideLength、circleRadius、pathStrokeWidth、activeColor、selectedColor、pathColor
        PatternLock(this.patternLockController).id('patttern_lock_sample_pattern_lock_5')
          .sideLength(this.sideLength)
          .circleRadius(this.circleRadius)
          .pathStrokeWidth(this.pathStrokeWidth)
          .activeColor(this.activeColor)
          .selectedColor(this.selectedColor)
          .pathColor(this.pathColor)
          .backgroundColor('#F5F5F5')
          .regularColor(this.regularColor)
          .autoReset(true)
          .onPatternComplete((input: Array<number>) => {
            // 输入的密码长度小于5时，提示重新输入
            if (input === null || input === undefined || input.length < 5) {
              this.message = 'The password length needs to be greater than 5, please enter again.'
              return
            }
            // 判断密码长度是否大于0
            if (this.passwords.length > 0) {
              // 判断两次输入的密码是否相同，相同则提示密码设置成功，否则提示重新输入
              if (this.passwords.toString() === input.toString()) {
                this.passwords = input
                this.message = 'Set password successfully: ' + this.passwords.toString()
              } else {
                this.message = 'Inconsistent passwords, please enter again.'
              }
            } else {
              // 提示第二次输入密码
              this.passwords = input
              this.message = "Please enter again."
            }
          })
        // Button：按钮
        // 关键属性：cardStyle
        Button('Reset PatternLock').margin(30).onClick(() => {
          // 重置密码锁
          this.patternLockController.reset()
          this.passwords = []
          this.message = 'Please input password'
        })
      }.id('patttern_lock_sample_column_3').cardStyle()
      .height('55%')
      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.patternlock_change') })
        .id('patttern_lock_sample_introduction_title_7')
      // Column：垂直布局容器
      // 关键属性：cardStyle、布局权重、外边距、主轴对齐
      Column() {
        // Scroll：滚动容器
        Scroll() {
          // Column：垂直布局容器
          Column() {
            // PatternLockControlPanel：PatternLockControlPanel 自定义组件
            PatternLockControlPanel({
              sideLength: $sideLength,
              pathStrokeWidth: $pathStrokeWidth,
              circleRadius: $circleRadius,
              activeColor: $activeColor,
              selectedColor: $selectedColor,
              regularColor: $regularColor,
              pathColor: $pathColor
            }).id('patttern_lock_sample_pattern_lock_control_panel_10')
          }.id('patttern_lock_sample_column_9')
        }.id('patttern_lock_sample_scroll_8')
      }.id('patternLock_scroll_001')
      .cardStyle()
      .layoutWeight(1)
      .margin({bottom:8})
    }.id('patttern_lock_sample_column_1').justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor($r('app.color.background_light_gray'))
    .height('100%')
    .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
  }
}