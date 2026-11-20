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
 * @file DataPanelSample.ets
 * 文件职责：DataPanelSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：DataPanelSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import { panelData } from '../../ComponentData'

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
 * DataPanelSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct DataPanelSample {
  private panelData: number[] = panelData

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.data_panel') }).id('data_panel_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.datapanel_circle')).id('data_panel_sample_text_3')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle
      Column() {
        // DataPanel：DataPanel 自定义组件
        // 关键属性：宽度、高度、cardStyle
        DataPanel({ values: this.panelData, max: 100, type: DataPanelType.Circle })
          .id('data_panel_sample_data_panel_5')
          .width(200)
          .height(200)
      }.id('data_panel_sample_column_4').cardStyle()

      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.datapanel_line')).id('data_panel_sample_text_6')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：cardStyle、宽度、高度
      Column() {
        // DataPanel：DataPanel 自定义组件
        // 关键属性：宽度、高度
        DataPanel({ values: this.panelData, max: 100, type: DataPanelType.Line })
          .id('data_panel_sample_data_panel_8')
          .width(300)
          .height(10)
      }.id('data_panel_sample_column_7')
      .cardStyle()
      .width('100%')
    }.id('data_panel_sample_column_1').height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}
