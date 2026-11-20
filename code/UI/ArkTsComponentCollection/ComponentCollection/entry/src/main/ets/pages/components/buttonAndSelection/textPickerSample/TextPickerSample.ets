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
 * @file entry/src/main/ets/pages/components/buttonAndSelection/textPickerSample/TextPickerSample.ets
 * 文件职责：TextPickerSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：TextPickerSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar'
import Logger from '../../../../util/Logger'
import { fruitArray } from '../../ComponentData'
import { getStringArrayData } from '../../../../data//ResourceDataHandle'

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
 * TextPickerSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct TextPickerSample {
  private select: number = 1
  private fruits: string[] = getStringArrayData(fruitArray)

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、宽度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.text_picker') }).id('text_picker_sample_title_bar_2')
      // Text：文本
      // 关键属性：leftTitleStyle
      Text($r('app.string.normal_display')).id('text_picker_sample_text_3')
        .leftTitleStyle()
      // Column：垂直布局容器
      // 关键属性：高度、cardStyle、宽度
      Column() {
        // TextPicker：文本选择器
        // 关键属性：内容变更回调、info
        // 交互：输入/提交回调
        TextPicker({ range: this.fruits, selected: this.select }).id('text_picker_sample_text_picker_5')
          .onChange((value: string | string[], index: number | number[]) => {
            Logger.info(`Picker item changed, value: ${value}, index: ${index}`);
          })
      }.id('text_picker_sample_column_4').height('40%')
      .cardStyle()
      .width('100%')
    }.id('text_picker_sample_column_1').height('100%')
    .width('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 })
  }
}
