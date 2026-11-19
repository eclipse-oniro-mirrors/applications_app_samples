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
 * @file entry/src/main/ets/pages/universal/events/clickEventSample/ClickEventSample.ets
 * 文件职责：ClickEventSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ClickEventSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle'
import { TitleBar } from '../../../../common/TitleBar'

/**
 * ClickEventSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ClickEventSample {
  // @State showClickEventInfo：组件内部状态
  @State showClickEventInfo: string = ''
  // @State crosshairPositionX：组件内部状态
  @State crosshairPositionX: number = 200
  // @State crosshairPositionY：组件内部状态
  @State crosshairPositionY: number = 100

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.click_event') }).id('click_event_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll() {
        // Column：垂直布局容器
        // 关键属性：尺寸约束
        Column() {
          // IntroductionTitle：IntroductionTitle 自定义组件
          IntroductionTitle({ introduction: $r('app.string.click_action_tips') })
            .id('click_event_sample_introduction_title_5')
          // Click event effect display
          // Column：垂直布局容器
          // 关键属性：内边距、圆角、背景色
          Column() {
            // Row：水平布局容器
            // 关键属性：高度、宽度、背景色、点击事件回调
            // 交互：可点击交互
            Row() {
              // Text：文本
              // 关键属性：字号、绝对定位
              Text('+').id('click_event_sample_text_8')
                .fontSize(18)
                .position({ x: this.crosshairPositionX, y: this.crosshairPositionY })
            }.id('click_event_sample_row_7')
            .height(200)
            .width('100%')
            .backgroundColor($r('app.color.background_shallow_grey'))
            .onClick((event: ClickEvent) => {
              this.crosshairPositionX = event.x
              this.crosshairPositionY = event.y
              // Get click location information
              this.showClickEventInfo = 'Click Point: ' + '\n  screenX: ' + event.screenX + '\n  screenY: ' + event.screenY
              + '\n  x: ' + event.x + '\n  y: ' + event.y + '\ntarget: ' + '\n  component globalPos: ('
              + event.target.area.globalPosition.x + ',' + event.target.area.globalPosition.y + ')\n  width: '
              + event.target.area.width + 'vp' + '\n  height: ' + event.target.area.height + 'vp' + '\ntimestamp: ' + event.timestamp
            })
          }.id('click_event_sample_column_6')
          .padding(12)
          .borderRadius(24)
          .backgroundColor(Color.White)

          // Text：文本
          // 关键属性：字号、宽度、文本对齐、内边距
          Text($r('app.string.get_click_event_detail')).id('click_event_sample_text_9')
            .fontSize(18)
            .width('100%')
            .textAlign(TextAlign.Start)
            .padding({ left: 18, top: 12 })

          // Click location information
          // Text：文本
          // 关键属性：字号、宽度、文本对齐、内边距
          Text(this.showClickEventInfo).id('click_event_sample_text_10')
            .fontSize(18)
            .width('100%')
            .textAlign(TextAlign.Start)
            .padding({ left: 18, top: 12 })
        }.id('click_event_sample_column_4')
        .constraintSize({ minHeight: '100%' })
      }.id('click_event_sample_scroll_3')
    }.id('click_event_sample_column_1')
    .width('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}