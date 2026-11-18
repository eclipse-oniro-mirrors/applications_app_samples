/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/pages/universal/events/touchEventSample/TouchEventSample.ets
 * 文件职责：TouchEventSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TouchEventSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'

/**
 * TouchEventSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TouchEventSample {
  // @State positionX：组件内部状态
  @State positionX: number = 200
  // @State positionY：组件内部状态
  @State positionY: number = 100
  // @State touchEventInfo：组件内部状态
  @State touchEventInfo: string = ''
  private touchAreaRight: number = 0
  private touchAreaBottom: number = 0

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.touch_event') }).id('touch_event_sample_title_bar_2')
      // IntroductionTitle：IntroductionTitle 自定义组件
      IntroductionTitle({ introduction: $r('app.string.touch_action_tips') })
        .id('touch_event_sample_introduction_title_3')
      // Column：垂直布局容器
      // 关键属性：内边距、圆角、背景色
      Column() {
        // Row：水平布局容器
        // 关键属性：高度、宽度、背景色、区域变化回调
        Row() {
          // Text：文本
          // 关键属性：字号、绝对定位
          Text('+').id('touch_event_sample_text_6')
            .fontSize(28)
            .position({ x: this.positionX, y: this.positionY })
        }.id('touch_event_sample_row_5')
        .height(200)
        .width('100%')
        .backgroundColor($r('app.color.background_shallow_grey'))
        .onAreaChange((oldValue: Area, newValue: Area) => {
          this.touchAreaRight = newValue.width as number
          this.touchAreaBottom = newValue.height as number
        })
        .onTouch((event: TouchEvent) => {
          let touchPointsCount = event.touches.length
          let touchPoint = event.touches[touchPointsCount - 1]
          if (touchPoint.x < 0 || touchPoint.y < 0 || touchPoint.x > this.touchAreaRight
          || touchPoint.y > this.touchAreaBottom) {
            return
          }
          this.positionX = touchPoint.x
          this.positionY = touchPoint.y
          let eventType = 'Down'
          if (event.type === TouchType.Down) {
            eventType = 'Down'
          } else if (event.type === TouchType.Up) {
            eventType = 'Up'
          } else if (event.type === TouchType.Move) {
            eventType = 'Move'
          }
          this.touchEventInfo
          = 'Touch Event:\n  Type:' + eventType + '\n  screenX: ' + touchPoint.screenX
          + '\n  screenY: ' + touchPoint.screenY + '\n  x: ' + touchPoint.x + '\n  y: ' + touchPoint.y
          + '\n  timestamp: ' + event.timestamp
          + '\nTarget:\n  globalPos: (' + event.target.area.globalPosition.x + ',' + event.target.area.globalPosition.y
          + ')\n  width:' + event.target.area.width + '\n  height:' + event.target.area.height
        })
      }.id('touch_event_sample_column_4')
      .padding(12)
      .borderRadius(24)
      .backgroundColor(Color.White)
      // touch location information
      // Text：文本
      // 关键属性：字号、宽度、文本对齐、内边距
      Text(this.touchEventInfo).id('touch_event_sample_text_7')
        .fontSize(18)
        .width('100%')
        .textAlign(TextAlign.Start)
        .padding({ left: 18, top: 30 })
    }.id('touch_event_sample_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}
